package com.skilldistillery.book2book.data;

import java.util.List;

import com.skilldistillery.book2book.entities.Copy;

public interface CopyDAO {



	void addCopy(Copy copy);

	void editCopy(Copy copy, int id);
	
	List<Copy> listCopies();

	void deleteCopy(int id);
	
	List<Copy> listBookCopies(int bookId);
	
	List<Copy> listUserCopies(int userId);

}
