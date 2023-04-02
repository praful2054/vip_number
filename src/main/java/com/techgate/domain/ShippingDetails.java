package com.techgate.domain;

public class ShippingDetails {
	private int id = 0;
	private int orderId = 0;
	private String courierName ="";
	private int trackingNo=0;
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
	public String getCourierName() {
		return courierName;
	}
	public void setCourierName(String courierName) {
		this.courierName = courierName;
	}
	public int getTrackingNo() {
		return trackingNo;
	}
	public void setTrackingNo(int trackingNo) {
		this.trackingNo = trackingNo;
	}
	
	
	
}
