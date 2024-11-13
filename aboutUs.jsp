<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us</title>
    <link rel="stylesheet" href="Au.css">
    <style>
    	@charset "UTF-8"; 
/* Reset some default styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body styling */
body {
    font-family: Arial, sans-serif;
    background-color: #f1cf54; /* Background color */
    color: #333; /* Text color */
}

/* Header styling */
header {
    background-color: #000000; /* Header background color */
    padding: 20px;
    display: flex; /* Use flexbox for header layout */
    align-items: center; /* Vertically center items */
    justify-content: space-between; /* Space between left and center */
}

/* Header left side styling */
.header-left {
    display: flex; /* Flexbox for logo and title */
    align-items: center; /* Vertically center items */
}

.logo {
    max-width: 100px; /* Adjust the logo size */
    margin-right: 20px; /* Space between logo and title */
}

.header-title {
    color: white;
    font-size: 2rem; /* Adjust title size */
}

/* Center header text */
.header-center {
    flex-grow: 1; /* Allow center header to grow and occupy available space */
    text-align: center; /* Center the text */
    color: white; /* Text color */
    font-size: 2rem; /* Font size */
     margin-right: 160px
}

/* Main content styling */
main {
    padding: 20px;
}

.about-container {
    max-width: 800px; /* Maximum width for the content */
    margin: auto; /* Center the content */
}

.about-container h2 {
    font-size: 2rem; /* Heading font size */
    margin: 20px 0; /* Spacing above and below headings */
}

.about-container p {
    font-size: 1.1rem; /* Paragraph font size */
    line-height: 1.6; /* Line height for better readability */
    margin-bottom: 20px; /* Spacing below paragraphs */
}

.about-container ul {
    list-style-type: disc; /* Bullet points for list */
    margin-left: 20px; /* Indent the list */
}

/* Footer styling */
footer {
    text-align: center;
    padding: 20px;
    background-color: #ff6600; /* Footer background color */
    color: white;
    position: relative;
    bottom: 0;
    width: 100%; /* Full width for the footer */
}

/* Media query for responsive design */
@media (max-width: 768px) {
    .navbar-right {
        display: flex;
        flex-direction: column; /* Stack navigation links */
        align-items: center; /* Center the links */
    }

    .about-container {
        padding: 10px; /* Less padding on smaller screens */
    }

    .header-center {
        font-size: 1.5rem; /* Adjust size on small screens */
    }
}

    	
    
    </style>
</head>
<body>

<header>
    <div class="header-left">
        <img src="welcome/logoNew.png" alt="biteCloud Logo" class="logo">
        <h1 class="header-title">biteCloud</h1>
    </div>
    <h1 class="header-center">About Us</h1>
</header>

<main>
    <section class="about-container">
        <h2>Our Mission</h2>
        <p>At biteCloud, our mission is to revolutionize the way people experience food delivery. We are dedicated to connecting hungry customers with a diverse range of restaurants and cuisines at the click of a button. We believe that everyone deserves access to delicious meals, whether it’s a quick lunch, a family dinner, or a late-night snack.</p>

        <h2>Our Story</h2>
        <p>Founded in 1990, we started as a small company with a big vision. Over the years, we have grown and adapted, always keeping our customers' needs at the forefront of our mission. Our dedicated team works tirelessly to ensure that every interaction with our brand is a positive one.</p>

        <h2>Our Values</h2>
        <ul>
            <li><strong>Integrity:</strong> We uphold the highest standards of integrity in all of our actions.</li>
            <li><strong>Customer Focus:</strong> Our customers are at the heart of everything we do.</li>
            <li><strong>Innovation:</strong> We continually seek innovative ways to improve our products and services.</li>
            <li><strong>Teamwork:</strong> We work together, across boundaries, to meet the needs of our customers.</li>
        </ul>
    </section>
</main>

<footer>
    <p>&copy; 2024 biteCloud. All rights reserved.</p>
</footer>

</body>
</html>
