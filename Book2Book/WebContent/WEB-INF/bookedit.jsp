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

<link rel="icon" href="media/favicon.ico">

<title>Insert title here</title>
</head>
<body>
<div class="container">

<%@  include file="nav.jsp" %>

<h1>
Edit
</h1>
<c:choose>
<c:when test="${books != null}">
<c:forEach items="${books}" var="book">
 
 <h3>Edit the book: ${book.title}</h3>
 
	<div class="container">
				<div class="row">
							<div class="col-2">

								<form action="editingbook.do" method="POST">
									<input type="hidden" name="id" value="${book.id}" /> 
									<label>Title: </label>
							</div>
						<div class="col-sm">
							 <input class="form-control" type="text" name="title" value="${book.title}"/> 
						</div>
				</div>

				<div class="row">
						  <div class="col-2">
								<label>Description: </label>
						  </div>
						  <div class="col-sm">
								<input class="form-control" type="text" name="description" value="${book.description}" />
						  </div>
			    </div>
			    
			    <div class="row">
						    <div class="col-2">
										 <label>Author First Name: </label> 
						    </div>
						  <div class="col-sm">
		 								<input class="form-control"  type="text" name="author.firstName" value="${book.author.firstName}" />
	    					</div>
	    		</div>
	    		
	    		<div class="row">
						    <div class="col-2">
		  								<label>Author Last Name: </label> 
		  		</div>
						  <div class="col-sm">
		  								<input class="form-control"  type="text" name="author.lastName" value="${book.author.lastName}" /> 
						</div>
	    		</div>
				<div class="row">
						    <div class="col-2">
		   								 <label>Content Rating</label> 
		 		</div>
							<div class="col-sm">
								    
										  <select  class="form-control"  name="contentRating.id">
												<option value="0"></option>
												<option value="1">Kids</option>
												<option value="2">Young Adult</option>
												<option value="3">Adult</option>
												<option value="4">Adult Plus</option>
											</select> <input type="hidden" name="contentRating.id" >
							</div>
							<div class="col-2">
											  <label>Genre</label>
							
		 					</div>
		 					
		 					<div class="col-sm">
		  
												  <div class="form-check">
										    <div class="col-sm">
										        <input class="form-check-input" type="checkbox" name="genreName" value="1">
										          Childrens
										        
										        </div>
										        <div class="col-sm">
										        <input class="form-check-input" type="checkbox" name="genreName" value="2">
										          Fantasy
										        </div>
										        <div class="col-sm">
										        <input class="form-check-input" type="checkbox" name="genreName" value="3">
										          History
										        </div>
										        <div class="col-sm">
										        <input class="form-check-input" type="checkbox" name="genreName" value="4">
										          Biography
										        </div>
										        <div class="col-sm">
										        <input class="form-check-input" type="checkbox" name="genreName" value="5">
										          Satire
										      </div>
										      
												
										    </div>
		  
		 					
		 					</div>
	    		</div>
	    		<div class="row">
						    	<div class="col-2">
						    	</div>
						    	<div class="col-sm">
		  
		   
   
		  
		  
		  
												   <input type="submit" value="Apply Changes" class="btn btn-success btn-lg btn-block" />
											</form>
	
		   						 </div>
					  </div>
					</div>
	
	</c:forEach>
 </c:when>
 <c:otherwise>No Book Found</c:otherwise>
 </c:choose>
 
 
 
 
 
 
 
 
<%--  
 <form action="home.do" method="GET">
<input id="home" type="submit" value="Home" class="btn btn-primary btn-lg">
</form>
 --%>
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