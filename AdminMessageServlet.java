package com.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminMessageServlet")
public class AdminMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String massage = request.getParameter("massage");
		String sID = request.getParameter("sellerID");
		   
        response.setContentType("text/html");
        
        boolean isTrue;
    	// Insert seller msg
        isTrue = userDBUtil.insertAdminMsg(massage,sID,request);

        if (isTrue == true) {
            RequestDispatcher disa = request.getRequestDispatcher("adminChatBox.jsp");
            disa.forward(request, response);
        } else {
        	PrintWriter out = response.getWriter();
            out.println("<html><body><h3>Error: Could not send message to seller. Please try again later.</h3></body></html>");
            return;
        }
	}

}
