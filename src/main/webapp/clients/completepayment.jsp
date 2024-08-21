<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Payment Confirmation - MyCafe</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Payment Confirmation</h1>
        <% 
            String customerId = request.getParameter("customer_id");
            double grandTotal = Double.parseDouble(request.getParameter("grand_total"));
            String paymentMethod = request.getParameter("payment_method");
            Connection con = null;
            PreparedStatement ps = null;

            try {
                // Load database driver and establish connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe", "root", "");

                // Update payment status to 'Completed'
                String updatePaymentStatusQuery = "UPDATE payment_details SET status = 'Completed' WHERE customer_id = ? AND total_amount = ? AND payment_method = ?";
                ps = con.prepareStatement(updatePaymentStatusQuery);
                ps.setString(1, customerId);
                ps.setDouble(2, grandTotal);
                ps.setString(3, paymentMethod);
                ps.executeUpdate();

                out.println("<div class='alert alert-success'>");
                out.println("<p><strong>Customer ID:</strong> " + customerId + "</p>");
                out.println("<p><strong>Grand Total:</strong> ₹" + grandTotal + "</p>");
                out.println("<p><strong>Payment Method:</strong> " + paymentMethod + "</p>");
                out.println("<p>Your payment has been successfully processed. Thank you for your purchase!</p>");
                out.println("</div>");

            } catch (Exception e) {
                out.println("<div class='alert alert-danger'>");
                out.println("<p><strong>Error:</strong> " + e.getMessage() + "</p>");
                out.println("</div>");
            } finally {
                try {
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
        <div class="text-center mt-4">
            <a href="home.jsp" class="btn btn-primary">Return to Home</a>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
