<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>
</head>
<body>
<%--<%@include file ="admin_connection.jsp" %> --%>
<%
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe","root","");
		Statement s=con.createStatement();
		int id=Integer.parseInt(request.getParameter("id"));
		
		int del=s.executeUpdate("delete from customer where customer_id= "+id);
		
		if(del>0)
		{
			%>
			<script>
				alert('User Deleted Successfully.....');
				window.location='user_details.jsp';
			</script>
		<% }
		else
		{
		%>
		<script >
		
		alert('User can'"t Delete Successfully....);
		window.location='user_details.jsp';
		
		</script>
		<% 
	}
	}

     catch(Exception e)

	{
    	 System.out.println(e);
}
%>
</body>
</html>