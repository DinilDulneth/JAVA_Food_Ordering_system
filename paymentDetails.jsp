<%@ page import="com.user.Payment" %>
<%@ page import="java.util.List" %>
<%@ page import="com.user.userDBUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> <!-- Font Awesome -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #FFFCEF; /* Light background color */
            margin: 0;
            padding: 20px;
        }
        .header {
            display: flex; /* Use flexbox for layout */
            justify-content: space-around; /* Space icons evenly */
            align-items: center; /* Center icons vertically */
            margin: 10px auto; /* Center the box horizontally and add space above/below */
            background-color: #000000; /* Black background */
            height: 60px; /* Fixed height */
            border-radius: 30px; /* Rounded corners */
            padding: 0 20px; /* Horizontal padding */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Optional shadow for depth */
            width: 75%; /* Width of the box */
        }
        .header-icons {
            display: flex; /* Use flexbox for layout */
            justify-content: space-around; /* Space icons evenly */
            align-items: center; /* Center icons vertically */
            margin: 10px auto; /* Center the box horizontally and add space above/below */
            background-color: #000000; /* Black background */
            height: 60px; /* Fixed height */
            border-radius: 30px; /* Rounded corners */
            padding: 0 20px; /* Horizontal padding */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Optional shadow for depth */
            width: 75%; /* Width of the box */
        }

        .header-icons a {
            color: #FFFCEF; /* Icon color */
            text-decoration: none; /* Remove underline */
            font-size: 24px; /* Size of the icons */
            transition: color 0.3s; /* Transition effect on hover */
        }

        .header-icons a:hover {
            color: #E54C44; /* Change color on hover */
        }
        h1 {
            color: #E54C44; /* Heading color */
            text-align: center; /* Center heading */
        }
        table {
            width: 100%; /* Full width */
            border-collapse: collapse; /* Merge borders */
            margin-top: 20px; /* Space above table */
            
        }
        th, td {
            padding: 6px; /* Cell padding */
            border: 1px solid #E54C44; /* Cell border color */
            text-align: left; /* Align text to the left */
            background-color: #FFFCEF; /* Cell background color */
        }
        th {
            background-color: #F1CF54; /* Header background */
            color: #000000; /* Header text color */
        }
        tr:hover {
            background-color: #D9B29C; /* Highlight row on hover */
        }
        .footer {
            text-align: center; /* Center footer text */
            margin-top: 20px; /* Space above footer */
        }
    </style>
</head>
<body>

    <div class="header-icons">
        <a href="AdminDashboard.jsp" title="Dashboard">
            <i class="fas fa-tachometer-alt"></i> <!-- Dashboard icon -->
        </a>
        <a href="homePage.jsp" title="Home">
            <i class="fas fa-home"></i> <!-- Home icon -->
        </a>
        <a href="javascript:history.back()" title="Back">
            <i class="fas fa-arrow-left"></i> <!-- Backward icon -->
        </a>
    </div>

    <h1>Payment Details</h1>

    <table>
        <thead>
            <tr>
                <th>Payment ID</th>
                <th>User ID</th>
                <th>Food ID</th>
                <th>Payment Method</th>
                <th>Date</th>
                <th>Food Name</th>
                <th>Price</th>
                <th>Seller Name</th>
                <th>Address</th>
                <th>Email</th>
                <th>Contact Number</th>
                <th>Shop Name</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Payment> paymentDetails = userDBUtil.getPaymentDetails();
                for (Payment payment : paymentDetails) {
            %>
                <tr>
                    <td><%= payment.getPaymentID() %></td>
                    <td><%= payment.getUserID() %></td>
                    <td><%= payment.getFoodID() %></td>
                    <td><%= payment.getPayment_method() %></td>
                    <td><%= payment.getDate() %></td>
                    <td><%= payment.getFood_name() %></td>
                    <td><%= payment.getPrice() %></td>
                    <td><%= payment.getSeller_name() %></td>
                    <td><%= payment.getAddress() %></td>
                    <td><%= payment.getEmail() %></td>
                    <td><%= payment.getContactNumber() %></td>
                    <td><%= payment.getShop_name() %></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

</body>
</html>
