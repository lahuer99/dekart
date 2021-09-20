<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New user Reg Page</title>
<%@include file="components/common_css_js.jsp"%>
<%@include file="components/navbar.jsp"%>
</head>
<body>
	<div class="container-fluid">


		<div class="row mt-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body px-5">
						<%@include file="components/message.jsp" %>
						<div class="container text-center">
							<img
								src="https://image.flaticon.com/icons/png/512/2037/2037710.png"
								style="max-height: 100px;">
						</div>
						<h3 class="text-center my-3">Sign Up Here!</h3>
						<form action="/mycart/RegisterServlet" method="POST">
							<div class="form-group">
								<label for="name">User name</label> <input type="text"
									class="form-control" name="user_name" id="name" aria-describedby="nameHelp"
									placeholder="Enter your name">
							</div>
							<div class="form-group">
								<label for="email">User email</label> <input type="email"
									class="form-control" name="user_email" id="email" aria-describedby="emailHelp"
									placeholder="Enter your email">
							</div>
							<div class="form-group">
								<label for="password">User password</label> <input
									type="password" class="form-control" name="user_password" id="password"
									aria-describedby="passwdHelp" placeholder="Enter your password">
							</div>
							<div class="form-group">
								<label for="phone">User Phone</label> <input type="number"
									class="form-control" name="user_phone" id="phone" aria-describedby="phoneNoHelp"
									placeholder="Enter your ph no">
							</div>
							<div class="form-group">
								<label for="useraddr">User Address</label>
								<textarea rows="4" cols="4" class="form-control" name="user_address" id="useraddr"
									aria-describedby="useraddrHelp"
									placeholder="Enter your user addr">
						</textarea>
							</div>
							<div class="container text-center">
								<button type="submit"class="btn btn-outline-success">Register</button>
								<button type="reset" class="btn btn-outline-warning">Reset</button>
							</div>
						</form>
					</div>
				</div>


			</div>
		</div>
	</div>
</body>
</html>