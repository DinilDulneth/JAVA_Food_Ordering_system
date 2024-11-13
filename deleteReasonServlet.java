package com.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteReasonServlet")
public class deleteReasonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String date = request.getParameter("date");
		String reason = request.getParameter("reason");
		
		
		boolean isTrue;
		
		
		isTrue = userDBUtil.deleteReasonInsert(userId, date, reason);
		
		if(isTrue == true) {
			
			RequestDispatcher dis = request.getRequestDispatcher("userDelete.jsp");
			dis.forward(request, response);
		} else {
			
			RequestDispatcher dis = request.getRequestDispatcher("error.jsp");
			dis.forward(request, response);
			
			
		}
		
		
	}

}
