package com.skilldistillery.book2book.data;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.springframework.stereotype.Repository;

import com.skilldistillery.book2book.entities.Book;
import com.skilldistillery.book2book.entities.Copy;


@Repository
public class BookDAOImpl implements BookDAO {
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("Book2Book");
	EntityManager em;
	
	
	@Override
	public void addBook(Book book) {
		em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(book);
		em.getTransaction().commit();
		em.close();
	}
	
	
	@Override
	public void editBook(int authorId, int contentRatingId, String description, String title, int id) {
		em = emf.createEntityManager();
		em.getTransaction().begin();
		Book updatedBook = em.find(Book.class, id);
		updatedBook.setAuthorId(authorId);
		updatedBook.setContentRatingId(contentRatingId);
		updatedBook.setDescription(description);
		updatedBook.setTitle(title);
		em.getTransaction().commit();
		em.close();
	}
	

	
	
	

}
