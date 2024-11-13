package com.user;

public class ContactModel {
	
	
	private int contactID;
	private String name;
	private String email;
	private String phone;
	private String msg_text;
	private String date;
	private int uid;
	
	
	
	
	public ContactModel(int contactID, String name, String email, String phone, String msg_text, String date,int uid) {
		super();
		this.contactID = contactID;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.msg_text = msg_text;
		this.date = date;
		this.uid= uid;
	}




	public int getContactID() {
		return contactID;
	}




	public void setContactID(int contactID) {
		this.contactID = contactID;
	}




	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	public String getPhone() {
		return phone;
	}




	public void setPhone(String phone) {
		this.phone = phone;
	}




	public String getMsg_text() {
		return msg_text;
	}




	public void setMsg_text(String msg_text) {
		this.msg_text = msg_text;
	}




	public String getDate() {
		return date;
	}




	public void setDate(String date) {
		this.date = date;
	}
	
	
	public int getuid() {
		return uid;
	}
	

}
