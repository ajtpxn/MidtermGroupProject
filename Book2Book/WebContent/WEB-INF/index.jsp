<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
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
	<h2>Welcome to the site</h2>

	
	<form action="getbooks.do" method="GET">
		Add a book to your list: <input type="submit" name="seeBook"
			value="See All Book">
	</form>
	<br>
	<form action="listAvailableCopy.do" method="GET">
		<input type="submit" value="Search Available Books"
			class="btn btn-warning btn-lg">
	</form>

	<p>
	<form action="transaction.do" method="GET">
		<input type="submit" name="seeTransactions"
			value="Books I am Borrowing">
	</form>
	</p>


</body>
</html>