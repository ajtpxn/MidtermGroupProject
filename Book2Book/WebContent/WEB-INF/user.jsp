<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<title>Home</title>
</head>
<body>
<div class="container">
	<h2>User Details</h2>

	<c:choose>
		<c:when test="${not empty user }">
			<c:when test="${user.active }">
				<ul>
					<li><em>Username:</em> ${transaction.startDate }</li>
					<li><em>Full Name:</em> ${transaction.startDate }</li>
				</ul>
			</c:when>
			<c:otherwise>This account is no longer active.</c:otherwise>
		</c:when>
		<c:otherwise>The user could not be found!</c:otherwise>
	</c:choose>

</div>
</body>
</html>