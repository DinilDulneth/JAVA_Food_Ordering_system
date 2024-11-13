<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Page</title>
    <link rel="stylesheet" href="homeMain.css"> <!-- Link to external CSS file -->
    <style>
        body {
            background-image: url('img/neww.jpg');
            background-size: cover; 
            background-repeat: no-repeat;
            background-position: center;
        }
        
        * {
		    margin: 0;
		    padding: 0;
		    box-sizing: border-box;
			}
			
			/* Body styling with background color */
			body {
			    font-family: Arial, sans-serif;
			    background-color: #f1cf54; /* Set background color for the entire page */
			    margin: 0;
			    padding: 0;
			}
			
			h3{
				
			    font-size: 3.0rem;
			    color: #ffffff;
			}
			
			/* Header styling */
			header {
			    background-color: #ff6600;
			    padding: 30px;
			    text-align: center;
			    color: white;
			    font-size: 24px;
			    position: relative;
			}
			
			/* Navbar link styling */
			.navbar-right {
			    position: absolute;
			    top: 15px;
			    right: 20px;
			}
			
			.navbar-right a {
			    color: white;
			    text-decoration: none;
			    font-size: 18px;
			    padding: 8px 12px;
			    border: 2px solid white;
			    border-radius: 5px;
			    transition: background-color 0.3s ease;
			}
			
			.navbar-right a:hover {
			    background-color: white;
			    color: #ff6600;
			}
			
			/* Center container for logo and text */
			.center-container {
			    display: flex;
			    justify-content: center;  /* Center the whole container */
			    align-items: center;  /* Vertically align items */
			    margin:20px 0 20px 0;  /* Adjust the margin for more or less space above/below the logo and text */
			}
			
			.logo-text-container {
			    display: flex;
			    align-items: center;  /* Vertically align the text and logo */
			}
			
			.logo-text {
			    font-size: 90px;
			    font-weight: bold;
			    background: linear-gradient(90deg, #f1cf54,#9E009B, #E73850); 
			    -webkit-background-clip: text; 
			    color: transparent; 
			    margin-right: 15px;
			    
			}
			
			.logo-image {
			    max-width: 150px;
			    height: auto;
			}
			
			.cards {
			    display: flex;
			    justify-content: center;  
			    flex-wrap: wrap;
			    margin: 20px 0; 
			    gap: 50px;  
			}
			
			.card {
			    background-color: rgba(255, 102, 0, 2); 
			    border-radius: 8px;
			    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
			    text-align: center;
			    width: 240px;
			    margin: 10px; 
			    padding: 20px;
			    transition: transform 0.3s ease, box-shadow 0.3s ease; 
				
			}
			
			
			.card:hover {
			    transform: translateY(-10px); 
			    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.7); 
			}
			
			.card img {
			    width: 100%;
			    height: auto;
			    border-radius: 5px;
			    background-color: transparent;
			}
			
			.card h3 {
			    font-size: 24px;
			    margin: 20px 0;
			}
			
			.card button {
			    background-color: #000000;
			    color: white;
			    border: none;
			    padding: 10px 20px;
			    font-size: 16px;
			    border-radius: 5px;
			    cursor: pointer;
			    transition: background-color 0.3s ease;
			}
			
			.card button:hover {
			    background-color: #ff3300;
			}
			
			/* Media query for responsive design */
			@media (max-width: 768px) {
			    .center-container {
			        flex-direction: column;
			        text-align: center;
			    }
			
			    .logo-text-container {
			        flex-direction: column;  
			    }
			
			    .cards {
			        flex-direction: column;
			        align-items: center;
			    }
			
			
			}
        
    </style>
    
</head>
	<body>
    <header>
    
            <div class="navbar-right">
       				<b><a href="aboutUs.jsp">About Us</a></b> 
            </div>
    </header>
   
 
  
   <div class="center-container">
        <img src="welcome/logoNew.png" class="logo-image">
        <span class="logo-text"  >biteCloud...</span>
    </div> 
    
    <section class="cards">
        <div class="card">
            <img src="welcome/sell1.png" alt="Admin">
            <h2>Food Seller</h2>
             <br>
            <a href ="sellerlogin.jsp"><button>GO >></button></a>
        </div>
        <div class="card">
            <img src="welcome/cus1.png" alt="Teacher">
            <h2>Customer</h2>
            <br>
             <a href ="logUi.jsp"><button>GO >></button></a>
        </div>
        <div class="card">
            <img src="welcome/ad1.png" alt="Student">
            <h2>Admin</h2>
             <br>
             <a href ="AdminLogin.jsp"><button>GO >></button></a>
        </div>
    </section>
    
   
   
   
    
    
	</body>
</html>