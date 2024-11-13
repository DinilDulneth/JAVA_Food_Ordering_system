<%@ page import="java.util.List" %>
<%@ page import="com.user.User" %>
<%@ page import="com.user.userDBUtil" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile (User Account) || RUKSHAN E A Y </title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            background: url('./RukshanImage/img65.jpg') no-repeat;
		    background-size: cover;
		    background-position: center;
		    opacity: 0.7;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .container {
            width: 60%;
            margin: 0 auto;
            padding: 30px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            margin-top: 50px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #512da8;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        button {
            display: inline-block;
            background-color: #512da8;
            color: white;
            border: none;
            padding: 15px 25px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            margin-top: 20px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #6d5ed3;
        }
        .no-user {
            text-align: center;
            color: red;
            font-size: 18px;
            margin-top: 20px;
        }
        @media (max-width: 600px) {
            .container {
                width: 95%;
            }
            button {
                width: 100%;
            }
        }
    </style>
</head>
<body>
	 <%
	 
			HttpSession session1 = request.getSession();
			 Integer userID = (Integer) session1.getAttribute("uID");
				if (userID == null) {
				    out.println("No user logged in.");
				}
	 
		    List<User> usersDetails = userDBUtil.getUserFromID(userID);
		    for (User uv : usersDetails) {   
		    	
	  %>


    <div class="container">
        <h1>Welcome to Your Profile</h1>
        
        <table>
                <tr>
                    <th>User ID</th>
                    <td><%=uv.getID() %></td>
                </tr>
                <tr>
                    <th>First Name</th>
                    <td><%=uv.getF_name() %></td>
                </tr>
                <tr>
                    <th>Last Name</th>
                    <td><%=uv.getL_name() %></td>
                </tr>
                <tr>
                    <th>Username</th>
                    <td><%=uv.getUserName() %></td>
                </tr>
                <%-- <tr>
                    <th>Password</th>
                    <td><%=uv.getPassword() %></td>
                </tr> --%>
                <tr>
                    <th>Email</th>
                    <td><%=uv.getEmail() %></td>
                </tr>
                <tr>
                    <th>Contact Number</th>
                    <td><%=uv.getContactNumber() %></td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td><%=uv.getAddress() %></td>
                </tr>
        </table>
        
        
	<c:url value="updateUser.jsp" var="userUpdate">
        
        	<c:param name="id" value="<%= String.valueOf(uv.getID()) %>"/>
			<c:param name="fN" value="<%=uv.getF_name() %>"/>
			<c:param name="lN" value="<%=uv.getL_name() %>"/>
			<c:param name="uName" value="<%=uv.getUserName() %>"/>
			<c:param name="pass" value="<%=uv.getPassword() %>"/>
			<c:param name="em" value="<%=uv.getEmail() %>"/>
			<c:param name="contacN" value="<%=uv.getContactNumber() %>"/>
			<c:param name="addr" value="<%=uv.getAddress() %>"/>
        
		</c:url>
        <a href="${userUpdate}"><button type="button" name="update" value="Update">Update Your Profile</button></a>
        
        <!-- URL for deleting user account -->
        
        <a href="deleteReasonInsert.jsp"><button type="button" name="deleteReason" value="DeleteReason">Delete Your Profile</button></a>
        
        <a href="homePage.jsp"><button>Back to Home Page</button></a>
        <button id="logoutBtn">Logout</button>
        
        
        <%
		    } 
	  	%>
        
    </div>
    <script>
    document.getElementById("logoutBtn").addEventListener("click", function() {
        // Clear user session or authentication token
        localStorage.removeItem('authToken'); // Example: Removing token from localStorage

        // Redirect to login page or homepage
        window.location.href = 'welcome.jsp'; // Change to your login or home page
    });
</script>
    
</body>
</html>