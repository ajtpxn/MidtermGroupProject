package com.skilldistillery.book2book.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.book2book.data.UserDAO;
import com.skilldistillery.book2book.data.UserDAOimpl;
import com.skilldistillery.book2book.entities.User;

@Controller
@SessionAttributes("userStatus")
public class UserController {
	
	@Autowired
	private static UserDAO userDAO;
	
	@RequestMapping(path="index.do")
	public ModelAndView index() {
		System.out.println("index");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index.jsp");
		return mv;
	}
	
	public void addUser(User user) {
		System.out.println("addUser");
		userDAO = new UserDAOimpl();
		ModelAndView mv = new ModelAndView();
		userDAO.creatUser(user);
		userDAO = null;
		mv.addObject(user);
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
	public ModelAndView logIn(HttpSession session) {
		System.out.println("logIn");
		ModelAndView mv = new ModelAndView();
		userDAO = new UserDAOimpl();
		if(userIsLoggedIn(session)) {
			System.out.println("User is logged in******");
			mv.setViewName("fail.jsp");
			return mv;
		}
		User validUser = userDAO.getUserByCredentials("usermcuserface", "imauser");
		
		if (validUser != null) {
			session.setAttribute("USER", validUser);
			mv.setViewName("success.jsp");
		}
		else {
			mv.setViewName("fail.jsp");
		}
		userDAO = null;
		return mv;
	}
	public void logOut() {
		System.out.println("logOut");
		
	}

}
