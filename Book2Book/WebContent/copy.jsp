<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Copies</title>
</head>
<body>
<%@ include file="nav.jsp"%>
	<c:choose>
		<c:when test="${not empty copy }">
			<ul>
				<li>Copy ID: ${copy.copyId }</li>
				<li>Availability?: ${copy.available }</li>
				<li>Date Added: ${copy.dateAdded }</li>
				<li>Date Removed: ${copy.dateRemoved }</li>
				<li>User ID: ${copy.userId }</li>
				<li>Book ID: ${copy.bookId }</li>
				<li>Active?: ${copy.active }</li>
				<li>Condition: ${copy.conditionId }</li>
			</ul>
			<form action="editCopy.do" method="GET">
				Edit Copy?
				<button>Edit</button>
				<input type="hidden" name="id" value="${copy.copyId }" />
			</form>
			<br>
			<form action="deleteCopy.do" method="POST">
				Delete Copy?
				<button onclick="myFunction()">Delete</button>
				<input type="hidden" name="id" value="${copy.copyId }" />
				<script>
					function myFunction() {
						confirm("Are you sure you wish to delete this copy from your library?")
					}
				</script>
			</form>
		</c:when>
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
	</c:choose>
	<form action="index.do">
	<input type="submit" value="Home">
	</form>
</body>
</html>