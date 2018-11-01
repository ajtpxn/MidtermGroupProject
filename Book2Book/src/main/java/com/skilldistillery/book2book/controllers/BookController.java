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
import com.skilldistillery.book2book.data.TransactionDAO;
import com.skilldistillery.book2book.data.UserDAO;
import com.skilldistillery.book2book.entities.Book;
import com.skilldistillery.book2book.entities.ContentRating;
import com.skilldistillery.book2book.entities.Genre;
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
	
//	// ADD NEW BOOK TO DB
//	@RequestMapping(path = "add.do", method = RequestMethod.POST)
//	public String addNewBook(@RequestParam("genreName") int[] genreid, @RequestParam("contentRating.id") int contentId,
//			Book book) {
//
//		List<Genre> genres = new ArrayList<>();
//		for (int i : genreid) {
//			Genre genre = bd.findGenreById(i);
//			genres.add(genre);
//		}
//		ContentRating rating = bd.findContentRatingById(contentId);
//
//		book.setContentRating(rating);
//		book.setGenres(genres);
//
//		bd.addBook(book);
//
//		return "redirect:addbook.do";
//	}
//	
//	
//	@RequestMapping(path = "addbook.do", method = RequestMethod.GET)
//	public ModelAndView addedBook() {
//		ModelAndView mv = new ModelAndView();
//		
//		mv.setViewName("book");
//
//		return mv;
//	}
	
	@RequestMapping(path = "addbook.do")
	public ModelAndView addBook() {
		System.out.println("Add Book");
		ModelAndView mv = new ModelAndView();
		Book book = new Book();
		mv.addObject(book);
		mv.setViewName("add");
		return mv;
	}
	
	@RequestMapping(path = "add.do", method = RequestMethod.POST)
	public ModelAndView returnBook(Book book) {
		System.out.println("Return Book");
		// userDAO = new UserDAOimpl();
		ModelAndView mv = new ModelAndView();
		List<Book> allBooks = bd.listAllBooks();
		List<String> allTitles = new ArrayList<>();
		for (Book thisBook : allBooks) {
			allTitles.add(thisBook.getTitle());
		}
		boolean takenTitle = false;
		for (String thisTitle : allTitles) {
			if (thisTitle.equals(book.getTitle())) {
				takenTitle = true;
			}
		}
		System.out.println(book.getTitle());
		
		if (book.getTitle() == null || book.getTitle().equals("") || takenTitle) {
			mv.setViewName("fail");
			mv.addObject("titleFail", true);
			return mv;
		}
		if (book.getAuthor() == null || book.getAuthor().equals("")) {
			mv.setViewName("fail");
			return mv;
		}
		if (book.getDescription() == null || book.getDescription().equals("")) {
			mv.setViewName("fail");
			return mv;
		}
		bd.addBook(book);
		// bookDAO = null;
		mv.addObject(book);
		
		mv.setViewName("success");
		return mv;
	}

	// EDIT BOOK
	@RequestMapping(path = "editingbook.do", method = RequestMethod.POST)
	public String editBook(@RequestParam("genreName") int[] genreid, @RequestParam("contentRating.id") int contentId,
	Book book, @RequestParam("id") int bookid) {
		
		
		List<Genre> genres = new ArrayList<>();
		for (int i : genreid) {
			Genre genre = bd.findGenreById(i);
			genres.add(genre);
		}
		ContentRating rating = bd.findContentRatingById(contentId);

		book.setContentRating(rating);
		book.setGenres(genres);
		

		
		bd.editBook(book, bookid);

		return "redirect:editedBook.do";
	}

	@RequestMapping(path = "editedBook.do", method = RequestMethod.GET)
	public ModelAndView editedBook() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("book");

		return mv;

	}

	// SEACH FOR BOOK
	@RequestMapping(path = "searchbook.do", method = RequestMethod.GET)
	public ModelAndView findBookByKeyword(String keyword) {
		ModelAndView mv = new ModelAndView();

		List<Book> books = bd.searchForBookbyKeyword(keyword);

		mv.addObject("books", books);
		mv.setViewName("bookList");

		return mv;
	}

	// BACK TO HOME BUTTON
	@RequestMapping(path = "home.do", method = RequestMethod.GET)
	public String returnHome() {
		return "book";
	}

	// SEARCH BOOK BY TITLE MOVE TO EDIT PAGE
	@RequestMapping(path = "editbook.do", method = RequestMethod.GET)
	public ModelAndView findBookByName(String title) {
		ModelAndView mv = new ModelAndView();

		List<Book> book = bd.searchForBookbyKeyword(title);
		mv.addObject("books", book);
		mv.setViewName("bookedit");

		return mv;
	}

	// LIST ALL BOOKS
	@RequestMapping(path = "getbooks.do", method = RequestMethod.GET)
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
