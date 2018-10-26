package com.skilldistillery.book2book.data;

import java.util.List;

import com.skilldistillery.book2book.entities.Copy;
import com.skilldistillery.book2book.entities.Transaction;
import com.skilldistillery.book2book.entities.User;

public interface UserDAO {
	public User creatUser(User user);
	public User updateUser(int id, User updatedUser);
	public boolean deleteUser( int id);
	public List<Copy> listAllUserBooks(int userId);
	public User findUser( int id);
	public List<Transaction> listAllTransactionsByUserId( int userId);
	public User getUserByCredentials(String userName, String password);
}
