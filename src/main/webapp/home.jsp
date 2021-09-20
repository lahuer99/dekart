<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>D.kart Home</title>
		<%@include file="components/common_css_js.jsp" %>
		<%@include file="components/navbar.jsp" %>
		
		<style type="text/css">
			div.jumbotron{
					background: #4682b4;
					color:white;
			}
			
			.logo-small{
				color: #4682b4;
				font-size:45px;
			}
			
			div.container-fluid.text-center{
				color: #4682b4;
			}
			div.container-fluid.mt-5.mb-5{
				color: #4682b4;
				background: white;
			}
			
			.carousel-control-prev{
				background-image: linear-gradient(to left, white, #4682b4);
			}
			.carousel-control-next{
				background-image: linear-gradient(to right, white, #4682b4);
			}
			
			.carousel-indicators li{
				background-color: #aad0f0;
			}
			.carousel-indicators li.active{
				background-color: #4682b4;
			}
			
			.carousel-item h4{
				font-style:italic;
				font-size:25px;
				font-weight:700;
				margin:40px 0;
			}
			
			.carousel-item span{
				font-size:20px;
				font-weight:400;
			}
			
			footer{
				background-color:#4682b4;
				color:white;
				padding: 20px 0;
			}
			footer a{
				color:white;
			}
			footer a:hover{
				text-decoration: none;
			}
			
			footer div.container-fluid.text-center{
				color: #c5cbd1;
			}
		</style>
		
	</head>
	<!-- scriptlets -->
	<body>
		<!-- Add a Jumbotron  -->
		<div class="jumbotron text-center">
			<h1>D.kart</h1>
			<p>Products for all Deloittians</p>
			
			<div class="container" style="width:40%;">
				<form action="" class="form-inline">
					<div class="input-group">
						<input type="search" class="form-control" size="70" placeholder="Search for products..." required="required">
						
						<div class="input-group-btn">
							<button class="btn btn-success">Search</button>
						</div>
						
					</div>
				</form>
			</div>
		</div>
		
		<!-- Services container  -->
		<div class="container-fluid text-center">
			<h2>Services offered</h2>
			<div class="row">
				<div class="col-sm-4">
					<span><i class="fas fa-laptop logo-small"></i></span>
					<h4>LAPTOPS</h4>
					<p>Tech Catalog laps</p>
				</div>
				
				<div class="col-sm-4">
					<span><i class="fas fa-mobile-alt logo-small"></i></span>
					<h4>LAPTOPS</h4>
					<p>Tech Catalog mobiles</p>
				</div>
				
				<div class="col-sm-4">
					<span><i class="fas fa-keyboard logo-small"></i></span>
					<h4>KEYBOARDS</h4>
					<p>Tech Catalog keyboards</p>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-sm-4">
					<span><i class="fas fa-gift logo-small"></i></span>
					<h4>GIFTS</h4>
					<p>Tech Catalog gifts</p>
				</div>
				
				<div class="col-sm-4">
					<span><i class="fas fa-clock logo-small"></i></span>
					<h4>WATCHES</h4>
					<p>Tech Catalog watches</p>
				</div>
				
				<div class="col-sm-4">
					<span><i class="fas fa-headphones-alt logo-small"></i></span>
					<h4>HEADSETS</h4>
					<p>Tech Catalog headphones</p>
				</div>
			</div>
		</div>	
		
		<div class="container-fluid mt-5 mb-5">
			<div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<h2>What our customers say!</h2>
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item">
						<!-- <img class="d-block w-100" src="img/headphones.png" alt="first img"> -->
						<h4>The best products at the best prices.
							<br><span style="font-style:normal;">Ron Swanson, Parks n Rec.</span>
						</h4>
					</div>
					<div class="carousel-item active">
						<h4>Such huge range of products, just like being at Walmart!FALSE. At a Target.
							<br><span style="font-style:normal;">Dwight K.Schrute, Dunder Mifflin Inc.</span>
						</h4>
					</div>
					<div class="carousel-item">
						<h4>So much ph-un.Its ph-antastic.
							<br><span style="font-style:normal;">Phil Dunphy, Real Estate Biz</span>
						</h4>
					</div>
				</div>
				
				<a class="carousel-control-prev bg-gradient-dark" href="#myCarousel" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next bg-gradient-dark" href="#myCarousel" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
				
			</div>
		</div>	
		
		<footer>
			<div class="container mt-5">
				<div class="row">
					<div class="col-md-5">
						<h5><i class="fa fa-road"></i> D.kart</h5>
						<div class="row">
							<div class="col-6">
								<ul class="list-unstyled">
									<li><a href="">Product</a></li>
									<li><a href="">Benefits</a></li>
									<li><a href="">Partners</a></li>
									<li><a href="">Teams</a></li>
								</ul>
							</div>
						</div>
					
						<ul class="nav">
							<li class="nav-item">
								<a class="nav-link pl-0" href=""><i class="fab fa-facebook fa-lg"></i></a>
							</li>
							<li class="nav-item">
								<a class="nav-link pl-0" href=""><i class="fab fa-twitter fa-lg"></i></a>
							</li>
							<li class="nav-item">
								<a class="nav-link pl-0" href=""><i class="fab fa-instagram fa-lg"></i></a>
							</li>
							<li class="nav-item">
								<a class="nav-link pl-0" href=""><i class="fab fa-gmail fa-lg"></i></a>
							</li>
						</ul>
						<br>
					</div>
					
					<div class="col-md-2">
						<h5 class="text-md-right">Contact Us</h5>
					</div>
					
					<div class="col-md-5">
						<form>
							<div class="row">
								<div class="col-md-6 form-group">
									<fieldset class="form-group">
										<input type="text" class="form-control" id="name" placeholder="Enter name">
									</fieldset>
								</div>
								<div class="col-md-6 form-group">
									<fieldset class="form-group">
										<input type="email" class="form-control" id="email" placeholder="Enter email">
									</fieldset>
								</div>
							</div>
							
							<div>
								<fieldset class="form-group">
									<textarea rows="" cols="" class="form-control" id="textarea" placeholder="Enter feedback"></textarea>
								</fieldset>
								
								<fieldset class="form-group">
									<button class="btn btn-info">Send</button>
								</fieldset>
							</div>
							
						</form>
					</div>
				</div>
			</div>
			<div class="container-fluid text-center">
				<p>Thank you for visiting.</p>
			</div>
		</footer>
		
	</body>
</html>