<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach items="${books}" var="book">
	Title: ${book.title }
	${book.id}
	<form action="copy.do" method="POST">
	<input type="text" value="${book}" name="book">
	<input type="text" value="${user}" name="user">
<input type="submit" value="Add Book to List" class="btn btn-primary btn-lg">
</form>
	
	 
	</c:forEach>
	
<form action="home.do" method="GET">
<input id="home" type="submit" value="Home" class="btn btn-primary btn-lg">
</form>
</body>
</html>