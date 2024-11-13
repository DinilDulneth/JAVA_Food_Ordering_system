package com.user;

import java.io.IOException;           // USER LOGIN SERVLET || RUKSHAN E A Y
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		
		PrintWriter out = response.getWriter();         // PrintWriter to write HTML responses directly to the User
		response.setContentType("text/html");
				
//======== from dinil =================================================================================
		
		Connection con = null;
		PreparedStatement stmt = null;
	
		try { //rukshan user login part
			List<User> userDetails = userDBUtil.validateLogIn(name, password);

		
			
			if (userDetails != null && !userDetails.isEmpty()) {
				
				request.setAttribute("userDetails", userDetails);
				RequestDispatcher dis = request.getRequestDispatcher("homePage.jsp");
				dis.forward(request, response);
				
				//automaticlly fill the userloginHstory -- by Dinil (It23268494)
			    User userobj = userDetails.get(0);  // Assuming one user is returned
			    int userID = userobj.getID();  // Get the user ID

			    String ipAddress = request.getRemoteAddr();  // Get IP address
			    String deviceInfo = request.getHeader("User-Agent");  // Get device info
			    
			    con = DBConnect.getConnection();
			    String sql = "INSERT INTO loginhistory (userID, login_time, ip_address, device_info) VALUES (?, ?, ?, ?)";
			    stmt = con.prepareStatement(sql);
			    
			    stmt.setInt(1, userID);  
			    stmt.setTimestamp(2, new Timestamp(System.currentTimeMillis()));  
			    stmt.setString(3, ipAddress);  
			    stmt.setString(4, deviceInfo);  
			    int result = stmt.executeUpdate();
//==============================================================================================
			     
			    //System.out.println("Login history inserted: " + result); 
			    //rukshan user login part
			}else {
                
				 out.println("<script type='text/javascript'>");
				 out.println("alert('Your username or password is incorrect');");
				 out.println("location='logUi.jsp'"); out.println("</script>");
				 
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			
			try {
				if (stmt != null) stmt.close();
				if (con != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}

