package com.skilldistillery.book2book.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.book2book.data.UserDAO;
import com.skilldistillery.book2book.data.UserDAOimpl;
import com.skilldistillery.book2book.entities.User;

@Controller
public class UserController {
	
	private static UserDAO userDAO = new UserDAOimpl();
	
	
	public void addUser(User user) {
		ModelAndView mv = new ModelAndView();
		userDAO.creatUser(user);
		mv.addObject(user);
	}
	
	public void userIsLoggedIn(User user) {
		ModelAndView mv = new ModelAndView();
		
		userDAO.creatUser(user);
		mv.addObject(user);
	}

}
