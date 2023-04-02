package com.techgate.domain;

import java.util.Date;

public class ProductImage {
	private int product_img_id = 0;
	private int product_id = 0;
	private String img_loc = null;
	private String img_seq_no = null;
	private String img_comment = null;
	private Date updated_date = null;
	
	public int getProduct_img_id() {
		return product_img_id;
	}
	public void setProduct_img_id(int productImgId) {
		product_img_id = productImgId;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int productId) {
		product_id = productId;
	}
	public String getImg_loc() {
		return img_loc;
	}
	public void setImg_loc(String imgLoc) {
		img_loc = imgLoc;
	}
	public String getImg_seq_no() {
		return img_seq_no;
	}
	public void setImg_seq_no(String imgSeqNo) {
		img_seq_no = imgSeqNo;
	}
	public String getImg_comment() {
		return img_comment;
	}
	public void setImg_comment(String imgComment) {
		img_comment = imgComment;
	}
	public Date getUpdated_date() {
		return updated_date;
	}
	public void setUpdated_date(Date updatedDate) {
		updated_date = updatedDate;
	}
}
