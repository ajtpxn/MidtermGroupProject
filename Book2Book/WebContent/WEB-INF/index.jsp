<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<c:otherwise><a href="login.do">Log In</a> | <a href="addUser.do">Sign Up</a>
		</c:otherwise>
		
	</c:choose>
</nav>
<h2>Welcome to the site</h2>

to be deleted

<p>
<a href="book.jsp">book</a>
</p>

<p>
<a href="copy.jsp">copy</a>
</p>

<p>
<a href="copytest.jsp">copytest</a>

<p>
<a href="transaction.jsp">transaction</a>
</p>


</body>
</html>