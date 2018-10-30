<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Home</title>
</head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet" href="stylesheets/indexpage.css">
<body>
	<div class="container-fluid">
		<div class="row">
			<img id="bookcase" alt="bookcase" src="media/bookcase.jpg">
			<div class="col offset-9">
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


			<h2 id="title">Book2Book</h2>
		
		</div>

	</div>
	
	<div class="container">
		<div class="row">

			<!-- 
	<form action="home.do" method="GET">
		<input type="submit" name="seeBook"
			value="Add a Book You Own to Your Profile" class="btn btn-primary btn-lg" >
	</form>
	 -->
			<div id="searchbutton" class="col">
				<form action="listAvailableCopy.do" method="GET">
					<input type="submit" value="Search Books Available to Borrow"
						class="btn btn-warning btn-lg">
				</form>
			</div>
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