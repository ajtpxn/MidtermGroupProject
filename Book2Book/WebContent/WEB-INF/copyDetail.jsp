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
<h2>Details on ${copy.book.title}</h2>
<strong>Title:</strong> ${copy.book.title} <br>
<strong>Author:</strong> ${copy.book.author.firstName} ${copy.book.author.lastName}<br>
<strong>Description:</strong> ${copy.book.description }<br>
<strong>Genre:</strong>
<c:forEach items="${copy.book.genres}" var="genre">
 ${genre.genreName }
</c:forEach>
<br>
<strong>Content Rating: </strong> ${copy.book.contentRatingId}<br>
<strong>Condition:</strong>  ${copy.conditionId }<br>
<strong>Lender Name: </strong> ${copy.user.firstName} ${copy.user.lastName}

</body>
</html>