<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<link rel="icon" href="media/favicon.ico">

<title>Profile</title>
</head>
<body>

<div class="container">

<div class="container">
  <div class="row">
    <div class="col-sm">
	<h2>My Profile
	
	<a href="editProfile.do" class="btn btn-secondary btn-sm" >Edit Profile</a>
	</h2>
	
    </div>
    <div class="col-sm">
    </div>
    <div class="col-sm">
	<%--Edit the file nav.jsp to change nav links --%>
	<%@ include file="nav.jsp"%>
    </div>
  </div>
</div>

	



	<ul>
		<li>Name: <c:out value="${USER.firstName }" /> <c:out
				value="${USER.lastName }" />
		   |    Username: <c:out value="${sessionScope.USER.userName }" /></li>
	</ul>
	
	
	
	
	
	
	<div class="container">
  <div class="row">
    <div class="col-sm">
	<h4> My Books: </h4>
    </div>
    <div class="col-sm">
	<form action="home.do" method="GET">
		<input type="submit" name="seeBook"
			value="Add a book to your list" class="btn btn-secondary btn-sm">
	</form>
	
    </div>
    <div class="col-sm">
    </div>
  </div>
</div>
	
	
	

	<c:forEach items="${copies}" var="copy" varStatus="loop">
	<hr>
	<div class="container">
  <div class="row">
    <div class="col-sm">
      
			${copy.book.title} by ${copy.book.author.firstName}
			${copy.book.author.lastName} 
		<form action="removeCopy.do" method="post">
			<input type="hidden" name="copyId" value="${copy.id}"> <input
				type="submit" name="removeCopy" value="Remove Book" class="btn btn-secondary btn-sm">
		</form>
    </div>
    <div class="col-sm">
      
		<form action="updateCondition.do" method="post">
			Condition:
			${copy.condition.name}

	<br>
			<select name="conditionId">
				<option value="0"></option>
				<option value="1">Brand New</option>
				<option value="2">Well Kept</option>
				<option value="3">Used</option>
				<option value="4">Worn</option>
				<option value="5">Last Legs</option>
			</select> <input type="hidden" name="copyId" value="${copy.id}"> <input
				type="submit" name="updateCopy" value="Update">
		</form>
    </div>
    <div class="col-sm">
      

		Current Status:
		<c:choose>
			<c:when test="${empty borrowers[loop.index]}">
				Available
			</c:when>
			<c:otherwise>
				Lent out to ${borrowers[loop.index].firstName} ${borrowers[loop.index].lastName}
			</c:otherwise>
		</c:choose>

    </div>
  </div>
</div>
	</c:forEach>
		<hr>
	<br>

<div class="text-center">


	<form action="transaction.do" method="get">
		 <input type="submit" name="seeTransactions"
			value="Books I am Borrowing" class="btn btn-secondary btn-sm">
	</form>
	<form action="transactionHistory.do" method="get">
	<input type="hidden" name="id" value="${USER.id}">
		 <input type="submit"
			value="My Transaction History" class="btn btn-secondary btn-sm">
	</form>
	
</div>
	
	

</div>
<!--  <div id="HCB_comment_box"><a href="http://www.htmlcommentbox.com">Comment Form</a> is loading comments...</div>
 <link rel="stylesheet" type="text/css" href="//www.htmlcommentbox.com/static/skins/bootstrap/twitter-bootstrap.css?v=0" />
 <script type="text/javascript" id="hcb"> /*<!--*/ if(!window.hcb_user){hcb_user={};} (function(){var s=document.createElement("script"), 
	 l=hcb_user.PAGE || (""+window.location).replace(/'/g,"%27"), h="//www.htmlcommentbox.com";s.setAttribute("type","text/javascript");
	 s.setAttribute("src", h+"/jread?page="+encodeURIComponent(l).replace("+","%2B")+"&opts=16862&num=10&ts=1541003812776");
	 if (typeof s!="undefined") document.getElementsByTagName("head")[0].appendChild(s);})(); / </script> -->


</body>
</html>