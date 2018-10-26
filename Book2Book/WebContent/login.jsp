<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
<%--Edit the file nav.jsp to change nav links --%>
<%@ include file="nav.jsp" %>
<h2>Login</h2>

<c:if test="${fail}">Login Failed</c:if>

<c:choose>
<c:when test="${fail}">Login Failed</c:when>
</c:choose>

<form action="login.do" method="post">


<label for="userName">Username: </label>
<input type="text" name="userName" />

<br>


<label for="password">Password: </label>
<input type="text" name="password" />




<input type="submit" value="Log In">
</form>

</body>
</html>