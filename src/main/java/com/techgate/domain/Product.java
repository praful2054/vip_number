package com.techgate.domain;

import java.util.Date;

public class Product {
	private int product_id  = 0;
	private int cate_id = 0;
	private String productName = null;
	private String productCode = null;
	private String productBrand = null;
	private String productColor = null;
	private String natureOfProduct = null;
	private String indication = null;
	private String useDirection = null;
	private String packing = null;
	private String descript = null;
	private String vegProduct = null;
	private String additinalDescription = null;
	private String type = null;
	private Date updated_date = null;
	private String status = null;
	private String sizeheight = null;
	private String sizelength = null;
	private String liters = null;
	private String trap = null;
	private String updated_by=null;
	private String created_by=null;
	private Date Created_date = null;
	private int vendor_id = 0;
	private String recharge_validity=null;
	private String number_status =null;
	private String lastCall=null;
	private String nextCall=null;
	private String number=null;
	private String buyerName=null;
	private String currentNumber=null;
	private String buyerContact=null;
	private String fileID=null;
	private String Comments=null;
	private int rateInRupee = 0;
	private int rateblack = 0;
	private String cate_name="";
	private String vendorname="";
	
	
	public int getRateInRupee() {
		return rateInRupee;
	}
	public void setRateInRupee(int rateInRupee) {
		this.rateInRupee = rateInRupee;
	}
	public int getRateblack() {
		return rateblack;
	}
	public void setRateblack(int rateblack) {
		this.rateblack = rateblack;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int productId) {
		product_id = productId;
	}
	public int getCate_id() {
		return cate_id;
	}
	public void setCate_id(int cateId) {
		cate_id = cateId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getNatureOfProduct() {
		return natureOfProduct;
	}
	public void setNatureOfProduct(String natureOfProduct) {
		this.natureOfProduct = natureOfProduct;
	}
	public String getIndication() {
		return indication;
	}
	public void setIndication(String indication) {
		this.indication = indication;
	}
	public String getUseDirection() {
		return useDirection;
	}
	public void setUseDirection(String useDirection) {
		this.useDirection = useDirection;
	}
	public String getPacking() {
		return packing;
	}
	public void setPacking(String packing) {
		this.packing = packing;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	public String getVegProduct() {
		return vegProduct;
	}
	public void setVegProduct(String vegProduct) {
		this.vegProduct = vegProduct;
	}
	public String getAdditinalDescription() {
		return additinalDescription;
	}
	public void setAdditinalDescription(String additinalDescription) {
		this.additinalDescription = additinalDescription;
	}
	public Date getUpdated_date() {
		return updated_date;
	}
	public void setUpdated_date(Date updatedDate) {
		updated_date = updatedDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getType() {
		return type;
	}
	public String getProductBrand() {
		return productBrand;
	}
	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}
	public String getProductColor() {
		return productColor;
	}
	public void setProductColor(String productColor) {
		this.productColor = productColor;
	}
	public String getSizeheight() {
		return sizeheight;
	}
	public void setSizeheight(String sizeheight) {
		this.sizeheight = sizeheight;
	}
	public String getSizelength() {
		return sizelength;
	}
	public void setSizelength(String sizelength) {
		this.sizelength = sizelength;
	}
	public String getLiters() {
		return liters;
	}
	public void setLiters(String liters) {
		this.liters = liters;
	}
	public String getTrap() {
		return trap;
	}
	public void setTrap(String trap) {
		this.trap = trap;
	}
	public String getUpdated_by() {
		return updated_by;
	}
	public void setUpdated_by(String updated_by) {
		this.updated_by = updated_by;
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
	public int getVendor_id() {
		return vendor_id;
	}
	public void setVendor_id(int vendor_id) {
		this.vendor_id = vendor_id;
	}
	public String getRecharge_validity() {
		return recharge_validity;
	}
	public void setRecharge_validity(String recharge_validity) {
		this.recharge_validity = recharge_validity;
	}
	public String getNumber_status() {
		return number_status;
	}
	public void setNumber_status(String number_status) {
		this.number_status = number_status;
	}
	public String getLastCall() {
		return lastCall;
	}
	public void setLastCall(String lastCall) {
		this.lastCall = lastCall;
	}
	public String getNextCall() {
		return nextCall;
	}
	public void setNextCall(String nextCall) {
		this.nextCall = nextCall;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public String getCurrentNumber() {
		return currentNumber;
	}
	public void setCurrentNumber(String currentNumber) {
		this.currentNumber = currentNumber;
	}
	public String getBuyerContact() {
		return buyerContact;
	}
	public void setBuyerContact(String buyerContact) {
		this.buyerContact = buyerContact;
	}
	public String getFileID() {
		return fileID;
	}
	public void setFileID(String fileID) {
		this.fileID = fileID;
	}
	public String getComments() {
		return Comments;
	}
	public void setComments(String comments) {
		Comments = comments;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public String getVendorname() {
		return vendorname;
	}
	public void setVendorname(String vendorname) {
		this.vendorname = vendorname;
	}
	
	
	
	
}
