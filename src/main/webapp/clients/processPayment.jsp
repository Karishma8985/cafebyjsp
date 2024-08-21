
 
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Processing Payment - MyCafe</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
</head>
<body>
    <%
        // Retrieve parameters from the request
        String customerId = request.getParameter("customer_id");
        double grandTotal = Double.parseDouble(request.getParameter("grand_total"));
        String paymentMethod = request.getParameter("payment_method");
        Connection con = null;
        PreparedStatement ps = null;
        PreparedStatement psUpdateOrder = null;

        try {
            // Load database driver and establish connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe", "root", "");

            // Update the order status to 'Completed'
            String updateOrderStatusQuery = "UPDATE orders SET status = 'Completed' WHERE customer_id = ? AND status = 'Pending'";
            psUpdateOrder = con.prepareStatement(updateOrderStatusQuery);
            psUpdateOrder.setString(1, customerId);
            psUpdateOrder.executeUpdate();

            // Prepare to insert payment details
            String insertPaymentDetailsQuery = "INSERT INTO payment_details (customer_id, total_amount, payment_method, status) VALUES (?, ?, ?, ?)";
         										
            ps = con.prepareStatement(insertPaymentDetailsQuery);
            ps.setString(1, customerId);
            ps.setDouble(2, grandTotal);
            ps.setString(3, paymentMethod);
            ps.setString(4, "Pending"); // Status for payment processing
            ps.executeUpdate();

            // Determine the appropriate payment page
            String redirectPage = "";
            if ("Netbanking".equalsIgnoreCase(paymentMethod)) {
                redirectPage = "netbanking.jsp";
            } else if ("Card Payment".equalsIgnoreCase(paymentMethod)) {
                redirectPage = "cardpayment.jsp";
            } else if ("Cash on Delivery".equalsIgnoreCase(paymentMethod)) {
                redirectPage = "cashondelivery.jsp";
            } else {
                out.println("<p>Error: Invalid payment method.</p>");
                return;
            }

            // Redirect to the appropriate payment page
            response.sendRedirect(redirectPage + "?customer_id=" + customerId + "&grand_total=" + grandTotal);

        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            try {
                if (ps != null) ps.close();
                if (psUpdateOrder != null) psUpdateOrder.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
 