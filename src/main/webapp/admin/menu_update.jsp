<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Menu Item</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
    <%@ include file="commonpage.jsp"%>
    <div class="container">
        <h2 class="mt-5">Update Menu Item</h2>
        <%
       // Connection con = null;
        PreparedStatement pst = null;
       // ResultSet rs = null;
        String fileName=null,image_path=null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe", "root", "");
            
            int id = Integer.parseInt(request.getParameter("item_id"));
            String itemName = request.getParameter("item_name");
            String description = request.getParameter("description");
            int itemPrice = Integer.parseInt(request.getParameter("item_price"));
            
            // Handle file upload
            Part filePart = request.getPart("item_image");
            if (filePart != null && filePart.getSize() > 0) {
                fileName = "images/" + System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
                String uploadPath = getServletContext().getRealPath("") + File.separator + fileName;
                filePart.write(uploadPath);
            } else {
                // If no new image is uploaded, keep the old filename
                String query = "SELECT image, image_path FROM menu WHERE item_id = ?";
                pst = con.prepareStatement(query);
                pst.setInt(1, id);
                rs = pst.executeQuery();
                if (rs.next()) {
                    fileName = rs.getString("image");
                    image_path = rs.getString("image_path");
                }
                rs.close();
            }
            
            // Update the item
            String updateQuery = "UPDATE menu SET item_name = ?, description = ?, price = ?, image = ?, image_path = ? WHERE item_id = ?";
            pst = con.prepareStatement(updateQuery);
            pst.setString(1, itemName);
            pst.setString(2, description);
            pst.setInt(3, itemPrice);
            pst.setString(4, (fileName != null) ? fileName : image_path); 
            pst.setString(5, image_path);
            pst.setInt(6, id);
            int rowsUpdated = pst.executeUpdate();
            
            if (rowsUpdated > 0) {
                out.println("<div class='alert alert-success' role='alert'>Item updated successfully!</div>");
            } else {
                out.println("<div class='alert alert-danger' role='alert'>Failed to update item!</div>");
            }
        } catch (NumberFormatException e) {
            out.println("<div class='alert alert-danger' role='alert'>Error: Invalid number format - " + e.getMessage() + "</div>");
        } catch (SQLException e) {
            out.println("<div class='alert alert-danger' role='alert'>Database error: " + e.getMessage() + "</div>");
        } catch (Exception e) {
            out.println("<div class='alert alert-danger' role='alert'>Error: " + e.getMessage() + "</div>");
        } 
        %>
        <a href="menu_data.jsp" class="btn btn-primary mt-3">Back to Menu List</a>
    </div>
</body>
</html>
