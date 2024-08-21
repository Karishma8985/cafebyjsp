<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Confirmation - MyCafe</title>
</head>
<body>
    <%
        // Get form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String datetime = request.getParameter("datetime");
        int peopleCount = Integer.parseInt(request.getParameter("select1"));
        String specialRequest = request.getParameter("message");
        
        // Fetch customer ID from session
        Integer customerId = (Integer) session.getAttribute("customer_id");
        
        if (customerId == null) {
            out.println("<h1>Error</h1>");
            out.println("<p>Customer ID not found. Please log in again.</p>");
            return; // Exit early if customer ID is not found
        }

        // Convert datetime format from 'MM/DD/YYYY hh:mm AM/PM' to 'YYYY-MM-DD HH:mm:SS'
        SimpleDateFormat inputFormat = new SimpleDateFormat("MM/dd/yyyy h:mm a");
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = "";
        
        try {
            java.util.Date date = inputFormat.parse(datetime);
            formattedDateTime = outputFormat.format(date);
        } catch (Exception e) {
            out.println("Date Format Error: " + e.getMessage());
            return; // Exit early if date format conversion fails
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe", "root", "")) {
                String query = "INSERT INTO reservations (name, email, reservation_datetime, people_count, special_request, customer_id) VALUES (?, ?, ?, ?, ?, ?)";
                try (PreparedStatement ps = con.prepareStatement(query)) {
                    ps.setString(1, name);
                    ps.setString(2, email);
                    ps.setString(3, formattedDateTime);
                    ps.setInt(4, peopleCount);
                    ps.setString(5, specialRequest);
                    ps.setInt(6, customerId);
                    ps.executeUpdate();
                    out.println("<h1>Reservation Confirmed</h1>");
                    out.println("<p>Thank you, " + name + ". Your reservation has been confirmed.</p>");
                }
            }
        } catch (SQLException e) {
            out.println("SQL Error: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            out.println("Class Error: " + e.getMessage());
        }
    %>
</body>
</html>
