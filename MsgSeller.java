package com.user;

public class MsgSeller {
	private int sid;
	private String massage;
	private String date;
	private String time;
	public MsgSeller(int sid, String massage, String date, String time) {
		this.sid = sid;
		this.massage = massage;
		this.date = date;
		this.time = time;
	}
	public int getSid() {
		return sid;
	}
	public String getMassage() {
		return massage;
	}
	public String getDate() {
		return date;
	}
	public String getTime() {
		return time;
	}
	
}
