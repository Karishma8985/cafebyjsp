<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>
</head>
<body>
	
	<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe", "root", "");
		Statement s = con.createStatement();
		int id = Integer.parseInt(request.getParameter("id"));
		//delete particular data
		int del = s.executeUpdate("delete from menu where item_id =" + id);
		if (del > 0) {
	%>
	<script>
alert('User Deleted Successfully...........');
window.location='menu_data.jsp';
</script>
	<%
	} else {
	%>
	<script>
alert('User can"'t Deleted Successfully...........');
window.location='menu_data.jsp';
</script>
	<%
	}
	} catch (Exception e) {
	System.out.println(e);
	}
	%>
</body>
</html>

