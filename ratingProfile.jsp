<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us Details</title>
<style>
    body {
        background-image: url('imageCon/dis.jpg'); /* Replace with the path to your image */
        background-size: cover; /* Makes the image cover the entire background */
        background-repeat: no-repeat; /* Prevents the image from repeating */
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f9;
        color: #333;
        margin: 0;
        padding: 20px;
    }

    h1 {
        text-align: center;
        color: white;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding-left:10px;
    }

    td {
        padding: 12px 6px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #eaeaea;
    }

    .updatebtn {
        padding: 8px 12px;
        background-color: #3498db;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
        margin-right: 5px;
    }

    .deletebtn {
        padding: 8px 12px;
        background-color: red;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
        margin-right: 5px;
    }

    td:last-child {
        white-space: nowrap;
    }

    @media screen and (max-width: 768px) {
        table {
            width: 100%;
        }

        td {
            padding: 10px;
            font-size: 12px;
        }

        a button, form button {
            padding: 6px 10px;
            font-size: 12px;
        }
    }

    #searchInput {
        width: 250px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 20px;
        box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
        font-size: 14px;
        box-sizing: border-box;
        display: block;
        margin: 20px auto;
    }
</style>
</head>
<body>

<h1>Thank You </h1>

<br>
<br>
<table>
    <c:forEach var="rating" items="${ratingDetails}">
        <tr>
            <td>ID : ${ratingDetails.id}</td>
        </tr>
        <tr>
            <td>Name : ${ratingDetails.name}</td>
        </tr>
        <tr>
            <td>Email : ${ratingDetails.email}</td>
        </tr>
        <tr>
            <td>Date : ${ratingDetails.date}</td>
        </tr>
        <tr>
            <td>You are Rating : ${ratingDetails.rate}</td>
        </tr>
        <tr>
            <td>You are Comment : ${ratingDetails.comment}</td>
        </tr>
        <tr>
            <td>
                <a href="#">
                    <button class="updatebtn">Edit</button>
                </a>

                <form action="DeleteServlet" method="post" style="display:inline;">
                    <input type="hidden" name="contactID" value="${contact_us.contactID}">
                    <button type="submit" class="deletebtn">Delete</button>
                </form>
            </td>
        </tr>
        <tr><td><hr></td></tr> <!-- Optional separator -->
    </c:forEach>
</table>

<script>
// Add any needed JS functionality here
</script>
</body>
</html>
