package com.skilldistillery.book2book.data;

import java.util.List;

import com.skilldistillery.book2book.entities.Book;
import com.skilldistillery.book2book.entities.User;

public interface UserDAO {
	public User creatUser(User user);
	public User updateUser(int id, User updatedUser);
	public boolean deleteUser( int id);
	public List<Book> listAllUserBooks();

}
