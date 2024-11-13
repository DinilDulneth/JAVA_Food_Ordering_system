<%@ page import="com.user.Seller" %>
<%@ page import="com.user.userDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
    <title>Seller Details</title>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #FFFCEF; 
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #000000;
            text-align: center;
        }
        .header-icons {
            display: flex; 
            justify-content: space-around;
            align-items: center; 
            background-color: #000000; 
            height: 60px; 
            border-radius: 30px; 
            padding: 0 20px; 
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px; 
            width:75%;
            margin: 10px auto;
        }
        .header-icons a {
            color: #FFFCEF; 
            text-decoration: none; 
            transition: color 0.3s; 
            display: flex; 
            align-items: center; 
            flex-direction: column;
        }
        .header-icons a img {
            width: 30px; 
            height: 30px; 
            margin-bottom: 5px; 
        }
        .header-icons a:hover {
            color: #E54C44; 
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center; 
            margin-top: 20px;
        }
        .seller-box {
            background-color: #D9B29C; 
            border-radius: 10px; /* Rounded corners */
            padding: 15px; /* Padding inside the box */
            margin: 10px; /* Spacing between boxes */
            width: 300px; /* Increased width for boxes */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Shadow for depth */
            transition: background-color 0.3s, transform 0.3s; /* Smooth transition for hover effects */
            text-align: center; /* Center text in boxes */
        }
        .seller-box:hover {
            background-color: #F1CF54; /* Change color on hover */
            transform: translateY(-5px); /* Slight lift effect on hover */
        }
        .seller-box input[type="button"] {
            background-color: #E54C44; /* Button color */
            color: #FFFCEF; /* Button text color */
            border: none; /* No border */
            padding: 10px 15px; /* Padding inside button */
            cursor: pointer; /* Pointer cursor on hover */
            transition: background-color 0.3s; /* Transition effect */
            width: 100%; /* Full width button */
            border-radius: 5px; /* Rounded corners */
        }
        .seller-box input[type="button"]:hover {
            background-color: #C44C38; /* Darker color on button hover */
        }
        .seller-icon img {
            width: 50px; /* Larger icon for sellers */
            height: 50px; /* Larger icon for sellers */
            margin-bottom: 10px; /* Space below the icon */
        }
         h1 {
            color: #000000; /* Dark text color */
            text-align: center; /* Center the title */
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

<h1>Seller Details</h1>

<%
    String status = request.getParameter("status");
    if ("deleted".equals(status)) {
%>
    <script>
        alert("Seller account has been successfully deleted!");
    </script>
<%
    }
%>

<div class="container">
    <%
        List<Seller> cusDetails = userDBUtil.getSellerDetails();
        for (Seller seller : cusDetails) {	
    %>		
    		<c:set var="sellerID" value="<%= seller.getSellerID() %>"/>
			<c:set var="sellerName" value="<%= seller.getSeller_name() %>"/>
			<c:set var="sellerAddress" value="<%= seller.getAddress() %>"/>
			<c:set var="sellerEmail" value="<%= seller.getEmail() %>"/>
			<c:set var="sellerPassword" value="<%= seller.getPassword() %>"/>
			<c:set var="sellerContactNumber" value="<%= seller.getContactNumber() %>"/>
			<c:set var="shopName" value="<%= seller.getShop_name() %>"/>
    
    
        <div class="seller-box">
            <div class="seller-icon">
                <i class="fa-solid fa-shop" style="margin-right: 8px; color: #000000; font-size: 36px; "></i>
            </div>
            <p><strong>Seller ID:</strong> <%= seller.getSellerID() %></p>
            <p><strong>Seller Name:</strong> <%= seller.getSeller_name() %></p>
            <p><strong>Seller Address:</strong> <%= seller.getAddress() %></p>
            <p><strong>Seller Email:</strong> <%= seller.getEmail() %></p>
            <p><strong>Seller Contact Number:</strong> <%= seller.getContactNumber() %></p>
            <p><strong>Shop Name:</strong> <%= seller.getShop_name() %></p>

            <c:url value="deleteSellerAcc.jsp" var="sellerDelete">
                <c:param name="sellerID" value="<%= String.valueOf(seller.getSellerID()) %>"/>
                <c:param name="sellerName" value="<%= seller.getSeller_name() %>"/>
                <c:param name="email" value="<%= seller.getEmail() %>"/>
                <c:param name="contactNumber" value="<%= seller.getContactNumber() %>"/>
                <c:param name="shopName" value="<%= seller.getShop_name() %>"/>
            </c:url>
            <a href="${sellerDelete}">
                <input type="button" name="delete" value="Delete the account!"><br><br>
            </a>
            
            <c:url value="adminChatBox.jsp" var="adminmsg">
                <c:param name="sellerID" value="<%= String.valueOf(seller.getSellerID()) %>"/>
                <c:param name="sellerName" value="<%= seller.getSeller_name() %>"/>
                <c:param name="email" value="<%= seller.getEmail() %>"/>
                <c:param name="contactNumber" value="<%= seller.getContactNumber() %>"/>
                <c:param name="shopName" value="<%= seller.getShop_name() %>"/>
            </c:url>
            <a href="${adminmsg}">
			    <input type="button" name="send" value="ChatBox" 
			           style="background-color: #0056b3 ; color: #FFFCEF; 
			           			width:140px;
			                  border: none; padding: 10px; 
			                  font-size: 16px; border-radius: 50px; 
			                  cursor: pointer; box-shadow: 0 4px 6px rgba(0,0,0,0.2); 
			                  transition: background-color 0.3s;">
			</a>
            
        </div>
    <%
        }
    %>
</div>

</body>
</html>
