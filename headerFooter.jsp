<%@ page import="com.user.Seller" %> <%@ page import="com.user.Foods" %> <%@
page import="com.user.userDBUtil" %> <%@ page import="java.util.List" %> <%@
page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <title>biteCloud - Food Ordering System</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
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
      .search_fucntion {
        right: 0;
        display: grid;
        align-items: center;
        margin-left: auto;
      }

      .menu-icon {
        cursor: pointer;
        font-size: 25px;
        color: #e54c44;
      }

      .menu-icon:hover {
        color: yellow;
      }
      .slide-menu {
        position: fixed;
        top: 0;
        padding-top: 20px;
        left: -300px;
        width: 300px;
        height: 100%;
        background-color: rgb(26, 26, 26);
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.5);
        transition: left 0.3s ease;
        z-index: 1000;
      }

      .slide-menu .menu-item {
        padding: 15px;
        font-size: 20px;
      }

      .slide-menu a {
        padding: 15px;
        font-size: 20px;
        display: block;
        color: #e54c44;
        text-decoration: none;
      }

      .slide-menu a:hover {
        background-color: rgb(46, 46, 46);
        color: #f1cf54;
      }

      .slide-menu.active {
        left: 0;
      }
      .slide-menu .close-icon {
        font-size: 29px;
        cursor: pointer;
        color: #e54c44;
        padding: 30px;
      }
      .close-icon:hover {
        color: #f1cf54;
      }
      .slide-menu ul {
        list-style: none;
        padding: 0;
      }
      .slide-menu ul li {
        padding: 15px;
        border-bottom: 1px solid #d9b29c;
      }
      .slide-menu ul li a {
        text-decoration: none;
        color: #000;
        display: flex;
        align-items: center;
      }
      .slide-menu ul li a:hover {
        background-color: rgba(255, 255, 255, 0.2);
      }
      .slide-menu ul li i {
        margin-right: 10px;
      }
      input[type="text"] {
        padding: 10px;
        width: 350px;
        border: none;
        border-radius: 30px;
        height: 100px;
      }
      input[type="submit"] {
        background-color: #e54c44;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 30px;
        cursor: pointer;
        transition: background-color 0.3s ease;
      }
      input[type="submit"]:hover {
        background-color: #f1cf54;
        color: #000;
      }
      h2 {
        color: #e54c44;
      }
      .horizontal-line {
        border-top: 2px solid #d9b29c;
        margin: 40px 0;
      }
      footer {
        text-align: center;
        padding: 10px;
        background-color: #f1cf54;
        width: 100%;
      }
      .fa-search {
        color: #e54c44;
        background-color: rgb(26, 26, 26);
        transition: color 0.3s ease;
        font-size: 27px;
      }

      .fa-search:hover {
        color: yellow;
      }
      .button-search {
        background-color: rgb(26, 26, 26);
        border: none;
      }
    </style>
  </head>
  <body>
    <header>
      <div class="menu-icon" onclick="toggleMenu()">
        <i class="fas fa-bars"></i>
        <!-- Menu icon -->
      </div>
      <img src="img/logoNew.png" alt="Logo" />
      <h1>biteCloud</h1>

      <form
        action="search"
        method="POST"
        style="display: flex; align-items: center"
      >
        <input
          class="search_fucntion"
          type="text"
          name="food"
          placeholder="Search for food..."
          style="
            padding: 10px;
            border: none;
            border-radius: 30px;
            margin-right: 10px;
            height: 27px;
          "
        />
        <button type="submit" name="submit" class="button-search">
          <i class="fas fa-search"></i>
          <!-- Search icon -->
        </button>
      </form>
    </header>

    <!-- Slide Menu -->
    <div class="slide-menu" id="slideMenu">
      <span class="close-icon" onclick="toggleMenu()">
        <i class="fas fa-times"></i>
        <!-- Close icon -->
      </span>
      <a href="profile.jsp"><i class="fas fa-user"></i> Profile</a>
      <a href="orders.jsp"><i class="fas fa-box"></i> Orders</a>
      <a href="about.jsp"><i class="fas fa-info-circle"></i> About Us</a>
      <a href="contact.jsp"><i class="fas fa-phone"></i> Contact</a>
    </div>

    <p>your page content</p>

    <footer>
      <p>&copy; 2024 biteCloud. All rights reserved.</p>
    </footer>

    <script>
      function toggleMenu() {
        const menu = document.getElementById("slideMenu");
        const body = document.body; // Reference to the body or main content

        menu.classList.toggle("active"); // Toggle the active class to show/hide the menu
        //container.classList.toggle('blur');
      }
    </script>
  </body>
</html>
