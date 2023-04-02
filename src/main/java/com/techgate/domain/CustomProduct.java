package com.techgate.domain;

import java.io.Serializable;

public class CustomProduct implements Serializable{


	private static final long serialVersionUID = 6558775812987265537L;
	private int product_id = 0;
	private String productName = null; 
	private String number = null; 
	private String type = null;
	private String img_loc = null;
	private String productBrand = null;
	private int discount = 0;
	private String productColor=null;
	private String productSize=null;
	private String productCode=null;
	private String trap=null;
	private String liters=null;
	private int rateInRupee = 0;
	private int rateInDollar = 0;
	
	public String getProductSize() {
		return productSize;
	}
	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}
	public String getProductColor() {
		return productColor;
	}
	public void setProductColor(String productColor) {
		this.productColor = productColor;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getProductBrand() {
		return productBrand;
	}
	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int productId) {
		product_id = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	public String getImg_loc() {
		return img_loc;
	}
	public void setImg_loc(String imgLoc) {
		img_loc = imgLoc;
	}
	
	
	
	public int getRateInRupee() {
		return rateInRupee;
	}
	public void setRateInRupee(int rateInRupee) {
		this.rateInRupee = rateInRupee;
	}
	public int getRateInDollar() {
		return rateInDollar;
	}
	public void setRateInDollar(int rateInDollar) {
		this.rateInDollar = rateInDollar;
	}
	public String getTrap() {
		return trap;
	}
	public void setTrap(String trap) {
		this.trap = trap;
	}
	public String getLiters() {
		return liters;
	}
	public void setLiters(String liters) {
		this.liters = liters;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	
	
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	@Override
	public boolean equals(Object obj) {		
		if (obj instanceof CustomProduct) {
			CustomProduct product = (CustomProduct) obj;
			if(product.getProduct_id() == this.product_id)
				return true;	
		}
		return false;
	}
	
	@Override
	public int hashCode() {
		return product_id;
	}
}
