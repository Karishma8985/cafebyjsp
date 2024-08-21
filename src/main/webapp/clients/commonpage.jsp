<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,java.util.*"%>
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
	<%
		try{
			String email = (String) session.getAttribute("aemail");
			String name = "";
			int cid;
					
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe", "root", "");
			Statement s=con.createStatement();
			ResultSet rs = s.executeQuery("select * from customer where email = '"+email+"'");
			session.setAttribute("aemail",email);
			if(rs.next())
			{
				cid=rs.getInt(1);
				name= rs.getString(2);
						
	%>
	<!-- Navbar & Hero Start -->
	<div class="container-xl-fluid position-relative p-0">
		<nav
			class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
			<a href="" class="navbar-brand p-0">
				<h1 class="text-primary m-0">
					<i class="fa fa-utensils me-3"></i>Cafe Coffee Day
				</h1> 
			</a>
			<a href="" class="navbar-brand p-0" class="text-primary m-0">
					welcome <%=name %></a>
			
				
					
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
				<span class="fa fa-bars"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<div class="navbar-nav ms-auto py-0 pe-4">
					<a href="home.jsp" class="nav-item nav-link active">Home</a>
					
				
									
					<a href="about.jsp" class="nav-item nav-link">About</a> 
					<a href="service.jsp" class="nav-item nav-link">Service</a>
					<a href="signout.jsp" class="nav-item nav-link">Logout</a> 
					<a href="menu.jsp" class="nav-item nav-link">Menu</a>

					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown">Pages</a>
						<div class="dropdown-menu m-0">
							<a href="booking.jsp" class="dropdown-item">Booking</a> <a
								href="team.jsp" class="dropdown-item">Our Team</a> <a
								href="testimonial.jsp" class="dropdown-item">Testimonial</a>
						</div>
					</div>
					<a href="cart.jsp" class="nav-item nav-link">MyOrder</a>
					<a href="contact.jsp" class="nav-item nav-link">Contact</a>
				</div>
				<a href="booking.jsp" class="btn btn-primary py-2 px-4">Book A Table</a>
			</div>

			</nav>


		</div>
		<div class="container-xl-fluid py-5 bg-dark hero-header mb-5"></div>

<%
	}
	 else
		{
	 		out.print(" can not Login....");
		}
	}
	catch(SQLException e)
	{
		out.print(e);
	}
	%>
	
</body>
</html>