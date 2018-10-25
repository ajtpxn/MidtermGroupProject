package com.skilldistillery.book2book.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Wishlist {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="book_id")
	private int bookId;
	
	public int getUserId() {
		return id;
	}
	public void setUserId(int userId) {
		this.id = userId;
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
		result = prime * result + id;
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
		if (id != other.id)
			return false;
		return true;
	}
	public Wishlist(int userId, int bookId) {
		super();
		this.id = userId;
		this.bookId = bookId;
	}
	public Wishlist() {
		super();
	}
	@Override
	public String toString() {
		return "Wishlist [userId=" + id + ", bookId=" + bookId + "]";
	}
	
}
