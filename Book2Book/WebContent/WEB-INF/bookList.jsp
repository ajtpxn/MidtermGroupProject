<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<link rel="stylesheet" href="stylesheets/universal.css">

<link rel="icon" href="media/favicon.ico">

<title>Book List</title>
</head>
<body>
<div class="container">
	<%@ include file="./nav.jsp"%>
	
	<hr>
	<div class="booksmargins">
	
	<div class="container">
  <div class="row">
    <div class="col-5">
	<form class="form-inline" action="searchbook.do" method="GET">
	<!-- <label>Keyword: </label>-->
	<input type="text" name="keyword" class="form-control mb-2" placeholder="Keyword"/> 
	<input type="submit" value="Search" class="btn btn-primary form-control mb-2 " />
	</form>
    </div>
    <div class="col-sm">
    <form action="home.do" method="GET">
		<input id="home" type="submit" value="My Book Is Not Listed"
			class="btn btn-warning">
	</form>
    </div>
  </div>
</div>

	<c:choose>
		<c:when test="${not empty books }">
			<c:forEach items="${books}" var="book">
			<hr>
			
			
 	
	
		<div class="container">
				<div class="row">
							<div class="col-1">
											<c:choose>
												<c:when test="${book.imageUrl != null}">
													<img id="coverpics" alt="Book Cover Image"
														src="${book.imageUrl}">
												</c:when>
												<c:otherwise>
													<img id="coverpics" alt="Book Cover Image"
														src="media/placeholder-book-cover-default.png">
												</c:otherwise>
											</c:choose>
							</div>
							<div class="col-7">
					
	${book.title } | by ${book.author.firstName} ${book.author.lastName}
							</div>
							<div class="col-sm">
				
											<div class="float-right">
												<form action="copy.do" method="POST" modelAttribute="book">
												<input type="hidden" value="${book.id}" name="bookId"> <input
													type="submit" value="Add Book to My List"
													class="btn btn-primary">
											</form>
											</div>
							</div>
					</div>
			</div>

			</c:forEach>
		</c:when>
		<c:otherwise>
		No books could be found!
		</c:otherwise>
	</c:choose>
	
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