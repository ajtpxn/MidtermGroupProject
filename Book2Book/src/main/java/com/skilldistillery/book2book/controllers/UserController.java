package com.skilldistillery.book2book.controllers;

import org.springframework.stereotype.Controller;

import com.skilldistillery.book2book.data.UserDAO;
import com.skilldistillery.book2book.data.UserDAOimpl;
import com.skilldistillery.book2book.entities.User;

@Controller
public class UserController {
	static UserDAO userDAO = new UserDAOimpl();
	
	public void addUser(User user) {
		userDAO.creatUser(user);
		
	}

}
