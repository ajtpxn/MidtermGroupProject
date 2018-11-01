<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
	
	<link rel="icon" href="media/favicon.ico">

<title>Books Available to Borrow</title>
</head>
<body>

	<div class="container">
		<%@ include file="nav.jsp"%>
		<h2>Books Available to Borrow</h2>
		<c:forEach items="${availCopies}" var="copy">
			<hr>

			<div class="row">
				<div class="col-9">
					<h4>${copy.book.title }</h4>
					by ${copy.book.author.firstName } ${copy.book.author.lastName } |
					${copy.book.description }
				</div>
				<div class="col-1" align="right">
					<form action="userprofile.do" method="GET">
						<input type="hidden" name="id" value="${copy.user.id}"> <input
							type="submit" value="View Owner Profile"
							class="btn btn-warning">
					</form>
					<form action="copyDetails.do" method="GET">
						<input type="hidden" name="copy.id" value="${copy.id}"> <input
							type="submit" value="Details and Borrow" class="btn btn-primary">
					</form>
				</div>
			</div>

		</c:forEach>

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