package com.skilldistillery.book2book.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.book2book.data.CopyDAO;
import com.skilldistillery.book2book.data.CopyDAOImpl;
import com.skilldistillery.book2book.data.TransactionDAO;
import com.skilldistillery.book2book.data.TransactionDAOImpl;
import com.skilldistillery.book2book.data.UserDAO;
import com.skilldistillery.book2book.data.UserDAOimpl;
import com.skilldistillery.book2book.entities.Copy;
import com.skilldistillery.book2book.entities.User;

@Controller
@SessionAttributes("userStatus")
public class UserController {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private CopyDAO copyDAO;

	@Autowired
	private TransactionDAO transDAO;

	@RequestMapping(path = "index.do")
	public ModelAndView index() {
		System.out.println("index");
		ModelAndView mv = new ModelAndView();
		List<Copy> limitedCopies = copyDAO.listLimitedCopies();
		System.out.println(limitedCopies.size());
		mv.addObject("availCopies", limitedCopies);
		mv.setViewName("index");
		
		return mv;
	}

	@RequestMapping(path = "addUser.do")
	public ModelAndView addUser() {
		System.out.println("Add User");
		ModelAndView mv = new ModelAndView();
		User user = new User();
		mv.addObject(user);
		mv.setViewName("addUser");
		return mv;
	}

	@RequestMapping(path = "returnUser.do", method = RequestMethod.POST)
	public ModelAndView returnUser(User user) {
		System.out.println("Return User");
		// userDAO = new UserDAOimpl();
		ModelAndView mv = new ModelAndView();
		if (user.getFirstName() == null || user.getFirstName().equals("")) {
			mv.setViewName("fail");
			return mv;
		}
		if (user.getLastName() == null || user.getLastName().equals("")) {
			mv.setViewName("fail");
			return mv;
		}
		if (user.getUserName() == null || user.getUserName().equals("")) {
			mv.setViewName("fail");
			return mv;
		}
		if (user.getPassword() == null || user.getPassword().equals("")) {
			mv.setViewName("fail");
			return mv;
		}
	
		user.setActive(true);
		userDAO.creatUser(user);
		// userDAO = null;
		mv.addObject(user);
		
		mv.setViewName("success");
		return mv;
	}

	@RequestMapping(path = "status.do")
	@ModelAttribute("userStatus")
	public boolean userIsLoggedIn(HttpSession session) {
		System.out.println("userIsLoggedIn");
		boolean status = false;
		User user = (User) session.getAttribute("USER");
		System.out.println(user);
		if (user != null) {
			status = true;
		}
		System.out.println(status);
		return status;
	}

	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public ModelAndView loginFromHome(HttpSession session) {
		System.out.println("loginFromHome");
		ModelAndView mv = new ModelAndView();
		if (userIsLoggedIn(session)) {
			mv.setViewName("index.do");
			return mv;
		}
		User user = new User();
		mv.addObject("user", user);
		mv.setViewName("login");
		return mv;
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String logIn(User formUser, HttpSession session) {
		System.out.println("logIn");
		// ModelAndView mv = new ModelAndView();
		// userDAO = new UserDAOimpl();
		if (userIsLoggedIn(session)) {
			System.out.println("*****sessionPositive******");
			// mv.setViewName("index.do");
			// return mv;
			return "redirect:account.do";

		}
		String username = formUser.getUserName();
		String password = formUser.getPassword();
		System.out.println("formUser.getUserName(): " + formUser.getUserName());
		System.out.println("formUser.getPassword(): " + formUser.getPassword());
		User validUser = userDAO.getUserByCredentials(username, password);

		if (validUser != null) {
			session.setAttribute("USER", validUser);
			// mv.setViewName("account.do");
			return "redirect:account.do";
		} else {
			return "redirect:fail.do";
		}
		// userDAO = null;
		// return mv;
	}

	@RequestMapping(path = "fail.do", method = RequestMethod.GET)
	public ModelAndView fail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("fail");
		return mv;
	}

	@RequestMapping(path = "logout.do")
	public String logOut(HttpSession session) {
		System.out.println("logOut");
		session.invalidate();
		return "index";

	}

	@RequestMapping(path = "account.do")
	public ModelAndView accountIndex(HttpSession session) {
		// copyDAO = new CopyDAOImpl();
		// transDAO = new TransactionDAOImpl();
		System.out.println("account page");
		ModelAndView mv = new ModelAndView();
		if (userIsLoggedIn(session)) {
			User user = (User) session.getAttribute("USER");
			int userId = user.getId();
			System.out.println("User Id: " + userId);
			List<Copy> copies = copyDAO.listUserCopies(userId);
			List<User> borrowers = new ArrayList<User>();
			System.out.println("back from copies");
			System.out.println(copies);
			System.out.println(userDAO);
			System.out.println(copyDAO);
			System.out.println(transDAO);
			for (Copy c : copies) {
				borrowers.add(transDAO.getBorrowerByCopyIdAndDate(c.getId(), new Date()));
			}
			/*
			 * for (int i = 0; i < copies.size(); i++) { List<Transaction> transactions =
			 * transDAO.getTransactionsByCopyId(i); String transName = "transaction_" +
			 * Integer.toString(i); Transaction t = transactions.get(0);
			 * mv.addObject(transName, t); }
			 */
			mv.addObject("copies", copies);
			mv.addObject("borrowers", borrowers);
			mv.setViewName("account");
			System.out.println("copies added to mv and account.jsp set");
			System.out.println(borrowers);
			return mv;
		} else {
			mv.setViewName("login");
			return mv;
		}
	}

	// EDIT USER PROFILE/ACCOUNT INFO
	@RequestMapping(path = "editingProfile.do", method = RequestMethod.POST)
	public String editProfile(User updatedUser, HttpSession session) {
		System.out.println("********************************************");
		System.out.println(updatedUser);
		System.out.println("********************************************");
		User olduser = (User) session.getAttribute("USER");

		userDAO.updateUser(olduser.getId(), updatedUser);

		return "redirect:edited.do";
	}

	@RequestMapping(path = "edited.do", method = RequestMethod.GET)
	public ModelAndView editedProfile() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("success");
		return mv;
	}

	// REDIRECT TO EDIT PROFILE/ACCOUINT PAGE
	@RequestMapping(path = "editProfile.do", method = RequestMethod.GET)
	public ModelAndView moveToEditProfile(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("USER");

		mv.addObject("user", user);
		mv.setViewName("editAccount");

		return mv;

	}
	
	@RequestMapping(path = "userprofile.do", method = RequestMethod.GET)
	public ModelAndView viewOtherUserProfile(@RequestParam("id") int id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User otherUser = userDAO.findUser(id);
		mv.addObject("user", otherUser);
		mv.setViewName("user");
		return mv;
	}

}
