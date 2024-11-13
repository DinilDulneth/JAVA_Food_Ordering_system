package com.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/EditFoodServlet")
public class EditFoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("foodId");
		String name = request.getParameter("fName");
		String price = request.getParameter("price");
		String description = request.getParameter("description");
		String category = request.getParameter("foodCategory");
		
		int sellerID = (int) request.getSession().getAttribute("sellerID");
		
		boolean isUpdated = userDBUtil.updateFood(id, name, price, description, category);
		
		if(isUpdated) {
			/**/
			
			request.getRequestDispatcher("foodStore.jsp").forward(request, response);
		}
		
		else {
			request.setAttribute("errorMessage", "Failed to add the food item.");
	        request.getRequestDispatcher("addFood.jsp").forward(request, response);
		}
		
	}

}
