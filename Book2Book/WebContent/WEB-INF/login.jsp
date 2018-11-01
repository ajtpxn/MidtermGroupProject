<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<link rel="stylesheet" href="stylesheets/login.css">
 
<link rel="icon" href="media/favicon.ico">

<title>Login</title>
</head>
<body>

<div class="container">

<%--Edit the file nav.jsp to change nav links --%>
<%@  include file="nav.jsp" %>

<h2>Login</h2>

		
		
		 <div class="book-image">
		 
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			<div class="row">&nbsp;</div>
			
			<form  id ="login" action="login.do" method="post" modelAttribute="user">
					<div class="container">
					  <div class="row">
					    <div class="col-2">
					    </div>
					    <div class="col-sm">
						<input type="text" name="userName" class="form-control" placeholder="Username"/>
					    </div>
					    <div class="col-2">
					    </div>
					  </div>
					</div>
					<div class="container">
					  <div class="row">
					    <div class="col-2">
					    </div>
					    <div class="col-sm">
						<input type="password" name="password" class="form-control" placeholder="Password"/> <br>
					    </div>
					    <div class="col-2">
					    </div>
					  </div>
					</div>
					<div class="container">
					  <div class="row">
					    <div class="col-2">
					    </div>
					    <div class="col-sm">
						<input id="submit" type="submit" value="Log In" class="btn btn-success btn-lg btn-block">
					    </div>
					    <div class="col-2">
					    </div>
					  </div>
					</div>
			</form>
			
		 </div>
			
			

</div>
</body>
</html>