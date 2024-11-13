package com.user;

public class LoginHistory {
	private int loginID;
	private int userID;
	private String date;
	private String ip_address;
	private String devise_info;
	public LoginHistory(int loginID, int userID, String date, String ip_address, String devise_info) {
		
		this.loginID = loginID;
		this.userID = userID;
		this.date = date;
		this.ip_address = ip_address;
		this.devise_info = devise_info;
	}
	public int getLoginID() {
		return loginID;
	}
	
	public int getUserID() {
		return userID;
	}

	public String getDate() {
		return date;
	}
	
	public String getIp_address() {
		return ip_address;
	}

	public String getDevise_info() {
		return devise_info;
	}

	
	
}
