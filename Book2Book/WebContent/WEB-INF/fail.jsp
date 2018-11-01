<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<link rel="icon" href="media/favicon.ico">

<title>Fail</title>
</head>
<body>
<div class="container">
<%--Edit the file nav.jsp to change nav links --%>
<%@ include file="nav.jsp" %>
<h2>Fail</h2>

<c:choose>
<c:when test="${userNameFail}">
<p>
That username is already taken.  Please try again.
</p>
</c:when>
<c:otherwise>
<p>
The action you were attempting has failed.
</p>
</c:otherwise>
</c:choose>
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