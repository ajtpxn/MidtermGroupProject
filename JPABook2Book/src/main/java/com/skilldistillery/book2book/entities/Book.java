package com.skilldistillery.book2book.entities;

import javax.persistence.Entity;

@Entity
public class Book {
	private int id;
	private String title;
	private int authorId;
	private String description;
	private int contentRatingId;
	private int genreId;
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
		result = prime * result + authorId;
		result = prime * result + contentRatingId;
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + genreId;
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
		if (genreId != other.genreId)
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
	public Book(int id, String title, int authorId, String description, int contentRatingId, int genreId) {
		super();
		this.id = id;
		this.title = title;
		this.authorId = authorId;
		this.description = description;
		this.contentRatingId = contentRatingId;
		this.genreId = genreId;
	}
	public Book() {
		super();
	}
	@Override
	public String toString() {
		return "Book [id=" + id + ", title=" + title + ", authorId=" + authorId + ", description=" + description
				+ ", contentRatingId=" + contentRatingId + ", genreId=" + genreId + "]";
	}
	
}
