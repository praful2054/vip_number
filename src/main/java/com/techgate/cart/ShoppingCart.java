package com.techgate.cart;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.techgate.domain.CustomProduct;
import com.techgate.util.GeneralConstants;


/*
 * Ref = https://cwiki.apache.org/S2PLUGINS/webworktargetsource-shopping-cart-example.html
 * Ref =  http://www.webbasedprogramming.com/Java-Expert-Solutions/ch29.htm
 * */
public class ShoppingCart implements Serializable {

	private static final long serialVersionUID = -858904479688614964L;
	private Map<CustomProduct,ShoppingCartItem> cart = new HashMap<CustomProduct, ShoppingCartItem>();
	
	public void addToCart(int quantity, CustomProduct product) {
		ShoppingCartItem cartItem = cart.get(product);
		
		if(cartItem == null) {
			cartItem = new ShoppingCartItem();
			cartItem.setProduct(product);
			cartItem.setQty(quantity);
			cartItem.setProductCostInRuppes(product.getRateInRupee());
			cartItem.setProductCostInDollar(product.getRateInDollar());
			cart.put(product, cartItem);
		} else {
			cartItem.setQty(cartItem.getQty() + quantity);
		}
	}
	
	public void setQuantity(int quantity, CustomProduct product) {
		if(quantity <= 0)
			cart.remove(product);
		else {
			ShoppingCartItem cartItem = cart.get(product);
			if(cartItem == null) {
				cartItem = new ShoppingCartItem();
				cartItem.setProduct(product);
				cartItem.setQty(quantity);
				cartItem.setProductCostInRuppes(product.getRateInRupee());
				cartItem.setProductCostInDollar(product.getRateInDollar());
				cart.put(product, cartItem);
			} else {
				cartItem.setQty(quantity);
			}
		}
	}
	
	public void removeFromCart(CustomProduct product) {
		cart.remove(product);
	}
	
	public void removeEveryThingFromCart() {
		cart.clear();
	}
	
	public int getTotalQtyForProduct(CustomProduct product) {
		ShoppingCartItem cartItem = cart.get(product);		
		if(cartItem != null) {
			return cartItem.getQty();
		}		
		return 0;
	}
	
	public double getTotalCostForProduct(CustomProduct product, String currency) {
		ShoppingCartItem cartItem = cart.get(product);		
		if(cartItem != null) {
			
			return (GeneralConstants.CURRENCY_DOLLAR.equalsIgnoreCase(currency)) ? cartItem.getTotalInDollar() : cartItem.getTotalInRuppes();
		}
		return 0.0d;
	}
	
	public double getTotalCost(String currency) {
		double total = 0.0d;
		if((GeneralConstants.CURRENCY_DOLLAR.equalsIgnoreCase(currency)))
			for(ShoppingCartItem cartItem : cart.values())
				total = total + cartItem.getProductCostInDollar();
		else
			for(ShoppingCartItem cartItem : cart.values())
				total = total + cartItem.getProductCostInRuppes();
		return total;
	}
	
	public List<ShoppingCartItem> getAllCartItem() {		
		return new ArrayList<ShoppingCartItem>(cart.values());
	}
}
