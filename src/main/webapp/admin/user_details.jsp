<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>
<body>
	<%@ include file="commonpage.jsp"%>
	<%-- <%@ include file="admin_connection.jsp" %> --%>
	<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");

		ResultSet res = s.executeQuery("select * from customer ");
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-8"
				style="position: absolute; top: 120px; left: 400px;">
				<div class="col-12">
					<button class="btn btn-warning" style='margin-left: 89%'>
						<a href="user.html" class="text-decoration-none text-white">Add
							User</a>
					</button>
				</div>
				<div class="card mb-4"  style='background-color: lightgray'>
					<div class="card-header">
						<i class="fas fa-table me-1"></i>
						<h4 class="text-center text-danger">User Details</h4>
					</div>
					<div class="card-body">
						<table id="datatablesSimple" class="table table-striped">
							<thead class="thead-dark">
								<tr>
									<th scope="col">Id</th>
									<th scope="col">Customer name</th>
									<th scope="col">Email</th>
									<!-- <th scope="col">password</th> -->

									<th scope="col">Edit</th>
									<th scope="col">Delete</th>

								</tr>
							</thead>
							<%
							while (res.next()) {
							%>
							<tbody>
								<tr>
									<td><%=res.getInt(1)%></td>
									<td><%=res.getString(2)%></td>
									<td><%=res.getString(3)%></td>
									<td><a href="user_delete.jsp?id=<%=res.getInt(1)%>">delete</a></td>
									<td><a href="user_edit.jsp?id=<%=res.getInt(1)%>">Edit</a></td>
								</tr>
							</tbody>
							<%
							}
							con.close();
							%>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	} catch (Exception e) {
	System.out.println(e);
	}
	%>
</body>
</html>
x
