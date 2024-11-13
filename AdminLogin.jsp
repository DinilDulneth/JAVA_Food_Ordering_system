<%@ page import="com.user.Seller" %> 
<%@ page import="com.user.Foods" %> 
<%@ page import="com.user.userDBUtil" %> 
<%@ page import="java.util.List" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>biteCloud - Admin Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
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

        .login-container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 400px;
            margin: 100px auto;
            text-align: center;
        }

        .login-container h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 28px;
        }

        .login-container label {
            font-size: 16px;
            color: #666;
            display: block;
            margin-bottom: 8px;
            text-align: left;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 90%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        .login-container input[type="submit"] {
            background-color: #e54c44;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        .login-container input[type="submit"]:hover {
            background-color: #f1cf54;
            color: #333;
        }

        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 20px;
        }

        footer {
            text-align: center;
            padding: 10px;
            background-color: #f1cf54;
            width: 100%;
            position: fixed;
            bottom: 0;
            left: 0;
        }

        /* Menu and other styling if needed */
    </style>
    <script>
        function showError(errorMessage) {
            if (errorMessage) {
                alert(errorMessage);
            }
        }
    </script>
</head>

<body>

    <header>
        <img src="img/logoNew.png" alt="Logo" />
        <h1>biteCloud</h1>
    </header>

    <div class="login-container">
        <h2>Admin Login</h2>
        <form action="logAdmin" method="POST">
            <label for="name">Username:</label>
            <input type="text" name="name" id="name" pattern="[a-zA-Z]+" required /><br />
            
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" maxlength="50" minlength="3" required /><br />
            
            <input type="submit" name="submit" value="Log In" /><br />
        </form>

        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            <div class="error-message"><%= errorMessage %></div>
            <script>
                showError("<%= errorMessage %>");
            </script>
        <%
            }
        %>
    </div>

    <footer>
        <p>&copy; 2024 biteCloud. All rights reserved.</p>
    </footer>

</body>
</html>
