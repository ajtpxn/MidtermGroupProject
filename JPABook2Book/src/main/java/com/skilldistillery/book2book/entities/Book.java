package com.skilldistillery.book2book.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Book {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String title;
	@Column(name="author_id")
	private int authorId;
	private String description;
	@Column(name="content_rating")
	private int contentRatingId;
	private int isbn;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getAuthorId() {
		return authorId;
	}
	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getContentRatingId() {
		return contentRatingId;
	}
	public void setContentRatingId(int contentRatingId) {
		this.contentRatingId = contentRatingId;
	}
	public int getIsbn() {
		return isbn;
	}
	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + authorId;
		result = prime * result + contentRatingId;
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + isbn;
		result = prime * result + id;
		result = prime * result + ((title == null) ? 0 : title.hashCode());
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
		Book other = (Book) obj;
		if (authorId != other.authorId)
			return false;
		if (contentRatingId != other.contentRatingId)
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (isbn != other.isbn)
			return false;
		if (id != other.id)
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}
	public Book(int id, String title, int authorId, String description, int contentRatingId, int isbn) {
		super();
		this.id = id;
		this.title = title;
		this.authorId = authorId;
		this.description = description;
		this.contentRatingId = contentRatingId;
		this.isbn = isbn;
	}
	public Book() {
		super();
	}
	@Override
	public String toString() {
		return "Book [id=" + id + ", title=" + title + ", authorId=" + authorId + ", description=" + description
				+ ", contentRatingId=" + contentRatingId + ", isbn=" + isbn + "]";
	}
	
}
