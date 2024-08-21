<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>database cafe</title>
</head>
<body>

	<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/", "root", "");
		Statement s = con.createStatement();
		s.execute("create database cafe");
		if (con != null) {
			System.out.println("connected? database created successfully");
		} else {
			System.out.println(" cant connected.....");
		}
	} catch (SQLException e) {
		System.out.println(e);
	}
	%>
</body>
</html>