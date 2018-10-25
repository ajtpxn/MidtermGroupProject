package com.skilldistillery.book2book.data;

import java.util.List;

import com.skilldistillery.book2book.entities.Book;

public interface BookDAO {



	void editBook(int authorId, int contentRatingId, String description, String title, int id);

	void addBook(Book book);

	List<Book> searchForBook(int author, String description, String title, String search);


}
