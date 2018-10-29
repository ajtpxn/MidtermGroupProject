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
<%@ include file="nav.jsp"%>

	<h2>Transaction Details</h2>

	
	<br>
	Borrowed Books:  
	<br>
	<br>
	
	
	<c:forEach items="${transactions}" var="transaction">
	
	ID: ${transaction.id}
	<br>
	Copy ID: ${transaction.copyId}
	<br>
	Start Date: ${transaction.startDate}
	<br>
	End Date: ${transaction.endDate}
	<br>
	<br>
	
	Copies:
	<c:forEach items="${copies}" var="copy">
	<br>
	Copy:
	<br>
	Transaction copyID: ${transaction.copyId}
	<br>
	Copy ID: ${copy.id}
	<br>

	<br>
	Transaction ID: ${copy.id}
	<br>
	Copy Book Title: ${copy.book.title} <br>
	Copy Book Descripton: ${copy.book.description}
	<br>
	

	
	</c:forEach>
	<br>
	
	</c:forEach>
	
	


</body>
</html>