<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
</head>
<style>
h1, h2, h3, h4, h5, h6 {
	
}

a, a:hover, a:focus, a:active {
	text-decoration: none;
	outline: none;
}

a, a:active, a:focus {
	color: #333;
	text-decoration: none;
	transition-timing-function: ease-in-out;
	-ms-transition-timing-function: ease-in-out;
	-moz-transition-timing-function: ease-in-out;
	-webkit-transition-timing-function: ease-in-out;
	-o-transition-timing-function: ease-in-out;
	transition-duration: .2s;
	-ms-transition-duration: .2s;
	-moz-transition-duration: .2s;
	-webkit-transition-duration: .2s;
	-o-transition-duration: .2s;
}

ul { 
	margin: 0;
	padding: 0;
	list-style: none;
}

img {
	max-width: 100%;
	height: auto;
}

section {
	padding: 60px 0;
	/* min-height: 100vh;*/
}

.footer {
	//background: linear-gradient(105deg, #6e99e6, #093c94);
	padding-top: 80px;
	padding-bottom: 40px;
}
/*END FOOTER SOCIAL DESIGN*/
.single_footer {
	
}

@media only screen and (max-width:768px) {
	.single_footer {
		margin-bottom: 30px;
	}
}

.single_footer h4 {
	color: #f;
	margin-top: 0;
	margin-bottom: 25px;
	font-weight: 700;
	text-transform: uppercase;
	font-size: 20px;
}

.single_footer h4::after {
	content: "";
	display: block;
	height: 2px;
	width: 40px;
	background: #f;
	margin-top: 20px;
	38
}

.single_footer p {
	color: #f;
}

.single_footer ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

.single_footer ul li {
	
}

.single_footer ul li a {
	color: #f;
	-webkit-transition: all 0.3s ease 0s;
	transition: all 0.3s ease 0s;
	line-height: 36px;
	font-size: 15px;
	text-transform: capitalize;
}

.single_footer ul li a:hover {
	color: #f 3666;
}

.single_footer_address {
	
}

.single_footer_address ul {
	
}

.single_footer_address ul li {
	color: #f;
}

.single_footer_address ul li span {
	font-weight: 400;
	color: #f;
	line-height: 28px;
}

.contact_social ul {
	list-style: outside none none;
	margin: 0;
	padding: 0;
}
/*START NEWSLETTER CSS*/
.subscribe {
	display: block;
	position: relative;
	margin-top: 15px; 39
	width: 100%;
}

.subscribe__input {
	background-color: #f;
	border: medium none;
	border-radius: 5px;
	color: #333;
	display: block;
	font-size: 15px;
	font-weight: 500;
	height: 60px;
	letter-spacing: 0.4px;
	margin: 0;
	padding: 0 150px 0 20px;
	text-align: center;
	text-transform: capitalize;
	width: 100%;
}

@media only screen and (max-width:768px) {
	.subscribe__input {
		padding: 0 50px 0 20px;
	}
}

.subscribe__btn {
	background-color: transparent;
	border-radius: 0 25px 25px 0;
	color: #01c7e9;
	cursor: pointer;
	display: block;
	font-size: 20px;
	height: 60px;
	position: absolute;
	right: 0;
	top: 0;
	width: 60px;
}

.subscribe__btn i {
	transition: all 0.3s ease 0s;
}

@media only screen and (max-width:768px) { 40 

	.subscribe__btn {
		right: 0px;
	}
}

.subscribe__btn:hover i {
	color: #f 3666;
}

button {
	padding: 0;
	border: none;
	background-color: transparent;
	-webkit-border-radius: 0;
	border-radius: 0;
}
/*END NEWSLETTER CSS*/
/*START SOCIAL PROFILE CSS*/
.social_profile {
	margin-top: 40px;
}

.social_profile ul {
	list-style: outside none none;
	margin: 0;
	padding: 0;
}

.social_profile ul li {
	float: left;
}

.social_profile ul li a {
	text-align: center;
	border: 0px;
	text-transform: uppercase;
	transition: all 0.3s ease 0s;
	margin: 0px 5px;
	font-size: 18px;
	color: #f;
	border-radius: 30px;
	width: 60px;
	height: 60px;
	line-height: 50px;
	display: block;
	border: 1px solid rgba(255, 255, 255, 0.2);
	41
}

.social_profile ul li ion-icon {
	font-size: 40px;
	padding: 8px;
}

@media only screen and (max-width:768px) {
	.social_profile ul li a {
		margin-right: 10px;
		margin-bottom: 10px;
	}
}

@media only screen and (max-width:480px) {
	.social_profile ul li a {
		width: 40px;
		height: 40px;
		line-height: 40px;
	}
}

.social_profile ul li a:hover {
	background: #f 3666;
	border: 1px solid #f 3666;
	color: #f;
	border: 0px;
}
/*END SOCIAL PROFILE CSS*/
.copyright {
	margin-top: 70px;
	padding-top: 40px;
	color: #f;
	font-size: 15px;
	border-top: 1px solid rgba(255, 255, 255, 0.4);
	text-align: center;
}

.copyright a {
	color: #01c7e9;
	transition: all 0.2s ease 0s;
}

.copyright a:hover {
	color: #f 3666;
}
</style>
<body>
	<div class="footer my-2">
		<div class="container-fluid">
		
			<div class="row">
				<div class="col-lg-4 col-sm-4 col-xs-12 text-white">
					<div class="single_footer">
						<h4>Services</h4>
						<ul>
							<li><a href="#" class="text-white">Atm Services</a></li>
							<li><a href="#" class="text-white">Home Loan</a></li>
							<li><a href="#" class="text-white">Deposit Amount </a></li>
							<li><a href="#" class="text-white">Withdraw Amount</a></li>
						</ul>
					</div>
				</div>
				<!--- END COL -->
				<div class="col-md-4 col-sm-4 col-xs-12">
					<div class="single_footer single_footer_address text-white">
						<h4>Page Link</h4>
						<ul>
							<li><a href="#" class="text-white">Home</a></li>
							<li><a href="#" class="text-white">About Us</a></li>
							<li><a href="#" class="text-white">Services </a></li>
							<li><a href="#" class="text-white">Gallery</a></li>
							<li><a href="#" class="text-white">Contact Us</a></li>
						</ul>
					</div>
				</div>
				<!--- END COL -->
				<div class="col-md-4 col-sm-4 col-xs-12 text-white">
					<div class="single_footer single_footer_address">
						<h4>Subscribe today</h4>
						<div class="signup_form">
							<form action="#" class="subscribe">
								<input type="text" class="subscribe__input"
									placeholder="Enter Email Address">
								<button type="button" class="subscribe__btn">
									<i class="fas fa-paper-plane"></i>
								</button>
							</form>
						</div>
					</div>
					<div class="social_profile" class="text-white">
						<ul>
							<li><a href="#" class="text-white"><ion-icon name="logo-facebook"></ion-icon></a></li>
												<li><a href="#" class="text-white"><ion-icon name="logo-instagram"></ion-icon></a></li>
							<li><a href="#" class="text-white"><ion-icon name="logo-twitter"></ion-icon></a></li>
							<li><a href="#" class="text-white"><ion-icon name="logo-whatsapp"></ion-icon></a></li>
						</ul>
					</div>
				</div>
				<!--- END COL -->
			</div>
			<!--- END ROW -->
			<div class="row">
				<div class="col-lg-12 col-sm-12 col-xs-12">
					<p class="copyright">
						Copyright © 2023 <a href="#">Cafe Web-site</a>.
					</p>
				</div>
				<!--- END COL -->
			</div>
			<!--- END ROW -->
		</div>
		<!--- END CONTAINER -->
	</div>
</body>
</html>