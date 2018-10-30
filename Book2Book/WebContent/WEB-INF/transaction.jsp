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




<%@ include file="nav.jsp"%>

	<h2>Books I am Borrowing</h2>
	<c:forEach items="${transactions}" var="transaction">
	<hr>
	<c:forEach items="${copies}" var="copy">
	<c:if test="${transaction.copyId==copy.id}">
	${copy.book.title} <br>
	${copy.book.description}<br>
	Copy Condition ID: ${copy.conditionId}
	</c:if>
	</c:forEach>
	| Start: ${transaction.startDate}
	| End: ${transaction.endDate} 
	</c:forEach>

	
	
	</div>


</body>
</html>