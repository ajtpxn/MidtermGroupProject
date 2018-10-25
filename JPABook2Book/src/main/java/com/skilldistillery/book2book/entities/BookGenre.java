package com.skilldistillery.book2book.entities;

import javax.persistence.Entity;

@Entity
public class BookGenre {
	private int bookId;
	private int genreId;
	
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public int getGenreId() {
		return genreId;
	}
	public void setGenreId(int genreId) {
		this.genreId = genreId;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + bookId;
		result = prime * result + genreId;
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
		BookGenre other = (BookGenre) obj;
		if (bookId != other.bookId)
			return false;
		if (genreId != other.genreId)
			return false;
		return true;
	}
	public BookGenre(int bookId, int genreId) {
		super();
		this.bookId = bookId;
		this.genreId = genreId;
	}
	public BookGenre() {
		super();
	}
	@Override
	public String toString() {
		return "BookGenre [bookId=" + bookId + ", genreId=" + genreId + "]";
	}
	
}
