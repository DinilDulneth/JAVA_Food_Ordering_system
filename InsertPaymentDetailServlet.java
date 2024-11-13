package com.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/InsertPaymentDetailServlet")
public class InsertPaymentDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session1 = request.getSession();
		Integer userID = (Integer) session1.getAttribute("uID");
		
		int fID =Integer.parseInt(request.getParameter("foodID"));
        int qntt = Integer.parseInt(request.getParameter("quntity"));
        String address = request.getParameter("Address");
        int sID = Integer.parseInt(request.getParameter("sellerid"));
        String paymentMethod = request.getParameter("paymentMethod");

        PrintWriter output = response.getWriter();
        response.setContentType("text/html");
        
        output.println("Food ID: " + fID);
        output.println("Seller ID: " + sID);
        output.println("Quantity: " + qntt);
        output.println("User ID: " + userID);
        output.println("Payment Method: " +paymentMethod);
        output.println("Address: " + address);
        
        boolean isTrue;
        
        isTrue = userDBUtil.insertPayment(userID,fID,paymentMethod,sID,qntt,address);

       if (isTrue) {
    	   request.setAttribute("message", "Payment inserted successfully!");
          RequestDispatcher dis = request.getRequestDispatcher("homePage.jsp");
            dis.forward(request, response);
        } else {
        	request.setAttribute("error", "Failed to insert payment. Please try again.");
        	RequestDispatcher dis = request.getRequestDispatcher("foodCart.jsp");
           dis.forward(request, response);
           return;
        

   }
        
	}

}
