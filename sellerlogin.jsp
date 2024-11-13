<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Seller Login Page</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style type="text/css">
    body {
        font-family: 'Poppins', sans-serif;
        background-image: url('img/loginBack.jpg');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .login-container {
        background-color: rgba(0, 0, 0, 0.8);
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.1);
    }

    h1 {
        text-align: center;
        color: #FFD700;
        margin-bottom: 30px;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 2px;
    }

    .form-label {
        color: #FFD700;
        font-weight: 500;
        margin-bottom: 8px;
    }

    .form-control {
        background-color: rgba(255, 255, 255, 0.1);
        border: none;
        border-bottom: 2px solid #FF0000;
        border-radius: 0;
        color: #ffffff;
        padding: 12px;
        margin-bottom: 20px;
        transition: all 0.3s ease;
    }

    /* Remove white background from autocomplete */
    input:-webkit-autofill,
    input:-webkit-autofill:hover,
    input:-webkit-autofill:focus,
    input:-webkit-autofill:active {
        -webkit-box-shadow: 0 0 0 30px rgba(0, 0, 0, 0.8) inset !important;
        -webkit-text-fill-color: #ffffff !important;
        transition: background-color 5000s ease-in-out 0s;
    }

    .form-control:focus {
        background-color: rgba(255, 255, 255, 0.15);
        box-shadow: none;
        border-bottom-color: #32CD32;
        color: #ffffff;
    }

    .form-control::placeholder {
        color: rgba(255, 255, 255, 0.5);
    }

    .btn-custom {
        background-color: #930000;
        border: none;
        color: white;
        padding: 12px;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 1px;
        transition: all 0.3s ease;
    }

    .btn-custom:hover {
        background-color: #32CD32;
        transform: translateY(-2px);
    }

    @media (max-width: 768px) {
        .login-container {
            margin: 20px;
            padding: 30px;
        }
    }

    /* Animation for form elements */
    .form-control, .btn-custom {
        animation: fadeIn 0.5s ease-in-out;
    }

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

    /* Add hover effect for form container */
    .login-container:hover {
        box-shadow: 0 12px 40px rgba(0, 0, 0, 0.4);
        transition: box-shadow 0.3s ease;
    }

    /* Style for error messages */
    .error-message {
        color: #FF0000;
        background-color: rgba(255, 0, 0, 0.1);
        padding: 10px;
        border-radius: 5px;
        margin-bottom: 20px;
        text-align: center;
    }
</style>
</head>
<body>

<div class="login-container col-md-4 col-10">
    <h1>Seller Login</h1>

    <form action="login" method="post">
        <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
        </div>
        
        <p style="color:white; ">Don't have an account? <a href="SellerSignup.jsp">Sign Up</a></p><br>
        
        <div class="d-grid">
            <button type="submit" class="btn btn-custom btn-block">Login</button>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script>
    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
    <% if (errorMessage != null) { %>
        // Create error message div
        const errorDiv = document.createElement('div');
        errorDiv.className = 'error-message';
        errorDiv.textContent = "<%= errorMessage %>";
        
        // Insert error message before the form
        const form = document.querySelector('form');
        form.parentNode.insertBefore(errorDiv, form);
        
        // Remove error message after 5 seconds
        setTimeout(() => {
            errorDiv.remove();
        }, 5000);
    <% } %>
</script>

</body>
</html>