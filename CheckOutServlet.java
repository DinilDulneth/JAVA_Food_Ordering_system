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

import com.user.OrderModel;
import com.user.foodCart;
import com.user.userDBUtil;


@WebServlet("/CheckOutServlet")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try (PrintWriter output = response.getWriter()){
			HttpSession session = request.getSession();
            ArrayList<foodCart> cart_list = (ArrayList<foodCart>) session.getAttribute("cart_list");
            
            HttpSession session1 = request.getSession();
    		Integer userID = (Integer) session1.getAttribute("uID");
    		String paymentMethod = request.getParameter("paymentMethod");
            String address = request.getParameter("Address");
            
            //user session
            if(cart_list != null) {
            	for(foodCart item: cart_list) {
            		OrderModel order = new OrderModel();
            		order.setFoodId(item.getFoodId());
            		order.setSellerID(item.getSellerID());
            		order.setQuantity(item.getQuantity());
            		order.setUserId(userID);
            		order.setPaymentMethod(paymentMethod); 
                    order.setAddress(address); 
            		
                    
                    output.println("Food ID: " + order.getFoodId());
                    output.println("Seller ID: " + order.getSellerID());
                    output.println("Quantity: " + order.getQuantity());
                    output.println("User ID: " + order.getUserId());
                    output.println("Payment Method: " + order.getPaymentMethod());
                    output.println("Address: " + order.getAddress());
                    
            		boolean isInserted = userDBUtil.insertOrder(order);
            	
					if(isInserted == true) {
	            		cart_list.clear();
	            		response.sendRedirect("homePage.jsp");
					}
					else {
						response.sendRedirect("foodCart.jsp");
					}
				}
            }
            
            else {
				response.sendRedirect("error.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
