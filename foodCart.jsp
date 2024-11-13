<%@ page import="java.util.List" %>
<%@ page import="com.user.FoodModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.user.foodCart" %>
<%@ page import="com.user.userDBUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%
		String shopname = request.getParameter("shop");
		ArrayList<foodCart> cart_list = (ArrayList<foodCart>) session.getAttribute("cart_list");
		List<foodCart> cartFoods = null;
		double totalPrice = 0.0;
		
		if(cart_list != null) {
		    cartFoods = userDBUtil.getCartProducts(cart_list);
		    request.setAttribute("cart_list", cart_list);
		    totalPrice = userDBUtil.getTotalPrice(cart_list);
		    request.setAttribute("totalPrice", totalPrice);
		}
	%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style type="text/css">
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
        .cart-container {
            margin-left: 20px;
        }
        .cart-button {
            background: none;
            border: 2px solid yellow;
            color: yellow;
            padding: 8px 20px;
            border-radius: 30px;
            display: flex;
            align-items: center;
            gap: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 16px;
            text-decoration: none;
        }
        .cart-button:hover {
            background-color: yellow;
            color: rgb(26, 26, 26);
            text-decoration: none;
        }
        .cart-button i {
            font-size: 18px;
        }
        .table thead {
            background-color: #F1CF54;
        }
        .table td, .table th {
            text-align: center;
            vertical-align: middle;
        }
        .table td form {
            display: inline-block;
            margin: 0;
        }
        .btn-incre, .btn-decre {
            background-color: #E54C44;
            color: white;
            border-radius: 5px;
            margin: 0 5px;
        }
        .btn-incre:hover, .btn-decre:hover {
            background-color: #F1CF54;
            color: black;
        }
        .btn-danger:hover {
            background-color: #E54C44;
            color: white;
        }
        .cart-summary {
            margin-top: 30px;
            text-align: right;
        }
        .total-price {
            font-size: 24px;
            font-weight: bold;
            color: #E54C44;
        }
        .checkout-btn {
            background-color: #28a745;
            color: #000;
            border-radius: 30px;
            padding: 10px 30px;
            font-size: 18px;
            cursor: pointer;
            border: none;
            transition: background-color 0.3s ease;
        }
        .checkout-btn:hover {
            background-color: #F1CF54;
            color: black;
        }
    </style>
</head>
<body>

<header>
    <div class="menu-icon" onclick="toggleMenu()">
        <i class="fas fa-bars"></i>
    </div>
    <img src="img/logoNew.png" alt="Logo" />
    <h1>biteCloud</h1>

    <form action="search" method="POST" style="display: flex; align-items: center;">
        <input class="search_fucntion" type="text" name="food" placeholder="Search for food..." style="padding: 10px; border:none; border-radius: 30px; margin-right: 10px;height:27px;">
        <button type="submit" name="submit" class="button-search">
            <i class="fas fa-search"></i>
        </button>
        <div class="cart-container">
            <a href="homePage.jsp" class="cart-button">
                <i class="fas fa-home"></i>
                <span>Home</span>
            </a>
        </div>
    </form>
</header>

<div class="container mt-5">
    <h1 class="mb-4">Your Cart</h1>
    <table class="table table-hover table-bordered">
        <thead class="thead-light">
            <tr>
                <th>Food Name</th>
                <!-- <th>Description</th> -->
                <th>Price</th>
                <th>Quantity</th>
                <th>Remove/pay</th>
            </tr>
        </thead>
        <tbody>
            <% if(cartFoods != null) {
                for(foodCart item: cartFoods) { %>
                    <tr>
                        <td><%= item.getfName() %></td>
                       <%--  <td><%= item.getDescription() %></td> --%>
                        <td>$<%= item.getPrice() %></td>
                        <td>
                            <form action="" method="post" class="form-inline">
                                <input type="hidden" name="id" value="<%= item.getFoodId() %>" class="form-inline">
                                <div class="form-group d-flex justify-content-between">
                                    <a class="btn btn-sm btn-decre" href="IncDecQuantity?action=dec&id=<%= item.getFoodId() %>"><i class="fas fa-minus-square"></i></a>
                                    <input type="text" name="quantity" class="form-control text-center" value="<%= item.getQuantity() %>" readonly style="width: 50px; min=1">
									<a class="btn btn-sm btn-incre" href="IncDecQuantity?action=inc&id=<%= item.getFoodId() %>"><i class="fas fa-plus-square"></i></a>
                                
                                	<input type="hidden" name="sellerid" value="<%=item.getSellerID()%>">
		    						<input type="hidden" name="foodID" value="<%=item.getFoodId()%>"><br>
                                	<input type="hidden" name="foodname" value="<%=item.getfName() %>" readonly>
                                	<input type="hidden" name="price" value="<%=item.getPrice() %>" readonly>
                                	
                                </div>
                            </form>
                        </td>
                        <td><a href="removeFromCart?id=<%= item.getFoodId() %>" class="btn btn-danger">Remove</a>
                        	<div class="cart-summary">
						        
						        <c:url value="payment.jsp" var="payfood">
						        
							            <c:param name="foodname" value="<%= item.getfName()%>"/>
							            <c:param name="price" value="<%=String.valueOf(item.getPrice())%>"/>
							            <c:param name="quantity" value="<%=String.valueOf(item.getQuantity())%>"/>
							            <c:param name="sellerID" value="<%=String.valueOf(item.getSellerID()) %>"/>
							            <c:param name="fID" value="<%= String.valueOf(item.getFoodId())%>"/>
						        
						        </c:url>
						        
						        <a href="${payfood}" class="checkout-btn">buy</a>
						        <% } 
                					} %>
						        
						    </div>
                        </td>
                    </tr>
                
        </tbody>
    </table>
    <p class="total-price">Total Price: $<%= totalPrice %></p>

    
</div>

<script>
    function toggleMenu() {
        const menu = document.getElementById('slideMenu');
        menu.classList.toggle('active');
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
	    <% }%>
	</script>

</body>
</html>