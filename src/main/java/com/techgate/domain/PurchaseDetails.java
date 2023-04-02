package com.techgate.domain;

public class PurchaseDetails {
	
	private int id = 0;
	private int orderId = 0;
	private int product_id = 0;
	private String productName = null;
	private String img_loc = null;
	private int qty = 0;
	private double productprice = 0.0d;
	private double netAmount = 0.0d;
	private String productColor = null;
	public String getProductColor() {
		return productColor;
	}
	public void setProductColor(String productColor) {
		this.productColor = productColor;
	}
	private String productSize = null;
	
	public String getProductSize() {
		return productSize;
	}
	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public void setImg_loc(String imgLoc) {
		img_loc = imgLoc;
	}
	
	public String getProductName() {
		return productName;
	}
	public String getImg_loc() {
		return img_loc;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int productId) {
		product_id = productId;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public double getProductprice() {
		return productprice;
	}
	public void setProductprice(double productprice) {
		this.productprice = productprice;
	}
	public double getNetAmount() {
		return netAmount;
	}
	public void setNetAmount(double netAmount) {
		this.netAmount = netAmount;
	}
}
