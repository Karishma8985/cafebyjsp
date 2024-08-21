<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe", "root", "");
		Statement s = con.createStatement();

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		ResultSet rs = s.executeQuery("select * from admin where email = '" + email + "' and password='" + password + "' ");
		session.setAttribute("adminemail", email);
		if (rs.next()) {
			%>
			<script>
				
				//alert("Login successfully....");
				window.location = "home.jsp";
				//response.sendRedirect("home.jsp");
			</script>
			<%
		} else {
			%>
			<script>
				alert(" invalid account_no or password...");
				window.location = "index.jsp";
			</script>
			<%
		}
	} catch (Exception e) {
		System.out.print(e);
	}
	%>
</body>
</html>