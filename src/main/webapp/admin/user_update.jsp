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
<%-- <%@ include file="connection.jsp" %> --%>
<%
try{
Class.forName("com.mysql.cj.jdbc.Driver");
// create connection with server"src/main/webapp/profile_update_data.jsp"
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe","root","");
Statement s=con.createStatement();
int id=Integer.parseInt(request.getParameter("uid"));
 
String cname = request.getParameter("cname");
String Email_Id = request.getParameter("Email_Id");
String password = request.getParameter("password");


int i=s.executeUpdate("update customer set name ='"+cname+"' , password ='"+password+"' where customer_id ="+id);
if(i>0)
{
%>
<script>
alert('User updated Successfully...........');
window.location='user_details.jsp';
</script>
<% }
else
{
%>
<script>
alert('User can"'t updated Successfully...........');
window.location='user_details.jsp';
</script>
<%
}
}
catch (Exception e){
System.out.print(e);
}
%>

</body>
</html>