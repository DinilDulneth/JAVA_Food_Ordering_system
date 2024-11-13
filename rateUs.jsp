<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rate Us || RUKSHAN E A Y</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background: linear-gradient(to right, #e2e2e2, #c9d6ff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url('deleteimg/img1.jpg') no-repeat;
            background-size: cover;
            width: 100%;
            background: url('img/imgRateus1.jpg') no-repeat;
            background-size: cover;
            height: 100vh;
            width: 100%;
        }

        .profile-container {
            background-color: white;
            padding: 16px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 600px;
            opacity: 0.5;
        }

        .profile-container h1 {
            text-align: center;
            font-size: 26px;
            color: black;
            margin-bottom: 20px;
        }
        
        .cart-container {
		    position: fixed; /* Fixed position, if needed */
		    top: 20px; /* Adjust according to your design */
		    right: 20px; /* Adjust according to your design */
		    z-index: 1000; /* Ensure it appears above other elements */
		}
		
		.cart-button {
		    display: flex; /* Aligns items in a row */
		    align-items: center; /* Center vertically */
		    padding: 10px; /* Add padding for a button-like feel */
		    background-color: #f1f1f1; /* Light background */
		    border-radius: 5px; /* Rounded corners */
		    text-decoration: none; /* Remove underline */
		    color: #333; /* Text color */
		}
		
		.cart-button:hover {
		    background-color: #d9d9d9; /* Darker on hover */
		}
		
		.cart-button i {
		    margin-right: 5px; /* Space between icon and text */
		}
        

        .input-group {
            margin-bottom: 15px;
        }

        .input-group label {
            display: block;
            font-size: 14px;
            margin-bottom: 4px;
            color: black;
        }

        .input-group input,
        .input-group textarea {
            background-color: transparent;
            border: none;
            border-bottom: 4px solid black;
            margin: 1px 0;
            padding: 10px 15px;
            font-size: 14px;
            border-radius: 14px;
            width: 100%;
            outline: none;
            color: black;
        }

        .star-rating {
            display: flex;
            justify-content: center;
            margin-bottom: 15px;
        }

        .star {
            font-size: 30px;
            color: gray;
            cursor: pointer;
        }

        .star.selected {
            color: gold;
        }

        button {
            width: 100%;
            background-color: darkblue;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: darkcyan;
        }
    </style>
</head>
<body>

<div class="cart-container">
    <a href="homePage.jsp" class="cart-button">
        <i class="fas fa-home"></i>
        <span>Home</span>
    </a>
</div>

    <div class="profile-container">
        <h1>Rate Us</h1>
        <form id="rating-form" action="userRating" method="Post">
            <div class="input-group" >
                <label for="name" >Name:</label>
                <input type="text" id="rat-id" name="name" placeholder="Name" required>
            </div>
            <div class="input-group">
                <label for="email" ">Email:</label>
                <input type="email" id="email" name="email" placeholder="Email" required>
            </div>
            <div class="input-group">
                <label for="date" >Date:</label>
                <input type="date" id="date" name="date" required>
            </div>
            <h3>Rating Category : </h3><br>
            <h5>(1-2: Very Bad, Poor / 2-4: Bad, Below Average / 4-6: Average, Fair / 6-8: Good, Above Average / 8-10: Excellent, Outstanding)</h5><br>
            <div class="input-group" id="input-group">
                <label for="rate" >Rating Number:</label>
                <input type="number" id="Number" name="rate" min="1" max="10" step="1" placeholder="Enter a number (1-10)" required>
            </div>
            <div class="input-group">
                <label for="comment" >Comment:</label>
                <input type="text" id="comment" name="comment" placeholder="Leave a comment" maxlength="200">
            </div>
            <button type="submit">Submit Rating</button>
        </form>
    </div>

    
</body>
</html>
    