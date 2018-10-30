<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<title>Home</title>
</head>
<body>
<div class="container">
	<%--Edit the file nav.jsp to change nav links --%>
	<nav>

		<c:choose>

			<c:when test="${not empty USER }">
				<a href="account.do">Account</a> |
		<a href="logout.do">Log Out</a>
			</c:when>
			<c:otherwise>
				<a href="login.do">Log In</a> | <a href="addUser.do">Sign Up</a>
			</c:otherwise>

		</c:choose>
	</nav>
	<h2>Book2Book</h2>

	
	<form action="getbooks.do" method="GET">
		<input type="submit" name="seeBook"
			value="Add a book you own to your profile" class="btn btn-primary btn-lg" >
	</form>
	<br>
	<form action="listAvailableCopy.do" method="GET">
		<input type="submit" value="Search Available Books to Borrow"
			class="btn btn-warning btn-lg">
	</form>


<!-- 
	<p>
	<form action="transaction.do" method="GET">
		<input type="submit" name="seeTransactions"
			value="Books I am Borrowing">
	</form>
	</p>
	 -->
	
	
</div>

</body>
</html>