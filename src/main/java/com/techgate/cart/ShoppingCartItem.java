package com.techgate.cart;

import java.io.Serializable;

import com.techgate.domain.CustomProduct;


public class ShoppingCartItem implements Serializable{

	private static final long serialVersionUID = 3350548572201080470L;
	private CustomProduct product = null;
	private int qty = 0;
	private double productCostInRuppes = 0;
	private double productCostInDollar = 0;
	private String productColor="";
	private String productSize="";
	
	public String getProductColor() {
		return productColor;
	}
	public void setProductColor(String productColor) {
		this.productColor = productColor;
	}
	public String getProductSize() {
		return productSize;
	}
	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}
	public void setProduct(CustomProduct product) {
		this.product = product;
	}
	public CustomProduct getProduct() {
		return product;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public double getProductCostInRuppes() {
		return productCostInRuppes;
	}
	public double getProductCostInDollar() {
		return productCostInDollar;
	}
	public double getTotalInRuppes(){
		return qty * productCostInRuppes;
	}
	public double getTotalInDollar(){
		return qty * productCostInDollar;
	}
	public void setProductCostInRuppes(double productCostInRuppes) {
		this.productCostInRuppes = productCostInRuppes;
	}
	public void setProductCostInDollar(double productCostInDollar) {
		this.productCostInDollar = productCostInDollar;
	}
}
