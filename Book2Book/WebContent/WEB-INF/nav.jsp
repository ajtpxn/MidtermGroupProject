<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<link rel="stylesheet" href="stylesheets/nav.css">

<link rel="icon" href="media/favicon.ico">

<nav class="nav justify-content-end">

  <li class="nav-item">
    <a class=" btn btn-primary btn-sm" href="index.do">Home</a>&nbsp;
  </li>



	<c:choose>
		<c:when test="${not empty USER }">

  <li class="nav-item">
    <a class=" btn btn-primary btn-sm" href="account.do">Account</a>&nbsp;
  </li>
  
  
  <li class="nav-item">
    <a class=" btn btn-primary btn-sm" href="logout.do">Log Out</a>&nbsp;
  </li>
  
		</c:when>
		<c:otherwise>
  
  <li class="nav-item">
    <a class=" btn btn-primary btn-sm" href="login.do">Log In</a>&nbsp;
  </li>
  
  
  <li class="nav-item">
    <a class=" btn btn-primary btn-sm" href="addUser.do">Sign Up</a>
  </li>
  
		</c:otherwise>
	</c:choose>
  
</ul>

</nav>