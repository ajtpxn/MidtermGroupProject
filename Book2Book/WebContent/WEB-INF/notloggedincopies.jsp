<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<link rel="icon" href="media/favicon.ico">

<title>Copies</title>
</head>
<!-- 
					<li>User ID: ${copy.userId }</li>
					<li>Book ID: ${copy.bookId }</li>
					<li>Active?: ${copy.active }</li>
					<li>Condition: ${copy.conditionId }</li>
					-->
<body>
<div class="container">
	<%@ include file="nav.jsp"%>
	<c:choose>
		<c:when test="${not empty copies }">
			<c:forEach items="${copies }" var="copy">
				<ul>
					<li>Copy ID: ${copy.id }</li>
					<li>Available?: ${copy.available }</li>
					<li>Date Added: ${copy.dateAdded }</li>
					<li>Date Removed: ${copy.dateRemoved }</li>
				</ul>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<h4>No Copy Found</h4>
		</c:otherwise>
	</c:choose>
	<form action="index.do">
		<input type="submit" value="Home">
	</form>
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