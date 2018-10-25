package com.skilldistillery.book2book.entities;

import javax.persistence.Entity;

@Entity
public class Wishlist {
	
	private int userId;
	private int bookId;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + bookId;
		result = prime * result + userId;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Wishlist other = (Wishlist) obj;
		if (bookId != other.bookId)
			return false;
		if (userId != other.userId)
			return false;
		return true;
	}
	public Wishlist(int userId, int bookId) {
		super();
		this.userId = userId;
		this.bookId = bookId;
	}
	public Wishlist() {
		super();
	}
	@Override
	public String toString() {
		return "Wishlist [userId=" + userId + ", bookId=" + bookId + "]";
	}
	
}
