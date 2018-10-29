package com.skilldistillery.book2book.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.book2book.data.CopyDAO;
import com.skilldistillery.book2book.data.CopyDAOImpl;
import com.skilldistillery.book2book.data.TransactionDAO;
import com.skilldistillery.book2book.data.TransactionDAOImpl;
import com.skilldistillery.book2book.data.UserDAO;
import com.skilldistillery.book2book.entities.Copy;
import com.skilldistillery.book2book.entities.Transaction;
import com.skilldistillery.book2book.entities.User;


@Controller
@SessionAttributes("transaction")
public class TransactionController {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private CopyDAO copyDAO;
	
	@Autowired
	private TransactionDAO transDAO;
	
	@RequestMapping(path="transaction.do", method=RequestMethod.GET)
	  public ModelAndView accountIndex(HttpSession session) {
		  System.out.println("transaction page");
		  ModelAndView mv = new ModelAndView();
		  UserController uc = new UserController();
		  
		  if(uc.userIsLoggedIn(session)) {
			  User user = (User) session.getAttribute("USER");
			  int userId = user.getId();
			  System.out.println("User Id: " + userId);
			  List<Transaction> transactions = transDAO.getTransactionsByBorrowerId(userId);
			  System.out.println("back from transactions");
			  System.out.println("transactions: "+transactions);
			  List<Copy> copies = copyDAO.listCopies();
			  System.out.println("copies: "+copies);
			  mv.addObject("copies", copies);
			  mv.addObject("transactions", transactions);
			  mv.setViewName("transaction");
			  System.out.println("transactions and copies added to mv and transaction.jsp set");
			  return mv;
		  }
		  else {
			  mv.setViewName("login.do");
			  return mv;
		  }
	}	  
}
