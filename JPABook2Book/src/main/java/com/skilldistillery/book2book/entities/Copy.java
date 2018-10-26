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
	
//	@Column(name="user_id")
//	private int userId;
	@Column(name="condition_id")
	private int conditionId;
	private boolean available;
	private boolean active;
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
//	public int getUserId() {
//		return userId;
//	}
//	public void setUserId(int userId) {
//		this.userId = userId;
//	}
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
	public Date getDateRemoved() {
		return dateRemoved;
	}
	public void setDateRemoved(Date dateRemoved) {
		this.dateRemoved = dateRemoved;
	}
	
	public User getUsers() {
		return user;
	}

	public void setUsers(User users) {
		this.user = users;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	//HASH CODE
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}
	//EQUALS
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Copy other = (Copy) obj;
		if (id != other.id)
			return false;
		return true;
		
	}
	
	
	//FIELD CONSTRUCTOR
	public Copy(int id, Book book, User user, int conditionId, boolean available, boolean active, Date dateRemoved) {
		super();
		this.id = id;
		this.book = book;
		this.user = user;
		this.conditionId = conditionId;
		this.available = available;
		this.active = active;
		this.dateRemoved = dateRemoved;
	}
	
	//NO ARG
	public Copy() {
		super();
	}
	
	
	//TO STRING
	@Override
	public String toString() {
		return "Copy [id=" + id + ", book=" + book.getTitle() + ", userID=" + user.getId() + ", conditionId=" + conditionId
				+ ", available=" + available + ", active=" + active + ", dateRemoved=" + dateRemoved + "]";
	}
	
	
}
