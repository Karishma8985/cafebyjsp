
 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Cart - MyCafe</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    
    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">
    
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Styles -->
    <style>
        .cart-table th, .cart-table td {
            text-align: center;
        }
        .total-amount {
            font-weight: bold;
        }
        .cart-container {
            max-width: 600px; /* Set maximum width to 600px */
            margin: auto; /* Center align container */
            padding: 20px;
        }
        .btn-custom {
            background-color: #007bff; /* Customize button color */
            border-color: #007bff;
        }
        .btn-custom:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
        .table-responsive {
            margin-top: 20px; /* Space above the table */
        }
        .order-summary {
            margin-top: 20px; /* Space above the summary */
            margin-right:100px;
            display: flex;
            flex-direction: column;
            align-items: flex-end; /* Align items to the right */
        }
        .grand-total {
            font-weight: bold;
        }
        .payment-option-button {
            display: block; /* Make buttons stack vertically */
            margin-bottom: 10px; /* Space between buttons */
        }
    </style>
</head>

<body>
    <%@ include file="commonpage.jsp" %>

    <%
        String email = (String) session.getAttribute("aemail");
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        PreparedStatement psItems = null;
        ResultSet rsItems = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe", "root", "");

            // Fetch customer ID
            String query = "SELECT customer_id FROM customer WHERE email = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            int customerId = 0;
            if (rs.next()) {
                customerId = rs.getInt("customer_id");
            }

            // Fetch all orders for the customer
            String fetchOrdersQuery = "SELECT * FROM orders WHERE customer_id = ? AND status = 'Pending'";
            ps = con.prepareStatement(fetchOrdersQuery);
            ps.setInt(1, customerId);
            rs = ps.executeQuery();

            double grandTotal = 0;
    %>

    <!-- Cart Start -->
    <div class="container cart-container py-5">
        <div class="text-center mb-4">
            <h3 class="text-primary">Items in Your Cart</h3>
        </div>

        <% 
        while (rs.next()) {
            int orderId = rs.getInt("order_id");
            double totalAmount = rs.getDouble("total_amount");

            // Fetch items for the order
            String fetchOrderItemsQuery = "SELECT * FROM order_items WHERE order_id = ?";
            psItems = con.prepareStatement(fetchOrderItemsQuery);
            psItems.setInt(1, orderId);
            rsItems = psItems.executeQuery();
        %>
        
        <div class="mb-4">
            <h2 class="mb-3">Order #<%= orderId %></h2>
            <div class="table-responsive">
                <table class="table table-striped cart-table mx-auto">
                    <thead>
                        <tr>
                            <th>Item</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% while (rsItems.next()) {
                            String itemName = rsItems.getString("item_name");
                            int quantity = rsItems.getInt("quantity");
                            double price = rsItems.getDouble("price");
                            double itemTotal = rsItems.getDouble("total_amount");
                        %>
                        <tr>
                            <td><%= itemName %></td>
                            <td><%= quantity %></td>
                            <td>₹<%= price %></td>
                            <td>₹<%= itemTotal %></td>
                        </tr>
                        <% 
                        } 
                        %>
                        <tr class="total-amount">
                            <td colspan="3" class="text-end">Total Amount:</td>
                            <td>₹<%= totalAmount %></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <% 
            grandTotal += totalAmount;
        }
        %>

        <div class="order-summary">
            <h2 class="grand-total">Grand Total: ₹<%= grandTotal %></h2>

            <!-- Payment Options -->
                       
            	<form action="processPayment.jsp" method="post" class="mt-4">
				    <input type="hidden" name="customer_id" value="<%= customerId %>">
				    <input type="hidden" name="grand_total" value="<%= grandTotal %>">
				    <div class="mb-3">
				        <button type="submit" name="payment_method" value="Netbanking" class="btn btn-custom payment-option-button">Netbanking</button>
				        <button type="submit" name="payment_method" value="Card Payment" class="btn btn-custom payment-option-button">Card Payment</button>
				        <button type="submit" name="payment_method" value="Cash on Delivery" class="btn btn-custom payment-option-button">Cash on Delivery</button>
				    </div>
				</form>
        </div>
    </div>
    <!-- Cart End -->

    <% 
        } catch (SQLException e) {
            out.println("SQL Error: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            out.println("Class Error: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (rsItems != null) rsItems.close();
                if (ps != null) ps.close();
                if (psItems != null) psItems.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>

    <%@ include file="footer.jsp" %>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
 