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
<%@ include file="nav.jsp" %>
<h2>My Profile</h2>



<h2>Your Detail</h2>
<ul>
	<li>Name: <c:out value="${USER.firstName }"/> <c:out value="${USER.lastName }"/></li>
	<li>Username: <c:out value="${sessionScope.USER.userName }"/></li>
</ul>
*****************************************************************<br>
<p>
Your Books:
</p>
<c:forEach items="${copies}" var="copy"> 
<p>
${copy.book.title}
<br>
Author: ${copy.book.author.firstName} ${copy.book.author.lastName}
<br>
Description ${copy.book.description}
<br>
Condition: ${copy.conditionId}
<form action="removeCopy.do" method="post">
<input type="hidden" name="copyId" value="${copy.id}">
<input type="submit" name="removeCopy" value="Remove Book" >
</form>
</p>
</c:forEach>
*****************************************************************<br>
Add a book to your list:
<p>
<form action="getbooks.do" method="GET">
<input type="submit" name="seeBook" value="See All Book" >
</form>
</p>

</body>
</html>