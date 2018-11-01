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
							<div class="row">
								<div class="col-9">
									<h5>
										Lent Out <em>${copies[loop.index].book.title }</em>
									</h5>
									<ul>
										<li></li>
										<li>Borrower: ${transaction.borrower.userName }</li>
										<li>Start Date: ${transaction.startDate }</li>
										<li>End Date: ${transaction.endDate }</li>
									</ul>
								</div>
								<div class="col-1" align="right">
									<form action="userprofile.do" method="GET">
										<input type="hidden" name="id" value="${copies[loop.index].user.id}">
										<input type="submit" value="View Lender Profile"
											class="btn btn-warning">
									</form>
									<form action="copyDetails.do" method="GET">
										<input type="hidden" name="copy.id" value="${copies[loop.index].id}">
										<input type="submit" value="Copy Details"
											class="btn btn-primary">
									</form>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="row">
								<div class="col-9">
									<h5>
										Borrowed <em>${copies[loop.index].book.title }</em>
									</h5>
									<ul>
										<li>Lender: ${lenders[loop.index].userName }</li>
										<li>Start Date: ${transaction.startDate }</li>
										<li>End Date: ${transaction.endDate }</li>
									</ul>
								</div>
								<div class="col-1" align="right">
									<form action="userprofile.do" method="GET">
										<input type="hidden" name="id" value="${lenders[loop.index].id}">
										<input type="submit" value="View Lender Profile"
											class="btn btn-warning">
									</form>
									<form action="copyDetails.do" method="GET">
										<input type="hidden" name="copy.id" value="${copies[loop.index].id}">
										<input type="submit" value="Copy Details"
											class="btn btn-primary">
									</form>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:when>
			<c:otherwise>
			You do not have any transactions yet!
			</c:otherwise>
		</c:choose>
		<br> <br> <br>
		<%@ include file="footer.jsp"%>
		<br> <br> <br>
	</div>


</body>
</html>