<%@ page import="com.user.User" %>
<%@ page import="com.user.userDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #FFFCEF; /* Light background color */
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #000000; /* Dark text color */
            text-align: center; /* Center the title */
        }
        h2 {
            color: #000000; /* Dark text color */
            text-align: center; /* Center the title */
        }
        .header-icons {
            display: flex; /* Use flexbox for layout */
            justify-content: space-around; /* Space icons evenly */
            align-items: center; /* Center icons vertically */
            background-color: #000000; /* Black background */
            height: 60px; /* Fixed height */
            border-radius: 30px; /* Rounded corners */
            padding: 0 20px; /* Horizontal padding */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Optional shadow for depth */
            margin-bottom: 20px; /* Space below the header */
            width: 75%;
            margin: 10px auto;
        }
        .header-icons a {
            color: #FFFCEF; /* Icon color */
            text-decoration: none; /* Remove underline */
            transition: color 0.3s; /* Transition effect on hover */
            display: flex; /* Align items */
            align-items: center; /* Center icons vertically */
            flex-direction: column; /* Stack icon above text */
        }
        .header-icons a img {
            width: 30px; /* Default icon size */
            height: 30px; /* Default icon height */
            margin-bottom: 5px; /* Space between icon and text */
        }
        .header-icons a:hover {
            color: #E54C44; /* Change color on hover */
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center; /* Center horizontally */
            margin-top: 20px;
        }
        .user-card {
            background-color: #D9B29C; /* Card color */
            border-radius: 10px; /* Rounded corners */
            padding: 15px; /* Padding inside the box */
            margin: 10px; /* Spacing between boxes */
            width: 300px; /* Increased width for boxes */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Shadow for depth */
            transition: background-color 0.3s, transform 0.3s; /* Smooth transition for hover effects */
            text-align: center; /* Center text in boxes */
        }
        .user-card:hover {
            background-color: #F1CF54; /* Change color on hover */
            transform: translateY(-5px); /* Slight lift effect on hover */
        }
        .delete-button {
            background-color: #E54C44; /* Button color */
            color: #FFFCEF; /* Button text color */
            border: none; /* No border */
            padding: 10px 15px; /* Padding inside button */
            cursor: pointer; /* Pointer cursor on hover */
            transition: background-color 0.3s; /* Transition effect */
            width: 100%; /* Full width button */
            border-radius: 5px; /* Rounded corners */
        }
        .delete-button:hover {
            background-color: #C44C38; /* Darker color on button hover */
        }
        .icon {
            color: #E54C44; /* Icon color */
            margin-right: 5px;
        }
    </style>
</head>
<body>

<div class="header-icons">
    <a href="AdminDashboard.jsp">
       <i class="fas fa-tachometer-alt" style=" font-size: 26px; "></i>
    </a>
    <a href="homePage.jsp">
        <i class="fas fa-home" style=" font-size: 26px; "></i>
    </a>
    <a href="javascript:history.back()" title="Back">
        <i class="fas fa-arrow-left" style=" font-size: 26px; "></i>
    </a>
</div>

<h1>User Details</h1>

<%
    String status = request.getParameter("status");
    if ("deleted".equals(status)) {
%>
    <script>
        alert("User account has been successfully deleted!");
    </script>
<%
    }
%>

<div class="container">
<%
    List<User> cusDetails = userDBUtil.getUserDetails();
    for (User user : cusDetails) {
%>

		<c:set var="uID" value="<%= user.getID() %>"/>
	    <c:set var="fname" value="<%= user.getF_name() %>"/>
	    <c:set var="lname" value="<%= user.getL_name() %>"/>
	    <c:set var="uname" value="<%= user.getUserName() %>"/>
	    <c:set var="password" value="<%= user.getPassword() %>"/>
	    <c:set var="email" value="<%= user.getEmail() %>"/>
	    <c:set var="contactNumber" value="<%= user.getContactNumber() %>"/>
	    <c:set var="address" value="<%= user.getAddress() %>"/>
    

    <div class="user-card">
        <h3><i class="fas fa-user icon" style="margin-right: 8px; color: #000000; font-size: 36px; "></i></h3>
        <p><strong>User ID: </strong><%= user.getID() %></p>
        <p><strong>First Name:</strong> <%= user.getF_name() %></p>
        <p><strong>Last Name:</strong> <%= user.getL_name() %></p>
        <p><strong>User Name:</strong> <%= user.getUserName() %></p>
        <p><strong>Password:</strong> <%= user.getPassword() %></p> 
        <p><strong>Email:</strong> <%= user.getEmail() %></p>
        <p><strong>Contact Number:</strong> <%= user.getContactNumber() %></p>
        <p><strong>Address:</strong> <%= user.getAddress() %></p>
        
        <c:url value="deleteUserAcc.jsp" var="userDelete">
            <c:param name="uID" value="<%= String.valueOf(user.getID()) %>"/>
            <c:param name="fname" value="<%= user.getF_name() %>"/>
            <c:param name="lname" value="<%= user.getL_name() %>"/>
            <c:param name="uname" value="<%= user.getUserName() %>"/>
            <c:param name="password" value="<%= user.getPassword() %>"/>
            <c:param name="email" value="<%= user.getEmail() %>"/>
            <c:param name="contactNumber" value="<%= user.getContactNumber() %>"/>
            <c:param name="address" value="<%= user.getAddress() %>"/>
        </c:url>
        
        <a href="${userDelete}">
            <button class="delete-button">Delete the account!</button>
        </a>
    </div>
<%
    }
%>
</div>

</body>
</html>
