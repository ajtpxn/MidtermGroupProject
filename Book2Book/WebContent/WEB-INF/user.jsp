<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>

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


</body>
</html>