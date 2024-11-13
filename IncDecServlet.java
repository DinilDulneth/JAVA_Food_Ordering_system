package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.foodCart;


@WebServlet("/IncDecServlet")
public class IncDecServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter output = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		
		try {
			
			String action = request.getParameter("action");
			int id = Integer.parseInt(request.getParameter("id"));
			
			HttpSession session = request.getSession(false);
            ArrayList<foodCart> cart_list = (ArrayList<foodCart>) session.getAttribute("cart_list");
			
			if(action != null && id >= 0) {
				
				if(action.equals("inc")) {
					
					for(foodCart item: cart_list) {
							if(item.getFoodId() == id) {
								
								int quantity = item.getQuantity();
								quantity++;
								item.setQuantity(quantity);
								response.sendRedirect("foodCart.jsp");
							}
					}
				}
				
				if(action.equals("dec")) {
					
					for(foodCart item: cart_list) {
						
							if(item.getFoodId() == id) {
								int quantity = item.getQuantity();
								quantity--;
								
								if(quantity == 0) {
									
									quantity++;								
								}
								item.setQuantity(quantity);
								break;
							}
					}
					response.sendRedirect("foodCart.jsp");
				}
				
			}
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
