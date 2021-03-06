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
	
<link rel="stylesheet" href="stylesheets/universal.css">

<link rel="icon" href="media/favicon.ico">

<title>Books Available to Borrow</title>
</head>
<body>

	<div class="container">
		<%@ include file="nav.jsp"%>
		<h2>Books Available to Borrow</h2>
			<hr>
			
			<div class="booksmargins">
		<c:forEach items="${availCopies}" var="copy">

			<div class="row">
				<div class="col-1">
											<c:choose>
												<c:when test="${copy.book.imageUrl != null}">
													<img id="coverpics" alt="Book Cover Image"
														src="${copy.book.imageUrl}">
												</c:when>
												<c:otherwise>
													<img id="coverpics" alt="Book Cover Image"
														src="media/placeholder-book-cover-default.png">
												</c:otherwise>
											</c:choose>
				</div>
				<div class="col-8">
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

			<hr>
		</c:forEach>
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