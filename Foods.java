package com.user;

public class Foods extends Seller {
	
	private int foodID;
	private String food_name;
	private String description;
	private String price;
	
	public Foods(int foodID, int sellerID, String food_name, String description, String price,
			String seller_name, String address, String email, String password, String contactNumber, String shop_name) {
        super(sellerID, seller_name, address, email, password, contactNumber, shop_name); 
        this.foodID = foodID;
        this.food_name = food_name;
        this.description = description;
        this.price = price;
    }

	public int getFoodID() {
		return foodID;
	}

	public String getFood_name() {
		return food_name;
	}

	public String getDescription() {
		return description;
	}

	public String getPrice() {
		return price;
	}
	public int getShopId() {
        return super.getSellerID(); 
    }

	
}
