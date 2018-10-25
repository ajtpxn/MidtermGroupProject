package com.skilldistillery.book2book.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Copy {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name="book_id")
	private int bookId;
	@Column(name="user_id")
	private int userId;
	@Column(name="condition_id")
	private int conditionId;
	private boolean available;
	private boolean active;
	//TODO figure out generated type value for procedurely generated 
	//date
	@GeneratedValue
	@Column(name="date_removed", updatable=false)
	private Date dateRemoved;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
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
	public Date getDateRemoved() {
		return dateRemoved;
	}
	public void setDateRemoved(Date dateRemoved) {
		this.dateRemoved = dateRemoved;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (active ? 1231 : 1237);
		result = prime * result + (available ? 1231 : 1237);
		result = prime * result + bookId;
		result = prime * result + conditionId;
		result = prime * result + ((dateRemoved == null) ? 0 : dateRemoved.hashCode());
		result = prime * result + id;
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
		Copy other = (Copy) obj;
		if (active != other.active)
			return false;
		if (available != other.available)
			return false;
		if (bookId != other.bookId)
			return false;
		if (conditionId != other.conditionId)
			return false;
		if (dateRemoved == null) {
			if (other.dateRemoved != null)
				return false;
		} else if (!dateRemoved.equals(other.dateRemoved))
			return false;
		if (id != other.id)
			return false;
		if (userId != other.userId)
			return false;
		return true;
	}
	public Copy(int id, int bookId, int userId, int conditionId, boolean available, boolean active, Date dateRemoved) {
		super();
		this.id = id;
		this.bookId = bookId;
		this.userId = userId;
		this.conditionId = conditionId;
		this.available = available;
		this.active = active;
		this.dateRemoved = dateRemoved;
	}
	public Copy() {
		super();
	}
	@Override
	public String toString() {
		return "Copy [id=" + id + ", bookId=" + bookId + ", userId=" + userId + ", conditionId=" + conditionId
				+ ", available=" + available + ", active=" + active + ", dateRemoved=" + dateRemoved + "]";
	}
	
	
}
