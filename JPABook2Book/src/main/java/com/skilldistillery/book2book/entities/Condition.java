package com.skilldistillery.book2book.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="copy_condition")
public class Condition {
	@Id
//	@GeneratedValue(strategy=GenerationType.IDENTITY)
//	@OneToMany(mappedBy="conditionId")
	private int id;
	private String condition;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((condition == null) ? 0 : condition.hashCode());
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
		Condition other = (Condition) obj;
		if (condition == null) {
			if (other.condition != null)
				return false;
		} else if (!condition.equals(other.condition))
			return false;
		if (id != other.id)
			return false;
		return true;
	}
	public Condition(int id, String condition) {
		super();
		this.id = id;
		this.condition = condition;
	}
	public Condition() {
		super();
	}
	@Override
	public String toString() {
		return "Condition [id=" + id + ", condition=" + condition + "]";
	}
	
	
	
}
