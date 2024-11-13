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


@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()) {
			
			ArrayList<foodCart> cartList = new ArrayList<foodCart>();
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			String sellerId = request.getParameter("sellerId");
			
			foodCart cart = new foodCart();
			
			cart.setFoodId(id);
			cart.setQuantity(1);
			
			HttpSession session = request.getSession();
			
			
			ArrayList<foodCart> cart_list = (ArrayList<foodCart>) session.getAttribute("cart_list");
			
			if(cart_list == null) {
				cartList.add(cart);
				session.setAttribute("cart_list", cartList);
				response.sendRedirect("foodList.jsp?sellerId=" + sellerId );
			}
			else {
				cartList = cart_list;
				
				boolean exists = false;
				
				for(foodCart cartItem: cart_list) {
					if(cartItem.getFoodId() == id) {
						exists = true;
						out.println("<h3>food exists in the cart <a href='foodCart.jsp'>Back to food cart</a></h3>");
					}
					
				}
				
				if(!exists) {
					cartList.add(cart);
					response.sendRedirect("foodList.jsp?sellerId=" + sellerId );
				}
			}
	
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
