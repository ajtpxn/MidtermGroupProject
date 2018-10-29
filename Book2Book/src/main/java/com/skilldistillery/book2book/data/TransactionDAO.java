package com.skilldistillery.book2book.data;

import java.util.Date;
import java.util.List;

import com.skilldistillery.book2book.entities.Transaction;
import com.skilldistillery.book2book.entities.User;

public interface TransactionDAO {
	public Transaction makeTransaction(Transaction t);
	public Transaction updateTransaction(int id, Transaction updated);
	public Transaction getTransactionById(int id);
	public List<Transaction> getTransactionsByBorrowerId(int id);
	public List<Transaction> getTransactionsByLenderId(int id);
	public List<Transaction> getTransactionsByCopyId(int id);
	public User getTransactionByCopyIdAndDate(int id, Date date);	
}
