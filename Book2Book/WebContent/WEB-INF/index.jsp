<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<link rel="stylesheet" href="stylesheets/indexpage.css">

<link rel="icon" href="media/favicon.ico">

<title>Home</title>
</head>
<body>

	<div class="container">
	
			
	
			<div class="books-image">
	
					<div id = "nav" class="col offset-10">
						<nav>
							<c:choose>
		
								<c:when test="${not empty USER }">
									<a href="account.do" class="btn btn-primary btn-lg">Account</a>
									<a href="logout.do" class="btn btn-primary btn-lg">Log Out</a>
								</c:when>
								<c:otherwise>
									<a href="login.do" class="btn btn-primary btn-lg">Log In</a>
									<a href="addUser.do" class="btn btn-primary btn-lg">Sign Up</a>
								</c:otherwise>
		
							</c:choose>
						</nav>
					</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>

				<div class="text-center">
		
					<img class="bookbanner" alt="B2B" src="media/Book2BookLogo.jpg">
					
					<strong class="bg-white display-1">&nbsp; Book2Book &nbsp;</strong>
					
				</div>
					
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
		
			</div>
			<div class="booksmargins">
			<hr>
		
			      
			 	<h2 id="booksavail" class="bg-white text-center">Books that are available to Borrow</h2>
			 
			 	<c:forEach items="${availCopies}" var="copy" >
							<hr>
		
							<h4 class="bg-white">${copy.book.title }</h4>
							<p class="bg-white">
							by ${copy.book.author.firstName } ${copy.book.author.lastName } |
							${copy.book.description }
							</p>
						
							<form action="copyDetails.do" method="GET">
								<input type="hidden" name="copy.id" value="${copy.id}"> <input
									type="submit" value="Details and Borrow" class="btn btn-primary btn-block">
							</form>
		
				</c:forEach>
			
			<br>
			
				<div id="searchbutton">
					<form action="listAvailableCopy.do" method="GET">
						<input type="submit" value="Search More Books Available to Borrow"
							class="btn btn-warning btn-lg btn-block">
					</form>
					</div>
			
		 
			</div>
	</div>

</body>
</html>