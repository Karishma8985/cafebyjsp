
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCafe</title>
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
<script nomodulesrc="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>
<style>
body {
	background-image: url('.././img/cafe122.jpg');
	
	background-repeat: no-repeat;
	background-size: cover;
	width: 100%;
	overflow-x: hidden;
	
}
</style>
<body>
	<%
	String email = (String) session.getAttribute("adminemail"); 
	String uname = "";
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe", "root", "");
	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select * from admin where email = '" + email + "' ");

	session.setAttribute("adminemail", email);
	if (rs.next()) {
		uname = rs.getString(1);
	}
	if (email != null) {
	%>

	<div class="container-fluid">

		<div class="row mx-5 my-5 border; background-color:transparent; ">
			<div class="row flex-nowrap">
			
				<div
					class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-warning min-vh-100">
					<a href="#"
						class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-danger text-decoration-none">
						<span class=" p-3  fs-5 d-none d-sm-inline"><h4>welcome</h4><h3><%=uname%></h3>	</span>
					</a>
					<ul
						class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start"
						id="menu">
						<li><a href="home.jsp" data-bs-toggle="collapse"
							class="nav-link px-0 align-middle"> <i
								class="fs-4 bi-speedometer2"></i> <span
								class="ms-1 d-none d-sm-inline text-warning"><strong><h5>Dashboard</h5></strong></span>
						</a></li>
						<li><a href="menu_data.jsp"
							class="nav-link px-0 align-middle"> <i class="fs-4 bi-table"></i>
								<span class="ms-1 d-none d-sm-inline text-warning"><h5>Menu
									Update</h5></span></a></li>
						<li><a href="user_details.jsp"
							class="nav-link px-0 align-middle"> <i class="fs-4 bi-table"></i>
								<span class="ms-1 d-none d-sm-inline text-warning"><h5>User
									Details</h5></span></a></li>
						<li><a href="admin_profile1_update.jsp"
							data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
								<i class="fs-4 bi-bootstrap"></i> <span
								class="ms-1 d-none d-sm-inline text-warning"><h5>Profile
									Update</h5></span>
						</a></li>
						<li><a href="changepassword.jsp" data-bs-toggle="collapse"
							class="nav-link px-0 align-middle "> <i
								class="fs-4 bi-bootstrap"></i> <span
								class="ms-1 d-none d-sm-inline text-warning"><h5>Change_Password</h5></span></a>
						</li>
						<li><a href="logout.jsp" class="nav-link px-0 align-middle">
								<i class="fs-4 bi-people"></i> <span
								class="ms-1 d-none d-sm-inline text-warning"><h5>Logout</h5></span>
						</a></li>
					</ul>
					<hr>
				</div>
			</div>
	

	<%
	} else {
	%>
	<script>
		alert('Please Login First..........');
		window.location = 'index.jsp';
	</script>
	<%
	}
	%>

</html>