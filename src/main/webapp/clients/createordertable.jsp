<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Orders Table</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
</head>
<body>
    <h1>Create Orders Table</h1>
    <%
         try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            
            
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe", "root", "");
			Statement stmt=con.createStatement();

            
            String sql = "CREATE TABLE orders (" +
                         "order_id INT AUTO_INCREMENT PRIMARY KEY, " +
                         "cid INT NOT NULL, " +
                         "cname VARCHAR(100) NOT NULL, " +
                         "email VARCHAR(100) NOT NULL, " +
                         "item_name VARCHAR(255) NOT NULL, " +
                         "quantity INT NOT NULL, " +
                         "price DECIMAL(10, 2) NOT NULL, " +
                         "total DECIMAL(10, 2) NOT NULL, " +
                         "order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, " +
                         "status VARCHAR(50) DEFAULT 'Pending', " +
                         "image_url VARCHAR(255), " +
                         "FOREIGN KEY (cid) REFERENCES customer(customer_id)" +
                         ")";

            // Execute the SQL statement
            stmt.executeUpdate(sql);

            out.println("<p>Orders table created successfully!</p>");

        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p>Error creating table: " + e.getMessage() + "</p>");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<p>Error loading database driver: " + e.getMessage() + "</p>");
        } 
    %>
</body>
</html>
