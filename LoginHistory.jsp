<%@ page import="com.user.LoginHistory" %>
<%@ page import="com.user.userDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Login Details</title>
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
            width: 95%; /* Full width */
            border-collapse: collapse; /* Merge borders */
            margin-top: 20px; /* Space above table */
            margin-left: 40px;
        }
        th, td {
            padding: 8px; /* Cell padding */
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

    <h1>User Login Details</h1>

    <table>
        <thead>
            <tr>
                <th>Login ID</th>
                <th>User ID</th>
                <th>Login Date</th>
                <th>IP Address</th>
                <th>Device Information</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<LoginHistory> cusDetails = userDBUtil.getLoginHistory();
                for (LoginHistory lh : cusDetails) {
            %>
                <tr>
                    <td><%= lh.getLoginID() %></td>
                    <td><%= lh.getUserID() %></td>
                    <td><%= lh.getDate() %></td>
                    <td><%= lh.getIp_address() %></td>
                    <td><%= lh.getDevise_info() %></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

</body>
</html>
