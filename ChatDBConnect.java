package com.user;

import java.sql.Connection;
import java.sql.DriverManager;

public class ChatDBConnect {
	private static String url = "jdbc:mysql://localhost:3306/db_chatbox_food_ordering";
	private static String userName = "root";
	private static String password = "3572315dinil";
	private static Connection conChatDB;
	
public static Connection getChatDBConnection(){
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			conChatDB = DriverManager.getConnection(url, userName, password);
		}
		catch(Exception e) {
			System.out.println("database is not success!!");
		}
		return conChatDB;
	}
}
