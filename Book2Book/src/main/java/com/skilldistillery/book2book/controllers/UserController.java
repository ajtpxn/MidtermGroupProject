package com.skilldistillery.book2book.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.book2book.data.CopyDAO;
import com.skilldistillery.book2book.data.CopyDAOImpl;
import com.skilldistillery.book2book.data.TransactionDAO;
import com.skilldistillery.book2book.data.UserDAO;
import com.skilldistillery.book2book.data.UserDAOimpl;
import com.skilldistillery.book2book.entities.Copy;
import com.skilldistillery.book2book.entities.User;

@Controller
@SessionAttributes("userStatus")
public class UserController {
	
	@Autowired
	private static UserDAO userDAO;
	
	@Autowired
	private static CopyDAO copyDAO;
	
	@Autowired
	private static TransactionDAO transDAO;
	
	@RequestMapping(path="index.do")
	public ModelAndView index() {
		System.out.println("index");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index.jsp");
		return mv;
	}
	
	@RequestMapping(path="addUser.do")
	public ModelAndView addUser() {
		System.out.println("Add User");
		ModelAndView mv = new ModelAndView();
		User user = new User();
		mv.addObject(user);
		mv.setViewName("addUser.jsp");
		return mv;
	}
	
	@RequestMapping(path="returnUser.do", method=RequestMethod.POST)
	public ModelAndView returnUser(User user) {
		System.out.println("Return User");
		userDAO = new UserDAOimpl();
		ModelAndView mv = new ModelAndView();
		userDAO.creatUser(user);
		userDAO = null;
		mv.addObject(user);
		mv.setViewName("success.jsp");
		return mv;
	}
	
	@RequestMapping(path="status.do")
	@ModelAttribute("userStatus")
	public boolean userIsLoggedIn(HttpSession session) {
		System.out.println("userIsLoggedIn");
		boolean status = false;
		User user = (User) session.getAttribute("USER");
		if (user != null) {
			status = true;
		}
		System.out.println(status);
		return status;
	}
	
	@RequestMapping(path="login.do", method=RequestMethod.GET)
	public ModelAndView loginFromHome(HttpSession session) {
		System.out.println("loginFromHome");
	    ModelAndView mv = new ModelAndView();
	    if (userIsLoggedIn(session)) {
	    	mv.setViewName("index.do");
	    	return mv;
	    }
	    User user = new User();
	    mv.addObject("user", user);
	    mv.setViewName("login.jsp");
	    return mv;
	}
	
	@RequestMapping(path="login.do", method=RequestMethod.POST)
	public ModelAndView logIn(User formUser, HttpSession session) {
		System.out.println("logIn");
		ModelAndView mv = new ModelAndView();
		userDAO = new UserDAOimpl();
		if(userIsLoggedIn(session)) {
			System.out.println("*****sessionPositive******");
			mv.setViewName("index.do");
			return mv;
		}
		String username = formUser.getUserName();
		String password = formUser.getPassword();
		System.out.println("formUser.getUserName(): "+formUser.getUserName());
		System.out.println("formUser.getPassword(): "+formUser.getPassword());
		User validUser = userDAO.getUserByCredentials(username, password);
		
		if (validUser != null) {
			session.setAttribute("USER", validUser);
			mv.setViewName("account.do");
		}
		else {
			mv.setViewName("fail.jsp");
		}
		userDAO = null;
		return mv;
	}
	
	@RequestMapping(path="logout.do")
	public String logOut(HttpSession session) {
		System.out.println("logOut");
		session.invalidate();
		return "index.do";
		
	}
	
	  @RequestMapping(path="account.do")
	  public ModelAndView accountIndex(HttpSession session) {
		  copyDAO = new CopyDAOImpl();
		  System.out.println("account page");
		  ModelAndView mv = new ModelAndView();
		  if(userIsLoggedIn(session)) {
			  User user = (User) session.getAttribute("USER");
			  int userId = user.getId();
			  System.out.println("User Id: " + userId);
			  List<Copy> copies = copyDAO.listUserCopies(userId);
			  System.out.println("back from copies");
			  System.out.println(copies);
			  mv.addObject("copies", copies);
			  mv.setViewName("account.jsp");
			  System.out.println("copies added to mv and account.jsp set");
			  return mv;
		  }
		  else {
			  mv.setViewName("login.do");
			  return mv;
		  }
	  }

}
