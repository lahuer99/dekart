<%@page import="com.deloitte.mycart.helper.DescHelper"%>
<%@page import="com.deloitte.mycart.dao.CategoryDao"%>
<%@page import="com.deloitte.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.deloitte.mycart.dao.ProductDao"%>
<%@page import="com.deloitte.mycart.entities.Product"%>
<%@page import="com.deloitte.mycart.helper.FactoryProvider"%>
<html>
<head>
<title>Index Page</title>
<%@include file="components/common_css_js.jsp"%>
<%@include file="components/navbar.jsp"%>
</head>
<body>
	<div class="row mt-3 mx-4">
		<%
		String cat = request.getParameter("category");
		%>
		<%
		ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
		List<Product> plist = null;

		if (cat == null || cat.trim().equals("all")) {
			plist = pdao.getAllProducts();
		} else {
			plist = pdao.getProductsById(Integer.parseInt(cat));
		}

		CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
		List<Category> clist = cdao.getCategories();
		%>
		<div class="col-md-2">
			<div class="list-group mt-4">
				<a href="index.jsp?category=all"
					class="list-group-item list-group-item-action active">All
					Products</a>
				<!-- active tag -->
				<%
				for (Category c : clist) {
				%>
				<!-- url rewriting -->
				<a href="index.jsp?category=<%=c.getCategoryId()%>"
					class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
				<%
				}
				%>


			</div>
		</div>
		<div class="col-md-10">
			<div class="row mt-4">
				<div class="col-md-12">
					<div class="card-columns">
						<%
						for (Product p : plist) {
						%>
						<div class="card">
							<div class="container text-center">
								<img src="images/products/<%=p.getpPhoto()%>"
									style="max-height: 200px; max-width: 250px; width: auto;"
									class="card-img-top mt-2" alt="Card img">
							</div>
							<div class="card-body">
								<h5 class="card-title"><%=p.getpName()%></h5>
								<p class="card-text"><%=DescHelper.get10Words(p.getpDesc())%></p>
								
							</div>
							<div class="card-footer text-center">
								<button class="btn btn-outline-warning" onclick=" addToCart(
									<%=p.getpId()%>,'<%=p.getpName()%>',<%= p.getPriceADiscount() %>)">Add to cart</button>
								<button class="btn btn-outline-primary mt-1">
									Price : $<%=p.getPriceADiscount()%><span class="text-secondary">
										<strike><%=p.getpPrice()%></strike> <%=p.getpDiscount()%>% off
									</span>
								</button>
							</div>
						</div>
						<%
						}
						if (plist.size() == 0) {
						out.println("No products to sh0w");
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/script.js"></script>
</body>
</html>
