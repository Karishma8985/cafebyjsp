<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "java.sql.*,java.util.*"%>
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
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe1","root","");
Statement s=con.createStatement();
/* <!-- taking input from html page... --> */

/* int id=Integer.parseInt(request.getParameter("id")); */
String  cname = request.getParameter("cname");
String Email = request.getParameter("Email_Id");
int password = Integer.parseInt(request.getParameter("password"));

//out.print(num);
/* <!-- execute insert query */
int i=s.executeUpdate("insert into customers(name,email,password) values ('"+cname+"','"+Email+"',"+password+")");
if(i>0)
{
%>
<script>
alert('User inserted Successfully...........');
window.location='user_details.jsp';
</script>
<% }
else
{
%>
<script>
alert('User can"'t inserted Successfully...........');
window.location='user_details.jsp';
</script>
<%
}
}catch(Exception e)
{
System.out.println(e);
}
%>

</body>
</html>