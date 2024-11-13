<%@ page import="java.util.List" %>
<%@ page import="com.user.User" %>
<%@ page import="com.user.userDBUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Delete Reason || RUKSHAN E A Y</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-color: white;
            background: linear-gradient(to right, #e2e2e2, #c9d6ff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url('RukshanImage/img1.jpg') no-repeat;
            background-size: cover;
            height: 100vh;
            width: 100%;
        }

        .profile-container {
            background-color: white;
            padding: 16px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 700px;
            opacity: 0.9;
        }

        .profile-container h1 {
            text-align: center;
            margin-top: 60px;
            font-size: 30px;
            color: black;
        }

        .profile-card {
            display: flex;
            flex-direction: column;
        }

        .profile-picture {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
            position: relative; /* Allows for absolute positioning of input */
        }

        .input-group {
            margin-bottom: 10px;
        }

        .input-group label {
            display: block;
            font-size: 14px;
            margin-bottom: 4px;
            color: black;
        }

        .input-group input {
            background-color: transparent;
            border: none;
            border-bottom: 4px solid black;
            margin: 1px 0;
            padding: 8px 10px;
            font-size: 14px;
            border-radius: 14px;
            width: 100%;
            outline: none;
            color: black;
        }

        ::placeholder {
            color: black;
            opacity: 1.5;
        }

        ::-ms-input-placeholder {
            color: black;
        }

        .other {
            background-color: transparent;
            border: none;
            border-bottom: 4px solid black;
            margin: 1px 0;
            padding: 8px 10px;
            font-size: 14px;
            border-radius: 14px;
            width: 100%;
            outline: none;
            color: black;
        }

        button {
            width: 100%;
            background-color: darkblue;
            color: white;
            border: none;
            padding: 6px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: darkcyan;
        }
    </style>
</head>
<body>
<!-- from uvindu------------------------------------------------------------------>
	<%
	 
			HttpSession session1 = request.getSession();
			 Integer userID = (Integer) session1.getAttribute("uID");
				if (userID == null) {
				    out.println("No user logged in.");
				}
	 
		    List<User> usersDetails = userDBUtil.getUserFromID(userID);
		    for (User uv : usersDetails) {   
		    	
	  %>
<!--------------------------------------------------------------------------------->	
    <div class="profile-container">
        <h1><b>Why Delete Your Account ?</b></h1><br>
        <div class="profile-card">
        
            <form id="profile-form" action="deleteReason" method="Post">
                <div class="input-group">
                    <label for="user-id">User ID : </label>
                    <input type="text" value="<%= String.valueOf(uv.getID()) %>" name="userId" id="user-id" >
                </div>

                <div class="input-group">
                    <label for="date">Date : </label>
                    <input type="datetime-local" placeholder="Date" name="date" id="date" required>
                </div>
						<br><br>
					<div>
					<label for="reson">Why Delete Your Account?</label><br><br>
                    <input class="other" type="text" id="otherReason" name="reason" placeholder="If you would like to comment , the reason for deleting your account , please note it." maxlength="500">
                	
                </div><br>
                
				
		        
		      	<button type="submit">Next</button><br><br>

            </form>
            
        </div>
        <%
    	    }
		%>
   	</div>

</body>
</html>
    