<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
<%
	session.invalidate();
%>
<script >
	
	alert('You have been Successfully logout......');
	window.location='index.jsp';
	
</script>
</body>
</html>