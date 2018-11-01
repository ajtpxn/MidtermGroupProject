<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<link rel="icon" href="media/favicon.ico">

<link rel="stylesheet" href="stylesheets/universal.css">

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
    <div class="col-1">
      		<img id="coverpics"  alt="Book Cover Image" src="${copy.book.imageUrl}">
    </div>
    <div class="col-sm">
			<c:out value="${copy.book.title}" /> by <c:out value="${copy.book.author.firstName}" />
			<c:out value="${copy.book.author.lastName}" />
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
		<form action="removeCopy.do" method="post">
			<input type="hidden" name="copyId" value="${copy.id}"> <input
				type="submit" name="removeCopy" value="Remove Book" class="btn btn-secondary btn-sm">
		</form>
		<form action="editbook.do" method="post">
			<input type="hidden" name="editBook" value="${copy.book.title}"> <input
				type="submit" name="editBook" value="Edit Book" class="btn btn-secondary btn-sm">
		</form>

    </div>
  </div>
</div>
	</c:forEach>
		<hr>
	<br>

<div class="container">
	  <div class="row">
	    <div class="col-sm">
		<h4> Books I am Borrowing: </h4>
	    </div>
	    <div class="col-sm">
		<form action="listAvailableCopy.do" method="get">
		 <input type="submit" value="Search Available Books to Borrow" class="btn btn-secondary btn-sm">
	</form>
		
	    </div>
	    <div class="col-sm">
	    </div>
	  </div>
</div>

	
		<c:choose>
			<c:when test="${not empty transactions}">

		<c:forEach items="${transactions}" var="transaction" varStatus="loop">
			<hr>
	<div class="container">
	  		<div class="row">
	    		<div class="col-1">
			
						<a href="returnBook.do?id=${transaction.id}" class="btn btn-secondary btn-sm">Return</a>
						
						
				</div>
		    	<div class="col">
						
						<c:forEach items="${transCopies}" var="copy">
							
						
						<c:if test="${transaction.copyId==copy.id}">
						<img id="coverpics"  alt="Book Cover Image" src="${copy.book.imageUrl}"> | 
						${copy.book.title} |
						${copy.condition.name}
						</c:if>
						</c:forEach>
						| Return by:
						<c:set var="str" value="${transaction.endDate}" />
					    ${fn:substringBefore(str, ' ')}
					    
				</div>
		    	<div class="col-1">
				    
				    
				    
						<a href="userprofile.do?id=${owners[loop.index].id}" class="btn btn-secondary btn-sm">Owner</a>
	
	
	
	
		    	</div>
	  		</div>
	</div>
	
		</c:forEach>
		
		</c:when>
		
			<c:otherwise>
			You are not borrowing any books yet!
			</c:otherwise>
		
		
		</c:choose>
	
	<br>
	<br>
	<br>
<div class="text-center">
	<form action="transactionHistory.do" method="get">
	<input type="hidden" name="id" value="${USER.id}">
		 <input type="submit"
			value="My Transaction History" class="btn btn-secondary btn-sm">
	</form>
	
</div>
	<br>
	<br>
	<br>
	<%@ include file="footer.jsp"%>
	<br>
	<br>
	<br>
</div>


<!--  <div id="HCB_comment_box"><a href="http://www.htmlcommentbox.com">Comment Form</a> is loading comments...</div>
 <link rel="stylesheet" type="text/css" href="//www.htmlcommentbox.com/static/skins/bootstrap/twitter-bootstrap.css?v=0" />
 <script type="text/javascript" id="hcb"> /*<!--*/ if(!window.hcb_user){hcb_user={};} (function(){var s=document.createElement("script"), 
	 l=hcb_user.PAGE || (""+window.location).replace(/'/g,"%27"), h="//www.htmlcommentbox.com";s.setAttribute("type","text/javascript");
	 s.setAttribute("src", h+"/jread?page="+encodeURIComponent(l).replace("+","%2B")+"&opts=16862&num=10&ts=1541003812776");
	 if (typeof s!="undefined") document.getElementsByTagName("head")[0].appendChild(s);})(); / </script> -->


</body>
</html>