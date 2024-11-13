package com.user;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteFoodServlet")
public class DeleteFoodServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String id = request.getParameter("foodId");
        
        int sID = (int) request.getSession().getAttribute("sellerID");

        boolean isDeleted = userDBUtil.deleteFood(id);
        
        if (isDeleted) {
            try {
                
                
                // Forward to foodStore.jsp with the updated food list
                request.getRequestDispatcher("foodStore.jsp").forward(request, response);
                
            } catch (Exception e) {
                request.setAttribute("errorMessage", "An error occurred while fetching food details.");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            }
            
        } else {
            // Handle failure in deleting the food item
            request.setAttribute("errorMessage", "Failed to delete the food item.");
            request.getRequestDispatcher("deleteFood.jsp").forward(request, response);
        }
    }
}
