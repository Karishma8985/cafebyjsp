<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Card Payment - MyCafe</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <%@ include file="commonpage.jsp" %>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Card Payment</h1>
        <% 
            String customerId = request.getParameter("customer_id");
            double grandTotal = Double.parseDouble(request.getParameter("grand_total"));
        %>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card p-4">
                    <div class="card-body bg-light">
                        <p><strong>Customer ID:</strong> <%= customerId %></p>
                        <p><strong>Grand Total:</strong> ₹<%= grandTotal %></p>

                        <!-- Form to process Card Payment -->
                        <form action="completepayment.jsp" method="post">
                            <input type="hidden" name="customer_id" value="<%= customerId %>">
                            <input type="hidden" name="grand_total" value="<%= grandTotal %>">
                            <input type="hidden" name="payment_method" value="Card Payment">
                            
                            <!-- Card Payment Details -->
                            <div class="form-group">
                                <label for="cardNumber">Card Number</label>
                                <input type="text" class="form-control" id="cardNumber" name="card_number" required>
                            </div>
                            <div class="form-group">
                                <label for="cardExpiry">Expiry Date</label>
                                <input type="text" class="form-control" id="cardExpiry" name="card_expiry" placeholder="MM/YY" required>
                            </div>
                            <div class="form-group">
                                <label for="cardCVC">CVC</label>
                                <input type="text" class="form-control" id="cardCVC" name="card_cvc" required>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Pay via Card</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
