package com.skilldistillery.book2book.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.springframework.stereotype.Repository;

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
	
	
	@Override
	public List<Book> searchForBook(int author, String description, String title, String search) {
		em = emf.createEntityManager();
		List<Book> bookList = new ArrayList<>();
		em.getTransaction().begin();
		String query = "select b from Book b where b.title like :search";
		em.createQuery(query).setParameter("search", search).getResultList();
		em.getTransaction().commit();
		em.close();
		return bookList;
	}

	

}
