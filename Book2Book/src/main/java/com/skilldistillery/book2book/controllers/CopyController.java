package com.skilldistillery.book2book.controllers;

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
	public String addNewCopy(@RequestParam("bookId")int bookId, HttpSession session) {
		
		Book book = bDAO.getBookById(bookId);
		User user = (User) session.getAttribute("USER");
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
	
	
}