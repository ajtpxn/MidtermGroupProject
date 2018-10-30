<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile</title>
</head>
<body>
	<%--Edit the file nav.jsp to change nav links --%>
	<%@ include file="nav.jsp"%>
	<h2>My Profile</h2>



	<h2>Your Detail</h2>
	<ul>
		<li>Name: <c:out value="${USER.firstName }" /> <c:out
				value="${USER.lastName }" /></li>
		<li>Username: <c:out value="${sessionScope.USER.userName }" /></li>
	</ul>
	*****************************************************************
	<br>
	<p>Your Books:</p>
	__________________________________
	<c:forEach items="${copies}" var="copy" varStatus="loop">
		<p>
			${copy.book.title} <br> Author: ${copy.book.author.firstName}
			${copy.book.author.lastName} <br> Description:
			${copy.book.description} <br>
		<form action="updateCondition.do" method="post">
			Condition:

			<c:if test="${copy.conditionId == 1}">Brand New</c:if>
			<c:if test="${copy.conditionId == 2}">Well Kept</c:if>
			<c:if test="${copy.conditionId == 3}">Used</c:if>
			<c:if test="${copy.conditionId == 4}">Worn</c:if>
			<c:if test="${copy.conditionId == 5}">Last Legs</c:if>

			<select name="conditionId">
				<option value="0"></option>
				<option value="1">Brand New</option>
				<option value="2">Well Kept</option>
				<option value="3">Used</option>
				<option value="4">Worn</option>
				<option value="5">Last Legs</option>
			</select> <input type="hidden" name="copyId" value="${copy.id}"> <input
				type="submit" name="updateCopy" value="Update">
		</form>

		Current Status:
		<c:choose>
			<c:when test="${empty borrowers[loop.index]}">
				Available
			</c:when>
			<c:otherwise>
				Lent out to ${borrowers[loop.index].firstName} ${borrowers[loop.index].lastName}
			</c:otherwise>
		</c:choose>

		<form action="removeCopy.do" method="post">
			<input type="hidden" name="copyId" value="${copy.id}"> <input
				type="submit" name="removeCopy" value="Remove Book">
		</form>

__________________________________<br>
		<br>
		<br>
	</c:forEach>
	*****************************************************************
	<br>
	<p>
	<form action="getbooks.do" method="GET">
		Add a book to your list: <input type="submit" name="seeBook"
			value="See All Book">
	</form>
	</p>



	<h4>Transaction List</h4>

	<p>
	<form action="transaction.do" method="get">
		 <input type="submit" name="seeTransactions"
			value="Books I am Borrowing">
	</form>
	</p>
	
	
	<p>
	<form action="editProfile.do" method="GET">
		 <input type="submit" name="editProfile"
			value="Edit Profile">
	</form>
	</p>
	
	



</body>
</html>