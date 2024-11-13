<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
    />
    <link rel="stylesheet" href="senaru_css/logInSignUpStyle.css" />
    <title>Seller Login</title>
  </head>
  <body>
    <div class="container" id="container">
      <div class="form-container sign-up">
      
        
      </div>
      <div class="form-container log-in">
      
        <form id="sign-up-Form" action="InsertServlet" method="post">
          <h1>Create Account</h1>
          <div class="social-icons">
            <a href="#" class="icon"
              ><i class="fa-brands fa-google-plus-g"></i
            ></a>
            <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
            <a href="#" class="icon"><i class="fa-brands fa-github"></i></a>
            <a href="#" class="icon"
              ><i class="fa-brands fa-linkedin-in"></i
            ></a>
          </div>
          <span><b>Or use your email for registeration</b></span>
          <input
            type="text"
            name="seller_name"
            placeholder="Seller Name"
            required
          />
          <input type="text" name="address" placeholder="Address" required />
          <input
            type="text"
            name="email"
            placeholder="email"
            maxlength="100"
            required
          />
          <input type="password" placeholder="Password" required />
          <input
            type="password"
            name="password"
            placeholder="Re-enter Password"
            required
          />
          <input
            type="tel"
            name="contactNumber"
            placeholder="Contact Number"
            maxlength="10"
            required
          />
          <input
            type="text"
            name="shop_name"
            placeholder="Shop Name"
            required
          />

          <button>Sign Up</button>
        </form>
        
      </div>
      <div class="moving-container">
        <div class="moving">
          <div class="moving-panel moving-left">
            <button class="hidden" id="log-in">Log In</button>
          </div>
          <div class="moving-panel moving-right">
            <h1>Hello, Friend!</h1>
            <p>
              Register with your personal details to use all of site features
            </p>
          </div>
        </div>
      </div>
    </div>

    <script src="senaru_js/logInSignUpindexScript.js"></script> 
  </body>
</html>
