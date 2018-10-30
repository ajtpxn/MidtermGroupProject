<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<title>Profile</title>
</head>
<body>

<div class="container">

<div class="container">
  <div class="row">
    <div class="col-sm">
	<h2>My Profile</h2>
    </div>
    <div class="col-sm">
	<form action="editProfile.do" method="GET">
		 <input type="submit" name="editProfile"
			value="Edit Profile">
	</form>
    </div>
    <div class="col-sm">
	<%--Edit the file nav.jsp to change nav links --%>
	<%@ include file="nav.jsp"%>
    </div>
  </div>
</div>

	



	<ul>
		<li>Name: <c:out value="${USER.firstName }" /> <c:out
				value="${USER.lastName }" />
		   |    Username: <c:out value="${sessionScope.USER.userName }" /></li>
	</ul>
	
	
	
	
	
	
	<div class="container">
  <div class="row">
    <div class="col-sm">
	<h4> My Books: </h4>
    </div>
    <div class="col-sm">
	<form action="home.do" method="GET">
		<input type="submit" name="seeBook"
			value="Add a book to your list">
	</form>
	
    </div>
    <div class="col-sm">
    </div>
  </div>
</div>
	
	
	

	<c:forEach items="${copies}" var="copy" varStatus="loop">
	<div class="container">
  <div class="row">
    <div class="col-sm">
      
			${copy.book.title} <br> Author: ${copy.book.author.firstName}
			${copy.book.author.lastName} <br> Description:
			${copy.book.description} <br>
    </div>
    <div class="col-sm">
      
		<form action="updateCondition.do" method="post">
			Condition:

			<c:if test="${copy.conditionId == 1}">Brand New</c:if>
			<c:if test="${copy.conditionId == 2}">Well Kept</c:if>
			<c:if test="${copy.conditionId == 3}">Used</c:if>
			<c:if test="${copy.conditionId == 4}">Worn</c:if>
			<c:if test="${copy.conditionId == 5}">Last Legs</c:if>
	<br>
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
    </div>
    <div class="col-sm">
      

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
    </div>
  </div>
</div>
		<hr>
	</c:forEach>
	<br>




	<form action="transaction.do" method="get">
		 <input type="submit" name="seeTransactions"
			value="Books I am Borrowing">
	</form>
	
	
	

</div>
	



</body>
</html>