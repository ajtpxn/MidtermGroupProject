package com.skilldistillery.book2book.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	private static UserDAO userDAO;
	
	@Autowired
	private static CopyDAO copyDAO;
	
	@Autowired
	private static TransactionDAO transDAO;
	
	@RequestMapping(path="transaction.do")
	  public ModelAndView accountIndex(HttpSession session) {
		  copyDAO = new CopyDAOImpl();
		  transDAO = new TransactionDAOImpl();
		  System.out.println("transaction page");
		  ModelAndView mv = new ModelAndView();
		  UserController uc = new UserController();
		  
		  if(uc.userIsLoggedIn(session)) {
			  User user = (User) session.getAttribute("USER");
			  int userId = user.getId();
			  System.out.println("User Id: " + userId);
			  List<Transaction> transactions = transDAO.getTransactionsByBorrowerId(userId);
			  System.out.println("back from transactions");
			  System.out.println(transactions);
			  List<Copy> copies = copyDAO.listUserCopies(userId);
			  System.out.println(copies);
			  mv.addObject("copies", copies);
			  mv.addObject("transactions", transactions);
			  mv.setViewName("account");
			  System.out.println("copies added to mv and account.jsp set");
			  return mv;
		  }
		  else {
			  mv.setViewName("login.do");
			  return mv;
		  }
	}	  
}
