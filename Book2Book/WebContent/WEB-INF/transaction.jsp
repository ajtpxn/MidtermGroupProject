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

	<h2>Borrowed Books</h2>
	
	<c:forEach items="${transactions}" var="transaction">
	<c:forEach items="${copies}" var="copy">
	<c:if test="${transaction.copyId==copy.id}">
	Title: ${copy.book.title} <br>
	Descripton: ${copy.book.description}<br>
	Copy Condition ID: ${copy.conditionId}
	</c:if>
	</c:forEach>
	<br>
	Transaction ID: ${transaction.id} <br>
	Transaction Copy ID: ${transaction.copyId} <br>
	Transaction Start Date: ${transaction.startDate} <br>
	Transaction End Date: ${transaction.endDate} <br>
	<br>
	
	
	
	</c:forEach>
	
	


</body>
</html>