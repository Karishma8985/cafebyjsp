<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
    String email = (String) session.getAttribute("aemail");
    int itemId = Integer.parseInt(request.getParameter("item_id"));

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

            // Delete item from cart
            query = "DELETE FROM orders WHERE customer_id = ? AND item_id = ?";
            try (PreparedStatement ps = con.prepareStatement(query)) {
                ps.setInt(1, customerId);
                ps.setInt(2, itemId);
                ps.executeUpdate();
            }

            response.sendRedirect("cart.jsp");
        }
    } catch (SQLException e) {
        out.println("SQL Error: " + e.getMessage());
    } catch (ClassNotFoundException e) {
        out.println("Class Error: " + e.getMessage());
    }
%>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Removing Item - MyCafe</title>
</head>

<body>
    <% 
        String email = (String) session.getAttribute("aemail");
        int itemId = Integer.parseInt(request.getParameter("item_id"));
        int customerId = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe", "root", "")) {
                // Fetch customer ID
                String query = "SELECT customer_id FROM customer WHERE email = ?";
                try (PreparedStatement ps = con.prepareStatement(query)) {
                    ps.setString(1, email);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            customerId = rs.getInt("customer_id");
                        }
                    }
                }

                // Remove item from cart
                query = "DELETE FROM orders WHERE customer_id = ? AND item_id = ?";
                try (PreparedStatement ps = con.prepareStatement(query)) {
                    ps.setInt(1, customerId);
                    ps.setInt(2, itemId);
                    int rowsAffected = ps.executeUpdate();
                    if (rowsAffected > 0) {
                        out.println("Item removed successfully.");
                    } else {
                        out.println("No item found to remove.");
                    }
                }
            }
        } catch (SQLException e) {
            out.println("SQL Error: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            out.println("Class Error: " + e.getMessage());
        }

        // Redirect back to cart.jsp
        response.sendRedirect("cart.jsp");
    %>
</body>
</html>
 --%>