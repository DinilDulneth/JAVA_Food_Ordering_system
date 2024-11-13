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
        background-image: url('senaru_ImgLoginSignup/dis.jpg'); 
        background-size: cover; 
        background-repeat: no-repeat; 
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

    .home-button {
        position: absolute;
        top: 20px;
        right: 20px;
    }

    .home-button button {
        padding: 10px 20px;
        background-color: #3498db;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }

    .home-button button:hover {
        background-color: #ffffff;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding-left: 10px;
    }

    th, td {
        padding: 12px 6px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #3498db;
        color: white;
        font-weight: bold;
        text-align: center;
    }

    td {
        text-align: center;
    }

    td:nth-child(6) {
        width: 120px;
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

    form {
        display: inline-block;
    }

    td:last-child {
        white-space: nowrap;
    }

    @media screen and (max-width: 768px) {
        table {
            width: 100%;
        }

        th, td {
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

<!-- Home Button -->
<div class="home-button">
    <a href="homePage.jsp"><button>Home</button></a>
</div>

<h1>Your Messages</h1>

<input type="text" id="searchInput" placeholder="Search...">

<br><br>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone No</th>
        <th>Your Message</th>
        <th>Date</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="contact_us" items="${all_contact_us}">
        <tr>
            <td>${contact_us.contactID}</td>
            <td>${contact_us.name}</td>
            <td>${contact_us.email}</td>
            <td>${contact_us.phone}</td>
            <td>${contact_us.msg_text}</td>
            <td>${contact_us.date}</td>
            <td>
                <a href="update.jsp?contactID=${contact_us.contactID}&name=${contact_us.name}&email=${contact_us.email}&phone=${contact_us.phone}&msg_text=${contact_us.msg_text}&date=${contact_us.date}">
                    <button class="updatebtn">Edit</button><br><br>
                </a>
                <form action="DeleteServlet" method="post">
                    <input type="hidden" name="contactID" value="${contact_us.contactID}">
                    <button type="submit" class="deletebtn">Delete</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

<script>
    function filterTable() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        table = document.querySelector("table");
        tr = table.getElementsByTagName("tr");

        for (i = 1; i < tr.length; i++) {
            tr[i].style.display = "none";
            td = tr[i].getElementsByTagName("td");

            for (var j = 0; j < td.length; j++) {
                if (td[j]) {
                    txtValue = td[j].textContent || td[j].innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                        break;
                    }
                }
            }
        }
    }

    document.getElementById("searchInput").addEventListener("input", filterTable);
</script>

</body>
</html>
