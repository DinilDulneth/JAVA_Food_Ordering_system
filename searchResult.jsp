<%@ page import="com.user.Seller" %> 
<%@ page import="com.user.Foods" %>
<%@ page import="com.user.User" %>
<%@page import="com.user.userDBUtil" %>
<%@ page import="java.util.List" %> <%@
page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <title>biteCloud - Food Ordering System</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <style>
      body {
        background-color: #fffcef;
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
      input[type="submit"] {
        background-color: #e54c44;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 30px;
        cursor: pointer;
        transition: background-color 0.3s ease;
      }
      input[type="submit"]:hover {
        background-color: #f1cf54;
        color: #000;
      }
      h2 {
        color: #e54c44;
      }
      .horizontal-line {
        border-top: 2px solid #d9b29c;
        margin: 40px 0;
      }
      footer {
        text-align: center;
        padding: 10px;
        background-color: #f1cf54;
        width: 100%;
      }
      .fa-search {
        color: #e54c44;
        background-color: rgb(26, 26, 26);
        transition: color 0.3s ease;
        font-size: 27px;
      }

      .fa-search:hover {
        color: yellow;
      }
      .button-search {
        background-color: rgb(26, 26, 26);
        border: none;
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
      
      .food_image img{
		    width:260px;
		    height: 100px; /* Set the height (adjust based on your needs) */
		    object-fit: cover; /* Maintain aspect ratio while covering the entire area */
		    border-radius: 30px; /* Optional: Add rounded corners to match design */
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
        .content{
        	margin:30px 30px 30px 50px;
        	padding:10px;
        }
      
    </style>
  </head>
  <body>
    <header>
      <div class="menu-icon" onclick="toggleMenu()">
        <i class="fas fa-bars"></i>
        <!-- Menu icon -->
      </div>
      <img src="img/logoNew.png" alt="Logo" />
      <h1>biteCloud</h1>

      <form
        action="search"
        method="POST"
        style="display: flex; align-items: center"
      >
        <input
          class="search_fucntion"
          type="text"
          name="food"
          placeholder="Search for food..."
          style="
            padding: 10px;
            border: none;
            border-radius: 30px;
            margin-right: 10px;
            height: 27px;
          "
          required
        />
        <button type="submit" name="submit" class="button-search">
          <i class="fas fa-search"></i>
          <!-- Search icon -->
        </button>
      </form>
    </header>

    <!-- Slide Menu -->
    <div class="slide-menu" id="slideMenu">
      <span class="close-icon" onclick="toggleMenu()">
        <i class="fas fa-times"></i>
        <!-- Close icon -->
      </span>
      <a href="homePage.jsp"><i class="fas fa-home"></i> Home</a>
      
      <!-- from Dinil--------------------------------------------------- -->
	    	<%
	    		String name = request.getParameter("name");
	    	
			    List<User> usersDetails = userDBUtil.getUser(name);
			    for (User uv : usersDetails) {    
			%>
	            
	            <c:set var="id" value="<%= uv.getID() %>"/>
	            <c:set var="fname" value="<%= uv.getF_name() %>"/>
	            <c:set var="lname" value="<%= uv.getL_name() %>"/>
	            <c:set var="username" value="<%= uv.getUserName() %>"/>
	            <c:set var="password" value="<%= uv.getPassword() %>"/>
	            <c:set var="email" value="<%= uv.getEmail() %>"/>
	            <c:set var="contact" value="<%= uv.getContactNumber() %>"/>
	            <c:set var="address" value="<%= uv.getAddress() %>"/>
	            
	            <c:url value="useraccount.jsp" var="userAcc">
	            	<c:param name="id" value="<%= String.valueOf(uv.getID()) %>"/>
	            	<c:param name="fname" value="<%= uv.getF_name() %>"/>
	            	<c:param name="lname" value="<%= uv.getL_name() %>"/>
	            	<c:param name="username" value="<%= uv.getUserName() %>"/>
	            	<c:param name="password" value="<%= uv.getPassword() %>"/>
	            	<c:param name="email" value="<%= uv.getEmail() %>"/>
	            	<c:param name="contact" value="<%= uv.getContactNumber() %>"/>
	            	<c:param name="address" value="<%= uv.getAddress() %>"/>
	            </c:url>
            
            <a href="${userAcc}">
            	<i class="fas fa-user"></i> 
            		Profile
            </a>
            
            <%
			    }
			%>
          <!---------------------------------------------------------------------------->
            
      
      		<a href="foodCart.jsp"><i class="fas fa-shopping-cart"></i> cart</a>
	       	<a href="aboutUs.jsp"><i class="fas fa-info-circle"></i> About Us</a>
	        <a href="ContactUs.jsp"><i class="fas fa-phone"></i> Contact</a>
	        <a href="rateUs.jsp"><i class="fas fa-star"></i> Rate Us</a>
    </div>

	<div class="content">
	<!-- page content -->
    <h2>Search Results:</h2>
   
	<c:forEach var="food" items="${foodDetails}">
	
	<div class="food">
        <div class="food_image"><img src="img/food.jpg"></div>
	    <h4 class="food-name"> ${food.food_name}</h4>
	    <p class="food-price">Rs. ${food.price}</p>
	    <p class="food-description">${food.description} </p>
	    <p class="food-shop">from ${food.shop_name}</p>
	</div>
	    <hr>
	 
	</c:forEach>
	</div>
	
	
	<%-- <%
		List<Foods> foodDetails = userDBUtil.search(food);
	    for (Foods fd : foodDetails){		
	%>		
			<p>Food Name = <%= fd.getFood_name() %></p>
			<p>Food description = <%= fd.getDescription() %></p>
			<p>Food price = <%= fd.getPrice() %></p>
			<p>Shop name = <%= fd.getShop_name() %></p><br>	
			
	<%		
		}
	%> --%>
	
	
	<c:if test="${empty foodDetails}">
	    <p>No food items found !</p>
	</c:if>
	<!-- page content -->

    <footer>
      <p>&copy; 2024 biteCloud. All rights reserved.</p>
    </footer>

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
