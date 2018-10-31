package com.skilldistillery.book2book.controllers;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

	@RequestMapping(path = "transaction.do", method = RequestMethod.GET)
	public ModelAndView accountIndex(HttpSession session) {
		System.out.println("transaction page");
		ModelAndView mv = new ModelAndView();
		UserController uc = new UserController();

		if (uc.userIsLoggedIn(session)) {
			User user = (User) session.getAttribute("USER");
			int userId = user.getId();
			System.out.println("User Id: " + userId);
			List<Transaction> transactions = transDAO.getTransactionsByBorrowerId(userId);
			System.out.println("back from transactions");
			System.out.println("transactions: " + transactions);
			List<Copy> copies = copyDAO.listCopies();
			List<User> owners = new ArrayList<User>();

			for (Transaction t : transactions) {
				Copy c = copyDAO.getCopy(t.getCopyId());
				owners.add(c.getUser());
			}

			System.out.println("copies: " + copies);
			mv.addObject("copies", copies);
			mv.addObject("transactions", transactions);
			mv.addObject("owners", owners);
			mv.setViewName("transaction");
			System.out.println("transactions and copies added to mv and transaction.jsp set");
			return mv;
		} else {
			mv.setViewName("login");
			return mv;
		}
	}

//	@RequestMapping(path="booksLentOut.do", method=RequestMethod.GET)
//	public ModelAndView booksLentOut(HttpSession session) {
//		System.out.println("transaction page");
//		ModelAndView mv = new ModelAndView();
//		UserController uc = new UserController();
//		
//		if(uc.userIsLoggedIn(session)) {
//			User user = (User) session.getAttribute("USER");
//			int userId = user.getId();
//			System.out.println("User Id: " + userId);
//			List<Transaction> transactions = transDAO.getTransactionsByBorrowerId(userId);
//			System.out.println("back from transactions");
//			System.out.println("transactions: "+transactions);
//			List<Copy> copies = copyDAO.listCopies();
//			System.out.println("copies: "+copies);
//			mv.addObject("copies", copies);
//			mv.addObject("transactions", transactions);
//			mv.setViewName("transaction");
//			System.out.println("transactions and copies added to mv and transaction.jsp set");
//			return mv;
//		}
//		else {
//			mv.setViewName("login.do");
//			return mv;
//		}
//	}

	@RequestMapping(path = "returnBook.do", method = RequestMethod.GET)
	public ModelAndView returnBorrowedCopy(HttpSession session, @RequestParam("id") int transId) {
		System.out.println("******************************************" + transId);
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("USER");
		System.out.println(user);
		int userId = user.getId();
		System.out.println("User Id: " + userId);
		Transaction returnTrans = transDAO.getTransactionById(transId);
		Copy borrowedCopy = copyDAO.getCopy(returnTrans.getCopyId());
		User lender = borrowedCopy.getUser();
		DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		Date today = Calendar.getInstance().getTime();
		String reportDate = df.format(today);
		Date dateSet = null;
		try {
			dateSet = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").parse(reportDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" + reportDate);
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" + dateSet);
		returnTrans.setEndDate(dateSet);
		returnTrans.setBorrowers(lender);
		borrowedCopy.setAvailable(true);
		copyDAO.editCopy(borrowedCopy, borrowedCopy.getId());
		transDAO.updateTransaction(transId, returnTrans);
		mv.setViewName("redirect:transaction.do");
		System.out.println(returnTrans.getEndDate());
		return mv;
	}

}
