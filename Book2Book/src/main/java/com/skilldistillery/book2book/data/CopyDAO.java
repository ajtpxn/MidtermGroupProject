package com.skilldistillery.book2book.data;

import java.util.List;

import com.skilldistillery.book2book.entities.Copy;

public interface CopyDAO {



	void addCopy(Copy copy);

	void editCopy(int conditionId, int id);
	
	List<Copy> searchForCopy(int id);

	void deleteCopy(int id);

}
