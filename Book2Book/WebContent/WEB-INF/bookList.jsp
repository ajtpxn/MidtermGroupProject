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

<title>Insert title here</title>
</head>
<body>
<div class="container">
	<%@ include file="./nav.jsp"%>
	
	
	<div class="container">
  <div class="row">
    <div class="col-sm">
		
    </div>
    <div class="col-sm">
	<form action="searchbook.do" method="GET">
	
	<label>Keyword: </label><input type="text" name="keyword" />
	<input type="submit" value="Search" class="btn btn-primary" />
	
	</form>
    </div>
    <div class="col-sm">
    	<form action="home.do" method="GET">
		<input id="home" type="submit" value="Add or Edit"
			class="btn btn-primary btn-lg">
	</form>
    </div>
  </div>
</div>

	<c:choose>
		<c:when test="${not empty books }">
			<c:forEach items="${books}" var="book">
			<hr>
	&nbsp; &nbsp;  ${book.title } | 
	${book.id}
				
				<div class="float-left">
	<form action="copy.do" method="POST" modelAttribute="book">
					<input type="hidden" value="${book.id}" name="bookId"> <input
						type="submit" value="Add Book to My List"
						class="btn btn-primary">
				</form>
				</div>

			</c:forEach>
		</c:when>
		<c:otherwise>
		No books could be found!
		</c:otherwise>
	</c:choose>

	</div>
</body>
</html>