<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<style>
body{
width:100%;
overflow-x:hidden;
}
</style>
</head>
<body>
 <%@ include file="commonpage.jsp" %>
<%

try{
Class.forName("com.mysql.cj.jdbc.Driver");
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe","root","");
 s=con.createStatement();
int id = Integer.parseInt(request.getParameter("id"));
 rs = s.executeQuery("select * from customer where customer_id = "+id+" ");
while(rs.next())
{
// for to fetch data and show in form on web server
%>
<div class="col-md-6" style="position:absolute; top:80px; left:500px;">
	<form method="post" action="user_update.jsp">
		<div class="form-group ">
			<input type="hidden" class="form-control" id="id" name="uid" value="<%=rs.getInt(1)%>"/>
			
		</div>
		<div class="form-group">
		<label for=" customer_name" class="text-white">Customer Name</label>
		<input type="text" class="form-control" id="customer_name" name="cname" value="<%=rs.getString(2)%>"/>
		
		</div>
		<div class="form-group">
		<label for="Email_Id" class="text-white">Emal_Id</label>
		<input type="email" class="form-control" id="Email_Id" name="Email_Id" value="<%=rs.getString(3)%>" readonly />
		</div>
		<div class="form-group">
		<label for="password" class="text-white">Password</label>
		<input type="password" class="form-control" id="password" name="password" value="<%=rs.getString(4)%>"/>
		</div>
		<div class="form-group">
		<input type="submit" value="Update" class="btn btn-warning">
		</div>
	</form>
</div>
<%
} }catch (Exception e){
out.print(e);
}
%>

</body>
</html>