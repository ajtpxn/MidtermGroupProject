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
	public void editBook(Book bookWithNewValues, int idOfBookToBeEdited) {
		em = emf.createEntityManager();
		em.getTransaction().begin();
		Author managedAuthor = bookWithNewValues.getAuthor();
	
		Book updatedBook = em.find(Book.class, idOfBookToBeEdited);
		//USES AUTHOR MANAGED AUTHOR ABOVE
		updatedBook.setAuthor( managedAuthor);
		
		updatedBook.setContentRatingId(bookWithNewValues.getContentRatingId());
		updatedBook.setDescription(bookWithNewValues.getDescription());
		updatedBook.setTitle(bookWithNewValues.getTitle());
		em.getTransaction().commit();
		em.close();
	}
	
	
	@Override
	public List<Book> searchForBookbyKeyword(String search) {
		em = emf.createEntityManager();
		List<Book> bookList = new ArrayList<>();
		em.getTransaction().begin();
		String query = "select b from Book b where concat(b.title, b.description, b.author.firstName, b.author.lastName) like :search";
		bookList = em.createQuery(query, Book.class).setParameter("search", "%"+search+"%").getResultList();
		em.getTransaction().commit();
		em.close();
		return bookList;
	}
	
	
	public Book searchForBookByTitle( String title) {
		
		em = emf.createEntityManager();
		
		String query = "SELECT b FROM Book b where b.title like :title";
		Book book = em.createQuery(query, Book.class).setParameter("title", "%"+title+"%").getSingleResult();
		
		
		em.close();
		return book;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
