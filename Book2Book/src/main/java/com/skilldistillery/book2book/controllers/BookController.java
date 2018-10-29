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
import com.skilldistillery.book2book.data.TransactionDAO;
import com.skilldistillery.book2book.data.UserDAO;
import com.skilldistillery.book2book.entities.Book;
import com.skilldistillery.book2book.entities.User;

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
	@RequestMapping(path="add.do", method= RequestMethod.POST)
	public String addNewBook(Book book ) {
		
				bd.addBook(book);
				
			return "redirect:addbook.do";	
	}
	@RequestMapping( path="addbook.do", method= RequestMethod.GET)
	public ModelAndView addedBook () {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("book");
		
		return mv;
	}
	
	//EDIT BOOK
	@RequestMapping(path="editbook.do", method = RequestMethod.POST)
	public String editBook(Book updatedBook, @RequestParam("id")int id) {
		int oldBookId = updatedBook.getId();
		System.out.println(oldBookId);
		
		System.out.println("ID passed by request" + id);
		bd.editBook(updatedBook, id);
		
		return "redirect:editBook.do";
	}
	@RequestMapping(path="editBook.do", method =RequestMethod.GET)
	public ModelAndView editedBook () {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("book");
		
		return mv;
		
	}
	
	//SEACH FOR BOOK 
	@RequestMapping(path="searchbook.do", method=RequestMethod.GET)
	public ModelAndView findBookByKeyword(String keyword) {
		ModelAndView mv = new ModelAndView();
		
		List<Book> books = bd.searchForBookbyKeyword(keyword);
		
		mv.addObject("books",books);
		mv.setViewName("bookList");
		
		return mv;
	}
	//BACK TO HOME BUTTON
	@RequestMapping(path="home.do", method=RequestMethod.GET)
	public String returnHome() {
		return "book";
	}
	
	
	//SEARCH BOOK BY TITLE MOVE TO EDIT PAGE
	@RequestMapping(path="editbook.do", method=RequestMethod.GET)
	public ModelAndView findBookByName(String title) {
		ModelAndView mv = new ModelAndView();
		
		Book book = bd.searchForBookByTitle(title);
		mv.addObject("book", book);
		mv.setViewName("bookedit");
	
		
		return mv;
	}
	
	//LIST ALL BOOKS 
	@RequestMapping(path="getbooks.do", method=RequestMethod.GET)
	public ModelAndView listAllBooks(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		List<Book> books = bd.listAllBooks();
		
		mv.addObject("books", books);
		User user = (User) session.getAttribute("USER");
		mv.addObject("user", user);
		mv.setViewName("bookList");
	
		
		return mv;
	}
	
}





















