<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<link rel="icon" href="media/favicon.ico">

<title>Book</title>
</head>
<body>
<div class="container">
<%@ include file="nav.jsp"%>

	
	<form action="getbooks.do" method="GET">
	<input type="submit" value="List All Books" class="btn btn-primary btn-lg" />
	</form>
<hr>
	<h3>Add a new Book</h3>
	<form action="add.do" method="POST">
  <div class="row">
    <div class="col-sm">
		<label>Title</label> 
    </div>
    <div class="col-sm">
		<input type="text" name="title" /> <br>
    </div>
    <div class="col-sm">
      
    </div>
  </div>
  <div class="row">
    <div class="col-sm">
		<label>Description</label>
    </div>
    <div class="col-sm">
		<input type="text" name="description" />
    </div>
    <div class="col-sm">
      
    </div>
  </div>
  <div class="row">
    <div class="col-sm">
		 <label>Author First Name</label> 
    </div>
    <div class="col-sm">
		 <input type="text" name="author.firstName" /><br>
    </div>
    <div class="col-sm">
      
    </div>
  </div>
  <div class="row">
    <div class="col-sm">
		  <label>Author Last Name</label> 
    </div>
    <div class="col-sm">
		  <input type="text" name="author.lastName" /> <br>
    </div>
    <div class="col-sm">
      
    </div>
  </div>
 
		
  <div class="row">
    <div class="col-4">
		  <label>Content Rating</label> 
    </div>
    <div class="col-sm">
		  <select name="contentRating.id">
				<option value="0"></option>
				<option value="1">Kids</option>
				<option value="2">Young Adult</option>
				<option value="3">Adult</option>
				<option value="4">Adult Plus</option>
			</select> <input type="hidden" name="contentRating.id" >
    </div>
    </div>
    
    <div class="row">
     <div class="col-sm">
		  <label>Genre</label> 
    </div>
    <div class="form-check">
    <div class="col-sm">
        <input class="form-check-input" type="checkbox" name="genreName" value="1">
          Childrens
        
        </div>
        <div class="col-sm">
        <input class="form-check-input" type="checkbox" name="genreName" value="2">
          Fantasy
        </div>
        <div class="col-sm">
        <input class="form-check-input" type="checkbox" name="genreName" value="3">
          History
        </div>
        <div class="col-sm">
        <input class="form-check-input" type="checkbox" name="genreName" value="4">
          Biography
        </div>
        <div class="col-sm">
        <input class="form-check-input" type="checkbox" name="genreName" value="5">
          Satire
      </div>
      
		
    </div>
    <div class="col-sm">
		   <input type="submit" value="Add Book" class="btn btn-primary" />
      
    </div>
  </div>
	</form>

<hr>
	<h2>Search for a Book</h2>
	<form action="searchbook.do" method="GET">
	
	<label>Search by Keyword: </label> <input type="text" name="keyword" />
	<input type="submit" value="Search" class="btn btn-primary" />
	
	</form>
	<hr>
	<h2>Edit Book</h2>
		<form action="editbook.do" method="GET">
	
	<label>Search by Keyword: </label> <input type="text" name="title" />
	<input type="submit" value="Search" class="btn btn-primary" />
	
	</form>
	
	</div>
	
</body>
</html>