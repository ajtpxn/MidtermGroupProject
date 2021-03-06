package com.skilldistillery.book2book.data;

import java.util.List;

import com.skilldistillery.book2book.entities.Book;
import com.skilldistillery.book2book.entities.ContentRating;
import com.skilldistillery.book2book.entities.Genre;

public interface BookDAO {

	void addBook(Book book);

	List<Book> searchForBookbyKeyword(String search);

	void editBook(Book bookWithNewValues, int idOfBookToBeEdited);

	public Book searchForBookByTitle(String title);

	public List<Book> listAllBooks();

	Book getBookById(int id);

	public Genre findGenreById(int id);

	public ContentRating findContentRatingById(int id);

}
