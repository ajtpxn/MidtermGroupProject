package com.skilldistillery.book2book.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.book2book.data.BookDAO;
import com.skilldistillery.book2book.data.CopyDAO;
import com.skilldistillery.book2book.entities.Book;
import com.skilldistillery.book2book.entities.Condition;
import com.skilldistillery.book2book.entities.Copy;
import com.skilldistillery.book2book.entities.User;

@Controller
public class CopyController {

	@Autowired
	private CopyDAO cDAO;

	@Autowired
	private BookDAO bDAO;

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
	public ModelAndView findAllAvailableCopiesToRent() {
		ModelAndView mv = new ModelAndView();

		List<Copy> allAvailableCopies = cDAO.seeAllAvailableCopies();

		mv.addObject("availCopies", allAvailableCopies);
		mv.setViewName("allAvailCopies");

		return mv;
	}

	// GET DETAILS ON COPY
	@RequestMapping(path = "copyDetails.do", method = RequestMethod.GET)
	public ModelAndView getCopyDetails(@RequestParam("copy.id") int copyId) {
		ModelAndView mv = new ModelAndView();

		Copy copyDetails = cDAO.getCopy(copyId);
		mv.addObject("copy", copyDetails);
		mv.setViewName("copyDetail");

		return mv;

	}

}