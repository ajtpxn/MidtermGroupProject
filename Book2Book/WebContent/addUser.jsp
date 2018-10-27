<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add User</title>
</head>
<body>
	<%--Edit the file nav.jsp to change nav links --%>
	<%@ include file="nav.jsp"%>
	<h2>Add User</h2>

	<form action="returnUser.do" method="post" modelAttribute="user">
		<label for="firstName">First Name: </label> 
		<input type="text" name="firstName" /> 
		<br>
		<label for="lastName">Last Name: </label>
		<input type="text" name="lastName" /> 
		<br> 
		<label for="userName">Username: </label>
		<input type="text" name="userName" /> 
		<br>
		<label for="password">Password: </label> 
		<input type="text" name="password" /> 
		
		<input type="submit" value="Add User">
	</form>

</body>
</html>