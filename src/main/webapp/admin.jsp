<%@page import="com.deloitte.mycart.dao.UserDao"%>
<%@page import="com.deloitte.mycart.entities.Product"%>
<%@page import="com.deloitte.mycart.dao.ProductDao"%>
<%@page import="com.deloitte.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.deloitte.mycart.helper.FactoryProvider"%>
<%@page import="com.deloitte.mycart.dao.CategoryDao"%>
<%@page import="com.deloitte.mycart.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin page</title>
<%@include file="components/common_css_js.jsp"%>
<%@include file="components/navbar.jsp"%>
</head>
<body>
	<%
	User user = (User) session.getAttribute("currentUser");
	if (user == null) {
		session.setAttribute("message", "Please login first");
		response.sendRedirect("/mycart/login.jsp");
		return;
	} else {
		if (user.getUserType() == "normal") {
			session.setAttribute("message", "Not Authorized");
			response.sendRedirect("/mycart/normal.jsp");
			return;
		}
	}
	%>

	<%
	UserDao udao=new UserDao(FactoryProvider.getFactory());
	List<User> ulist=udao.getAllUsers();
	
	CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
	List<Category> clist = cdao.getCategories();
	
	ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
	List<Product> plist=pdao.getAllProducts();
	%>

	<div class="container admin">
		<div class="container-fluid">
			<%@include file="components/message.jsp"%>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="card mt-3">
					<div class="card-body text-center">
						<div class="container">
							<img
								src="https://image.flaticon.com/icons/png/512/681/681443.png"
								class="img-fluid" style="max-height: 60px;">
						</div>

						<h3><%=ulist.size() %></h3>
						<h4>Users</h4>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mt-3">
					<div class="card-body text-center">
						<div class="container">
							<img
								src="https://image.flaticon.com/icons/png/512/1141/1141964.png"
								class="img-fluid" style="max-height: 60px;">

						</div>
						<h3><%=clist.size()%></h3>
						<h4>Category</h4>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card mt-3">
					<div class="card-body text-center">
						<div class="container">
							<img
								src="https://image.flaticon.com/icons/png/512/2345/2345152.png"
								class="img-fluid" style="max-height: 60px;">

						</div>
						<h3><%=plist.size() %></h3>
						<h4>Products</h4>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-3">
			<div class="col-md-4 offset-md-2" type="button"
				class="btn btn-primary" data-toggle="modal"
				data-target="#addCategoryModal">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img
								src="https://image.flaticon.com/icons/png/512/1828/1828926.png"
								class="img-fluid" style="max-height: 60px;">
						</div>
						<h4>Add Category</h4>
					</div>
				</div>
			</div>
			<div class="col-md-4" type="button" class="btn btn-primary"
				data-toggle="modal" data-target="#addProductModal">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img
								src="https://image.flaticon.com/icons/png/512/1828/1828926.png"
								class="img-fluid" style="max-height: 60px;">
						</div>
						<h4>Add Product</h4>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Button trigger modal -->
	<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button> -->

	<!-- Modal -->
	<div class="modal fade" id="addCategoryModal" tabindex="-1"
		role="dialog" aria-labelledby="addCategoryModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="/mycart/ProductOperationServlet" method="POST">
						<!-- hidden field ops -->
						<input type="hidden" name="operation" value="addCategory">
						<div class="form-group">
							<label for="category">Category name</label> <input type="text"
								class="form-control" name="category_name" id="category"
								aria-describedby="nameHelp" placeholder="Enter category name"
								required="required">
						</div>
						<div class="form-group">
							<label for="catdesc">Category Description</label>
							<textarea rows="3" cols="3" class="form-control"
								name="category_desc" id="catdesc" aria-describedby="nameHelp"
								placeholder="Enter category desc" required="required">
				</textarea>
						</div>
						<button type="submit" class="btn btn-secondary">Save</button>
						<button type="reset" class="btn btn-primary">Reset</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="addProductModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- enctype to mention that img is also present -->
					<form action="/mycart/ProductOperationServlet" method="POST"
						enctype="multipart/form-data">
						<!-- hidden field ops -->
						<input type="hidden" name="operation" value="addProduct">
						<div class="form-group">
							<label for="product">Product name</label> <input type="text"
								class="form-control" name="product_name" id="product"
								aria-describedby="nameHelp" placeholder="Enter product name">
						</div>
						<div class="form-group">
							<label for="pdesc">Product Description</label>
							<textarea rows="3" cols="3" class="form-control"
								name="product_desc" id="pdesc" aria-describedby="nameHelp"
								placeholder="Enter product desc">
				</textarea>
						</div>
						<div class="form-group">
							<label for="pprice">Product Price</label> <input type="number"
								class="form-control" name="product_price" id="pprice"
								aria-describedby="nameHelp" placeholder="Enter product price">
						</div>
						<div class="form-group">
							<label for="pdisc">Product Discount</label> <input type="number"
								class="form-control" name="product_discount" id="pdisc"
								aria-describedby="nameHelp" placeholder="Enter product discount">
						</div>
						<div class="form-group">
							<label for="pquantity">Product Quantity</label> <input
								type="number" class="form-control" name="product_quantity"
								id="pquantity" aria-describedby="nameHelp"
								placeholder="Enter product quantity">
						</div>
						<div class="form-group">
							<%-- 	<%
					CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
					List<Category> clist=cdao.getCategories();
				%> --%>
							<label for="pcategory">Category</label> <select
								name="product_category" id="pcategory" class="form-control">
								<%
								for (Category c : clist) {
								%>
								<option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
								<%
								}
								%>
							</select>
						</div>
						<div class="form-group">
							<label for="ppic">Product Pic</label><br> <input type="file"
								name="product_pic" id="ppic">
						</div>
						<button type="submit" class="btn btn-secondary">Save</button>
						<button type="reset" class="btn btn-primary">Reset</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>