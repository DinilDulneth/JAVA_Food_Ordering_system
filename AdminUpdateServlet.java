package com.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateCustomerServlet")
public class AdminUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String adminID = request.getParameter("adminID");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String telno = request.getParameter("telno");
		
		boolean isTrue;
		
		isTrue = userDBUtil.updateAdmin(adminID,name,email,password,fname,lname,telno);
		
		if(isTrue == true) {
			List<Admin> cusDetails = userDBUtil.getAgainAdminDetails(adminID);
			request.setAttribute("cusDetails", cusDetails);
			
			request.setAttribute("updateMessage", "Admin details updated successfully!");
			
			RequestDispatcher dis = request.getRequestDispatcher("adminProfile.jsp");
			dis.forward(request, response);
			
		}else {
			List<Admin> cusDetails = userDBUtil.getAgainAdminDetails(adminID);
			request.setAttribute("cusDetails", cusDetails);
			
			request.setAttribute("updateMessage", "Failed to update admin details.");
			
			RequestDispatcher dis = request.getRequestDispatcher("adminProfile.jsp");
			dis.forward(request, response);
			
		}
	}

}
