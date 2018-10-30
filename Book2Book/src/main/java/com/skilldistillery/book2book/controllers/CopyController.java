package com.skilldistillery.book2book.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.helpers.DateTimeDateFormat;
import org.jboss.logging.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.book2book.data.BookDAO;
import com.skilldistillery.book2book.data.CopyDAO;
import com.skilldistillery.book2book.data.TransactionDAO;
import com.skilldistillery.book2book.entities.Book;
import com.skilldistillery.book2book.entities.Condition;
import com.skilldistillery.book2book.entities.Copy;
import com.skilldistillery.book2book.entities.Transaction;
import com.skilldistillery.book2book.entities.User;

@Controller
public class CopyController {

	@Autowired
	private CopyDAO cDAO;

	@Autowired
	private BookDAO bDAO;
	
	@Autowired
	private TransactionDAO tDAO;

	// Add a new copy to a user's library(tentative name)
	@RequestMapping(path = "copy.do", method = RequestMethod.POST)
	public String addNewCopy(@RequestParam("bookId") int bookId, HttpSession session) {

		Book book = bDAO.getBookById(bookId);
		User user = (User) session.getAttribute("USER");
		Condition condition = new Condition();
		System.out.println("form book: " + book);
		System.out.println("form user: " + user);
		Copy copy = new Copy();
		copy.setActive(true);
		copy.setAvailable(true);
		copy.setBook(book);
		copy.setUser(user);
		copy.setConditionId(1);
		System.out.println(copy);
		cDAO.addCopy(copy);

		return "redirect:account.do";
	}

//	@RequestMapping(path = "addcopy.do", method = RequestMethod.GET)
//	public ModelAndView addedCopy(HttpSession session) {
//		ModelAndView mv = new ModelAndView();
//		User user = (User) session.getAttribute("USER");
//		List<Copy> copies = cDAO.listUserCopies(user.getId());
//		mv.addObject("copies", copies);
//		mv.setViewName("account.jsp");
//		return mv;
//	}

	// edit a user's copy
	@RequestMapping(path = "editCopy.do", method = RequestMethod.POST)
	public String editCopy(Copy updatedCopy, int prevCopyId) {
		cDAO.editCopy(updatedCopy, prevCopyId);
		return "redirect:editCopy.do";
	}

	// edit a user's copy
	@RequestMapping(path = "updateCondition.do", method = RequestMethod.POST)
	public String updateCondition(@RequestParam("conditionId") int newConditionId, @RequestParam("copyId") int copyId) {
		Copy newCopy = cDAO.getCopy(copyId);
		newCopy.setConditionId(newConditionId);
		cDAO.editCopy(newCopy, copyId);
		return "success";
	}

	@RequestMapping(path = "editedCopy.do", method = RequestMethod.GET)
	public ModelAndView editedCopy() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("copy");
		return mv;
	}

	// soft delete a user's copy (flag as active=false)
	@RequestMapping(path = "deleteCopy.do", method = RequestMethod.POST)
	public boolean deleteCopy(int id) {
		cDAO.deleteCopy(id);
		return false;
	}

	@RequestMapping(path = "deletedCopy.do", method = RequestMethod.GET)
	public ModelAndView deletedCopy() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("copy");
		return mv;
	}

	// return a list of all copies
	public ModelAndView getListCopies() {
		ModelAndView mv = new ModelAndView();
		List<Copy> copies = cDAO.listCopies();
		mv.addObject("copies", copies);
		mv.setViewName("copytest");
		return mv;
	}

	// return a list of copies of a particular book
	public ModelAndView getBookCopies() {
		ModelAndView mv = new ModelAndView();
		List<Copy> copies = cDAO.listBookCopies(1);
		mv.addObject("copies", copies);
		mv.setViewName("copy");
		return mv;
	}

	@RequestMapping(path = "removeCopy.do", method = RequestMethod.POST)
	public ModelAndView removeCopyFromUser(HttpSession session, @RequestParam("copyId") int copyId) {
		ModelAndView mv = new ModelAndView();
		cDAO.deleteCopy(copyId);
		mv.setViewName("success");
		return mv;
	}

//
//	@RequestMapping(path = "listAvailableCopy.do", method = RequestMethod.GET)
//	public ModelAndView listAvailableCopy() {
//		List<Copy> allCopies = cDAO.listCopies();
//		List<Copy> availableCopies = new ArrayList<Copy>();
//		System.out.println("blah");
//		for (Copy c : allCopies) {
//			if (c.isAvailable()) {
//				availableCopies.add(c);
//			}
//		}
//		System.out.println("blah blah");
//
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("copies", availableCopies);
//		mv.setViewName("notloggedincopies");
//		return mv;
//	}

	// FIND ALL AVAILBLE BOOKS TO RENT
	@RequestMapping(path = "listAvailableCopy.do", method = RequestMethod.GET)
	public ModelAndView findAllAvailableCopiesToRent(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("USER");
		System.out.println(user);
		
		if (user != null) {
			List<Copy> allAvailableCopies = cDAO.seeAllAvailableCopies(user.getId());
			mv.addObject("availCopies", allAvailableCopies);
			mv.setViewName("allAvailCopies");
			return mv;
		}
		else {
			
			mv.addObject("rejectNotLoggedIn", true);
			mv.setViewName("addUser");
			return mv;
//			List<Copy> limitedCopies = cDAO.listLimitedCopies();
//			System.out.println(limitedCopies.size());
//			mv.addObject("availCopies", limitedCopies);
//			mv.setViewName("login");
//			return mv;
		}

	}


	// GET DETAILS ON COPY
	@RequestMapping(path = "copyDetails.do", method = RequestMethod.GET)
	public ModelAndView getCopyDetails(HttpSession session, @RequestParam("copy.id") int copyId) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("USER");
		System.out.println(user);
		if (user != null) {
			Copy copyDetails = cDAO.getCopy(copyId);
			mv.addObject("copy", copyDetails);
			mv.setViewName("copyDetail");
			
			return mv;
		}
		else {
			mv.addObject("rejectNotLoggedIn", true);
			mv.setViewName("addUser");
			return mv;
		}
	}
	
	//ADD TRANSACTION AND UPDATE USERS COPY.AVAILABLE TO FASLE
	@RequestMapping(path = "addTransUpdateCopy.do", method = RequestMethod.POST)
	public String addTransAndUpdateCopyAvailable( @RequestParam(name="copyId") int copyId,
			@RequestParam(name="datefilter") String dateRange, HttpSession session) {
		
		
		
		Copy copy = cDAO.getCopy(copyId);
		
		User user = (User) session.getAttribute("USER");
		//PARSES START AND END DATE FROM STRING TO DATE
		//SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		//String time = "2018-10-10 12:00:00";
		System.out.println(dateRange);
		//10/23/2018 - 11/06/2018
		String[] dateArray= dateRange.split("\\s-\\s");
		System.out.println(dateArray[0]);
		System.out.println(dateArray[1]);
		String sd = dateArray[0];
		String startDateWithTime = sd.concat(" 10:00:00");
		String ed = dateArray[1];
		String endDateWithTime = ed.concat(" 10:00:00");
		Date startD = null;
		//Date cDate = null;
		Date endD = null;

		try {
			startD = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").parse(startDateWithTime);
			endD = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").parse(endDateWithTime);
			System.out.println(startD);
			System.out.println(endD);
//			startD = f.parse(startDate);
//			endD = f.parse(endDate);
			//cDate = f.parse(time);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// CREATES NEW TRANSANACTION
		Transaction newTrans = new Transaction();

		newTrans.setBorrowers(user);
		newTrans.setCopyId(copy.getId());
		newTrans.setStartDate(startD);
		newTrans.setEndDate(endD);
		//newTrans.setDateCreated(cDate);
		
		tDAO.makeTransaction(newTrans);
		
		//SWITCHES AVAILABLITY TO FALSE
		copy.setAvailable(false);
		cDAO.editCopy(copy, copyId);
		
		
		
		
		return "redirect:transaction.do";
	}
	
	@RequestMapping(path = "changedCopyTrans.do", method = RequestMethod.GET)
	public ModelAndView addedTransandUpdatedCopy() {
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("allAvailCopies");
		return mv;
	}
	
	
	
	//LIST OF AVAILBEL COPIES TO BORROW ON INDEX PAGE
	@RequestMapping(path = "index.do", method = RequestMethod.GET)
	public ModelAndView findAllAvailableCopiesForIndex() {
		ModelAndView mv = new ModelAndView();
		
		List<Copy> limitedCopies = cDAO.listLimitedCopies();
		System.out.println(limitedCopies.size());
		mv.addObject("availCopies", limitedCopies);
		mv.setViewName("index");
		return mv;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}


















