package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/deleteSellerServlet")
public class deleteSellerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sellerIDStr = request.getParameter("sellerID");
        
        if (sellerIDStr != null && !sellerIDStr.isEmpty()) {
            try {
                int sellerID = Integer.parseInt(sellerIDStr);
                
                // Delete seller account from the main database
                boolean isSuccess = userDBUtil.deletesellerAccount(sellerID);
                
                if (isSuccess) {
   // Delete seller's chat table--------------------------------------------------------------
                    Connection conChatDB = null;
                    Statement stmt = null;

                    try {
                        conChatDB = ChatDBConnect.getChatDBConnection();
                        stmt = conChatDB.createStatement();
                        
                        // Delete the table associated with the seller
                        String tableName = "messages_" + sellerID;
                        String sql = "DROP TABLE IF EXISTS "+ tableName+" ";
                        stmt.executeUpdate(sql);

                        response.sendRedirect("sellerProfiles.jsp?status=deleted");

                    } catch (SQLException e) {
                        e.printStackTrace();
                        request.setAttribute("errorMessage", "Error occurred while deleting seller messages.");
                        request.getRequestDispatcher("errorPage.jsp").forward(request, response);

                    } finally {
                        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (conChatDB != null) try { conChatDB.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }

                } else {
                    request.setAttribute("errorMessage", "Error occurred while deleting seller account.");
                    request.getRequestDispatcher("errorPage.jsp").forward(request, response);
                }

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
