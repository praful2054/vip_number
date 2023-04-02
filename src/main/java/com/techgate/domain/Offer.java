package com.techgate.domain;

import java.util.Date;

public class Offer {

	private int offerId = 0;
	private String offerName = null;
	private String offerType = null;
	private double discountValue = 0.0;
	private String assoicatedProducts = null;
	private Date creationDate = null;
	private Date expiryDate = null;
	private int noOfDays = 0;
	private String is_enabled = null;
	public int getOfferId() {
		return offerId;
	}
	public void setOfferId(int offerId) {
		this.offerId = offerId;
	}
	public String getOfferName() {
		return offerName;
	}
	public void setOfferName(String offerName) {
		this.offerName = offerName;
	}
	public String getOfferType() {
		return offerType;
	}
	public void setOfferType(String offerType) {
		this.offerType = offerType;
	}
	public void setDiscountValue(double discountValue) {
		this.discountValue = discountValue;
	}
	public double getDiscountValue() {
		return discountValue;
	}
	public String getAssoicatedProducts() {
		return assoicatedProducts;
	}
	public void setAssoicatedProducts(String assoicatedProducts) {
		this.assoicatedProducts = assoicatedProducts;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	public Date getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}
	public int getNoOfDays() {
		return noOfDays;
	}
	public void setNoOfDays(int noOfDays) {
		this.noOfDays = noOfDays;
	}
	public String getIs_enabled() {
		return is_enabled;
	}
	public void setIs_enabled(String is_enabled) {
		this.is_enabled = is_enabled;
	}
}
