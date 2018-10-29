<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
</head>
<body>
<%@ include file="nav.jsp"%>
<h1>Edit Profile</h1>

<form action="returnUser.do" method="post" modelAttribute="user">
		<label for="firstName">First Name: </label> 
		<input type="text" name="firstName" value="${user.firstName}"/> 
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