<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

 <style>
        body {
            background-image: url('img/sback.jpg'); /* Replace with the path to your image */
            background-size: cover; /* Makes the image cover the entire background */
            background-position: center; /* Centers the image */
            background-repeat: no-repeat; /* Prevents the image from repeating */
		    font-family: 'Arial', sans-serif;
		    background-color: #f4f4f4;
		    margin: 0;
		    padding: 0;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    height: 100vh;
		}
		
		h2 {
		    text-align: center;
		    color: white;
		    font-size: 24px;
		    margin-bottom: 0px;
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
		
		
		/* Form Container */
		form {
		    background-color:black;
		    opacity:80%;
		    padding: 20px;
		    border-radius: 10px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		    width: 50%;
		    height: 80%;
		}
		
		table {
		    width: 100%;
		}
		
		td {
		    padding: 10px;
		}
		
		input[type="text"],
		input[type="email"],
		input[type="date"],
		textarea {
		    width: 100%;
		    padding: 7px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		    font-size: 13px;
		    margin-top: 5px;
		}
		
		textarea {
		    resize: none;
		}
		
		input[type="submit"] {
		    background-color: #28a745;
		    color: #fff;
		    border: none;
		    padding: 12px 20px;
		    border-radius: 5px;
		    cursor: pointer;
		    font-size: 16px;
		    width: 60%;
		    margin-right:100px;
		    margin-top: 15px;
		    transition: background-color 0.3s ease;
		}
		
		input[type="submit"]:hover {
		    background-color: #218838;
		}
		
		/* Form Labels */
		td:first-child {
		    font-weight: bold;
		    color: white;
		    text-align: right;
		    padding-right: 10px;
		}
		
		/* Responsive Design */
		@media screen and (max-width: 600px) {
		    form {
		        padding: 20px;
		    }
		
		    td:first-child {
		        text-align: left;
		        padding-right: 0;
		        display: block;
		    }
		
		    td {
		        display: block;
		        text-align: center;
		    }
		
		    input[type="submit"] {
		        margin-top: 20px;
		    }
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

	<form action="ContactInsertServlet" method="post" onsubmit="return validatePhone()">
	<h2> You Want Contact biteCloud ?</h2>
		<table>
			<tr>
				<td>Name :</td>
				<td><input type="text" name="name" required></td>
			</tr>
			<tr>
				<td>Email :</td>
				<td><input type="email" name="email" required></td>
			</tr>
			<tr>
				<td>Phone No :</td>
				<td>
					<input type="text" name="phone" required 
					pattern="[0-9]{10}" 
					title="Please enter a valid 10-digit phone number">
				</td>
			</tr>
			<tr>
				<td>Message :</td>
				<td>
					<textarea name="msg_text" rows="5" cols="30" required></textarea>
				</td>
			</tr>
			<tr>
				<td>Date :</td>
				<td><input type="date" name="date" required></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="SEND"></td>
			</tr>		
			
		</table>		
	</form>
	
	<script>
function validatePhone() {
    var phone = document.getElementsByName("phone")[0].value;
    var phonePattern = /^[0-9]{10}$/;

    if (!phonePattern.test(phone)) {
        alert("Please enter a valid 10-digit phone number.");
        return false;
    }
    return true;
}
</script>

</body>
</html>



