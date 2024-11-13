package com.user;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ContactgetServlet")
public class ContactgetServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

   

    // Handles GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
    	userDBUtil cn =new userDBUtil();
  
		HttpSession session1 = request.getSession();
		 Integer userID = (Integer) session1.getAttribute("uID");
			if (userID == null) {
			    System.out.println("No user logged in.");
			}
    	
    	List<ContactModel> all_contact_us = cn.gettAllnotice(userID);
	        request.setAttribute("all_contact_us", all_contact_us);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("display.jsp");
	        dispatcher.forward(request, response);
    }
}
