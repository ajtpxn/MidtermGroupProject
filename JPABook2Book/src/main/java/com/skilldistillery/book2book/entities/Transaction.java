package com.skilldistillery.book2book.entities;

import javax.persistence.Entity;

@Entity
public class Transaction {
	private int id;
	private int borrowId;
	private String startDate;
	private String endDate;
	private int copyId;
	private String dateCreated;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBorrowId() {
		return borrowId;
	}
	public void setBorrowId(int borrowId) {
		this.borrowId = borrowId;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getCopyId() {
		return copyId;
	}
	public void setCopyId(int copyId) {
		this.copyId = copyId;
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
		result = prime * result + borrowId;
		result = prime * result + copyId;
		result = prime * result + ((dateCreated == null) ? 0 : dateCreated.hashCode());
		result = prime * result + ((endDate == null) ? 0 : endDate.hashCode());
		result = prime * result + id;
		result = prime * result + ((startDate == null) ? 0 : startDate.hashCode());
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
		Transaction other = (Transaction) obj;
		if (borrowId != other.borrowId)
			return false;
		if (copyId != other.copyId)
			return false;
		if (dateCreated == null) {
			if (other.dateCreated != null)
				return false;
		} else if (!dateCreated.equals(other.dateCreated))
			return false;
		if (endDate == null) {
			if (other.endDate != null)
				return false;
		} else if (!endDate.equals(other.endDate))
			return false;
		if (id != other.id)
			return false;
		if (startDate == null) {
			if (other.startDate != null)
				return false;
		} else if (!startDate.equals(other.startDate))
			return false;
		return true;
	}
	public Transaction(int id, int borrowId, String startDate, String endDate, int copyId, String dateCreated) {
		super();
		this.id = id;
		this.borrowId = borrowId;
		this.startDate = startDate;
		this.endDate = endDate;
		this.copyId = copyId;
		this.dateCreated = dateCreated;
	}
	public Transaction() {
		super();
	}
	@Override
	public String toString() {
		return "Transaction [id=" + id + ", borrowId=" + borrowId + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", copyId=" + copyId + ", dateCreated=" + dateCreated + "]";
	}
	
	
}
