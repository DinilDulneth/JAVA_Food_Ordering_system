package com.user;

import java.util.List;

public interface ConInterface {
	
	
	
	
	public  boolean instertdata(String name, String email, String phone, String msg_text, String date);
	
	public  List<ContactModel> getByID (String Id);
	public  List<ContactModel> gettAllnotice ();
	public  boolean updateData(String contactID, String name, String email,String phone,String msg_text,String date);
	public  boolean deletedata (String contactID);
	

}
