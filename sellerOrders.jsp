<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.user.OrderModel" %>

<html>
<head>
    <title>Order Details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>Order Details</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Food Name</th>
                    <th>Address</th>
                    <th>Quantity</th>
                </tr>
            </thead>
           <tbody>
    <%
        List<OrderModel> orderList = (List<OrderModel>) request.getAttribute("orderList");
        List<Integer> removedOrderIds = (List<Integer>) session.getAttribute("removedOrderIds");

        if (removedOrderIds == null) {
            removedOrderIds = new ArrayList<>();
        }

        if (orderList != null) {
            for (OrderModel order : orderList) {
                if (!removedOrderIds.contains(order.getOrderId())) { 
    %>
    <tr>
        <td><%= order.getUserId() %></td>
        <td><%= order.getfName() %></td>
        <td><%= order.getAddress() %></td>
        <td><%= order.getQuantity() %></td>
        <td>
            <form action="RemoveOrderServlet" method="post">
                <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                <button type="submit" class="btn btn-success">Completed</button>
            </form>
        </td>
    </tr>
    <%
                
                }
            }
        }
    %>
</tbody>

        </table>
    </div>
</body>
</html>
