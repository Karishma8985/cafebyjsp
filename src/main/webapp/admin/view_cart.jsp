<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Cart - MyCafe</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Cart</h2>

        <% 
            session = request.getSession();
            Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");

            if (cart != null && !cart.isEmpty()) {
                double totalAmount = 0.0;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe", "root", "")) {
                        String query = "SELECT item_id, item_name, price FROM menu WHERE item_id = ?";
                        PreparedStatement ps = con.prepareStatement(query);

                        out.println("<table class='table table-striped'>");
                        out.println("<thead><tr><th>Item</th><th>Quantity</th><th>Price</th><th>Amount</th></tr></thead>");
                        out.println("<tbody>");

                        for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
                            int itemId = entry.getKey();
                            int quantity = entry.getValue();
                            ps.setInt(1, itemId);
                            ResultSet rs = ps.executeQuery();
                            if (rs.next()) {
                                String itemName = rs.getString("item_name");
                                double itemPrice = rs.getDouble("price");
                                double amount = itemPrice * quantity;
                                totalAmount += amount;
        %>

        <tr>
            <td><%= itemName %></td>
            <td><%= quantity %></td>
            <td>₹<%= itemPrice %></td>
            <td>₹<%= amount %></td>
        </tr>

        <% 
                            }
                        }
                        out.println("</tbody>");
                        out.println("</table>");
                        out.println("<div class='mt-4'>");
                        out.println("<p>Total Amount: ₹" + totalAmount + "</p>");
                        out.println("<form method='post' action='finalize_order.jsp'>");
                        out.println("<input type='hidden' name='total_amount' value='" + totalAmount + "'>");
                        out.println("<button type='submit' class='btn btn-success'>Place Order</button>");
                        out.println("</form>");
                        out.println("</div>");
                    }
                } catch (SQLException e) {
                    out.println("SQL Error: " + e.getMessage());
                } catch (ClassNotFoundException e) {
                    out.println("Class Error: " + e.getMessage());
                }
            } else {
                out.println("<p>No items in cart.</p>");
                out.println("<a href='menu.jsp' class='btn btn-primary'>Back to Menu</a>");
            }
        %>

    </div>
</body>
</html>
