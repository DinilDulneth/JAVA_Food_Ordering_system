package com.user;

public class OrderModel extends FoodModel{
	private int orderId;
	private int userId;
//	private int sellerId;
	private int quantity;
	private String address;
	private String paymentMethod;
	private double totalPrice;
	
	public OrderModel() {
		this.orderId = 0;
		this.userId = 0;
		//this.sellerId = 0;
		this.quantity = 0;
		this.address = null;
		this.paymentMethod = null;
		this.totalPrice = 0.0;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
//	public int getSellerId() {
//		return sellerId;
//	}
//	public void setSellerId(int sellerId) {
//		this.sellerId = sellerId;
//	}
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
	
	
}