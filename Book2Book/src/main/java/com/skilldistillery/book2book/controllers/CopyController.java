package com.skilldistillery.book2book.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.book2book.data.BookDAO;
import com.skilldistillery.book2book.data.CopyDAO;
import com.skilldistillery.book2book.data.TransactionDAO;
import com.skilldistillery.book2book.data.UserDAO;
import com.skilldistillery.book2book.entities.Book;
import com.skilldistillery.book2book.entities.Copy;

@Controller
public class CopyController {
	@Autowired
	private BookDAO bDAO;
	@Autowired
	private CopyDAO cDAO;
	@Autowired
	private TransactionDAO tDAO;
	@Autowired
	private UserDAO uDAO;

	// Add a new copy to a user's library(tentative name)
	@RequestMapping(path = "someroutehere", method = RequestMethod.POST)
	public String addNewCopy(Copy copy) {

		cDAO.addCopy(copy);

		return "redirect:addcopy.do";
	}

	@RequestMapping(path = "addbook.do", method = RequestMethod.GET)
	public ModelAndView addedCopy() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("someroutehere");

		return mv;
	}

	// edit a user's copy
	@RequestMapping(path = "someotherroute", method = RequestMethod.POST)
	public String editCopy(Copy updatedCopy, int prevCopyId) {
		cDAO.editCopy(updatedCopy, prevCopyId);
		return "redirect:editCopy.do";
	}

	@RequestMapping(path = "editCopy.do", method = RequestMethod.GET)
	public ModelAndView editedCopy() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("someotherroute");
		return mv;
	}

	// soft delete a user's copy (flag as active=false)
	@RequestMapping(path = "anotherroute", method = RequestMethod.POST)
	public boolean deleteCopy(int id) {
		cDAO.deleteCopy(id);
		return false;
	}

	@RequestMapping(path = "anotherroute", method = RequestMethod.GET)
	public ModelAndView deletedCopy() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("anotherroute");
		return mv;
	}

	// return a list of copies of a particular book
	public ModelAndView getBookCopies() {
		ModelAndView mv = new ModelAndView();
		List<Copy> copies = cDAO.listBookCopies(1);
		mv.addObject("copies", copies);
		mv.setViewName("yetanotherroute");
		return mv;
	}
	// return a list of copies from a user
	public ModelAndView getUserCopies() {
		ModelAndView mv = new ModelAndView();
		List<Copy> copies = cDAO.listUserCopies(1);
		mv.addObject("copies", copies);
		mv.setViewName("circuitousroute");
		return mv;
	}
	
	
}