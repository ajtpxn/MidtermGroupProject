package com.skilldistillery.book2book.entities;

import javax.persistence.Entity;

@Entity
public class Rating {
	private int id;
	private int userId;
	private int bookId;
	private String rating;
	private String dateCreated;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
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
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + bookId;
		result = prime * result + ((dateCreated == null) ? 0 : dateCreated.hashCode());
		result = prime * result + id;
		result = prime * result + ((rating == null) ? 0 : rating.hashCode());
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
		Rating other = (Rating) obj;
		if (bookId != other.bookId)
			return false;
		if (dateCreated == null) {
			if (other.dateCreated != null)
				return false;
		} else if (!dateCreated.equals(other.dateCreated))
			return false;
		if (id != other.id)
			return false;
		if (rating == null) {
			if (other.rating != null)
				return false;
		} else if (!rating.equals(other.rating))
			return false;
		if (userId != other.userId)
			return false;
		return true;
	}
	public Rating(int id, int userId, int bookId, String rating, String dateCreated) {
		super();
		this.id = id;
		this.userId = userId;
		this.bookId = bookId;
		this.rating = rating;
		this.dateCreated = dateCreated;
	}
	public Rating() {
		super();
	}
	@Override
	public String toString() {
		return "Rating [id=" + id + ", userId=" + userId + ", bookId=" + bookId + ", rating=" + rating
				+ ", dateCreated=" + dateCreated + "]";
	}
	
	
}
