<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<title>Edit Profile</title>
</head>
<body>
<div class="container">
<%@ include file="nav.jsp"%>
<h1>Edit Profile</h1>

<form action="editingProfile.do" method="post" >
		<label for="firstName">First Name: </label> 
		<input type="text" name="firstName" value="${user.firstName}"/> 
		<br>
		<label for="lastName">Last Name: </label>
		<input type="text" name="lastName" value="${user.lastName}"/> 
		<br> 
		<label for="userName">Username: </label>
		<input type="text" name="userName" value="${user.userName}"/> 
		<br>
		<label for="password">Password: </label> 
		<input type="text" name="password" value="${user.password}" /> 
		<br>
		
		<input type="submit" value="Confirm Edit">
	</form>

</div>
</body>
</html>