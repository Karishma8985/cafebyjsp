<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Menu - MyCafe</title>
    <style>
    body{
    	background-image: url('../img/cafe122.jpg');
    	background-repeat: no-repeat;
    	background-size: cover;
    }
        .menu-item {
            border-radius: 10px;
            overflow: hidden;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            padding: 15px;
            height: 200px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .menu-item img {
            width: 100px;
            height: 100px;
            object-fit: 120px;
        }
        .menu-item .details {
            flex: 1;
            margin-left: 15px;
        }
        .menu-item .details h6 {
            margin: 0;
            font-size: 1.2em;
            font-weight: 600;
            color: #333;
        }
        .menu-item .details .price {
            color: #FF9900;
            font-size: 1.2em;
            font-weight: 700;
        }
        .menu-item .details .description {
            color: #666;
            margin-bottom: 10px;
        }
        .quantity-input {
            width: 60px;
            margin-right: 10px;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            font-weight: 600;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
        .section-title {
            font-family: 'Nunito', sans-serif;
            font-size: 1.5em;
            color: #333;
        }
        .tab-content {
            padding: 20px 0;
        }
    </style>
</head>

<body>
    <%@ include file="commonpage.jsp" %>

    <%
        String email = (String) session.getAttribute("aemail");
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

                // Fetch menu items
                query = "SELECT * FROM menu";
                try (Statement stmt = con.createStatement();
                     ResultSet res = stmt.executeQuery(query)) {
    %>

    <!-- Menu Start -->
    <div class="container-xl-fluid py-5">
        <div class="container">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h5 class="section-title ff-secondary text-center text-primary fw-normal">Food Menu</h5>
                <h1 class="mb-5">Most Popular Items</h1>
            </div>
            <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane fade show p-0 active">
                        <form id="order-form" action="process_order.jsp" method="post">
                            <div class="row g-4">
                                <% while (res.next()) {
                                    int id = res.getInt("item_id");
                                    String itemName = res.getString("item_name");
                                    String description = res.getString("description");
                                    double itemPrice = res.getDouble("price");
                                    String filename = res.getString("image");
                                %>
                                <div class="col-md-6 mb-3">
                                    <div class="menu-item">
                                        <img class="img-fluid rounded" src="../<%= filename %>" alt="<%= itemName %>">
                                        <div class="details">
                                            <h6 class="d-flex justify-content-between border-bottom pb-2">
                                                <span><%= itemName %></span>
                                                <span class="price">₹<%= itemPrice %></span>
                                            </h6>
                                            <p class="description"><%= description %></p>
                                            <input type="number" name="quantity_<%= id %>" class="quantity-input" min="1" max="5" value="1">
                                            <input type="checkbox" name="selected_<%= id %>" value="<%= id %>"> Select
                                        </div>
                                    </div>
                                </div>
                                <% } %>
                            </div>
                            <input type="hidden" name="customer_id" value="<%= customerId %>">
                            <button type="submit" class="btn btn-primary mt-4">Add Selected Items to Cart</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Menu End -->

    <% 
                }
            }
        } catch (SQLException e) {
            out.println("SQL Error: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            out.println("Class Error: " + e.getMessage());
        }
    %>
    <%@ include file="footer.jsp" %>
</body>
</html>
