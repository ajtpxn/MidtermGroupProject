package com.skilldistillery.book2book.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="content_rating")
public class ContentRating {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name")
	private String contentName;
	
	@OneToMany(mappedBy="contentRating")
	private List<Book> booksbyRating;
	
	//GETTERS AND SETTERS
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContentName() {
		return contentName;
	}
	public void setContentName(String contentName) {
		this.contentName = contentName;
	}
	
	
	public List<Book> getBooksbyRating() {
		return booksbyRating;
	}
	public void setBooksbyRating(List<Book> booksbyRating) {
		this.booksbyRating = booksbyRating;
	}
	//HASHCODE AND EQUALS
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((contentName == null) ? 0 : contentName.hashCode());
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
		ContentRating other = (ContentRating) obj;
		if (contentName == null) {
			if (other.contentName != null)
				return false;
		} else if (!contentName.equals(other.contentName))
			return false;
		if (id != other.id)
			return false;
		return true;
	}
	public ContentRating(int id, String contentName) {
		super();
		this.id = id;
		this.contentName = contentName;
	}
	public ContentRating() {
		super();
	}
	@Override
	public String toString() {
		return "ContentRating [id=" + id + ", contentName=" + contentName + "]";
	}
	
}
