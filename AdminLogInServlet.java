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
import com.user.userDBUtil;

@WebServlet("/AdminLogInServlet")
public class AdminLogInServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        try {
            List<Admin> adminDetails = userDBUtil.AdminValidation(name, password);
            
            if (adminDetails != null && !adminDetails.isEmpty()) {
                HttpSession session = request.getSession();
                session.setAttribute("admin", adminDetails.get(0)); 
                
                request.setAttribute("adminDetails", adminDetails);
                RequestDispatcher dis = request.getRequestDispatcher("AdminDashboard.jsp");
                dis.forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Invalid admin name or password!!! try again :)");
                RequestDispatcher dis = request.getRequestDispatcher("AdminLogin.jsp");
                dis.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred. Please try again!!! try again :)");
            RequestDispatcher dis = request.getRequestDispatcher("AdminLogin.jsp");
            dis.forward(request, response);
        }
        
      //for session---------------------------------------------
        
        List<Admin> adminID = userDBUtil.AdminValidation(name, password);
        for (Admin ad : adminID) {
        	ad.getID();
        	
        	HttpSession session2 = request.getSession();
        	session2.setAttribute("adminID", ad.getID());
        	session2.setAttribute("adminName", ad.getAdmin_name());
        	session2.setAttribute("adminPassword", ad.getPassword());
        }
        //--------------------------------------------------------
    }
}
