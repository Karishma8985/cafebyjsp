 
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Tables</title>
</head>
<body>
    <%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Updated driver class

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe", "root", "");

        Statement stmt = con.createStatement();

        // Create Admin table
        String createAdminTable = "CREATE TABLE IF NOT EXISTS admin (" +
                                  "name VARCHAR(100) NOT NULL," +
                                  "email VARCHAR(100) NOT NULL," +
                                  "password VARCHAR(100) NOT NULL)";
        stmt.executeUpdate(createAdminTable);

        // Create customer table
        String createCustomerTable = "CREATE TABLE IF NOT EXISTS customer (" +
                                     "customer_id INT AUTO_INCREMENT PRIMARY KEY," +
                                     "name VARCHAR(100) NOT NULL," +
                                     "email VARCHAR(100) NOT NULL," +
                                     "password VARCHAR(100) NOT NULL)";
        stmt.executeUpdate(createCustomerTable);

        // Create menu table
        String createMenuTable = "CREATE TABLE IF NOT EXISTS menu (" +
                                 "item_id INT AUTO_INCREMENT PRIMARY KEY," +
                                 "item_name VARCHAR(100) NOT NULL," +
                                 "description VARCHAR(500) NOT NULL," +
                                 "price DECIMAL(10, 2) NOT NULL," +
                                 "image VARCHAR(100) NOT NULL," +
                                 "item_path VARCHAR(100) NOT NULL)";
        stmt.executeUpdate(createMenuTable);

        // Create orders table
        String createOrderTable = "CREATE TABLE IF NOT EXISTS orders (" +
                                  "order_id INT AUTO_INCREMENT PRIMARY KEY," +
                                  "customer_id INT," +"item_id INT,"+"item_name VARCHAR(100)," +"quantity INT," +
                                  "order_date DATETIME DEFAULT CURRENT_TIMESTAMP," +
                                  "price DECIMAL(10, 2)," +
                                  "TotalAmount DECIMAL(10, 2)," +
                                  "status VARCHAR(50)," +
                                  "FOREIGN KEY (customer_id) REFERENCES customer(customer_id)"+
                                  "FOREIGN KEY (item_id) REFERENCES menu(item_id))";
        stmt.executeUpdate(createOrderTable);

        // Create order_details table
        String createOrderDetailsTable = "CREATE TABLE IF NOT EXISTS order_details (" +
                                         "order_detail_id INT AUTO_INCREMENT PRIMARY KEY," +
                                         "order_id INT," +
                                         "item_id INT," +
                                         "quantity INT NOT NULL," +
                                         "price DECIMAL(10, 2)," +
                                         "FOREIGN KEY (order_id) REFERENCES orders(order_id)," +
                                         "FOREIGN KEY (item_id) REFERENCES menu(item_id))";
        stmt.executeUpdate(createOrderDetailsTable);
        
       /*  CREATE TABLE payment_details (
        	    payment_id INT AUTO_INCREMENT PRIMARY KEY,
        	    customer_id INT,
        	    total_amount DOUBLE,
        	    payment_method ENUM('Netbanking', 'Card Payment', 'Cash on Delivery'),
        	    status ENUM('Pending', 'Completed') DEFAULT 'Pending',
        	    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
        	); */


        // Close resources
        stmt.close();
        con.close();

        out.println("Tables created successfully!");

    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        out.println("An error occurred: " + e.getMessage());
    }
    %>
</body>
</html>
 