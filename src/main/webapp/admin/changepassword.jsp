<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.* "%>
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
<script nomodule
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
<style>
body {
	width: 100px%;
	overflow-x: hidden;
	background-image: url('.././img/cafe122.jpg');
	background-size: cover;
	image-repeat: norepeat;
	width: auto;
	overflow-x: hidden;
	
}
</style>
</head>
<body>
  <%@ include file="commonpage.jsp" %>
	<div class="container">

		<div class="row mx-5 my-5 border p-5 border-secondary"
			style="border-radius: 10px">
			<div class="com-md-8 offset-md-2">
				<h2 class="text-center text-white">Reset Your Password</h2>

				<form action="" method="POST">
					<div class="form-group text-white">
						<label for="oldpassword">Old password</label> 
						<input type="password" class="form-control" id="oldpassword" name="opsw"
							placeholder="Enter Old Password Here" style='background-color: #D3D3D3'>
					</div>
					<br> <br>
					<div class="form-group text-white">
						<label for="password">New Password</label> <input type="password"
							class="form-control" id="password" name="npsw"
							placeholder="Enter New Password Here "  style='background-color: #D3D3D3'>
					</div>
					<div class="form-group text-white">
						<label for="c_password">Confirm Password</label> <input
							type="password" class="form-control" id="c_password" name="cpsw"
							placeholder="Enter Your Confirm Password"  style='background-color: #D3D3D3'> <br> <br>
							
						<input type="submit" class="btn btn-warning">
					</div>
				</form>
			</div>
		</div>
	</div>
	<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe", "root", "");
		s = con.createStatement();

		String opsw = request.getParameter("opsw");
		if (opsw != null) {

			 email = (String) session.getAttribute("adminemail");
			 rs = s.executeQuery("Select * from admin where password='" + opsw + "'");
			if (rs.next()) {
		String npsw = request.getParameter("npsw");
		String cpsw = request.getParameter("cpsw");
		if (npsw.compareTo(cpsw) == 0) {
			int i = s.executeUpdate("update admin set password='" + npsw + "'	where email='" + email + "'");
			if (i > 0) {
	%>
	<script>							
							alert('password changed successfully.....');
							window.location='commonpage.jsp';
						</script>
	<%
	} else {
	%>
	<script>
							alert('password can"'t changed Successfully....');
							window.location='changepassword.jsp';
						</script>
	<%
	}
	} else {
	%>
	<script>
					alert('Password & Confirm Password both are')
					window.location='changepassword.jsp';
					</script>
	<%
	}
	} else {
	%>
	<script>
						alert('Your Old Password Is Not Match');
						window.location='changepassword.jsp';
					</script>
	<%
	}

	}

	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>
</html>