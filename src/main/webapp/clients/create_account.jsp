<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>MyCafe</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="../lib/animate/animate.min.css" rel="stylesheet">
<link href="../lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="../lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="../css/cstyle.css" rel="stylesheet">
</head>
<body>
<!-- Navbar & Hero Start -->
		<div class="container-xl-fluid position-relative p-0">
			<nav
				class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
				<a href="" class="navbar-brand p-0">
					<h1 class="text-primary m-0">
						<i class="fa fa-utensils me-3"></i>Cafe Coffee Day
					</h1> <!-- <img src="img/logo.png" alt="Logo"> -->
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
					<span class="fa fa-bars"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<div class="navbar-nav ms-auto py-0 pe-4">
						<a href="index.jsp" class="nav-item nav-link active">Home</a> 
						<a href="about.jsp" class="nav-item nav-link">About</a> 
							<a href="service.jsp" class="nav-item nav-link">Service</a>
							<a href="login.html" class="nav-item nav-link">Login</a>
							<a href="create_account.jsp" class="nav-item nav-link">Register</a>
							
									
						
						<a href="contact.jsp" class="nav-item nav-link">Contact</a>
					</div>
					<a href="" class="btn btn-primary py-2 px-4">Book A Table</a>
				</div>

			</nav>

			
		</div>
	<div class="container-xl-fluid py-5 bg-dark hero-header mb-4"></div>

	<div>
		<div>
			<div class="container">
			<div class="row mx-5 my-5 border p-5 border-secondary" style="background-color: #FFAA48; border-radius:15px;">
				<!-- <div class="row mx-5 my-5 border py-5 border-secondary bg-primary"
					style="border-radius: 10px; background-color: whitesmoke;""> -->
					<!--<div class="col-md-12 border border-secondary py-3 border-rounded">-->
					<div class="col-md-8 offset-md-2">
						<form action="create_account_2.jsp" method="post">
							<fieldset>
								<h4 class="text-center">Register</h4>
								<div class="form-group ">
									<label for="name_data"><h6>Name</h6></label> <input type="text"
										name="name" class="form-control" id="name_data" placeholder="name" required>
								</div>
								<br>
								<div class="form-group">
									<label for="email_data"><h6>Email</h6></label> <input type="email"
										name="email" class="form-control" id="email_data" placeholder="eamil" required>
								</div>
								<br>
								<div class="form-group">
									<label for="password_data"><h6>Password</h6></label> <input
										type="password" name="psw" class="form-control"
										id="password_data" placeholder="password">
								</div>
								<br>
								<br>
								<button type="submit" class="btn" style="background-color: #d16022; border-radius:10px;"><i><h5 class="text-white">Sign in</h5></i></button>
								<br> <br> <a href="login.html" class=""><h6>Already
									Have a Account</h6></a> 
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>