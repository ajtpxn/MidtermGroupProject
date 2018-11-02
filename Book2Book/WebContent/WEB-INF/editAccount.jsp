
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<link rel="icon" href="media/favicon.ico">

<title>Edit Profile</title>
</head>
<body>
<div class="container">
<%@ include file="nav.jsp"%>
<h1>Edit Profile</h1>

<form action="editingProfile.do" method="post" >
<div class="container">
				<div class="row">
							<div class="col-3">
							</div>
							<div class="col-2">
									<label for="firstName">First Name: </label> 
							</div>
							<div class="col-sm">
									<input class="form-control" type="text" name="firstName" value="${user.firstName}"/> 
							</div>
				</div>

				<div class="row">
				<div class="col-3">
							</div>
							<div class="col-2">
									<label for="lastName">Last Name: </label>
							</div>
							<div class="col-sm">
									<input class="form-control" type="text" name="lastName" value="${user.lastName}"/> 
							</div>
				</div>

				<div class="row">
				<div class="col-3">
							</div>
							<div class="col-2">
									<label for="userName">Username: </label>
							</div>
							<div class="col-sm">
									<input class="form-control" type="text" name="userName" value="${user.userName}"/> 
							</div>
				</div>

				<div class="row">
				<div class="col-3">
							</div>
							<div class="col-2">
									<label for="password">New Password: </label> 
							</div>
							<div class="col-sm">
									<input class="form-control" type="password" placeholder="New Password" name="password" id="password" required>
							</div>
				</div>

				<div class="row">
				<div class="col-3">
							</div>
							<div class="col-2">
									<label for="password">Confirm Password: </label> 
							</div>
							<div class="col-sm">
							        <input class="form-control" type="password" placeholder="Confirm  New  Password" id="confirm_password" <%-- value="${user.password}" --%> required> 
							</div>
				</div>

				<div class="row">
				<div class="col-3">
							</div>
							<div class="col-2">
							</div>
							<div class="col-sm">
		
									<input class="btn btn-success btn-lg btn-block" type="submit" value="Submit Changes">
							</div>
				</div>
</div>
									
		
		
	</form>
	
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