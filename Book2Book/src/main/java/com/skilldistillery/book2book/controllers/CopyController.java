package com.skilldistillery.book2book.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.book2book.data.CopyDAO;
import com.skilldistillery.book2book.entities.Copy;
import com.skilldistillery.book2book.entities.User;

@Controller
public class CopyController {

	@Autowired
	private CopyDAO cDAO;

	// Add a new copy to a user's library(tentative name)
	@RequestMapping(path = "copy.do", method = RequestMethod.POST)
	public String addNewCopy(Copy copy, HttpSession session) {

		
		User user = (User) session.getAttribute("USER");
		
		System.out.println(user);
		cDAO.addCopy(copy);

		return "redirect:addcopy.do";
	}

	@RequestMapping(path = "addcopy.do", method = RequestMethod.GET)
	public ModelAndView addedCopy( @RequestParam("copy.user.id")int userId) {
		ModelAndView mv = new ModelAndView();
		List<Copy> copies = cDAO.listUserCopies(userId);
		
		mv.addObject("copies", copies);
		mv.setViewName("account.jsp");

		return mv;
	}

	// edit a user's copy
	@RequestMapping(path = "editCopy.do", method = RequestMethod.POST)
	public String editCopy(Copy updatedCopy, int prevCopyId) {
		cDAO.editCopy(updatedCopy, prevCopyId);
		return "redirect:editCopy.do";
	}

	@RequestMapping(path = "editedCopy.do", method = RequestMethod.GET)
	public ModelAndView editedCopy() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("copy.jsp");
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
		mv.setViewName("copy.jsp");
		return mv;
	}
	
	// return a list of all copies
	public ModelAndView getListCopies() {
		ModelAndView mv = new ModelAndView();
		List<Copy> copies = cDAO.listCopies();
		mv.addObject("copies", copies);
		mv.setViewName("copytest.jsp");
		return mv;
	}

	// return a list of copies of a particular book
	public ModelAndView getBookCopies() {
		ModelAndView mv = new ModelAndView();
		List<Copy> copies = cDAO.listBookCopies(1);
		mv.addObject("copies", copies);
		mv.setViewName("copy.jsp");
		return mv;
	}
	// return a list of copies from a user
	public List<Copy> getUserCopies(int userId) {
		List<Copy> copies = cDAO.listUserCopies(userId);
		
		return copies;
	}
	
	
}