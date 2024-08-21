<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head> 
<body> 
<% 
	try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe","root","");
Statement s=con.createStatement();
String name = request.getParameter("name");
String Email_Id=request.getParameter("email");
String password= request.getParameter("psw");

int i=s.executeUpdate("insert into customer(name,email,password) values ('"+name+"','"+Email_Id+"',"+password+")");
if(i>0)
{
	%>
	<script >
		
		alert("Account Created Successfully...!");
		window.location="login.html";
		
	</script>
	<%
	
}
else {
	%>
	<script >
	alert("Account Not Created Successfully...!");
	window.location="Create_account.jsp";
	
	</script>
	<% 
	
		out.println("can't Inserted Data.....!");
	}
	}
catch(SQLException e)
{
	out.println(e);
	
}
%>
</body>
</html>