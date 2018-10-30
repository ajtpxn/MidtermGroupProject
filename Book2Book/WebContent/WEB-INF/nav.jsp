<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav>
	<a href="index.do" class="btn btn-primary btn-sm">Home</a> 
	
	<c:choose>
	
		<c:when test="${not empty USER }">
		
		
		
		<a href="account.do" class="btn btn-primary btn-sm">Account</a> 
		
		
		
		<a href="logout.do" class="btn btn-primary btn-sm">Log Out</a>
		</c:when>
		<c:otherwise><a href="login.do" class="btn btn-primary btn-sm" >Log In</a>  
		<a href="addUser.do" class="btn btn-primary btn-sm" >Sign Up</a>
		</c:otherwise>
		
	</c:choose>
</nav>