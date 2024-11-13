package com.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;



@WebServlet("/InsertFoodServlet")
@MultipartConfig
public class InsertFoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fName = request.getParameter("foodName");
		String price = request.getParameter("foodPrice");
		double convPrice = Double.parseDouble(price);
		String description = request.getParameter("foodDescription");
		String category = request.getParameter("foodCategory");
		
		int sellerID = (int) request.getSession().getAttribute("sellerID");
		
		FoodModel fModel =  new FoodModel();
		fModel.setSellerID(sellerID);
		fModel.setfName(fName);
		fModel.setDescription(description);
		fModel.setPrice(convPrice);
		fModel.setCategory(category);
		
		boolean isInserted = userDBUtil.insertFood(fModel);
		
		if(isInserted) {
			
			request.getRequestDispatcher("foodStore.jsp").forward(request, response);
		}
		
		else {
			 request.setAttribute("errorMessage", "Failed to add the food item.");
	         request.getRequestDispatcher("addFood.jsp").forward(request, response);
		}
		
	}
	


}


