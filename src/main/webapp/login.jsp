<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@include file="components/common_css_js.jsp"%>
<%@include file="components/navbar.jsp"%>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
					<div class="card-header text-center">
						<h3>Login</h3>
					</div>
					<div class="card-body">
						<%@include file="components/message.jsp" %>
						<form action="/mycart/LoginServlet" method="POST">
							<div class="form-group">
								<label for="useremail">Email address</label> <input
									type="email" name="user_email" class="form-control" id="useremail"
									aria-describedby="emailHelp" placeholder="Enter email">

							</div>
							<div class="form-group">
								<label for="userpasswd">Password</label> <input
									type="password" name="user_password" class="form-control" id="userpasswd"
									placeholder="Password">
							</div>
							<small class="form-text text-muted">By continuing, you agree to DeKart's Terms and Conditions of Use and Privacy Policy.</small>
							<div class="container text-center">
							
								<button type="submit" class="btn btn-primary mt-3">Submit</button>
								<button type="reset" class="btn btn-primary mt-3">Reset</button>
								<small><a href="register.jsp" class="d-block mb-2 mt-3">new to DeKart? Create an account</a></small>
							</div>
							
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>