package com.user;

public class DeleteReason {
	
	private int userId;
	private String date;
	private String reason;
	public DeleteReason(int userId, String date, String reason) {
		
		this.userId = userId;
		this.date = date;
		this.reason = reason;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	

}
