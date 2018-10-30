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

<title>Home</title>
</head>
<body>

			<img id="bookcase" alt="bookcase" src="media/bookcase.jpg">

			<div id = "nav" class="col offset-10">
				<nav>
					<c:choose>

						<c:when test="${not empty USER }">
							<a href="account.do" class="btn btn-primary btn-sm">Account</a>
							<a href="logout.do" class="btn btn-primary btn-sm">Log Out</a>
						</c:when>
						<c:otherwise>
							<a href="login.do" class="btn btn-primary btn-sm">Log In</a>
							<a href="addUser.do" class="btn btn-primary btn-sm">Sign Up</a>
						</c:otherwise>

					</c:choose>
				</nav>
			</div>
		

<div class="container">
  <div class="row">
    <div class="col">
    </div>
    <div class="col-8">
			<h2 id="title" class="bg-light text-center"> &nbsp; Book2Book &nbsp;</h2>
    </div>
    <div class="col">
    </div>
  </div>
</div>
		


	
	

			<!-- 
	<form action="home.do" method="GET">
		<input type="submit" name="seeBook"
			value="Add a Book You Own to Your Profile" class="btn btn-primary btn-lg" >
	</form>
	 -->
	 <div class="container" class="bg-white">
			  <div class="row" class="bg-white">
			    <div class="col" class="bg-white">
			    </div>
			    <div class="col-8" class="bg-white">
			      
	 <h2 id="booksavail" class="bg-white text-center">Book that are available to Borrow!</h2>
	 
	 <c:forEach items="${availCopies}" var="copy" >
			<hr>

					<h4 class="bg-white">${copy.book.title }</h4>
					<p class="bg-white">
					by ${copy.book.author.firstName } ${copy.book.author.lastName } |
					${copy.book.description }
					</p>
				
					<form action="copyDetails.do" method="GET">
						<input type="hidden" name="copy.id" value="${copy.id}"> <input
							type="submit" value="Details and Borrow" class="btn btn-primary">
					</form>

		</c:forEach>
			      
			    </div>
			    <div class="col">
			    </div>
			  </div>
			</div>
		
		<div class="container" >
		  <div class="row">
		    <div class="col">
		    </div>
		    <div class="col-8">
			<div id="searchbutton">
				<form action="listAvailableCopy.do" method="GET">
					<input type="submit" value="Search More Books Available to Borrow"
						class="btn btn-warning btn-lg">
				</form>
				</div>
		
		    </div>
		    <div class="col">
		    </div>
		  </div>
	 
			
			
	


	<!-- 
	<p>
	<form action="transaction.do" method="GET">
		<input type="submit" name="seeTransactions"
			value="Books I am Borrowing">
	</form>
	</p>
	 -->




</body>
</html>