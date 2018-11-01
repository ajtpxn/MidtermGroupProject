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
<body>
<div class="container">
<c:when test="${not empty copies }">
			<c:forEach items="${copies }" var="copy">
				<ul>
					<li>Copy ID: ${copy.copyId }</li>
					<li>Available?: ${copy.available }</li>
					<li>Date Added: ${copy.dateAdded }</li>
					<li>Date Removed: ${copy.dateRemoved }</li>
					<li>User ID: ${copy.userId }</li>
					<li>Book ID: ${copy.bookId }</li>
					<li>Active?: ${copy.active }</li>
					<li>Condition: ${copy.conditionId }</li>
				</ul>
			</c:forEach>
			<form action="deleteCopy.do" method="GET">
				Enter Copy ID you wish to delete: <input type="number" name="id"
					value="Please enter a copy ID" /><input type="submit"
					value="Search" />
			</form>
			<form action="editCopy.do" method="GET">
				Enter Copy ID you wish to update: <input type="number" name="id"
					value="Please enter a copy ID" /><input type="submit"
					value="Search" />
			</form>
			</c:when>
			<c:otherwise>
			<h4>No Copy Found</h4>
			</c:otherwise>
			</div>
</body>
</html>