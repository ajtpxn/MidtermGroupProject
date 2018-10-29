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
<%-- 
	<c:choose>
		<c:when test="${not empty transaction }">
		<!-- The below is rather ugly and is just for debug
			 Later it should be organized better with a table or something
			 It also assumes that transaction, lender, borrower, book, author have all been added as objects -->
			<ul>
				<li><em>Creation Date:</em> ${transaction.startDate }</li>
				<li><em>Start Date:</em> ${transaction.startDate }</li>
				<li><em>End Date:</em> ${transaction.startDate }</li>
				<li><em>Lender:</em> <a href="user.jsp">${lender.username }</a></li>
				<li><em>Borrower:</em> <a href="user.jsp">${borrower.username }</a></li>
				<li><em>Book:</em> <a href="book.jsp">${book.title }</a></li>
				<li><em>Author:</em> <a href="author.jsp">${author.name }</a></li>
				<li><em>Condition:</em> ${condition }</li>
			</ul>
		</c:when>
		<c:otherwise>The transaction could not be found!</c:otherwise>
	</c:choose>
	 --%>
	
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
	<br>
	</c:forEach>

</body>
</html>