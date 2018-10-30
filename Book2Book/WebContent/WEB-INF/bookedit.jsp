<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>
<div class="container">
 
 <h3>Edit the book: ${book.title}</h3>
	<form action="editbook.do" method="POST">
		<input type="hidden" name="id" value="${book.id}"/> 
		<label>title</label> <input type="text" name="title" value="${book.title}"/> 
		<label>description</label><input type="text" name="description" value="${book.description}" />
		 <label>author first name</label> <input type="text" name="author.firstName" value="${book.author.firstName}" />
		  <label>author last name</label> <input type="text" name="author.lastName" value="${book.author.lastName}" /> 
		  <label>Content</label> <input type="text" name="contentRating" value="${book.contentRating}" />
		   <input type="submit" value="Edit Book" class="btn btn-Dark" />
	</form>
 
 
 
 
 
 
 
 
 
 
 
 
 <form action="home.do" method="GET">
<input id="home" type="submit" value="Home" class="btn btn-primary btn-lg">
</form>
</div>
</body>
</html>