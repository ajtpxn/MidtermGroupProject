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
<h2>Available Books for Borrow</h2>
<c:forEach items="${availCopies}" var="copy">

${copy.book.title }

<form action="copyDetails.do" method="GET">
	<input type="hidden" name="copy.id" value="${copy.id}">
	<input type="submit" value="Details" class="btn btn-primary btn-lg">
	</form>

<br><br>

</c:forEach>

<form action="home.do" method="GET">
		<input type="submit" value="Home"
			class="btn btn-primary btn-lg">
	</form>

</body>
</html>