package com.skilldistillery.book2book.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Genre {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name="name")
	private String genreName;
	
	
	@ManyToMany(mappedBy="genres")
	private List<Book> books;
	
	
	
	
	
	
	
	
	//GETTERS AND SETTERS
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGenreName() {
		return genreName;
	}
	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}
	
	public List<Book> getBooks() {
		return books;
	}
	public void setBooks(List<Book> books) {
		this.books = books;
	}
	
	public void addBook( Book book) {
		if ( this.books == null) {
			this.books = new ArrayList<>();
		}
		if( !books.contains(book)) {
			books.add(book);
			book.addGenre(this);
		}
	}
	
	public void removeBook( Book genre) {
		if (this.books != null) {
			this.books.remove(genre);
			genre.removeGenre(this);
		}
	}
	
	
	
	
	
	
	
	
	//HASH AND EQUALS
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((genreName == null) ? 0 : genreName.hashCode());
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
		Genre other = (Genre) obj;
		if (genreName == null) {
			if (other.genreName != null)
				return false;
		} else if (!genreName.equals(other.genreName))
			return false;
		if (id != other.id)
			return false;
		return true;
	}
	public Genre(int id, String genreName) {
		super();
		this.id = id;
		this.genreName = genreName;
	}
	public Genre() {
		super();
	}
	@Override
	public String toString() {
		return "Genre [id=" + id + ", genreName=" + genreName + "]";
	}
	
}
