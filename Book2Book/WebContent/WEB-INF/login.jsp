<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="stylesheets/login.css">
<title>Login</title>
</head>
<body>
<div class="container">
<%--Edit the file nav.jsp to change nav links --%>
<div id="nav">
<%@  include file="nav.jsp" %>
</div>
<h2>Login</h2>
<img id="openbook" alt="openbook" src="media/openbook.jpg">
<form id ="login" action="login.do" method="post" modelAttribute="user">


<label for="userName">Username: </label>
<input type="text" name="userName" />

<br>


<label id="pass" for="password">Password: </label>
<input type="password" name="password" />




<input id="submit" type="submit" value="Log In" class="btn btn-success btn-lg btn-block">
</form>

</div>
</body>
</html>