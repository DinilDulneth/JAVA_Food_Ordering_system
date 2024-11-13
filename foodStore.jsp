<%@ page import="com.user.FoodModel" %>
<%@ page import="com.user.userDBUtil" %>
<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Food Store</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <style>
        body {
            background-image: url('img/back.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-repeat: no-repeat;
            font-family: 'Poppins', sans-serif;
            color: #333;
            margin-top:140px;
        }

		
		header {
	        background-color: rgb(26, 26, 26);
	        padding: 20px;
	        display: grid;
	        align-items: center;
	        gap: 10px;
	        grid-template-columns: 230px 64px 500px 400px;
	        position: fixed;
	        top: 0;
	        left: 0;
	        right: 0;
	        width: 100%;
	        z-index: 1000;
	      }
	
	      header img {
	        width: 70px;
	        margin-right: 10px;
	      }
	
	      header h1 {
	        margin: 0;
	        color: yellow;
	        font-size: 55px;
	      }
	      .search_fucntion {
	        right: 0;
	        display: grid;
	        align-items: center;
	        margin-left: auto;
	      }
	
	      .menu-icon {
	        cursor: pointer;
	        font-size: 25px;
	        color: #e54c44;
	      }
	
	      .menu-icon:hover {
	        color: yellow;
	      }
	      .slide-menu {
	        position: fixed;
	        top: 0;
	        padding-top: 20px;
	        left: -300px;
	        width: 300px;
	        height: 100%;
	        background-color: rgb(26, 26, 26);
	        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.5);
	        transition: left 0.3s ease;
	        z-index: 1000;
	      }
	
	      .slide-menu .menu-item {
	        padding: 15px;
	        font-size: 20px;
	      }
	
	      .slide-menu a {
	        padding: 15px;
	        font-size: 20px;
	        display: block;
	        color: #e54c44;
	        text-decoration: none;
	      }
	
	      .slide-menu a:hover {
	        background-color: rgb(46, 46, 46);
	        color: #f1cf54;
	      }
	
	      .slide-menu.active {
	        left: 0;
	      }
	      .slide-menu .close-icon {
	        font-size: 29px;
	        cursor: pointer;
	        color: #e54c44;
	        padding: 30px;
	      }
	      .close-icon:hover {
	        color: #f1cf54;
	      }
	      .slide-menu ul {
	        list-style: none;
	        padding: 0;
	      }
	      .slide-menu ul li {
	        padding: 15px;
	        border-bottom: 1px solid #d9b29c;
	      }
	      .slide-menu ul li a {
	        text-decoration: none;
	        color: #000;
	        display: flex;
	        align-items: center;
	      }
	      .slide-menu ul li a:hover {
	        background-color: rgba(255, 255, 255, 0.2);
	      }
	      .slide-menu ul li i {
	        margin-right: 10px;
	      }
	      input[type="text"] {
	        padding: 10px;
	        width: 350px;
	        border: none;
	        border-radius: 30px;
	        height: 100px;
	      }

        .container {
            background-color: rgba(0, 0, 0, 0.5);
            border-radius: 15px;
            padding: 25px;
            margin-top: 60px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
        }

        h1 {
            color: #FFD700;
            font-weight: 600;
            letter-spacing: 2px;
            margin-bottom: 25px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .btn-primary {
            background-color: #FF0000;
            border: none;
            padding: 10px 20px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            margin-bottom: 30px;
        }

        .btn-primary:hover {
            background-color: #32CD32;
            transform: translateY(-2px);
        }

        .card {
            background-color: rgba(255, 255, 255, 0.9);
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            max-width: 300px;
            min-width:250px;
            margin: 0px auto;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-img-top {
            height: 160px;
            object-fit: cover;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .card-body {
            padding: 15px;
            line-height: 1.3;
        }

        .card-title {
            color: #000;
            font-weight: 600;
            font-size: 1.1rem;
            margin-bottom: 8px;
        }

        .card-text {
            margin-bottom: 6px;
            font-size: 0.9rem;
        }

        .btn-warning {
            background-color: #FFD700;
            border: none;
            color: #000;
            transition: all 0.3s ease;
        }

        .btn-warning:hover {
            background-color: #FFC107;
            transform: translateY(-2px);
        }

        .btn-danger {
            background-color: #FF0000;
            border: none;
            transition: all 0.3s ease;
        }

        .btn-danger:hover {
            background-color: #DC3545;
            transform: translateY(-2px);
        }

        .alert-warning {
            background-color: rgba(255, 215, 0, 0.2);
            border: 1px solid #FFD700;
            color: #FFD700;
        }

        /* Decorative elements */
        .container::before {
            content: '';
            position: absolute;
            top: -5px;
            left: -5px;
            right: -5px;
            bottom: -5px;
            border: 2px solid #FFD700;
            border-radius: 17px;
            pointer-events: none;
            opacity: 0.3;
        }

        .card::after {
            content: '';
            position: absolute;
            bottom: -3px;
            left: 50%;
            transform: translateX(-50%);
            width: 90%;
            height: 3px;
            background: linear-gradient(to right, #FF0000, #FFD700, #32CD32);
            border-radius: 3px;
        }

        /* Grid improvements */
        .row {
            margin-right: -10px;
            margin-left: -10px;
        }

        .col-md-4 {
            padding: 10px;
        }

        /* Animation for cards */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .card {
            animation: fadeIn 0.5s ease-out;
        }
    </style>
</head>
<body>

		<%
	   		HttpSession session4 = request.getSession();  
			Integer sellerIDInt = (Integer) session4.getAttribute("sellerID");
			String sellerID = String.valueOf(sellerIDInt);
			
			String sellern = (String) session4.getAttribute("sellername");
		%>

	<header>
      <div class="menu-icon" onclick="toggleMenu()">
        <i class="fas fa-bars"></i>
        <!-- Menu icon -->
      </div>
      <img src="img/logoNew.png" alt="Logo" />
      <h1>biteCloud</h1>
    </header>

    <!-- Slide Menu -->
    <div class="slide-menu" id="slideMenu">
      <span class="close-icon" onclick="toggleMenu()">
        <i class="fas fa-times"></i>
        <!-- Close icon -->
      </span>
      <a href="getOrders?sellerid=<%= sellerID %>"><i class="fas fa-box"></i> Orders</a>
      <a href="about.jsp"><i class="fas fa-info-circle"></i> About Us</a>
      <a href="sellerChatBox.jsp"><i class="fas fa-comments"></i>Chat With Admin</a>
    </div>
    
	<div class="container mt-4">
    <h1 class="mb-4">Welcome, <c:out value="<%=sellern%>" /></h1>
    <a href="addFood.jsp" class="btn btn-primary mb-4">Add Food Item</a>
    <a href="sellerChatBox.jsp" class="btn btn-primary mb-4" style="background-color:blue;">
    <i class="fas fa-comments" style="margin-right: 8px;"></i>
	    Chat with Admin
	</a>

    <div class="row">
        <% 
        if (sellerID == null) {
            out.println("No user logged in.");
        } else {
            List<FoodModel> fDetails = userDBUtil.getFoodDetails(sellerID);
            for (FoodModel fd : fDetails) {    
        %>
        <div class="col-md-4 mb-3 d-flex align-items-stretch">
            <div class="card">
                <img src="img/burger_.jpeg" class="card-img-top">
                <div class="card-body">
                    <h5 class="card-title"><%=fd.getfName() %></h5>
                    <p class="card-text"><strong>Rs. <%=fd.getPrice() %></strong></p>
                    <p class="card-text"><%=fd.getDescription() %></p>
                    <p class="card-text"><small>Category: <%=fd.getCategory() %></small></p>

                    <c:url value="EditFood.jsp" var="edit_food">
                        <c:param name="id" value="<%=String.valueOf(fd.getFoodId())%>" />
                        <c:param name="name" value="<%=fd.getfName()%>" />
                        <c:param name="price" value="<%=String.valueOf(fd.getPrice())%>" />
                        <c:param name="description" value="<%=fd.getDescription()%>" />
                        <c:param name="category" value="<%=fd.getCategory()%>" />
                        <c:param name="img" value="<%=fd.getFoodPic()%>" />
                    </c:url>

                    <c:url value="deleteFood.jsp" var="del_food">
                        <c:param name="id" value="<%=String.valueOf(fd.getFoodId())%>" />
                        <c:param name="name" value="<%=fd.getfName()%>" />
                        <c:param name="price" value="<%=String.valueOf(fd.getPrice())%>" />
                        <c:param name="description" value="<%=fd.getDescription()%>" />
                        <c:param name="category" value="<%=fd.getCategory()%>" />
                        <c:param name="img" value="<%=fd.getFoodPic()%>" />
                    </c:url>

                    <div class="mt-2">
                        <a href="${edit_food}" class="btn btn-warning btn-sm me-2">Edit</a>
                        <a href="${del_food}" class="btn btn-danger btn-sm">Delete</a>
                    </div>
                </div>
            </div>
        </div>
        <% } } %>
    </div>
</div>

		

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
      function toggleMenu() {
        const menu = document.getElementById("slideMenu");
        const body = document.body; // Reference to the body or main content

        menu.classList.toggle("active"); // Toggle the active class to show/hide the menu
        //container.classList.toggle('blur');
      }
    </script>
</body>
</html>