package com.skilldistillery.book2book.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Book {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String title;
	
	@ManyToOne(cascade=CascadeType.PERSIST)
	@JoinColumn(name="author_id")
	private Author author;
	
	private String description;
	
	@ManyToOne(cascade=CascadeType.PERSIST)
	@JoinColumn(name="content_rating")
	private ContentRating contentRating;
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name="book_genre",
	joinColumns=@JoinColumn(name="book_id"),
	inverseJoinColumns=@JoinColumn(name="genre_id"))
	private List<Genre> genres;
	
//	@Column(name="pic_url")
//	private String picture;
//	
	
	
	//GETTERS ANDN SETTERS 
	
	
	public int getId() {
		return id;
	}
	public List<Genre> getGenres() {
		return genres;
	}
	public void setGenres(List<Genre> genres) {
		this.genres = genres;
	}
	
	public void addGenre( Genre genre) {
		if ( this.genres == null) {
			this.genres = new ArrayList<>();
		}
		if( !genres.contains(genre)) {
			genres.add(genre);
			genre.addBook(this);
		}
	}
	
	public void removeGenre( Genre genre) {
		if (this.genres != null) {
			this.genres.remove(genre);
			genre.removeBook(this);
		}
	}
	
	
	public void setContentRating(ContentRating contentRating) {
		this.contentRating = contentRating;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public ContentRating getContentRating() {
		return contentRating;
	}
	public Author getAuthor() {
		return author;
	}
	public void setAuthor(Author author) {
		this.author = author;
	}
	
	
	
	//HASH AND EQUALS
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((author == null) ? 0 : author.hashCode());
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + id;
		result = prime * result + ((title == null) ? 0 : title.hashCode());
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
		Book other = (Book) obj;
		if (author == null) {
			if (other.author != null)
				return false;
		} else if (!author.equals(other.author))
			return false;
		if (contentRating != other.contentRating)
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (id != other.id)
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Book id: ").append(id).append(" title: ").append(title).append(" author: ").append(author)
				.append(" description: ").append(description).append(" contentRatingId: ").append(contentRating);
		return builder.toString();
	}
	public Book(int id, String title, Author author, String description, ContentRating contentRating) {
		super();
		this.id = id;
		this.title = title;
		this.author = author;
		this.description = description;
		this.contentRating = contentRating;
	}
	public Book() {
		super();
	}
	
	
	
}
