package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DBConnect")
public class DBConnect {
	
	private static String url = "jdbc:mysql://localhost:3306/food_ordering_system_db";
	private static String userName = "root";
	private static String password = "3572315dinil";
	private static Connection con;
	
public static Connection getConnection(){
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, userName, password);
		}
		catch(Exception e) {
			System.out.println("database is not success!!");
		}
		return con;
	}
	
}
