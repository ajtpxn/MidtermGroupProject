<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<link rel="icon" href="media/favicon.ico">

<title>Transaction History</title>
</head>
<body>


	<div class="container">




		<%@ include file="nav.jsp"%>

		<h4>My Transaction History</h4>
		<c:choose>
			<c:when test="${not empty history}">
				<c:forEach items="${history}" var="transaction" varStatus="loop">
					<c:choose>
						<c:when test="${empty lenders[loop.index] }">
							<h5>Lent Out <em>${copies[loop.index].book.title }</em></h5>
							<ul>
								<li></li>
								<li>Borrower: ${transaction.borrower.userName }</li>
								<li>Start Date: ${transaction.startDate }</li>
								<li>End Date: ${transaction.endDate }</li>
							</ul>
						</c:when>
						<c:otherwise>
							<h5>Borrowed <em>${copies[loop.index].book.title }</em></h5>
							<ul>
								<li>Lender: ${lenders[loop.index].userName }</li>
								<li>Start Date: ${transaction.startDate }</li>
								<li>End Date: ${transaction.endDate }</li>
							</ul>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:when>
			<c:otherwise>
			You do not have any transactions yet!
			</c:otherwise>
		</c:choose>

	</div>


</body>
</html>