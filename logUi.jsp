<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <title>Log In / Sing Up (Register Account) || RUKSHAN E A Y</title> 
    
    <style>
  		*{
		    margin: 0;
		    padding: 0;
		    box-sizing: border-box;
		    font-family: 'Montserrat', sans-serif;
		}
		
		body{
		    background-color: #c9d6ff;
		    background: linear-gradient(to right, #e2e2e2, #c9d6ff);
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    flex-direction: column;
		    height: 100vh;
		    background: url('RukshanImage/img.jpg') no-repeat;
		    background-size: cover;
		    background-position: center;
		    opacity: 0.7;
		}
		
		.container {
		    background-color: #fff;
		    border-radius: 30px;
		    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.35);
		    position: relative;
		    overflow: hidden;
		    width: 600px; 
		    max-width: 90%;  
		    min-height: 570px;
		}
		
		::placeholder{
		    color: black;
		    opacity: 1;
		}
		
		::-ms-input-placeholder{
		    color: black;
		}
		
		.container p{
		    font-size: 14px;
		    line-height: 20px;
		    letter-spacing: 0.3px;
		    margin: 20px 0;
		}
		
		.container span{
		    font-size: 12px;
		}
		
		.container a{
		    color: #333;
		    font-size: 13px;
		    text-decoration: none;
		    margin: 15px 0 10px;
		}
		
		.container button{
		    background-color: #512da8;
		    color: #fff;
		    font-size: 12px;
		    padding: 10px 45px;
		    border: 1px solid transparent;
		    border-radius: 8px;
		    font-weight: 600;
		    letter-spacing: 0.5px;
		    text-transform: uppercase;
		    margin-top: 10px;
		    cursor: pointer;
		}
		
		.container button.hidden{
		    background-color: #512da8;
		    border-color: #fff;
		}
		
		.container form{
		    background-color: #fff;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    flex-direction: column;
		    padding: 0 40px;
		    height: 100%;
		}
		
		.container input{
		    background-color: transparent;
		    border: none;
		    border-bottom: 4px solid black;
		    margin: 3px 0;
		    padding: 6px 10px;
		    font-size: 14px;
		    border-radius: 14px;
		    width: 100%;
		    outline: none;
		}
		
		.form-container{
		    position: absolute;
		    top: 60px;
		    height: 70%;
		    transition: all 0.6s ease-in-out;
		}
		
		.log-in{
		    left: 0;
		    width: 50%;
		    z-index: 2;
		}
		
		.container.active .log-in{
		    transform: translateX(100%);
		}
		
		.sign-up{
		    left: 0;
		    width: 50%;
		    opacity: 0;
		    z-index: 1;
		}
		
		.container.active .sign-up{
		    transform: translateX(100%);
		    opacity: 1;
		    z-index: 5;
		    animation: move 0.6s;
		}
		
		@keyframes move{
		    0%, 49.99%{
		        opacity: 0;
		        z-index: 1;
		    }
		    50%, 100%{
		        opacity: 1;
		        z-index: 5;
		    }
		}
		
		.social-icons{
		    margin: 20px 0;
		}
		
		.social-icons a{
		    border: 1px solid #ccc;
		    border-radius: 20%;
		    font-size: 12px;
		    border-radius: 20%;
		    display: inline-flex;
		    justify-content: center;
		    align-items: center;
		    margin: 0 3px;
		    width: 40px;
		    height: 40px;
		}
		
		.moving-container{
		    position: absolute;
		    top: 0;
		    left: 50%;
		    width: 50%;
		    height: 100%;
		    overflow: hidden;
		    transition: all 0.6s ease-in-out;
		    border-radius: 150px 0 0 100px;
		    z-index: 1000;
		}
		
		.container.active .moving-container{
		    transform: translateX(-100%);
		    border-radius: 0 150px 100px 0;
		}
		
		.moving{
		    background-color: #512da8;
		    height: 100%;
		    background: linear-gradient(to right, #5c6bc0, #512da8);
		    color: #fff;
		    position: relative;
		    left: -100%;
		    height: 100%;
		    width: 200%;
		    transform: translateX(0);
		    transition: all 0.6s ease-in-out;
		}
		
		.container.active .moving{
		    transform: translateX(50%);
		}
		
		.moving-panel{
		    position: absolute;
		    width: 50%;
		    height: 100%;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    flex-direction: column;
		    padding: 0 30px;
		    text-align: center;
		    top: 0;
		    transform: translateX(0);
		    transition: all 0.6s ease-in-out;
		}
		
		.moving-left{
		    transform: translateX(-200%);
		}
		
		.container.active .moving-left{
		    transform: translateX(0);
		}
		
		.moving-right{
		    right: 0;
		    transform: translateX(0);
		}
		
		.container.active .moving-right{
		    transform: translateX(200%);
		}
  	</style>
</head>

<body>

    <div class="container" id="container">
        <div class="form-container sign-up">
        
            <form id="sign-up-Form" action="insert" method="Post">
                <h3>Register Account</h3>
                <div class="social-icons">
                    <a href="#" class="icon"><i class="fa-brands fa-google-plus-g" ></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-github"></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-linkedin-in"></i></a>
                </div>
                <span><b>Or use your email for registeration</b></span>
                <input type="text" placeholder="First Name" name="fName" pattern="[A-Za-z]+" title="Only letters are allowed" required>
                <input type="text" placeholder="Last Name" name="lName" pattern="[A-Za-z]+" title="Only letters are allowed" required>
                <input type="text" placeholder="User Name" name="name" maxlength="16" required>
                <input type="tel" placeholder="Contact Number" name="contact" maxlength="10" required>
                <input type="text" placeholder="Address" name="address" required>
                <input type="email" placeholder="Email" name="email" required>
                <input type="password" placeholder="Password" name="password" required>
                <input type="password" placeholder="Re-enter Password" required>
               <a href="homePage.jsp"> <button>Sign Up</button></a>
            </form>
            
        </div>
        <div class="form-container log-in">
        
            <form action="log" method="POST">
                <h1>LOG IN</h1>
                <div class="social-icons">
                    <a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-github"></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-linkedin-in"></i></a>
                </div>
                <span><b>Or use your email password</b></span>
                <input type="text" placeholder="UserName" name="name" required>
                <input type="password" placeholder="Password" name="password" required>
                <a href="#"><b>Forget Your Password?</b></a>
                <button>Log in</button>
            </form>
            
        </div>
        <div class="moving-container">
            <div class="moving">
                <div class="moving-panel moving-left">
                    <h1>Welcome BiteCloud!</h1>
                    <p>Enter your personal details to use all of site features</p>
                    <button class="hidden" id="log-in">Log In</button>
                </div>
                <div class="moving-panel moving-right">
                    <h1>Welcome BiteCloud!</h1>
                    <p>Register with your personal details to use all of site features</p>
                    <a ><button class="hidden" id="sign-up">Sign Up</button></a>
                </div>
            </div>
        </div>
    </div>

    <script src="RukshanJS/logInSignUpindexScript.js"></script>
</body>
</html>