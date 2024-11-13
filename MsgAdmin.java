package com.user;

public class MsgAdmin {
	private int aid;
	private String massage;
	private String date;
	private String time;
	public MsgAdmin(int aid, String massage, String date, String time) {
		super();
		this.aid = aid;
		this.massage = massage;
		this.date = date;
		this.time = time;
	}
	public int getAid() {
		return aid;
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
