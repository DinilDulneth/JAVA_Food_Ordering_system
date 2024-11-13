<%@ page import="com.user.Seller" %>
<%@ page import="com.user.Foods" %>
<%@ page import="com.user.User" %>
<%@ page import="com.user.userDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>biteCloud - Food Ordering System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background-color: #FFFCEF;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            color: #000000;
            overflow-x: hidden;
            padding-top: 80px;
        }
        header {
		    background-color: rgb(26, 26, 26);
		    padding: 20px;
		    display: grid;
		    align-items: center; /* Center items vertically */
		    gap: 10px; /* Add space between items */
		    grid-template-columns: 230px 64px 500px 400px; 
		    position:fixed;
		    top: 0; /* Stick to the top */
		    left: 0; /* Stick to the left */
		    right: 0; /* Stick to the right */
		    width: 100%; /* Cover full width */
		    z-index: 1000; /* Ensure it is above other content */
		}
		
		header img {
		    width: 70px;
		    margin-right: 10px; /* Add a little margin on the right side of the logo */
		}
		
		header h1 {
		    margin: 0;
		    color: yellow;
		    font-size: 55px;
		}
		.search_fucntion{
			right:0;
			display: grid; /* Ensure flexbox layout */
            align-items: center; /* Center items vertically */
            margin-left: auto; /* Push search container to the right */
		}
        
        .menu-icon {
		    cursor: pointer; /* Change cursor to pointer */
		    font-size: 25px; /* Increase icon size */
		    color: #E54C44; /* Default color */
		}
		
		.menu-icon:hover {
		    color: yellow; /* Change color on hover */
		}
        .slide-menu {
            position: fixed;
            top: 0;
            padding-top:20px;
            left: -300px; /* Hide menu initially */
            width: 300px;
            height: 100%;
            background-color: rgb(26,26,26);
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.5);
            transition: left 0.3s ease; /* Slide effect */
            z-index: 1000; /* Ensure it's above other content */
        }
        
        .slide-menu .menu-item {
		    padding: 15px;
		    font-size: 20px; /* Increase font size for menu items */
		}
		
		.slide-menu a { /* Assuming menu items are anchor tags */
		    padding: 15px;
		    font-size: 20px; /* Increase font size for menu items */
		    display: block; /* Ensure each link takes the full width */
		    color: #E54C44 ; /* Text color for menu items */
		    text-decoration: none; /* Remove underline */
		}
		
		.slide-menu a:hover {
		    background-color: rgb(46,46,46); /* Lighter hover background color */
		    color:#F1CF54 ;
		}
		
		
        .slide-menu.active {
            left: 0; /* Show menu when active */
        }
        .slide-menu .close-icon {
            font-size: 29px;
            cursor: pointer;
            color:#E54C44 ; /* Close icon color */
            padding: 30px; /* Space around the icon */
        }
        .close-icon:hover{ /* Lighter hover background color */
		    color:#F1CF54 ;
        
        }
        .slide-menu ul {
            list-style: none;
            padding: 0;
        }
        .slide-menu ul li {
            padding: 15px;
            border-bottom: 1px solid #D9B29C; /* Separator line */
        }
        .slide-menu ul li a {
            text-decoration: none; /* Remove underline from links */
            color: #000; /* Link color */
            display: flex; /* Align icon and text */
            align-items: center; /* Center the icon and text */
        }
        .slide-menu ul li a:hover {
            background-color: rgba(255, 255, 255, 0.2); /* Background change on hover */
        }
        .slide-menu ul li i {
            margin-right: 10px; /* Space between icon and text */
        }
        input[type="text"] {
            padding: 10px;
            width: 350px;
            border: none;
            border-radius: 30px;
        }
        input[type="submit"] {
            background-color: #E54C44;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #F1CF54;
            color: #000;
        }
        h2 {
            color: #E54C44;
        }
        .container {
            max-width: auto;
            margin: 15px auto;
            padding: 20px;
        }
        .food-container {
            display: grid; 
            grid-template-columns: repeat(4, 1fr); 
            gap: 18px; /* Space between grid items */
        }
        .seller-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr); 
            gap: 10px; 
            max-width: 950px;
        }
        .food {
            border: none;
            border-radius: 30px;
            padding: 13px;
            background-color: #FFFFFF;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: left;
            transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth transitions */
            display: flex;
            flex-direction: column; /* Stack items vertically */
            align-items: flex-start; /* Align items to the left */
            height: 175px;
            width: 260px;
            line-height: 1; 
        }  
        .seller {
            border: none;
            border-radius: 30px;
            padding: 12px;
            background-color: #FFFFFF;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: left;
            transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth transitions */
            display: flex;
            flex-direction: column; /* Stack items vertically */
            align-items: flex-start; /* Align items to the left */
            height: 85px;
            width: 250px;
            line-height: 1.1;
            flex-direction:row;
        }
        .food:hover, .seller:hover {
            transform: scale(1.05); /* Scale effect on hover */
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2); /* Increased shadow for depth */
        }
        .food h4, .food p {
            margin: 1px 0;
            line-height: 1; /* Smaller line height */
            transition: color 0.3s ease; /* Smooth color transition */
        }
        .food_image img{
		    width:260px;
		    height: 100px; /* Set the height (adjust based on your needs) */
		    object-fit: cover; /* Maintain aspect ratio while covering the entire area */
		    border-radius: 30px; /* Optional: Add rounded corners to match design */
		}
		.seller_image img{
			width:105px;
		    height: 88px; /* Set the height (adjust based on your needs) */
		    object-fit: cover; /* Maintain aspect ratio while covering the entire area */
		    border-radius: 30px;
		}
		.seller_details{
			margin-left:6px;
			margin-top:4px;
		}
        .food-name {
            font-size: 20px;
        }
        .food-description {
            font-size: 13px;
            color: gray;
        }
        .food h4:hover, .food:hover .food-name, .food:hover .food-price {
            color: #F1CF54; /* Change color on hover */
        }
        .food-price:hover {
            color: #F1CF54; /* Change price color on hover */
        }
        .food-shop {
            margin: 2px 0;
            font-size: 13px;
        }
        .seller h4, .seller p {
            margin: 2px 0;
            line-height: 1; /* Smaller line height */
            transition: color 0.3s ease; /* Smooth color transition */
        }
        .seller:hover h4 {
            color: #E54C44; /* Change color on hover */
        }
        .seller p i {
            color: #E54C44;
        }
        .shop_address {
            font-size: 13px;
            color: gray;
        }
        .shop_num {
            font-size: 13px;
            color: gray;
        }
        .horizontal-line {
            border-top: 2px solid #D9B29C;
            margin: 40px 0;
        }
        footer {
            text-align: center;
            padding: 10px;
            background-color: #F1CF54;
            width: 100%;
        }
        .fa-search {
		    color: #E54C44; 
		    background-color: rgb(26,26,26); 
		    transition: color 0.3s ease;
		    font-size:27px;
		}
		
		.fa-search:hover {
		    color: yellow; 
		}
		.button-search{
			background-color: rgb(26,26,26); 
			border:none;
		}
		a {
	      color: inherit;
	      text-decoration: none;
	    }
	    a:hover {
	      color: #E54C44; /* Optional hover color */
	      text-decoration: none; /* Optional underline on hover */
	    }
		
    </style>
</head>
<body>

<header>
	<div class="menu-icon" onclick="toggleMenu()">
        <i class="fas fa-bars"></i> <!-- Menu icon -->
    </div>
    <img src="img/logoNew.png" alt="Logo" />
    <h1>biteCloud</h1>
    
    <form action="search" method="POST" style="display: flex; align-items: center;">
        <input class="search_fucntion" type="text" name="food" placeholder="Search for food..." style="padding: 10px; border:none; border-radius: 30px; margin-right: 10px;height:27px;" minlength="1" maxlength="50" pattern="[A-Za-z\s]+" required>
        <button type="submit" name="submit" class="button-search">
            <i class="fas fa-search"></i> <!-- Search icon -->
        </button>
    </form>
</header>

<!-- Slide Menu -->
	<div class="slide-menu" id="slideMenu">
	    <span class="close-icon" onclick="toggleMenu()">
	        <i class="fas fa-times"></i> <!-- Close icon -->
	    </span>	
            <a href="useraccount.jsp">
            	<i class="fas fa-user"></i> 
            		Profile
            </a>
	        <a href="foodCart.jsp"><i class="fas fa-shopping-cart"></i> cart</a>
	       	<a href="aboutUs.jsp"><i class="fas fa-info-circle"></i> About Us</a>
	        <a href="ContactUs.jsp"><i class="fas fa-phone"></i> Contact</a>
	        <a href="rateUs.jsp"><i class="fas fa-star"></i> Rate Us</a>
	</div>
  </head>
  <body>
	<div class="container">
	    <div class="food-container">
	    
	        <%
	            List<Foods> foodDetails = userDBUtil.getFoodDetails();
	            int foodCount = 0;
	            for (Foods fd : foodDetails) {    
	                if (foodCount >= 10) break;  // Limiting to 10 items
	                foodCount++;    
	        %>
	        
	        <c:url value="paymentFood.jsp" var="adfoodUpdate">
		            <c:param name="foodname" value="<%= String.valueOf(fd.getFood_name()) %>"/>
		            <c:param name="price" value="<%= fd.getPrice() %>"/>
		            <c:param name="des" value="<%= fd.getDescription() %>"/>
		            <c:param name="shopId" value="<%=String.valueOf(fd.getShopId()) %>"/>
		            <c:param name="fID" value="<%= String.valueOf(fd.getFoodID()) %>"/>
	        </c:url>
	        
	        <a href="${adfoodUpdate}">
	            <div class="food">
	                <div class="food_image"><img src="img/food.jpg"></div>
	                <h4 class="food-name"><%= fd.getFood_name() %></h4>
	                <p class="food-price">Rs. <%= fd.getPrice() %></p> 
	                <p class="food-shop">from <%= fd.getShop_name() %></p> 
	                <p class="food-description"><%= fd.getDescription() %></p>
	            </div>
	        </a>
	        <%
	            }
	        %>
	    </div>
	
	    <div class="horizontal-line"></div>
	
	    <h2>Shops</h2>
	    <div class="seller-container">
	        <%
	            List<Seller> cusDetails = userDBUtil.getSellerDetails();
	            int sellerCount = 0;
	            for (Seller seller : cusDetails) {    
	                if (sellerCount >= 10) break;  // Limiting to 10 items
	                sellerCount++;
	        %>
	        
	        <c:url value="foodList.jsp" var="adUpdate">
		            <c:param name="sellerId" value="<%= String.valueOf(seller.getSellerID()) %>"/>
		            <c:param name="shop" value="<%= seller.getShop_name() %>"/>
		            <c:param name="address" value="<%= seller.getAddress() %>"/>
		           
	        </c:url>
	        
	        <a href="${adUpdate}">
	        
	            <div class="seller">
	            	<div class="seller_image"> <img src="img/shop.jpg"></div>
	               <div class="seller_details"><h4><%= seller.getShop_name() %></h4> <!-- Bold shop name -->
	                <p class="shop_address"><%= seller.getAddress() %></p>
	                <p class="shop_num"><i class="fas fa-phone"></i> <%= seller.getContactNumber() %></p>
	 				</div>
	 			</div>	
	        </a>
	 			
	        <%
	            }
	        %>
	        
	        <!-- from dinil--------------------------------------------------- -->
	    	<%
	    		String name = request.getParameter("name");
	    	
			    List<User> usersDetails = userDBUtil.getUser(name);
			    for (User uv : usersDetails) {    
			    	
			    	HttpSession session1 = request.getSession();
		            session1.setAttribute("uID", uv.getID());
			    }
			%>
			<!---------------------------------------------------------------------------->
	        
	    </div>
	</div>
	
	<footer>
	    <p>&copy; 2024 biteCloud. All rights reserved.</p>
	</footer>
	
	<script>
			// Menu toggle functionality
			function toggleMenu() {
			    const menu = document.getElementById('slideMenu');
			    const body = document.body; // Reference to the body or main content
			
			    menu.classList.toggle('active'); // Toggle the active class to show/hide the menu
			}
	</script>
	<% 
	    String message = (String) request.getAttribute("message");
	    String error = (String) request.getAttribute("error");
	%>
	
	<script>
	    <% if (message != null) { %>
	        alert("<%= message %>");
	    <% } else if (error != null) { %>
	        alert("<%= error %>");
	    <% } %>
	</script>

</body>
</html>
