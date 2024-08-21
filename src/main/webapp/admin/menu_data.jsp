<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MyCafe - Menu Data</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
    <style>
       
        .container {
            margin-top: 30px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            color: lightpink;
        }
        .card-header {
            background-color: #e9ddef;
            color: #495057;
            border-bottom: 2px solid #dee2e6;
            font-weight: bold;
            font-size: 1.25rem;
        }
        .menu-item {
            border: 1px solid #dee2e6;
            border-radius: 8px;
            overflow: hidden;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            display: flex;
            align-items: center;
            padding: 10px;
            gap: 10px;
            height: 175px;
        }
        .menu-item img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
        }
        .details {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 100%; 
        }
        .details h6 {
            font-size: 1.1rem;
            margin-bottom: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .details .price {
            font-weight: bold;
        }
        .details small {
            color: #6c757d;
        }
        .button-group {
            display: flex;
            gap: 5px; 
        }
        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
            color: #212529;
        }
        .btn-warning:hover {
            background-color: #e0a800;
            border-color: #d39e00;
        }
        .btn-danger, .btn-primary {
            border-radius: 20px;
            padding: 0.25rem 0.5rem; 
            font-size: 0.75rem; 
        }
        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }
        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
    </style>
</head>
<body>
    <%@ include file="commonpage.jsp"%>
    <%
    try {
        // Load the JDBC driver and establish a connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe", "root", "");
        s = con.createStatement();
        ResultSet res = s.executeQuery("SELECT * FROM menu");
    %>
    <div class="container">
        <div class="row mb-3">
            <div class="col-md-12 text-right">
                <a href="add.html" class="btn btn-warning mb-3">Add Item</a>
            </div>
        </div>
        <div class="tab-content">
            <div id="tab-1" class="tab-pane fade show p-0 active">
                <div class="row g-4">
                    <% while (res.next()) { 
                        int id = res.getInt("item_id");
                        String itemName = res.getString("item_name");
                        String description = res.getString("description");
                        int itemPrice = res.getInt("price");
                        String filename = res.getString("image");
                    %>
                    <div class="col-md-6 mb-3">
                        <div class="menu-item">
                            <img src="../<%= filename %>" alt="Item Image">
                            <div class="details">
                                <h6>
                                    <span><%= itemName %></span>
                                    <span class="price">₹<%= itemPrice %></span>
                                </h6>
                                <small><%= description %></small>
                                <div class="button-group mt-auto">
                                    <a href="menu_delete.jsp?id=<%= id %>" class="btn btn-danger btn-sm">Delete</a>
                               
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
    <%
    } catch (Exception e) {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database operation failed");
    } 
    %>
</body>
</html>
