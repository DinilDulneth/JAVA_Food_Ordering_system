package com.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    	userDBUtil cn =new userDBUtil();
    	
    	// Retrieve contactID from the request
    	
    	
        String contactID = request.getParameter("contactID");
        boolean isTrue;

        // Call the controller to delete the data
        isTrue = cn.deletedata(contactID);

        // If deletion is successful
        if (isTrue) {
            String alertMessage = "Data Delete Successful";
            response.getWriter().println("<script>alert('" + alertMessage + "');" +
                "window.location.href='ContactgetServlet';</script>");
        } 
        // If deletion failed
        else {
            List<ContactModel> noticedetails = cn.getByID(contactID);
            request.setAttribute("noticedetails", noticedetails);
            
            // Forward to error page
            RequestDispatcher dispatcher = request.getRequestDispatcher("Wrong.jsp");
            dispatcher.forward(request, response);
        }
    }
}

