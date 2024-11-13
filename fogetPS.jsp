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
      <div class="form-container log-in">
        <form action="Sellerloginservlet" method="post">
          <h2>FORGOT PASSWORD</h2>
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

          <input type="text" name="email" placeholder=" Enter Email" required />
          <input
            type="password"
            name="password"
            placeholder=" Enter New  Password"
            required
          />

          <button>Update Password</button>
        </form>
      </div>
      <div class="moving-container">
        <div class="moving">
          <div class="moving-panel moving-left">
            <h1>Welcome Back!</h1>
            <p>Enter your personal details to use all of site features</p>
            <button class="btn" id="log-in">Update Password</button>
          </div>
          <div>
            <h1>Hello, Friend!</h1>
          </div>
        </div>
      </div>
    </div>

    <script src="senaru_js/logInSignUpindexScript.js"></script>
  </body>
</html>
