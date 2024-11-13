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
    <title>Delete Profile || RUKSHAN E A Y</title>
    <link rel="stylesheet" href="RukshanCSS/deleteStyle.css">
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
        <h1>Delete Profile</h1>
        <div class="profile-card"><br><br>
            <form id="profile-form" action="userDeleteUser" method="Post">
                
                <div class="input-group">
                <label for="user-id"> User ID : </label>
                    <input type="text" placeholder="User ID" name="id" value="<%=String.valueOf(uv.getID())  %>" id="u-id" readonly>
                </div>
                
                <div class="input-group">
                <label for="username"> User Name : </label>
                    <input type="text" placeholder="Username"name="username" value="<%=uv.getUserName() %>" id="Username" maxlength="16" readonly>
                </div>
                
                <div class="input-group">
                <label for="password"> Password : </label>
                    <input type="password" placeholder="Password" value="<%=uv.getPassword() %>" name="password" id="password" required>
                </div>
                

                <button type="submit" name="submit">Delete Profile</button><br><br>
            </form>
            
            <%
		    	}
            %>
            </div>
        </div>
</body>
</html>