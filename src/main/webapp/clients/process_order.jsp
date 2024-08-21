<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Processing Cart - MyCafe</title>
</head>
<body>
    <% 
        String email = (String) session.getAttribute("aemail");
        int customerId = Integer.parseInt(request.getParameter("customer_id"));
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Statement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe", "root", "");

            // Create a new order
            String insertOrderQuery = "INSERT INTO orders (customer_id, total_amount, status) VALUES (?, ?, 'Pending')";
            ps = con.prepareStatement(insertOrderQuery, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, customerId);
            ps.setDouble(2, 0); // Total amount will be updated later
            ps.executeUpdate();

            // Retrieve the generated order ID
            rs = ps.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            // Add items to order_items table
            double totalAmount = 0;
            Map<Integer, Integer> selectedItems = new HashMap<>();
            Enumeration<String> parameterNames = request.getParameterNames();
            while (parameterNames.hasMoreElements()) {
                String paramName = parameterNames.nextElement();
                if (paramName.startsWith("quantity_")) {
                    int itemId = Integer.parseInt(paramName.substring("quantity_".length()));
                    int quantity = Integer.parseInt(request.getParameter(paramName));
                    if (quantity > 0 && request.getParameter("selected_" + itemId) != null) { // Only process if quantity is greater than 0 and selected
                        selectedItems.put(itemId, quantity);
                    }
                }
            }

            for (Map.Entry<Integer, Integer> entry : selectedItems.entrySet()) {
                int itemId = entry.getKey();
                int quantity = entry.getValue();
                
                // Fetch item details
                String fetchPriceQuery = "SELECT item_name, price FROM menu WHERE item_id = ?";
                ps = con.prepareStatement(fetchPriceQuery);
                ps.setInt(1, itemId);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String itemName = rs.getString("item_name");
                    double price = rs.getDouble("price");
                    double itemTotal = price * quantity;
                    totalAmount += itemTotal;

                    // Insert into order_items table
                    String insertOrderItemQuery = "INSERT INTO order_items (order_id, item_id, item_name, quantity, price, total_amount) VALUES (?, ?, ?, ?, ?, ?)";
                    ps = con.prepareStatement(insertOrderItemQuery);
                    ps.setInt(1, orderId);
                    ps.setInt(2, itemId);
                    ps.setString(3, itemName);
                    ps.setInt(4, quantity);
                    ps.setDouble(5, price);
                    ps.setDouble(6, itemTotal);
                    ps.executeUpdate();
                }
            }

            // Update total amount for the order
            String updateOrderQuery = "UPDATE orders SET total_amount = ? WHERE order_id = ?";
            ps = con.prepareStatement(updateOrderQuery);
            ps.setDouble(1, totalAmount);
            ps.setInt(2, orderId);
            ps.executeUpdate();

            // Redirect back to menu.jsp
            response.sendRedirect("menu.jsp");

        } catch (SQLException e) {
            out.println("SQL Error: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            out.println("Class Error: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
 
 
 
 
<%--  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Processing Cart - MyCafe</title>
</head>
<body>
    <% 
        String email = (String) session.getAttribute("aemail");
        int customerId = Integer.parseInt(request.getParameter("customer_id"));
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Statement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe", "root", "");

            // Check if there are any existing pending orders
            String fetchOrderQuery = "SELECT * FROM orders WHERE customer_id = ? AND status = 'Pending'";
            ps = con.prepareStatement(fetchOrderQuery);
            ps.setInt(1, customerId);
            rs = ps.executeQuery();

            int orderId = 0;
            boolean orderExists = false;
            if (rs.next()) {
                orderId = rs.getInt("order_id");
                orderExists = true;
            }

            if (!orderExists) {
                // Create a new order
                String insertOrderQuery = "INSERT INTO orders (customer_id, total_amount, status) VALUES (?, ?, 'Pending')";
                ps = con.prepareStatement(insertOrderQuery, Statement.RETURN_GENERATED_KEYS);
                ps.setInt(1, customerId);
                ps.setDouble(2, 0); // Total amount will be updated later
                ps.executeUpdate();

                // Retrieve the generated order ID
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    orderId = rs.getInt(1);
                }
            }

            // Add items to the order_items table
            double totalAmount = 0;
            Map<Integer, Integer> selectedItems = new HashMap<>();
            Enumeration<String> parameterNames = request.getParameterNames();
            while (parameterNames.hasMoreElements()) {
                String paramName = parameterNames.nextElement();
                if (paramName.startsWith("quantity_")) {
                    int itemId = Integer.parseInt(paramName.substring("quantity_".length()));
                    int quantity = Integer.parseInt(request.getParameter(paramName));
                    if (quantity > 0 && request.getParameter("selected_" + itemId) != null) {
                        selectedItems.put(itemId, quantity);
                    }
                }
            }

            for (Map.Entry<Integer, Integer> entry : selectedItems.entrySet()) {
                int itemId = entry.getKey();
                int quantity = entry.getValue();
                
                // Fetch item details
                String fetchPriceQuery = "SELECT item_name, price FROM menu WHERE item_id = ?";
                ps = con.prepareStatement(fetchPriceQuery);
                ps.setInt(1, itemId);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String itemName = rs.getString("item_name");
                    double price = rs.getDouble("price");
                    double itemTotal = price * quantity;
                    totalAmount += itemTotal;

                    // Insert into order_items table
                    String insertOrderItemQuery = "INSERT INTO order_items (order_id, item_id, item_name, quantity, price, total_amount) VALUES (?, ?, ?, ?, ?, ?)";
                    ps = con.prepareStatement(insertOrderItemQuery);
                    ps.setInt(1, orderId);
                    ps.setInt(2, itemId);
                    ps.setString(3, itemName);
                    ps.setInt(4, quantity);
                    ps.setDouble(5, price);
                    ps.setDouble(6, itemTotal);
                    ps.executeUpdate();
                }
            }

            // Update total amount for the order
            String updateOrderQuery = "UPDATE orders SET total_amount = ? WHERE order_id = ?";
            ps = con.prepareStatement(updateOrderQuery);
            ps.setDouble(1, totalAmount);
            ps.setInt(2, orderId);
            ps.executeUpdate();

            // Redirect back to menu.jsp
            response.sendRedirect("menu.jsp");

        } catch (SQLException e) {
            out.println("SQL Error: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            out.println("Class Error: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
  --%>