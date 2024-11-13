package com.user;

public class Admin {
	private int ID;
	private String admin_name;
	private String email;
	private String password;
	private String F_name;
	private String L_name;
	private String contactNumber;
	
	public Admin(int iD, String admin_name, String email, String password, String f_name, String l_name,
			String contactNumber) {
		ID = iD;
		this.admin_name = admin_name;
		this.email = email;
		this.password = password;
		F_name = f_name;
		L_name = l_name;
		this.contactNumber = contactNumber;
	}
	
	public int getID() {
		return ID;
	}
	
	public String getAdmin_name() {
		return admin_name;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getPassword() {
		return password;
	}
	
	public String getF_name() {
		return F_name;
	}
	
	public String getL_name() {
		return L_name;
	}
	
	public String getContactNumber() {
		return contactNumber;
	}
	
	
	
}
