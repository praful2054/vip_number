package com.techgate.domain;

import java.util.Date;

public class Category {

	private int cate_id = 0;
	private int cate_parent_id = 0;
	private String cate_name = null;
	private String parent_cate_name = null;
	private String cate_descript = null;
	private Date cate_UpdatedDate = null;
	private String cate_img_loc = null; 
	private String status = null;
	
	
	public int getCate_id() {
		return cate_id;
	}
	public void setCate_id(int cateId) {
		cate_id = cateId;
	}
	public int getCate_parent_id() {
		return cate_parent_id;
	}
	public void setCate_parent_id(int cateParentId) {
		cate_parent_id = cateParentId;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cateName) {
		cate_name = cateName;
	}
	public String getCate_descript() {
		return cate_descript;
	}
	public void setCate_descript(String cateDescript) {
		cate_descript = cateDescript;
	}
	public Date getCate_UpdatedDate() {
		return cate_UpdatedDate;
	}
	public void setCate_UpdatedDate(Date cateUpdatedDate) {
		cate_UpdatedDate = cateUpdatedDate;
	}
	public String getCate_img_loc() {
		return cate_img_loc;
	}
	public void setCate_img_loc(String cateImgLoc) {
		cate_img_loc = cateImgLoc;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getParent_cate_name() {
		return parent_cate_name;
	}
	public void setParent_cate_name(String parent_cate_name) {
		this.parent_cate_name = parent_cate_name;
	}
	
}
