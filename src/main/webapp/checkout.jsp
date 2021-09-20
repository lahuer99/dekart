<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
<%@include file="components/common_css_js.jsp"%>
<%@include file="components/navbar.jsp"%>
<%@include file="components/common_modal.jsp"%>
</head>
<body>
	<%
	User user = (User) session.getAttribute("currentUser");
	if (user == null) {
		session.setAttribute("message", "Please login first");
		response.sendRedirect("/mycart/login.jsp");
		return;
	}
	%>
	<div class="container">
		<div class="row mt-4">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3>Selected Items!</h3>
						<div class="card-body2"></div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<form>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" value="<%=user.getUserEmail()%>"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="name">Name</label> <input type="text"
									value="<%=user.getUserName()%>" class="form-control"
									id="name" aria-describedby="emailHelp" placeholder="Enter name">
							</div>
							<div class="form-group">
								<label for="addr">Email address</label> <br>
								<textarea id="addr" class="form-control" rows="6" cols="6"
									placeholder="Enter address"><%=user.getUserAddress()%></textarea>
							</div>
							<div class="form-group">
								<label for="no">Phone no</label> <input type="text"
									value="<%=user.getUserPhone()%>" class="form-control" id="no"
									aria-describedby="emailHelp" placeholder="Enter contact no">
							</div>
							<button class="btn btn-outline-success">Order Now</button>
							<button type="button" class="btn btn-outline-info"
								onclick="window.location='index.jsp'">Continue Shopping</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/script.js"></script>
</body>
</html>