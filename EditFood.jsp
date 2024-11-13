<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Food Item</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-4">

	<%
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String description = request.getParameter("description");
		String category = request.getParameter("category");
		String img = request.getParameter("img");
	%>
	
    <h1>Update Food Item</h1>

    <form action="editFood" method="post">
        <input type="hidden" name="foodId" value="<%= id %>">
        <div class="mb-3">
            <label for="fName" class="form-label">Food Name</label>
            <input type="text" class="form-control" id="fName" name="fName" value="<%= name %>">
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Price</label>
            <input type="number" step="0.01" class="form-control" id="price" name="price" value="<%= price %>">
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea class="form-control" id="description" name="description"><%= description %></textarea>
        </div>
        
        <div class="mb-3">
                    <label for="foodCategory" class="form-label">Food Category</label>
                    <select class="form-select" id="foodCategory" name="foodCategory" required>
                        <option value="<%= category %>" selected><%= category %></option>
                        <option value="Fast food">Fast food</option>
                        <option value="Desert">Desert</option>
                        <option value="Salad">salad</option>
                        <option value="Beverage">Beverage</option>
                        <option value="Curry">Curry</option>
                        <option value="Sweet">Sweet</option>
                    </select>
                </div>
        
        <%-- <div class="mb-3">
            <label for="category" class="form-label">Category</label>
            <input type="text" class="form-control" id="category" name="category" value="<%= category %>">
        </div> --%>
        
        <button type="submit" class="btn btn-danger">Update</button>
        <a href="foodStore.jsp" class="btn btn-secondary">Cancel</a>
    </form> 
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>