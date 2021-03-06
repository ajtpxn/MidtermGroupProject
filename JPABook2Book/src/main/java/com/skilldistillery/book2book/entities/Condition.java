package com.skilldistillery.book2book.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="copy_condition")
public class Condition {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@OneToMany(mappedBy="condition")
	private List<Copy> copies;
	
	
	//GETTERS AND SETTERS

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}
	
	

	public List<Copy> getCopies() {
		return copies;
	}

	public void setCopies(List<Copy> copies) {
		this.copies = copies;
	}
	
	public void addCopy( Copy copy) {
		if ( this.copies == null) {
			this.copies = new ArrayList<>();
		}
		if( !copies.contains(copy)) {
			copies.add(copy);
			
		}
	}
	
	public void removeCopy( Copy genre) {
		if (this.copies != null) {
			this.copies.remove(genre);
			
		}
	}
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
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
		Condition other = (Condition) obj;
		if (id != other.id)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Condition id: ").append(id).append(" name: ").append(name);
		return builder.toString();
	}

	public Condition(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Condition() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
