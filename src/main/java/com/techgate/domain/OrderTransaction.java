package com.techgate.domain;

import java.util.Date;

public class OrderTransaction {
	
	private int orderId = 0;
	private int cust_id = 0;
	private String orderPlacedDate = null;
	private Date orderAcceptedDate = null;
	private Date OrderDispatched = null;
	private Date DeliveryDate = null;
	private Date updatedDate = null;
	private double orderTotal = 0.0d;
	private String currency = null;
	private String emailid = null;
	private String firstName = null;
	private String contactNo1 = null;
	private double shippingCharge = 0.0d;
	private String paymentStatus = null;
	private String orderStatus = null;
	private String emp_id = null;
	private String channel = null;
	private String gstin = null;
	
	public void setShippingCharge(double shippingCharge) {
		this.shippingCharge = shippingCharge;
	}
	public double getShippingCharge() {
		return shippingCharge;
	}
	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	public String getPaymentStatus() {
		return paymentStatus;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getEmailid() {
		return emailid;
	}
	
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getCurrency() {
		return currency;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getCust_id() {
		return cust_id;
	}
	public void setCust_id(int custId) {
		cust_id = custId;
	}
	
	
	public String getOrderPlacedDate() {
		return orderPlacedDate;
	}
	public void setOrderPlacedDate(String orderPlacedDate) {
		this.orderPlacedDate = orderPlacedDate;
	}
	public Date getOrderAcceptedDate() {
		return orderAcceptedDate;
	}
	public void setOrderAcceptedDate(Date orderAcceptedDate) {
		this.orderAcceptedDate = orderAcceptedDate;
	}
	public Date getOrderDispatched() {
		return OrderDispatched;
	}
	public void setOrderDispatched(Date orderDispatched) {
		OrderDispatched = orderDispatched;
	}
	public Date getDeliveryDate() {
		return DeliveryDate;
	}
	public void setDeliveryDate(Date deliveryDate) {
		DeliveryDate = deliveryDate;
	}
	public Date getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
	public double getOrderTotal() {
		return orderTotal;
	}
	public void setOrderTotal(double orderTotal) {
		this.orderTotal = orderTotal;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getContactNo1() {
		return contactNo1;
	}
	public void setContactNo1(String contactNo1) {
		this.contactNo1 = contactNo1;
	}
	public String getChannel() {
		return channel;
	}
	public void setChannel(String channel) {
		this.channel = channel;
	}
	public String getGstin() {
		return gstin;
	}
	public void setGstin(String gstin) {
		this.gstin = gstin;
	}
	
	
	
}
