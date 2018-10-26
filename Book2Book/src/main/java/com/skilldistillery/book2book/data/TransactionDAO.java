package com.skilldistillery.book2book.data;

import java.util.List;

import com.skilldistillery.book2book.entities.Transaction;

public interface TransactionDAO {
	public Transaction makeTransaction(Transaction t);
	public Transaction updateTransaction(int id, Transaction updated);
	public Transaction getTransactionById(int id);
	public List<Object[]> getTransactionsByBorrowerId(int id);
	public List<Object[]> getTransactionsByLenderId(int id);
	public List<Object[]> getTransactionsByCopyId(int id);
}
