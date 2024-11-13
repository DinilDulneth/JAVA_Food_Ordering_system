<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add New Food Item</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
background-color: #f8f9fa;
}
.form-container {
background-color: #ffffff;
border-radius: 10px;
box-shadow: 0 0 10px rgba(0,0,0,0.1);
padding: 30px;
margin-top: 50px;
}
h1 {
color: #007bff;
margin-bottom: 30px;
}
</style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 form-container">
            <h1 class="text-center mb-4">Add New Food Item</h1>
            
            <form action="insertFood" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                <div class="mb-3">
                    <label for="foodName" class="form-label">Food Name</label>
                    <input type="text" class="form-control" id="foodName" name="foodName" required>
                </div>
                
                <div class="mb-3">
                    <label for="foodPrice" class="form-label">Food Price</label>
                    <div class="input-group">
                        <span class="input-group-text">Rs</span>
                        <input type="number" class="form-control" id="foodPrice" name="foodPrice" step="0.01" required>
                    </div>
                </div>
                
                <div class="mb-3">
                    <label for="foodDescription" class="form-label">Food Description</label>
                    <textarea class="form-control" id="foodDescription" name="foodDescription" rows="3" required></textarea>
                </div>
                
                <!-- <div class="mb-3">
                    <label for="foodPicture" class="form-label">Food Picture</label>
                    <input type="file" class="form-control" id="foodPicture" name="foodPicture" accept="image/*" required>
                </div> -->
                
                <div class="mb-3">
                    <label for="foodCategory" class="form-label">Food Category</label>
                    <select class="form-select" id="foodCategory" name="foodCategory" required>
                        <option value="" selected disabled>Select a category</option>
                        <option value="Fast food">Fast food</option>
                        <option value="Dessert">Desert</option>
                        <option value="Salad">salad</option>
                        <option value="Beverage">Beverage</option>
                        <option value="Curry">Curry</option>
                        <option value="Sweet">Sweet</option>
                    </select>
                </div>
                
                <div class="d-grid">
                    <button type="submit" class="btn btn-success btn-lg">Submit</button>
                </div>
                
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS (optional, for certain Bootstrap features) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script>
function validateForm() {
    const foodPrice = document.getElementById("foodPrice").value;

    // Ensure the food price is a positive number
    if (foodPrice <= 0) {
        alert("Food price must be a positive number.");
        return false; // Prevent form submission
    }
    return true;
}
</script>

</body>
</html>