package com.skilldistillery.book2book.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.springframework.stereotype.Repository;

import com.skilldistillery.book2book.entities.Author;
import com.skilldistillery.book2book.entities.Book;



@Repository
public class BookDAOImpl implements BookDAO {
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("Book2Book");
	EntityManager em;
	
	
	@Override
	public void addBook(Book book) {
		em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(book);
		em.flush();
		em.getTransaction().commit();
		em.close();
	}
	
	
	@Override
	public void editBook(Author author, int contentRatingId, String description, String title, int id) {
		em = emf.createEntityManager();
		em.getTransaction().begin();
		Book updatedBook = em.find(Book.class, id);
		updatedBook.setAuthor(author);
		updatedBook.setContentRatingId(contentRatingId);
		updatedBook.setDescription(description);
		updatedBook.setTitle(title);
		em.getTransaction().commit();
		em.close();
	}
	
	
	@Override
	public List<Book> searchForBook(String search) {
		em = emf.createEntityManager();
		List<Book> bookList = new ArrayList<>();
		em.getTransaction().begin();
		String query = "select b from Book b where concat(b.title, b.description, b.author.firstName, b.author.lastName) like :search";
		
		bookList = em.createQuery(query, Book.class).setParameter("search", "%"+search+"%").getResultList();
		em.getTransaction().commit();
		em.close();
		return bookList;
	}

	

}
