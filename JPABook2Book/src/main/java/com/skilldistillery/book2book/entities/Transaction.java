package com.skilldistillery.book2book.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name="copy_transaction")
public class Transaction {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	
	
	@Column(name="start_date")
	private Date startDate;
	
	@Column(name="end_date")
	private Date endDate;
	
	@Column(name="copy_id")
	private int copyId;
	
	@Temporal(TemporalType.TIMESTAMP)
	@CreationTimestamp
	@Column(name="date_created", updatable=false)
	private Date dateCreated;
	
	@ManyToOne
	@JoinColumn(name="borrow_id")
	private User borrower;
	
	
	public User getBorrowers() {
		return borrower;
	}
	public void setBorrowers(User borrower) {
		this.borrower = borrower;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getCopyId() {
		return copyId;
	}
	public void setCopyId(int copyId) {
		this.copyId = copyId;
	}
	public Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Transaction id: ").append(id).append(" startDate: ").append(startDate).append(" endDate: ")
				.append(endDate).append(" copyId: ").append(copyId).append(" dateCreated: ").append(dateCreated)
				.append(" borrower: ").append(borrower);
		return builder.toString();
	}
	public Transaction(int id, Date startDate, Date endDate, int copyId, Date dateCreated, User borrower) {
		super();
		this.id = id;
		this.startDate = startDate;
		this.endDate = endDate;
		this.copyId = copyId;
		this.dateCreated = dateCreated;
		this.borrower = borrower;
	}
	public Transaction() {
		super();
		// TODO Auto-generated constructor stub
	}


	
}
