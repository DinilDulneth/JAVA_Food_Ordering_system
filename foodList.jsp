<%@ page import="com.user.FoodModel" %>
<%@ page import="com.user.userDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Listing Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
            padding: 15px 30px;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            width: 100%;
            z-index: 1000;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
        }

        .left-section {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        
        .logo-container {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        header img {
            width: 70px;
            height: auto;
        }
        
        header h1 {
            margin: 0;
            color: yellow;
            font-size: 55px;
            white-space: nowrap;
        }

        .search-container {
            flex: 1;
            max-width: 500px;
            margin-left: 20px;
        }

        .search-container form {
            display: flex;
            align-items: center;
            gap: 10px;
            width: 100%;
        }

        .search_fucntion {
            flex: 1;
            padding: 10px 20px;
            border: none;
            border-radius: 30px;
            width: 100%;
        }

        .button-search {
            background: none;
            border: none;
            color: yellow;
            cursor: pointer;
            padding: 10px;
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

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 0 15px;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            margin: -15px;
        }

        .col-4 {
            flex: 0 0 33.333333%;
            max-width: 33.333333%;
            padding: 15px;
        }

        .food-item {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .food-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        }

        .food-card {
            position: relative;
            overflow: hidden;
            border-radius: 8px;
            margin-bottom: 15px;
        }

        .food-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
        }

        .food-name {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }

        .food-price {
            font-size: 18px;
            color: #E54C44;
            margin-bottom: 10px;
        }

        .food-description {
            font-size: 14px;
            color: #666;
            margin-bottom: 15px;
            flex-grow: 1;
        }

        .quantity-selector {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 15px;
        }

        .quantity-selector input[type="number"] {
            width: 70px;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-align: center;
        }

        .quantity-selector label {
            margin-bottom: 0;
            font-weight: bold;
            color: #333;
        }

        .total-price {
            font-size: 16px;
            font-weight: bold;
            color: #E54C44;
            margin-bottom: 15px;
        }

        .btn-success {
            background-color: #E54C44;
            border: none;
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-success:hover {
            background-color: #F1CF54;
            color: #000;
        }

        footer {
            background-color: rgb(26, 26, 26);
            color: white;
            text-align: center;
            padding: 20px;
            position: relative;
            bottom: 0;
            width: 100%;
            margin-top: 40px;
        }

        @media (max-width: 992px) {
            .col-4 {
                flex: 0 0 50%;
                max-width: 50%;
            }
            
            header {
                padding: 15px;
            }
            
            header h1 {
                font-size: 40px;
            }
        }

        @media (max-width: 768px) {
            .col-4 {
                flex: 0 0 100%;
                max-width: 100%;
            }
            
            header {
                flex-direction: column;
                padding: 10px;
                gap: 10px;
            }
            
            .left-section {
                width: 100%;
                flex-direction: column;
                align-items: center;
            }

            .search-container {
                margin-left: 0;
                max-width: 100%;
                width: 100%;
            }

            .cart-container {
                margin-left: 0;
                width: 100%;
            }

            .cart-button {
                width: 100%;
                justify-content: center;
            }
            
            header h1 {
                font-size: 32px;
            }
        }
    </style>
    <script>
        function updateTotal(foodId) {
            const quantity = document.getElementById('quantity_' + foodId).value;
            const price = document.getElementById('price_' + foodId).value;
            const total = (quantity * price).toFixed(2);
            document.getElementById('total_' + foodId).textContent = 'Total: Rs. ' + total;
        }
    </script>
</head>
<body>

<header>
    <div class="left-section">
        <div class="logo-container">
            <img src="img/logoNew.png" alt="Logo" />
            <h1>biteCloud</h1>
        </div>
        <div class="search-container">
            <form action="search" method="POST">
                <input class="search_fucntion" type="text" name="food" placeholder="Search for food...">
                <button type="submit" name="submit" class="button-search">
                    <i class="fas fa-search"></i>
                </button>
            </form>
        </div>
    </div>
    <div class="cart-container">
        <a href="homePage.jsp" class="cart-button">
            <i class="fas fa-home"></i>
            <span>Home</span>
        </a>
    </div>
    <div class="cart-container">
        <a href="foodCart.jsp" class="cart-button">
            <i class="fas fa-shopping-cart"></i>
            <span>Cart</span><span class="badge badge-danger">${cart_list.size()}</span>
        </a>
    </div>
</header>

<div class="container">
    <div class="row">
        <% 
        	String shopname = request.getParameter("shop");
            String sellerId = request.getParameter("sellerId");
            if (sellerId != null) {
                List<FoodModel> foodList = userDBUtil.getFoodDetails(sellerId);
                if (foodList != null && !foodList.isEmpty()) {
                    for (FoodModel food : foodList) {
        %>
        <div class="col-4">
            <div class="food-item">
                <div class="food-card">
                    <img src="img/food.jpg" alt="Food Image">
                </div>
                <div class="food-name"><%= food.getfName() %></div>
                <div class="food-price">Rs. <%= food.getPrice() %></div>
                <div class="food-description"><%= food.getDescription() %></div>
                <a href="AddToCart?id=<%= food.getFoodId() %>&sellerId=<%= sellerId %>" class="btn btn-success">Add to cart</a>
            </div>
        </div>
        <% 
                    }
                } else {
        %>
        <div class="col-12">
            <p>No food items found for this seller.</p>
        </div>
        <% 
                }
            } else {
        %>
        <div class="col-12">
            <p>Invalid seller ID.</p>
        </div>
        <% 
            }
        %>
    </div>
</div>

<footer>
    <p>&copy; 2024 biteCloud. All rights reserved.</p>
</footer>

</body>
</html>