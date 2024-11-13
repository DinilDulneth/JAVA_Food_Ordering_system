<%@ page import="com.user.Admin" %>
<%@ page import="com.user.userDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #FFFCEF; /* Background color */
            margin: 0; /* Remove default margin */
            padding: 0; /* Remove default padding */
        }
        h2 {
            text-align: center;
            color: #000000; /* Heading color */
        }
        .container {
            width: 50%; /* Reduced width of the form container */
            margin: auto; /* Center the container */
            padding: 20px; /* Padding inside the container */
            background-color: #D9B29C; /* Form background color */
            border-radius: 15px; /* Rounded corners */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Shadow for depth */
            margin-bottom:20px;
        }
        form {
            display: flex;
            flex-direction: column; /* Stack input fields vertically */
        }
        input[type="text"], input[type="submit"] {
            padding: 8px; /* Padding for inputs */
            margin-bottom:13px; /* Reduced margin for spacing */
            border: 1px solid #D9B29C; /* Border color */
            border-radius: 5px; /* Rounded corners for inputs */
        }
        input[type="submit"] {
            background-color: #F1CF54; /* Submit button color */
            color: #000000; /* Text color */
            cursor: pointer; /* Pointer cursor on hover */
            transition:0.4s;
            width:40%;
            margin: 8px auto; 
        }
        input[type="submit"]:hover {
            background-color: #E54C44; /* Change button color on hover */
            color: #FFFCEF; /* Change text color on hover */
            
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

    <h2>Edit Admin Details</h2>

    <div class="container">
        <%
            String adminID = request.getParameter("adminID");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String telno = request.getParameter("telno");
        %>

        <form action="update" method="POST">
            Admin ID : <input type="text" name="adminID" value="<%=adminID%>" readonly>
            Admin name : <input type="text" name="name" value="<%=name%>" readonly>
            Admin email : <input type="text" name="email" value="<%=email%>" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}">
            	<span style="color:red;">*Valid email required</span><br>
            Admin password : <input type="text" name="password" value="<%=password%>" minlength="4">
            Admin first name : <input type="text" name="fname" value="<%=fname%>"  pattern="[a-zA-Z]+">
            Admin last name : <input type="text" name="lname" value="<%=lname%>" pattern="[a-zA-Z]+">
            Admin contact number : <input type="text" name="telno" value="<%=telno%>" pattern="\d{10}">
            <input type="submit" name="submit" value="Update my data"><br>
        </form>
    </div>

</body>
</html>
