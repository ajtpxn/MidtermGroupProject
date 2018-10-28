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

<%@ include file="../nav.jsp" %>


<c:forEach items="${books}" var="book">
<br>
	Title: ${book.title }
	${book.id}
	<form action="copy.do" method="POST" modelAttribute="book">
	<input type="hidden" value="${book.id}" name="bookId">
	<%-- <input type="hidden" value="${user.id}" name="userId"> --%>
<input type="submit" value="Add Book to List" class="btn btn-primary btn-lg">
</form>
	
	</c:forEach>
	
<form action="home.do" method="GET">
<input id="home" type="submit" value="Home" class="btn btn-primary btn-lg">
</form>
</body>
</html>