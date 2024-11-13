<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="NewUp1.css">
<meta charset="UTF-8">
<title>Up Date</title>
<style>
        body {
            background-image: url('senaru_ImgLoginSignup/back.jpg'); /* Replace with the path to your image */
            background-size: cover; /* Makes the image cover the entire background */
            background-position: center; /* Centers the image */
            background-repeat: no-repeat; /* Prevents the image from repeating */
            
        }
    </style>
</head>
<body>


<%
		String contactID = request.getParameter("contactID");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String msg_text = request.getParameter("msg_text");
		String date = request.getParameter("date");
	%>
	<form action ="UpdateServlet" method = "post">
		<h2>YOU WANT UPDATE YOUR DEATILS ?</h2>
		<table>
	
			<tr>
				<td>ID :</td>
				<td><input type="text" name="contactID" value=<%=contactID%> readonly></td>
			</tr>
			<tr>
				<td> Name :</td>
				<td><input type="text" name="name" value=<%=name%> required></td>
			</tr>
			<tr>
				<td>Email :</td>
				<td><input type="text" name="email" value=<%=email%> required></td>
			</tr>
			<tr>
				<td>phone No :</td>
				<td><input type="text" name="phone" value=<%=phone%> required></td>
			</tr>
			<tr>
				<td>massege :</td>
				
				
				
				
			<td>
			
			<textarea name="msg_text" rows="5" cols="30"  value =<%=msg_text%> required></textarea>
			
			
			</td> 
				
			</tr>
			<tr>
				<td>Date :</td>
				<td><input type="text" name="date" value=<%=date%> required></td>
			</tr>
			
			<tr>
				<td colspan ="2"><input type ="submit" value="UPDATE"></td>
			</tr>		
		</table>		
	</form>







</body>
</html>