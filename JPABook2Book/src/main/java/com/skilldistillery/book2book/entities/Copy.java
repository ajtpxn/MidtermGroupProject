package com.skilldistillery.book2book.entities;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Copy {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="book_id")
	private Book book;
	
	
	@ManyToOne(cascade=CascadeType.MERGE)
	@JoinColumn(name="condition_id")
	private Condition condition;
	
	
	private boolean available;
	private boolean active;
	@Temporal(TemporalType.TIMESTAMP)
	@CreationTimestamp
	@Column(name="date_added", updatable=false)
	private Date dateAdded;
	@Temporal(TemporalType.TIMESTAMP)
	@CreationTimestamp
	@Column(name="date_removed", updatable=false)
	private Date dateRemoved;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@Column(name = "image_url")
	private String imageUrl;

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	
	public Condition getCondition() {
		return condition;
	}

	public void setCondition(Condition condition) {
		this.condition = condition;
	}

	public boolean isAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public Date getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(Date dateAdded) {
		this.dateAdded = dateAdded;
	}

	public Date getDateRemoved() {
		return dateRemoved;
	}

	public void setDateRemoved(Date dateRemoved) {
		this.dateRemoved = dateRemoved;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getId() {
		return id;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (active ? 1231 : 1237);
		result = prime * result + (available ? 1231 : 1237);
		result = prime * result + ((book == null) ? 0 : book.hashCode());
		
		result = prime * result + ((dateAdded == null) ? 0 : dateAdded.hashCode());
		result = prime * result + ((dateRemoved == null) ? 0 : dateRemoved.hashCode());
		result = prime * result + id;
		result = prime * result + ((user == null) ? 0 : user.hashCode());
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
		Copy other = (Copy) obj;
		if (active != other.active)
			return false;
		if (available != other.available)
			return false;
		if (book == null) {
			if (other.book != null)
				return false;
		} else if (!book.equals(other.book))
			return false;
		if (condition != other.condition)
			return false;
		if (dateAdded == null) {
			if (other.dateAdded != null)
				return false;
		} else if (!dateAdded.equals(other.dateAdded))
			return false;
		if (dateRemoved == null) {
			if (other.dateRemoved != null)
				return false;
		} else if (!dateRemoved.equals(other.dateRemoved))
			return false;
		if (id != other.id)
			return false;
		if (user == null) {
			if (other.user != null)
				return false;
		} else if (!user.equals(other.user))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Copy id: ").append(id).append(" book: ").append(book).append(" conditionId: ")
				.append(condition).append(" available: ").append(available).append(" active: ").append(active)
				.append(" dateAdded: ").append(dateAdded).append(" dateRemoved: ").append(dateRemoved).append(" user: ")
				.append(user);
		return builder.toString();
	}

	public Copy(int id, Book book, Condition condition, boolean available, boolean active, Date dateAdded, Date dateRemoved,
			User user) {
		super();
		this.id = id;
		this.book = book;
		this.condition = condition;
		this.available = available;
		this.active = active;
		this.dateAdded = dateAdded;
		this.dateRemoved = dateRemoved;
		this.user = user;
	}

	public Copy() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	


	
}
