<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 
 <h3>Edit the book: ${book.title}</h3>
	<form action="editbook.do" method="POST">
		<input type="hidden" name="id" value="${book.id}"/> 
		<label>title</label> <input type="text" name="title" value="${book.title}"/> 
		<label>description</label><input type="text" name="description" value="${book.description}" />
		 <label>author first name</label> <input type="text" name="author.firstName" value="${book.author.firstName}" />
		  <label>author last name</label> <input type="text" name="author.lastName" value="${book.author.lastName}" /> 
		  <label>Content</label> <input type="number" name="contentRatingId" value="${book.contentRatingId}" />
		   <input type="submit" value="Edit Book" class="btn btn-Dark" />
	</form>
 
 
 
 
 
 
 
 
 
 
 
 
 <form action="home.do" method="GET">
<input id="home" type="submit" value="Home" class="btn btn-primary btn-lg">
</form>

</body>
</html>