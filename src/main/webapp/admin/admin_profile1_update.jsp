<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<style>
body{
witdh:100%;
overflow-x:hidden;

}
</style>
</head>
<body>
<%@ include file="commonpage.jsp" %>
<div class="col-md-6" style="position:absolute; top:200px; left:500px;">
<form action="adminprofile_update.jsp">
	
		<div class="form-group">
	<label for="user_name" class="text-light"><b>User name</b></label>
	<input type="text" class="form-control" id="user_name" name="uname" value="<%=rs.getString(1)%>"/>
	</div>
	
	<div class="form-group">
	<label for="email" class="text-light"><b>email</b></label>
	<input type="email" class="form-control"  id="email" name="email" value="<%= rs.getString(2)%>" readonly/>
	</div> 
	
	
	<div class="form-group">
	<label for="password" class="text-light"><b>Password</b></label>
	<input type="password" class="form-control" id="password" name="psw" value="<%=rs.getString(3)%>"/>
	</div>

 
	<div class="form-group">
	<input type="submit" value="Update" class="btn btn-success">
	</div>
</form>
</div>
</body>
</html>