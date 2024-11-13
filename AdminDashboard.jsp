<%@ page import="com.user.Admin" %>
<%@ page import="com.user.userDBUtil" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #FFFCEF;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
        }

		.header {
            color: #000000;
            padding: 20px 0; /* Padding for top and bottom */
            font-size: 28px; /* Font size for the title */
            font-weight: bold; /* Bold title */
        }
        
        /* Sidebar */
        .sidebar {
            background-color: #000000;
            width: 250px;
            height: 100vh;
            position: fixed;
            display: flex;
            flex-direction: column;
            padding-top: 20px;
            box-shadow: 4px 0 8px rgba(0, 0, 0, 0.2);
            transition: width 0.3s ease;
            overflow: hidden;
        }

        .sidebar.collapsed {
            padding-top: 50px;
            width: 60px;
        }

        .sidebar a {
            text-decoration: none;
            padding: 15px 20px;
            color: #FFFCEF;
            font-weight: bold;
            display: flex;
            align-items: center;
            transition: all 0.3s ease;
        }

        .sidebar.collapsed a span {
            display: none;
        }

        .sidebar a:hover {
            background-color: #E54C44;
            color: #FFFCEF;
        }

        .sidebar h2 {
            color: #F1CF54;
            text-align: center;
            margin-bottom: 20px;
            padding-top: 50px;
            font-size: 24px;
            transition: opacity 0.3s ease;
        }

        .sidebar.collapsed h2 {
            opacity: 0;
            height: 0;
            margin: 0;
            padding: 0;
        }

        /* Toggle Button */
        .toggle-btn {
            position: absolute;
            top: 10px;
            right: -15px;
            background-color: #E54C44;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            box-shadow: 0px 0px 5px rgba(0,0,0,0.3);
            transition: transform 0.3s ease;
        }

        .toggle-btn::before {
            content: '\2630'; /* Unicode for hamburger icon */
            color: #FFFCEF;
            font-size: 18px;
        }

        .sidebar.collapsed .toggle-btn::before {
            content: '\2715'; /* Unicode for close icon */
        }

        /* Main content */
        .content {
            margin-left: 260px;
            margin-top:31px;
            padding: 20px;
            flex-grow: 1;
            transition: margin-left 0.3s ease;
            display: flex;
            justify-content: space-between; /* Added for horizontal alignment */
        }

        .sidebar.collapsed ~ .content {
            margin-left: 60px;
        }

        .dashboard-header {
            text-align: center;
            color: #000000;
            margin-bottom: 20px;
            flex-grow: 1; /* Allow header to grow */
        }

        h1 {
            font-size: 36px;
            margin: 0;
            color: #000000;
        }
        h3{
	        margin: 0;
            color: #E54C44;
		}

        .menu {
            background-color: #FFFCEF;
            border-radius: 20px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 70%; /* Adjust width */
            text-align: left;
            margin-right: 20px; /* Space between menu and profile picture */
            box-shadow: 0 4px 10px #E54C44;
        }

        .menu a {
            display: flex;
            align-items: center;
            color: #000000;
            text-decoration: none;
            font-weight: bold;
            margin: 15px 0;
            padding: 15px;
            border-radius: 8px;
            background-color: #D9B29C;
            text-align: left;
            transition: all 0.3s ease;
        }

        .menu a:hover {
            background-color: #E54C44;
            color: #FFFCEF;
        }

        .menu a img {
            width: 30px;
            height: 30px;
            margin-right: 10px;
        }

        .menu p {
            color: #666;
            font-size: 14px;
            margin: 0;
            padding: 0 15px;
            text-align: left;
        }

        /* Profile Picture */
        .profile-container {
		    display: flex;
		    margin-top: 30px; /* Space from the top */
		    flex-direction: column; /* Stack items vertically */
		    align-items: center; /* Center items horizontally within the container */
		    width: 16%; /* Adjust width */
		    background-color:rgb(30, 30, 30); /* Background color */
		    height: 46%; /* Adjust height */
		    padding: 10px; /* Inner spacing */
		    border-radius: 30px 0px 0px 30px; /* Rounded corners */
		    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.5); /* Shadow effect */
		    position: absolute; /* Position it relative to its first positioned ancestor */
		    right: 0; /* Align to the right of the page */
		    top: 30%; /* Optional: Adjust top positioning */
		    transform: translateY(-50%); /* Optional: Center vertically if needed */
		}
        .profile-picture {
            width: 120px; /* Increased size */
            height: 120px; /* Increased size */
            border-radius: 50%;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
            background-color: white;
            margin-bottom: 10px;
            margin-left:40px;
        }

        .admin-details {
        	margin-right:20px;
            text-align: right;
            color: #F1CF54;
        }

        footer {
            text-align: center;
            margin-top: 40px;
            color: #F1CF54;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .sidebar {
                width: 60px;
            }

            .sidebar.collapsed {
                width: 0;
            }

            .sidebar h2, .sidebar a span {
                display: none;
            }

            .sidebar a {
                justify-content: center;
            }

            .content {
                margin-left: 60px;
            }

            .sidebar.collapsed ~ .content {
                margin-left: 0;
            }

            .toggle-btn {
                top: 10px;
                right: -15px;
            }
            .admin-name {
			    font-size: 22px;                /* Increased font size */
			    font-weight: bold;              /* Bold text */
			    color: #E54C44;                 /* Text color */
			    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3); /* Subtle shadow for depth */
			    letter-spacing: 1px;            /* Slight spacing between letters */
			    padding: 10px;                  /* Padding around the text */
			    background-color: #FFFCEF;      /* Light background for contrast */
			    border-radius: 5px;             /* Rounded corners */
			    display: inline-block;           /* Ensures background applies correctly */
			    margin-bottom: 10px;            /* Space below the name */
			}
			.menu a {
			    
			}
			
			.menu a i {
			    width: 30px; /* Make sure icon width is set */
			    height: 30px; /* Make sure icon height is set */
			    margin-right: 8px; /* Add space between icon and text */
			    transition: transform 0.3s; /* Animation effect */
			}
			
			.menu a:hover {
			    background-color: #E54C44;
			    color: #FFFCEF;
			}
			
			.field1 {
			    border: 2px solid black; /* Border color */
			    border-radius: 15px; /* Rounded corners for the fieldset */
			    padding: 20px; /* Padding inside the fieldset */
			    background-color: #FFFCEF; /* Background color */
			    margin: 20px 0; /* Margin for spacing */
			}
			
			.logout-btn {
			    background-color: #E54C44;
			    color: #FFFCEF;
			    border: none;
			    padding: 10px 20px;
			    font-size: 16px;
			    font-weight: bold;
			    cursor: pointer;
			    border-radius: 5px;
			    display: flex;
			    align-items: center; /* Aligns icon and text vertically */
			    justify-content: center; /* Centers the text */
			    transition: background-color 0.3s ease;
			    margin-left: 40px; /* Adjusts spacing if needed */
			}
			
			.logout-btn:hover {
			    background-color: #C43934; /* Darker shade on hover */
			}
			
			.logout-btn i {
			    font-size: 18px;
			}


        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="toggle-btn" onclick="toggleSidebar()"></div>
        <h2>Admin Menu</h2>
        <a href="adminProfile.jsp">
            <i class="fa-solid fa-user-tie" style="margin-right: 8px; color: #000000; ;
			    color: #FFFCEF;"></i>
            <span>Admin Profile</span>
        </a>
        <a href="homePage.jsp">
            <i class="fa-solid fa-house" style="margin-right: 8px; color: #000000; ;
			    color: #FFFCEF;"></i>
            <span>Home Page</span>
        </a>
    </div>

    <!-- Main Content Area -->
    <div class="content">
		
        <div class="menu">
        	<!-- Header -->
			<div class="header">
		        Dashboard
		    </div>
		    <h3>Editions</h3>
            <a href="sellerProfiles.jsp">
                <i class="fa-solid fa-shop" style="margin-right: 8px; color: #000000;"></i>
                <span>Seller Profiles</span>
                
            </a>
            <a href="userProfiles.jsp">
                <i class="fa-solid fa-user" style="margin-right: 8px; color: #000000;"></i>
                <span>User Profiles</span>
            </a>
            
            <div class="field1">
			    <h3>System Details</h3>
			    <a href="deletedUserAccount.jsp">
			        <i class="fa-solid fa-user-minus" style="margin-right: 8px; color: #000000;"></i>
			        <span>Deleted User Accounts</span>
			    </a>
			    <a href="LoginHistory.jsp">
			        <i class="fa-solid fa-right-to-bracket" style="margin-right: 8px; color: #000000;"></i>
			        <span>Login History</span>
			    </a>
			    <a href="paymentDetails.jsp">
			        <i class="fa-solid fa-money-bill-1-wave" style="margin-right: 8px; color: #000000;"></i>
			        <span>Payment Details</span>
			    </a>
			    <a href="ReadContactUsPage.jsp">
			        <i class="fa-solid fa-comments" style="margin-right: 8px; color: #000000;"></i>
			        <span>Comment from user</span>
			    </a>
			    <a href="RatingPage.jsp">
			        <i class="fa-solid fa-star" style="margin-right: 8px; color: #000000;"></i>
			        <span>Rating Details</span>
			    </a>
			</div>

        </div>
   
   
   		<%
	   		HttpSession session2 = request.getSession();  
	   		String adminName = (String) session2.getAttribute("adminName");
	   		String adminPassword = (String) session2.getAttribute("adminPassword");
	
		   		if (adminName == null || adminPassword == null) {
		   		    out.println("No user logged in.");
		   		} else {
		   		    List<Admin> adDetails = userDBUtil.AdminValidation(adminName, adminPassword);
		
		   		    for (Admin adm : adDetails) {    
   		%>
   		
   			<!-- Profile Section -->
			<div class="profile-container">
				<a href="adminProfile.jsp" style="color: #000000; text-decoration: none;">
			    <img src="img/administrator.png" alt="Admin Profile" class="profile-picture">
			    <div class="admin-details">
			        <h2 class="admin-name"><%=adm.getAdmin_name() %></h2>
			        <p><%=adm.getEmail() %></p> 
			    </div>
			    </a>
			    <a href="welcome.jsp" style="color: #FFFCEF; text-decoration: none; margin-top: 20px;">
			    
		        <button class="logout-btn" style="background-color: #E54C44; color: #FFFCEF;  border: none;  padding: 10px 20px; 
		               font-size: 16px; 
		               font-weight: bold; 
		               cursor: pointer; 
		               border-radius: 5px; 
		               display: flex; 
		               align-items: center; 
		               justify-content: center; 
		               transition: background-color 0.3s ease; 
		               margin-left: 40px;">
		            <i class="fa-solid fa-right-from-bracket" ></i>
		            
		        </button>
    </a>
			</div>
   		        
   		<%	        
	   		    }
	   		}
	    %>
    	
    </div>

    <script>
        function toggleSidebar() {
            var sidebar = document.getElementById('sidebar');
            sidebar.classList.toggle('collapsed');
        }
    </script>

</body>
</html>
