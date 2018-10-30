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
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<title>Insert title here</title>
</head>
<body>

<div class="container">

<%@ include file="nav.jsp"%>
<h2>Details on ${copy.book.title}</h2>
<hr>
<div class="container">
  <div class="row">
    <div class="col-sm">
<strong>Title:</strong> ${copy.book.title} <br>
<strong>Author:</strong> ${copy.book.author.firstName} ${copy.book.author.lastName}<br>
<strong>Description:</strong> ${copy.book.description }<br>
<strong>Genre:</strong>
<c:forEach items="${copy.book.genres}" var="genre">
 ${genre.genreName }
</c:forEach>
<br>
<strong>Content Rating: </strong> ${copy.book.contentRatingId}<br>
<strong>Condition:</strong> ${copy.condition.name}<br>
<strong>Lender Name: </strong> ${copy.user.firstName} ${copy.user.lastName}
    </div>
    <div class="col-sm">
<form:form action="addTransUpdateCopy.do" method="POST" modelAttribute="copy">


I would like to borrow this book<br>
<input type="hidden" value="${copy.id}" name="copyId">
<input type="submit" value="Borrow" class="btn btn-primary">

<input type="text" name="datefilter" value="" />

<script type="text/javascript">
$(function() {

  $('input[name="datefilter"]').daterangepicker({
      autoUpdateInput: false,
      locale: {
          cancelLabel: 'Clear'
      }
  });

  $('input[name="datefilter"]').on('apply.daterangepicker', function(ev, picker) {
      $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
  });

  $('input[name="datefilter"]').on('cancel.daterangepicker', function(ev, picker) {
      $(this).val('');
  });

});
</script>
</form:form>
</div>

</body>
</html>