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

@Controller
public class BookController {
	@Autowired
	private BookDAO bd;
	@Autowired
	private CopyDAO cd;
	@Autowired
	private TransactionDAO td;
	@Autowired
	private UserDAO ud;

	//ADD NEW BOOK TO DB
	@RequestMapping(path="XXX", method= RequestMethod.POST)
	public String addNewBook(Book book ) {
		
				bd.addBook(book);
				
			return "redirect:addbook.do";	
	}
	@RequestMapping( path="addbook.do", method= RequestMethod.GET)
	public ModelAndView addedBook () {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("XXX");
		
		return mv;
	}
	
	//EDIT BOOK
	@RequestMapping(path="XXXX", method = RequestMethod.POST)
	public String editBook(Book updatedBook, int oldBookId) {
		
		bd.editBook(updatedBook, oldBookId);
		
		return "redirect:editBook.do";
	}
	@RequestMapping(path="editBook.do", method =RequestMethod.GET)
	public ModelAndView editedBook () {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("XXX");
		
		return mv;
		
	}
	
	//SEACH FOR BOOK 
	
	public ModelAndView findBookByKeyword(String keyword) {
		ModelAndView mv = new ModelAndView();
		
		List<Book> books = bd.searchForBook(keyword);
		
		mv.addObject("books",books);
		mv.setViewName("XXXXX");
		
		return mv;
	}
	
	
	
}
