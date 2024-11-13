package com.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/deleteUserServlet")
public class deleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String userIDStr = request.getParameter("userID");
	    if (userIDStr != null && !userIDStr.isEmpty()) {
	        try {
	            int userID = Integer.parseInt(userIDStr);
	            
	            userDBUtil.deleteUserAccount(userID);
	            
	            response.sendRedirect("userProfiles.jsp?status=deleted"); 
	        
	        } catch (NumberFormatException e) {
	            request.setAttribute("errorMessage", "Invalid User ID format");
	            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
	        }
	    } else {
	        request.setAttribute("errorMessage", "User ID cannot be null or empty");
	        request.getRequestDispatcher("errorPage.jsp").forward(request, response);
	    }
	}

}
