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
	<li><c:out value="${sessionScope.USER.userName }"/></li>
	<li><c:out value="${USER.firstName }"/></li>
	<li><c:out value="${USER.lastName }"/></li>
</ul>

<form action="getbooks.do" method="GET">
<input type="submit" name="seeBook" value="See All Book" >
</form>

Copies:

<c:forEach items="${copies}" var="copy"> 

Copy:



</c:forEach>

</body>
</html>