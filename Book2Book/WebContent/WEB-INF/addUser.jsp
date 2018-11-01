<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="stylesheets/adduser.css">
<title>Sign Up</title>
</head>
<body>

<div class="container">

	<%--Edit the file nav.jsp to change nav links --%>
	<%@ include file="nav.jsp"%>
	
	
	<h2 id="title">   Sign Up</h2>
	<div class="row">
	<div id="text" class="col-4">
	<div class="text-danger">
	<p>
	<c:if test="${rejectNotLoggedIn}" >You must be logged in for that. Please sign up or log in.</c:if>
	</p>
	</div>



	<form action="returnUser.do" method="post" modelAttribute="user">
		<!-- <label for="firstName">First Name: </label>  -->
		<input type="text" name="firstName" class="form-control" placeholder="First Name"/> 
		<br>
		<!-- <label for="lastName">Last Name: </label> -->
		<input type="text" name="lastName" class="form-control" placeholder="Last Name"/> 
		<br> 
		<!-- <label for="userName">Username: </label> -->
		<input type="text" name="userName" class="form-control" placeholder="Username"/> 
		<br>
		<!-- <label for="password">Password: </label>  -->
		<input type="password" name="password" class="form-control" placeholder="Password"/> 
		<br>
		<input type="submit" class="form-control btn btn-success btn-block" value="Sign Up">
	</form>
	</div>

	<div class="col">
	<img id="pic" alt="" src="media/StackOfBooks.jpg">
	</div>
	</div>
	
	<br>
	<br>
	<br>
	<%@ include file="footer.jsp"%>
	<br>
	<br>
	<br>
</div>

</body>
</html>