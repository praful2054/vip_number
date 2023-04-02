package com.techgate.domain;

import java.util.Date;

public class CustomerLoginDetail {
	
	private int cust_id = 0;
	private String emailid = null;
	private String password = null;
	private String forgetpasswordquestion = null;
	private String answer = null;
	private Date createdDate = null;
	private Date updatedDate = null;
	private String status = null;
	
	public int getCust_id() {
		return cust_id;
	}
	public void setCust_id(int custId) {
		cust_id = custId;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getForgetpasswordquestion() {
		return forgetpasswordquestion;
	}
	public void setForgetpasswordquestion(String forgetpasswordquestion) {
		this.forgetpasswordquestion = forgetpasswordquestion;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public Date getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
