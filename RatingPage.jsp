<%@ page import="com.user.Rating" %>
<%@ page import="com.user.userDBUtil" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Rating Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #FFFCEF;
            margin: 0;
            padding: 20px;
        }
        .header-icons {
            display: flex;
            justify-content: space-around;
            align-items: center;
            margin: 10px auto;
            background-color: #000000;
            height: 60px;
            border-radius: 30px;
            padding: 0 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            width: 75%;
        }

        .header-icons a {
            color: #FFFCEF;
            text-decoration: none;
            font-size: 24px;
            transition: color 0.3s;
        }

        .header-icons a:hover {
            color: #E54C44;
        }
        h1 {
            color: #E54C44;
            text-align: center;
        }
        table {
            width: 90%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-left: auto;
            margin-right: auto;
        }
        th, td {
            padding: 8px;
            border: 1px solid #E54C44;
            text-align: left;
            background-color: #FFFCEF;
        }
        th {
            background-color: #F1CF54;
            color: #000000;
        }
        tr:hover {
            background-color: #D9B29C;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <div class="header-icons">
        <a href="AdminDashboard.jsp" title="Dashboard">
            <i class="fas fa-tachometer-alt"></i>
        </a>
        <a href="homePage.jsp" title="Home">
            <i class="fas fa-home"></i>
        </a>
        <a href="javascript:history.back()" title="Back">
            <i class="fas fa-arrow-left"></i>
        </a>
    </div>

    <h1>Rating Details</h1>

    <table>
        <thead>
            <tr>
                <th>Rating ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Date</th>
                <th>Rating</th>
                <th>Comment</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Rating> rDetails = userDBUtil.getRatingDetails();
                for (Rating rd : rDetails) {
            %>
                <tr>
                    <td><%= rd.getRid() %></td>
                    <td><%= rd.getName() %></td>
                    <td><%= rd.getEmail() %></td>
                    <td><%= rd.getDate() %></td>
                    <td><%= rd.getRate() %></td>
                    <td><%= rd.getComment() %></td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

</body>
</html>
