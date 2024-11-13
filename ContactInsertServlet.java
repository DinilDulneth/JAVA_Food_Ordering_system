package com.user;

import java.io.IOException;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ContactInsertServlet")
public class ContactInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session1 = request.getSession();
		 Integer userID = (Integer) session1.getAttribute("uID");
			if (userID == null) {
			    System.out.println("No user logged in.");
			}
		
		userDBUtil cn =new userDBUtil();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String msg_text = request.getParameter("msg_text");
		String date = request.getParameter("date");
		
		boolean isTrue;
		isTrue = cn.instertdata(name,email,phone,msg_text,date,userID);
		
		if(isTrue == true) {
			String alertMessage = "Data Insert Successful";
			response.getWriter().println("<script> alert ('"+alertMessage+"');window.location.href='ContactgetServlet'</script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("Wrong.jsp");
			dis2.forward(request,response);
		}
		
	}

}
