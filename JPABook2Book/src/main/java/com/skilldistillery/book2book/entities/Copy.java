package com.skilldistillery.book2book.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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

	@Column(name="condition_id")
	private int conditionId;
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
	
	//GETTERS AND SETTERS

	public int getId() {
		return id;
	}
	
	public Book getBook() {
		return book;
	}
	public void setBookId(Book book) {
		this.book= book;
	}
	public int getConditionId() {
		return conditionId;
	}
	public void setConditionId(int conditionId) {
		this.conditionId = conditionId;
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

	public void setUser(User users) {
		this.user = users;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (active ? 1231 : 1237);
		result = prime * result + (available ? 1231 : 1237);
		result = prime * result + ((book == null) ? 0 : book.hashCode());
		result = prime * result + conditionId;
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
		if (conditionId != other.conditionId)
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


	public Copy(int id, Book book, User user, int conditionId, boolean available, boolean active, Date dateRemoved, Date dateAdded) {

		super();
		this.id = id;
		this.book = book;
		this.user = user;
		this.conditionId = conditionId;
		this.available = available;
		this.active = active;
		this.dateAdded = dateAdded;
		this.dateRemoved = dateRemoved;
	}
	
	//NO ARG
	public Copy() {
		super();
	}
	
	//TO STRING
	@Override
	public String toString() {
		return "Copy [id=" + id + ", book=" + book + ", conditionId=" + conditionId + ", available=" + available
				+ ", active=" + active + ", dateAdded=" + dateAdded + ", dateRemoved=" + dateRemoved + ", user=" + user
				+ "]";
	}
	
	
}
