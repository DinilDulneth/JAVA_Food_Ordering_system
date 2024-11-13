package com.user;

public class Delete_user_account {

	private String dalete_reson;
	private int userID;
	private String date;
	
	public Delete_user_account(String dalete_reson, int userID, String date) {
		this.dalete_reson = dalete_reson;
		this.userID = userID;
		this.date = date;
	}
	
	public String getDalete_reson() {
		return dalete_reson;
	}

	public int getUserID() {
		return userID;
	}


	public String getDate() {
		return date;
	}

	

}
