package com.skilldistillery.book2book.data;

import java.util.List;

import com.skilldistillery.book2book.entities.Transaction;

public interface TransactionDAO {
	public Transaction getTransactionById(int id);
	public List<Transaction> getTransactionsByBorrowerId(int id);
	public List<Transaction> getTransactionsByLenderId(int id);
	public List<Transaction> getTransactionsByCopyId(int id);
}
