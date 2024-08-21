<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Menu Item</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
	 <%@ include file="commonpage.jsp"%>
    <div class="container">
        <h2 class="mt-5">Edit Menu Item</h2>
        <%
               
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe", "root", "");
            
            int id = Integer.parseInt(request.getParameter("id"));
            String query = "SELECT * FROM menu WHERE item_id = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            
            if (rs.next()) {
                String itemName = rs.getString("item_name");
                String description = rs.getString("description");
                int itemPrice = rs.getInt("price");
                String filename = rs.getString("image");
        %>
        <div>
		<div>
			<div class="container">
			<div class="row mx-5 my-5 border p-5 border-secondary" style="background-color: #FFAA48; border-radius:15px;">
				
					<div class="col-md-8 offset-md-2">
				        <form action="menu_update.jsp" method="post" enctype="multipart/form-data">
				            <input type="hidden" name="item_id" value="<%= id %>"/>
				            
				            <div class="form-group">
				                <label for="item_name"><h6>Item Name</h6></label>
				                <input type="text" class="form-control" id="item_name" name="item_name" value="<%= itemName %>" required>
				            </div>
				
				            <div class="form-group">
				                <label for="description"><h6>Description</h6></label>
				                <textarea class="form-control" id="description" name="description" rows="3" required><%= description %></textarea>
				            </div>
				
				            <div class="form-group">
				                <label for="item_price"><h6>Price</h6></label>
				                <input type="number" class="form-control" id="item_price" name="item_price" value="<%= itemPrice %>" step="0.01" required>
				            </div>
				
				            <div class="form-group">
				                <label for="item_image"><h6>Image</h6></label>
				                <input type="file" class="form-control-file" id="item_image" name="item_image">
				                <% if (filename != null && !filename.isEmpty()) { %>
				                <img src="../<%= filename %>" alt="Current Image" class="img-thumbnail mt-2" style="max-width: 200px;">
				                <% } %>
				            </div>
				
				            <button type="submit" class="btn btn-primary"><h6>Update</h6></button>
				        </form>
				        </div>
				</div>
			</div>
		</div>
	</div>
        <%
            } else {
                out.println("<div class='alert alert-danger' role='alert'>Item not found!</div>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<div class='alert alert-danger' role='alert'>Error: " + e.getMessage() + "</div>");
        } 
        %>
    </div>
</body>
</html>
