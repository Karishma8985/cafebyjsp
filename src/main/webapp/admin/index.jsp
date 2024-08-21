<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCafe </title>
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
	<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<style>
body {
	background-image: url('.././img/cafe122.jpg');
	width: 100%;
	overflow-x: hidden;
	
}
</style>
</head>
<body>

	<div class="container">

		<div class="row mx-5 my-5 border p-5 border-warning"
			style="border-radius: 10px; background-color: transparent;">
			<div class="col-md-8 offset-md-2">
				
				<form action="admin_login.jsp" method="POST">
				
					<h3 class="text-center" style="color: white">Admin Login Form</h3>
					<div class="form-group">
						<label for="email" style="color: yellow">Email</label> <input
							type="email" class="form-control" id="email" name="email"
							placeholder="Enter Your Email....">
					</div>
					<div class="form-group">
						<label for="password" style="color: yellow">Password</label> <input
							type="password" class="form-control" id="password"
							name="password" placeholder="Enter Your Password....">
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
					<br> <a href="forgetpassword.jsp" style="color: red">forget
						password?</a> <br> <br>
				</form>
			</div>
		</div>
	</div>

</body>
</html>