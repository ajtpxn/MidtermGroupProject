package com.skilldistillery.book2book.entities;

import javax.persistence.Entity;

@Entity
public class ContentRating {
	private int id;
	private String contentName;
	
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
