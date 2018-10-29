<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book</title>
</head>
<body>
<%@ include file="nav.jsp"%>

	<h2>Book</h2>


	<h3>Add a new Book</h3>
	<form action="add.do" method="POST">
		<label>title</label> <input type="text" name="title" /> 
		<label>description</label><input type="text" name="description" />
		 <label>author first name</label> <input type="text" name="author.firstName" />
		  <label>author last name</label> <input type="text" name="author.lastName" /> 
		  <label>Content</label> <input type="number" name="contentRatingId" />
		   <input type="submit" value="Add Book" class="btn btn-Dark" />
	</form>
	<h2>Search Book</h2>
	<form action="searchbook.do" method="GET">
	
	<label>search by keyword</label> <input type="text" name="keyword" />
	<input type="submit" value="Search Book" class="btn btn-Dark" />
	
	</form>
	<h2>Edit Book</h2>
		<form action="editbook.do" method="GET">
	
	<label>search by keyword</label> <input type="text" name="title" />
	<input type="submit" value="Search Book title" class="btn btn-Dark" />
	
	</form>
	
	
</body>
</html>