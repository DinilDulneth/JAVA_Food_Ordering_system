package com.user;

public class Payment extends Foods {
    private int paymentID;
    private int userID;
    private String payment_method;
    private String date;

    // Constructor for Payment
    public Payment(int paymentID, int userID,String payment_method,String date , int foodID, int sellerID, String food_name, String description, String price, String seller_name, String address,String email,String password, String contactNumber, String shop_name) {
        super(foodID, sellerID, food_name, description, price, seller_name, address,email,password, contactNumber, shop_name);
        this.paymentID = paymentID;
        this.userID = userID;
        this.payment_method = payment_method;
        this.date = date;
    }
	public int getPaymentID() {
		return paymentID;
	}

	public int getUserID() {
		return userID;
	}

	public String getPayment_method() {
		return payment_method;
	}

	public String getDate() {
		return date;
	}

	public String getPrice() {
		return super.getPrice();
	}
	public String getFoodName() {
		return super.getFood_name();
	}
	public String getShopName() {
		return super.getShop_name();
	}
	public String getContactNumber() {
		return super.getContactNumber();
	}
    
}
