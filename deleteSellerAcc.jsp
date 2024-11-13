<%@ page import="com.user.Admin" %>
<%@ page import="com.user.userDBUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Seller</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> <!-- Link to Font Awesome -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #FFFCEF; /* Light background color */
            margin: 0;
            padding: 20px;
        }
        .header-icons {
            display: flex; /* Use flexbox for layout */
            justify-content: space-around; /* Space icons evenly */
            align-items: center; /* Center icons vertically */
            margin: 20px auto; /* Center the box horizontally and add space above/below */
            background-color: #000000; /* Black background */
            height: 60px; /* Fixed height */
            border-radius: 30px; /* Rounded corners */
            padding: 0 20px; /* Horizontal padding */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Shadow for depth */
            width: 75%; /* Width of the box */
        }
        .header-icons a {
            color: #FFFCEF; /* Icon color */
            text-decoration: none; /* Remove underline */
            font-size: 24px; /* Size of the icons */
            transition: color 0.3s; /* Transition effect on hover */
        }
        .header-icons a:hover {
            color: #F1CF54; /* Change color on hover */
        }
        h2 {
            color: #000000; /* Dark text color */
            text-align: center; /* Center the title */
        }
        .form-container {
		    max-width: 700px; /* Max width for the form */
		    margin: 0 auto; /* Center the form */
		    padding: 20px;
		    border: 1px solid #D9B29C; /* Border color */
		    border-radius: 10px; /* Rounded corners */
		    background-color: #D9B29C; /* Form background color */
		    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2); /* Subtle shadow */
		}
		
		.form-container input[type="text"] ,input[type="submit"] {
		    width: 96%; /* Width for input fields */
		    padding: 10px; /* Padding inside input */
		    margin-bottom: 10px; /* Space between inputs */
		    border: 1px solid #D9B29C; /* Border color */
		    border-radius: 5px; /* Rounded corners */
		}
		
		/* Center the submit button */
		.form-container input[type="submit"] {
		    background-color: #F1CF54; /* Submit button color */
		    color: #000000; /* Text color */
		    cursor: pointer; /* Pointer cursor on hover */
		    transition: 0.4s; /* Transition effect */
		    width: 40%; /* Width of the submit button */
		    margin: 20px auto; /* Center the button horizontally */
		    display: block; /* Block display to ensure centering */
		}
		
		.form-container input[type="submit"]:hover {
		    background-color: #E54C44; /* Change button color on hover */
		    color: #FFFCEF; /* Change text color on hover */
		}

    </style>
</head>
<body>

    <div class="header-icons">
        <a href="AdminDashboard.jsp" title="Dashboard">
            <i class="fas fa-tachometer-alt"></i> <!-- Dashboard icon -->
        </a>
        <a href="Home.jsp" title="Home">
            <i class="fas fa-home"></i> <!-- Home icon -->
        </a>
        <a href="javascript:history.back()" title="Back">
            <i class="fas fa-arrow-left"></i> <!-- Backward icon -->
        </a>
    </div>

    <h2>Delete Seller Account</h2>

    <%
        String sellerID = request.getParameter("sellerID");
        String sellerName = request.getParameter("sellerName");
        String email = request.getParameter("email");
        String contactNumber = request.getParameter("contactNumber");
        String shopName = request.getParameter("shopName");
    %>

    <div class="form-container">
        <form action="deleteSeller" method="POST">
            Seller ID: <input type="text" name="sellerID" value="<%= sellerID %>" readonly><br>
            Seller Name: <input type="text" name="sellerName" value="<%= sellerName %>" readonly><br>
            Email: <input type="text" name="email" value="<%= email %>" readonly><br>
            Contact Number: <input type="text" name="contactNumber" value="<%= contactNumber %>" readonly><br>
            Shop Name: <input type="text" name="shopName" value="<%= shopName %>" readonly><br>
            
            <input type="submit" name="submit" value="Delete this Account"><br>
        </form>
    </div>

</body>
</html>
