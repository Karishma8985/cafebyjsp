<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Coffecafe Day</title>
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
<style>

        .menu-item {
            border-radius: 10px;
            overflow: hidden;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            padding: 15px;
            height: 250px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .menu-item img {
            width: 120px;
            height: 120px;
            object-fit: 150px;
        }
        .menu-item .details {
            flex: 1;
            margin-left: 15px;
        }
        .menu-item .details h6 {
            margin: 0;
            font-size: 1.2em;
            font-weight: 600;
            color: #333;
        }
        .menu-item .details .price {
            color: #FF9900;
            font-size: 1.2em;
            font-weight: 700;
        }
        .menu-item .details .description {
            color: #666;
            margin-bottom: 10px;
        }
</style>
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
						<!-- <a href="about.jsp" class="nav-item nav-link">About</a> <a
						href="service.jsp" class="nav-item nav-link">Service</a> <a -->
						<a href="login.html" class="nav-item nav-link">Login</a> <a
						href="create_account.jsp" class="nav-item nav-link">Register</a> 
						<!-- <a href="contact.jsp" class="nav-item nav-link">Contact</a> -->
				</div>
				<a href="" class="btn btn-primary py-2 px-4">Book A Table</a>
			</div>

		</nav>


	<div class="container-xl-fluid py-5 bg-dark hero-header mb-5">
		<div class="container my-5 py-5">
			<div class="row align-items-center g-5">
				<div class="col-lg-6 text-center text-lg-start">
					<h1 class="display-3 text-white animated slideInLeft">
						Enjoy Our<br>Delicious Meal
					</h1>
					<p class="text-white animated slideInLeft mb-4 pb-2">Tempor
						erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam
						amet diam et eos. Clita erat ipsum et lorem et sit, sed stet lorem
						sit clita duo justo magna dolore erat amet</p>
					<a href=""
						class="btn btn-primary py-sm-3 px-sm-5 me-3 animated slideInLeft">Book
						A Table</a>
				</div>
				<div class="col-lg-6 text-center text-lg-end overflow-hidden">
					<img class="image_style" src="../img/hero1.png" alt="">
				</div>
			</div>
		</div>
	</div>

	<!-- Service Start -->
	<div class="container-xl-fluid py-5">
		<div class="container">
			<div class="row g-4">
				<div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
					<div class="service-item rounded pt-3">
						<div class="p-4">
							<i class="fa fa-3x fa-user-tie text-primary mb-4"></i>
							<h5>Master Chefs</h5>
							<p>Diam elitr kasd sed at elitr sed ipsum justo dolor sed
								clita amet diam</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
					<div class="service-item rounded pt-3">
						<div class="p-4">
							<i class="fa fa-3x fa-utensils text-primary mb-4"></i>
							<h5>Quality Food</h5>
							<p>Diam elitr kasd sed at elitr sed ipsum justo dolor sed
								clita amet diam</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
					<div class="service-item rounded pt-3">
						<div class="p-4">
							<i class="fa fa-3x fa-cart-plus text-primary mb-4"></i>
							<h5>Online Order</h5>
							<p>Diam elitr kasd sed at elitr sed ipsum justo dolor sed
								clita amet diam</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
					<div class="service-item rounded pt-3">
						<div class="p-4">
							<i class="fa fa-3x fa-headset text-primary mb-4"></i>
							<h5>24/7 Service</h5>
							<p>Diam elitr kasd sed at elitr sed ipsum justo dolor sed
								clita amet diam</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Service End -->


	<!-- About Start -->
	<div class="container-xl-fluid py-5">
		<div class="container">
			<div class="row g-5 align-items-center">
				<div class="col-lg-6">
					<div class="row g-3">
						<div class="col-6 text-start">
							<img class="img-fluid rounded w-100 wow zoomIn"
								data-wow-delay="0.1s" src="../img/about-1.jpg">
						</div>
						<div class="col-6 text-start">
							<img class="img-fluid rounded w-75 wow zoomIn"
								data-wow-delay="0.3s" src="../img/about-2.jpg"
								style="margin-top: 25%;">
						</div>
						<div class="col-6 text-end">
							<img class="img-fluid rounded w-75 wow zoomIn"
								data-wow-delay="0.5s" src="../img/about-3.jpg">
						</div>
						<div class="col-6 text-end">
							<img class="img-fluid rounded w-100 wow zoomIn"
								data-wow-delay="0.7s" src="../img/about-4.jpg">
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<h5
						class="section-title ff-secondary text-start text-primary fw-normal">About
						Us</h5>
					<h1 class="mb-4">
						Welcome to <i class="fa fa-utensils text-primary me-2"></i>Cafe
						coffee Day
					</h1>
					<p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor
						diam ipsum sit. Aliqu diam amet diam et eos erat ipsum et lorem et
						sit, sed stet lorem sit.</p>
					<p class="mb-4">Tempor erat elitr rebum at clita. Diam dolor
						diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et
						lorem et sit, sed stet lorem sit clita duo justo magna dolore erat
						amet</p>
					<div class="row g-4 mb-4">
						<div class="col-sm-6">
							<div
								class="d-flex align-items-center border-start border-5 border-primary px-3">
								<h1 class="flex-shrink-0 display-5 text-primary mb-0"
									data-toggle="counter-up">15</h1>
								<div class="ps-4">
									<p class="mb-0">Years of</p>
									<h6 class="text-uppercase mb-0">Experience</h6>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div
								class="d-flex align-items-center border-start border-5 border-primary px-3">
								<h1 class="flex-shrink-0 display-5 text-primary mb-0"
									data-toggle="counter-up">50</h1>
								<div class="ps-4">
									<p class="mb-0">Popular</p>
									<h6 class="text-uppercase mb-0">Master Chefs</h6>
								</div>
							</div>
						</div>
					</div>
					<a class="btn btn-primary py-3 px-5 mt-2" href="">Read More</a>
				</div>
			</div>
		</div>
	</div>
	<!-- About End -->

	<%
       try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe", "root", "");
            Statement stmt = con.createStatement();
                // Fetch menu items
            ResultSet res = stmt.executeQuery("SELECT * FROM menu"); 
    %>

    <!-- Menu Start -->
    <div class="container-xl-fluid py-5">
        <div class="container">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h5 class="section-title ff-secondary text-center text-primary fw-normal">Food Menu</h5>
                <h1 class="mb-5">Most Popular Items</h1>
            </div>
            <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
                <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                    <li class="nav-item">
                        <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-1">
                            <i class="fa fa-coffee fa-2x text-primary"></i>
                            <div class="ps-3">
                                <small class="text-body">Popular</small>
                                <h6 class="mt-n1 mb-0">Breakfast</h6>
                            </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill" href="#tab-2">
                            <i class="fa fa-hamburger fa-2x text-primary"></i>
                            <div class="ps-3">
                                <small class="text-body">Special</small>
                                <h6 class="mt-n1 mb-0">Lunch</h6>
                            </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-3">
                            <i class="fa fa-utensils fa-2x text-primary"></i>
                            <div class="ps-3">
                                <small class="text-body">Lovely</small>
                                <h6 class="mt-n1 mb-0">Dinner</h6>
                            </div>
                        </a>
                    </li>
                </ul>

               
                <div class="tab-content">
                <div id="tab-1" class="tab-pane fade show p-0 active">
				   <form id="order-form" action="cart_process.jsp" method="post">
					    <div class="row g-4">
					        <% while (res.next()) {
					            int id = res.getInt("item_id");
					            String itemName = res.getString("item_name");
					            String description = res.getString("description");
					            int itemPrice = res.getInt("price");
					            String filename = res.getString("image");
					        %>
					        <div class="col-md-4 mb-3">
					            <div class="menu-item">
					                <img class="img-fluid rounded" src="../<%= filename %>" alt="<%= itemName %>">
					                <div class="details">
					                    <h6 class="d-flex justify-content-between border-bottom pb-2">
					                        <span><%= itemName %></span>
					                        <span class="price">₹<%= itemPrice %></span>
					                    </h6>
					                    <p class="description"><%= description %></p>
					                  
					                </div>
					            </div>
					        </div>
					        <% } %>
					    </div>
					    
					</form>
                </div>
            </div>
            </div>
        </div>
    </div>
    <!-- Menu End -->

    <%
        } catch (SQLException e) {
            out.println("SQL Error: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            out.println("Class Error: " + e.getMessage());
        }
    %>
	<!-- Reservation Start -->
	<div class="container-xl-fluid py-5 px-0 wow fadeInUp"
		data-wow-delay="0.1s">
		<div class="row g-0">
			<div class="col-md-6">
				<div class="video">
					<button type="button" class="btn-play" data-bs-toggle="modal"
						data-src="https://www.youtube.com/embed/DWRcNpR6Kdc"
						data-bs-target="#videoModal">
						<span></span>
					</button>
				</div>
			</div>
			<div class="col-md-6 bg-dark d-flex align-items-center">
				<div class="p-5 wow fadeInUp" data-wow-delay="0.2s">
					<h5
						class="section-title ff-secondary text-start text-primary fw-normal">Reservation</h5>
					<h1 class="text-white mb-4">Book A Table Online</h1>
					<form>
						<div class="row g-3">
							<div class="col-md-6">
								<div class="form-floating">
									<input type="text" class="form-control" id="name"
										placeholder="Your Name"> <label for="name">Your
										Name</label>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-floating">
									<input type="email" class="form-control" id="email"
										placeholder="Your Email"> <label for="email">Your
										Email</label>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-floating date" id="date3"
									data-target-input="nearest">
									<input type="text" class="form-control datetimepicker-input"
										id="datetime" placeholder="Date & Time" data-target="#date3"
										data-toggle="datetimepicker" /> <label for="datetime">Date
										& Time</label>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-floating">
									<select class="form-select" id="select1">
										<option value="1">People 1</option>
										<option value="2">People 2</option>
										<option value="3">People 3</option>
									</select> <label for="select1">No Of People</label>
								</div>
							</div>
							<div class="col-12">
								<div class="form-floating">
									<textarea class="form-control" placeholder="Special Request"
										id="message" style="height: 100px"></textarea>
									<label for="message">Special Request</label>
								</div>
							</div>
							<div class="col-12">
								<button class="btn btn-primary w-100 py-3" type="submit">Book
									Now</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="videoModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content rounded-0">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Youtube Video</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- 16:9 aspect ratio -->
					<div class="ratio ratio-16x9">
						<iframe class="embed-responsive-item" src="" id="video"
							allowfullscreen allowscriptaccess="always" allow="autoplay"></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- Team Start -->
	<div class="container-xl-fluid pt-5 pb-3">
		<div class="container">
			<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
				<h5
					class="section-title ff-secondary text-center text-primary fw-normal">Team
					Members</h5>
				<h1 class="mb-5">Our Master Chefs</h1>
			</div>
			<div class="row g-4">
				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
					<div class="team-item text-center rounded overflow-hidden">
						<div class="rounded-circle overflow-hidden m-4">
							<img class="img-fluid" src="../img/team-1.jpg" alt="">
						</div>
						<h5 class="mb-0">Full Name</h5>
						<small>Designation</small>
						<div class="d-flex justify-content-center mt-3">
							<a class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
					<div class="team-item text-center rounded overflow-hidden">
						<div class="rounded-circle overflow-hidden m-4">
							<img class="img-fluid" src="../img/team-2.jpg" alt="">
						</div>
						<h5 class="mb-0">Full Name</h5>
						<small>Designation</small>
						<div class="d-flex justify-content-center mt-3">
							<a class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
					<div class="team-item text-center rounded overflow-hidden">
						<div class="rounded-circle overflow-hidden m-4">
							<img class="img-fluid" src="../img/team-3.jpg" alt="">
						</div>
						<h5 class="mb-0">Full Name</h5>
						<small>Designation</small>
						<div class="d-flex justify-content-center mt-3">
							<a class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
					<div class="team-item text-center rounded overflow-hidden">
						<div class="rounded-circle overflow-hidden m-4">
							<img class="img-fluid" src="../img/team-4.jpg" alt="">
						</div>
						<h5 class="mb-0">Full Name</h5>
						<small>Designation</small>
						<div class="d-flex justify-content-center mt-3">
							<a class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-square btn-primary mx-1" href=""><i
								class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Team End -->


	<!-- Testimonial Start -->
	<div class="container-xl-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
		<div class="container">
			<div class="text-center">
				<h5
					class="section-title ff-secondary text-center text-primary fw-normal">Testimonial</h5>
				<h1 class="mb-5">Our Clients Say!!!</h1>
			</div>
			<div class="owl-carousel testimonial-carousel">
				<div class="testimonial-item bg-transparent border rounded p-4">
					<i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
					<p>Dolor et eos labore, stet justo sed est sed. Diam sed sed
						dolor stet amet eirmod eos labore diam</p>
					<div class="d-flex align-items-center">
						<img class="img-fluid flex-shrink-0 rounded-circle"
							src="../img/testimonial-1.jpg" style="width: 50px; height: 50px;">
						<div class="ps-3">
							<h5 class="mb-1">Client Name</h5>
							<small>Profession</small>
						</div>
					</div>
				</div>
				<div class="testimonial-item bg-transparent border rounded p-4">
					<i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
					<p>Dolor et eos labore, stet justo sed est sed. Diam sed sed
						dolor stet amet eirmod eos labore diam</p>
					<div class="d-flex align-items-center">
						<img class="img-fluid flex-shrink-0 rounded-circle"
							src="../img/testimonial-2.jpg" style="width: 50px; height: 50px;">
						<div class="ps-3">
							<h5 class="mb-1">Client Name</h5>
							<small>Profession</small>
						</div>
					</div>
				</div>
				<div class="testimonial-item bg-transparent border rounded p-4">
					<i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
					<p>Dolor et eos labore, stet justo sed est sed. Diam sed sed
						dolor stet amet eirmod eos labore diam</p>
					<div class="d-flex align-items-center">
						<img class="img-fluid flex-shrink-0 rounded-circle"
							src="../img/testimonial-3.jpg" style="width: 50px; height: 50px;">
						<div class="ps-3">
							<h5 class="mb-1">Client Name</h5>
							<small>Profession</small>
						</div>
					</div>
				</div>
				<div class="testimonial-item bg-transparent border rounded p-4">
					<i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
					<p>Dolor et eos labore, stet justo sed est sed. Diam sed sed
						dolor stet amet eirmod eos labore diam</p>
					<div class="d-flex align-items-center">
						<img class="img-fluid flex-shrink-0 rounded-circle"
							src="../img/testimonial-4.jpg" style="width: 50px; height: 50px;">
						<div class="ps-3">
							<h5 class="mb-1">Client Name</h5>
							<small>Profession</small>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Testimonial End -->


	<!-- Footer Start -->
	<div
		class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn"
		data-wow-delay="0.1s">
		<div class="container py-5">
			<div class="row g-5">
				<div class="col-lg-3 col-md-6">
					<h4
						class="section-title ff-secondary text-start text-primary fw-normal mb-4">Company</h4>
					<a class="btn btn-link" href="">About Us</a> <a
						class="btn btn-link" href="">Contact Us</a> <a
						class="btn btn-link" href="">Reservation</a> <a
						class="btn btn-link" href="">Privacy Policy</a> <a
						class="btn btn-link" href="">Terms & Condition</a>
				</div>
				<div class="col-lg-3 col-md-6">
					<h4
						class="section-title ff-secondary text-start text-primary fw-normal mb-4">Contact</h4>
					<p class="mb-2">
						<i class="fa fa-map-marker-alt me-3"></i>Coffee Cafe Day.<br>Satyam
						Complex,<br>Maninagar
					</p>
					<p class="mb-2">
						<i class="fa fa-phone-alt me-3"></i>+91 9898787867
					</p>
					<p class="mb-2">
						<i class="fa fa-envelope me-3"></i>cafeinfo@gmail.com
					</p>

					<div class="d-flex pt-2">
						<a class="btn btn-outline-light btn-social" href=""><i
							class="fab fa-twitter"></i></a> <a
							class="btn btn-outline-light btn-social" href=""><i
							class="fab fa-facebook-f"></i></a> <a
							class="btn btn-outline-light btn-social" href=""><i
							class="fab fa-youtube"></i></a> <a
							class="btn btn-outline-light btn-social" href=""><i
							class="fab fa-linkedin-in"></i></a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<h4
						class="section-title ff-secondary text-start text-primary fw-normal mb-4">Opening</h4>
					<h5 class="text-light fw-normal">Monday - Saturday</h5>
					<p>09AM - 09PM</p>
					<h5 class="text-light fw-normal">Sunday</h5>
					<p>10AM - 08PM</p>
				</div>
				<div class="col-lg-3 col-md-6">
					<h4
						class="section-title ff-secondary text-start text-primary fw-normal mb-4">Newsletter</h4>
					<p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
					<div class="position-relative mx-auto" style="max-width: 400px;">
						<input class="form-control border-primary w-100 py-3 ps-4 pe-5"
							type="text" placeholder="Your email">
						<button type="button"
							class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="copyright">
				<div class="row">
					<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
						&copy; <a class="border-bottom" href="#">Your Site Name</a>, All
						Right Reserved.

						<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
						Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML
							Codex</a><br> <br> Distributed By <a class="border-bottom"
							href="https://themewagon.com" target="_blank">ThemeWagon</a>
					</div>
					<div class="col-md-6 text-center text-md-end">
						<div class="footer-menu">
							<a href="">Home</a> <a href="">Cookies</a> <a href="">Help</a> <a
								href="">FQAs</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer End -->


	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
		class="bi bi-arrow-up"></i></a>
	</div>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../lib/wow/wow.min.js"></script>
	<script src="../lib/easing/easing.min.js"></script>
	<script src="../lib/waypoints/waypoints.min.js"></script>
	<script src="../lib/counterup/counterup.min.js"></script>
	<script src="../lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="../lib/tempusdominus/js/moment.min.js"></script>
	<script src="../lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script src="../lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="../js/jmain.js"></script>


</body>
</html>