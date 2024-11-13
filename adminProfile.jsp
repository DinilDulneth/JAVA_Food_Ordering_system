<%@ page import="com.user.Admin" %>
<%@ page import="com.user.userDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #FFFCEF; /* Background color */
            color: #000000; /* Text color */
            margin: 0;
            padding: 20px;
        }

        h1 {
            color: #E54C44; /* Heading color */
            text-align: center; /* Center heading */
        }

        .admin-details {
            display: flex; /* Use flexbox for horizontal alignment */
            flex-wrap: wrap; /* Allow items to wrap */
            gap: 20px; /* Space between boxes */
            justify-content: flex-start; /* Align boxes to the left */
            padding: 20px;
        }

        .admin-card {
            background-color: #D9B29C; /* Card background color */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 20px;
            width: 300px; /* Card width */
            text-align: left; /* Left align text */
            transition: transform 0.3s;
        }

        .admin-card:hover {
            transform: translateY(-5px); /* Hover effect */
        }

        .admin-card h3 {
            margin: 0;
            color: #E54C44   ; /* Card title color */
        }

        .admin-card p {
            margin: 5px 0;
            color: #000000; /* Text color */
        }

        .admin-card a {
            display: inline-block;
            margin-top: 10px;
            background-color: #F1CF54; /* Button color */
            color: #000000;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
            font-size: 16px; /* Button text size */
        }

        .admin-card a:hover {
            background-color: #E54C44; /* Button hover color */
        }

        .icon {
            font-size: 40px;
            color: #000000; /* Icon color */
        }

        .update-icon {
            margin-right: 5px; /* Spacing between icon and text */
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

    </style>
    <script>
        function showAlert(message) {
            alert(message);
        }
    </script>
</head>
<body>
<!-- Header icons for Dashboard, Home, and Backward -->
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
	
	<h1>Admin Details</h1>
	
	<c:if test="${not empty updateMessage}">
	    <script>
	        showAlert('${updateMessage}');
	    </script>
	</c:if>
	
	<div class="admin-details">
	<%
		HttpSession session2 = request.getSession();  
		String adminName = (String) session2.getAttribute("adminName");
		String adminPassword = (String) session2.getAttribute("adminPassword");

   		if (adminName == null || adminPassword == null) {
   		    out.println("No user logged in.");
   		} else {
   		    List<Admin> adDetails = userDBUtil.AdminValidation(adminName, adminPassword);

   		    for (Admin adm : adDetails) {    
	%>        
			<c:set var="adminID" value="<%= adm.getID() %>"/>
		    <c:set var="name" value="<%= adm.getAdmin_name() %>"/>
		    <c:set var="email" value="<%= adm.getEmail() %>"/>
		    <c:set var="password" value="<%= adm.getPassword() %>"/>
		    <c:set var="fname" value="<%= adm.getF_name() %>"/>
		    <c:set var="lname" value="<%= adm.getL_name() %>"/>
		    <c:set var="telno" value="<%= adm.getContactNumber() %>"/>
		        
	    <div class="admin-card">
	        <div class="icon">
	            <i class="fas fa-user-shield"></i> <!-- Admin icon -->
	        </div>
	        <h3><%= adm.getAdmin_name() %></h3>
	        <p><strong>ID:</strong> <%= adm.getID() %></p>
	        <p><strong>Email:</strong> <%= adm.getEmail() %></p>
	        <p><strong>First Name:</strong> <%= adm.getF_name() %></p>
	        <p><strong>Last Name:</strong> <%= adm.getL_name() %></p>
	        <p><strong>Contact No:</strong> <%= adm.getContactNumber() %></p>
	
	        <c:url value="EditAdminDetails.jsp" var="adUpdate">
	            <c:param name="adminID" value="<%= String.valueOf(adm.getID()) %>"/>
	            <c:param name="name" value="<%= adm.getAdmin_name() %>"/>
	            <c:param name="email" value="<%= adm.getEmail() %>"/>
	            <c:param name="password" value="<%= adm.getPassword() %>"/>
	            <c:param name="fname" value="<%= adm.getF_name() %>"/>
	            <c:param name="lname" value="<%= adm.getL_name() %>"/>
	            <c:param name="telno" value="<%= adm.getContactNumber() %>"/>
	        </c:url>
	
	        <a href="${adUpdate}">
	            <i class="fas fa-edit update-icon"></i> <!-- Update icon -->
	            Update
	        </a>
	    </div>
	    
	<%  
   		    }
	    }
	%>
	</div>
	<hr>
	<h2>Other Admin details</h2>
		<div class="admin-details">
				<%
		   		    List<Admin> adDetails = userDBUtil.getAdminDetails();
		   		    for (Admin ad : adDetails) {
		   		    	if (ad.getAdmin_name().equals(adminName) && ad.getPassword().equals(adminPassword)) {
		   		            continue;
		   		    	}
				%> 	
					<div class="admin-card">
				        <div class="icon">
				            <i class="fas fa-user-shield"></i> <!-- Admin icon -->
				        </div>
					        <h3><%= ad.getAdmin_name() %></h3>
					        <p><strong>ID:</strong> <%= ad.getID() %></p>
					        <p><strong>Email:</strong> <%= ad.getEmail() %></p>
					        <p><strong>First Name:</strong> <%= ad.getF_name() %></p>
					        <p><strong>Last Name:</strong> <%= ad.getL_name() %></p>
					        <p><strong>Contact No:</strong> <%= ad.getContactNumber() %></p>
			        
		       		</div>
		       		<br>
		        <%
		   		    }
				%>
			</div>

</body>
</html>
