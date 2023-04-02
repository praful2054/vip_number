package com.techgate.domain;

import java.util.Date;

public class ProductOtherDetail {
	private int product_id = 0;
	
	private double ratewhite = 0;
	private double rateivory = 0;
	private int discount = 0;
	private int flatdiscountedrate = 0;
	private int rateInRupee = 0;
	private int rateInDollar = 0;
	private String updated_by=null;
	private Date updated_date = null;
	private String created_by=null;
	private Date Created_date = null;
	
	private int rateblack = 0;
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int productId) {
		product_id = productId;
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
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getFlatdiscountedrate() {
		return flatdiscountedrate;
	}
	public void setFlatdiscountedrate(int flatdiscountedrate) {
		this.flatdiscountedrate = flatdiscountedrate;
	}
	public double getRatewhite() {
		return ratewhite;
	}
	public void setRatewhite(double ratewhite) {
		this.ratewhite = ratewhite;
	}
	public double getRateivory() {
		return rateivory;
	}
	public void setRateivory(double rateivory) {
		this.rateivory = rateivory;
	}

	public String getUpdated_by() {
		return updated_by;
	}
	public void setUpdated_by(String updated_by) {
		this.updated_by = updated_by;
	}
	public Date getUpdated_date() {
		return updated_date;
	}
	public void setUpdated_date(Date updated_date) {
		this.updated_date = updated_date;
	}
	public String getCreated_by() {
		return created_by;
	}
	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}
	public Date getCreated_date() {
		return Created_date;
	}
	public void setCreated_date(Date created_date) {
		Created_date = created_date;
	}
	public int getRateblack() {
		return rateblack;
	}
	public void setRateblack(int rateblack) {
		this.rateblack = rateblack;
	}	
	
	
	
}
