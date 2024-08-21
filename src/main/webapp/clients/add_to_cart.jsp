<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
    String email = (String) session.getAttribute("aemail");
    int itemId = Integer.parseInt(request.getParameter("item_id"));
    int quantity = Integer.parseInt(request.getParameter("quantity"));

    if (email == null || email.isEmpty()) {
        response.sendRedirect("login.jsp");
        return;
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe", "root", "")) {
            // Fetch customer ID
            String query = "SELECT customer_id FROM customer WHERE email = ?";
            int customerId = 0;
            try (PreparedStatement ps = con.prepareStatement(query)) {
                ps.setString(1, email);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        customerId = rs.getInt("customer_id");
                    }
                }
            }

            // Check if the item is already in the cart
            query = "SELECT * FROM orders WHERE customer_id = ? AND item_id = ?";
            boolean itemExists = false;
            try (PreparedStatement ps = con.prepareStatement(query)) {
                ps.setInt(1, customerId);
                ps.setInt(2, itemId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        itemExists = true;
                    }
                }
            }

            if (itemExists) {
                // Update quantity
                query = "UPDATE orders SET quantity = quantity + ? WHERE customer_id = ? AND item_id = ?";
                try (PreparedStatement ps = con.prepareStatement(query)) {
                    ps.setInt(1, quantity);
                    ps.setInt(2, customerId);
                    ps.setInt(3, itemId);
                    ps.executeUpdate();
                }
            } else {
                // Insert new item
                query = "INSERT INTO orders (customer_id, item_id, quantity) VALUES (?, ?, ?)";
                try (PreparedStatement ps = con.prepareStatement(query)) {
                    ps.setInt(1, customerId);
                    ps.setInt(2, itemId);
                    ps.setInt(3, quantity);
                    ps.executeUpdate();
                }
            }
         // Redirect back to menu.jsp
            response.sendRedirect("menu.jsp");
         /*    response.sendRedirect("cart.jsp"); */
        }
    } catch (SQLException e) {
        out.println("SQL Error: " + e.getMessage());
    } catch (ClassNotFoundException e) {
        out.println("Class Error: " + e.getMessage());
    }
%>
