
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="com.techgate.cart.ShoppingCartItem"%>
<%@page import="com.techgate.domain.CustomProduct"%>
<%@page import="com.techgate.util.GeneralConstants"%>
<%@page import="com.techgate.domain.ProductOtherDetail"%>
<%@page import="com.techgate.domain.Product"%>
<%@page import="com.techgate.cart.ShoppingCart"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    
    <%
try{
    	
        int productIdCheck = Integer.parseInt(request.getParameter("vProductId"));
    	ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
    	String action = request.getParameter("action");
    	String productId = request.getParameter("vProductId");
    	//System.out.println("productId >>>> "+productId);
    	int ddiscount = 0;
    	if(request.getParameter("vDiscount")!=null){
    		 ddiscount =Integer.parseInt(request.getParameter("vDiscount").trim());
    	}
    	
    	int price=0, discount=0, disprice=0, flatDiscount=0;
    	
    	int eproductId=0; boolean checkcart=true;
    	
    	
    	DBConnection dbcon = new DBConnection();
    	Connection con = dbcon.getCon();
    	Statement stmt =  con.createStatement();
    	ResultSet res1 = null, res2=null, res3=null;
    	ResultSet res = stmt.executeQuery("select * from ProductOtherDetails where product_id='"+productId+"'");
    	if(res.next()) {
    		ddiscount = res.getInt("discount");
    		flatDiscount = res.getInt("flatdiscountedrate");
    		price = res.getInt("rateInRupee");
    	}
    	
    	DBConnection.close(con, stmt, res);
    	
    	if(cart != null && cart.getAllCartItem().size()>0) {
    	for(ShoppingCartItem item : cart.getAllCartItem()) {
    		eproductId = item.getProduct().getProduct_id();
    		if(productId.equals(String.valueOf(eproductId))){
    			checkcart=false;
    		}
    	}
    	}
    	
    	
    	
    	
    	if(GeneralConstants.ADD_TO_CART.equals(action)) {
    		if(ddiscount>0){
            	discount = ddiscount;
            	//price = price;//Integer.parseInt(request.getParameter("vRateRuppes"));
            	
            	disprice = price * discount / 100;
            	
            	price = price - disprice;
    		}else if(flatDiscount > 0){
                //disprice = price * discount / 100;
            	
            	price = price - flatDiscount;
    		}
    		
    		String productName = request.getParameter("vProductName");
    		//TODO: Should get rate from database incase of data tampering
    		String rateRuppes = String.valueOf(price); ;
    		String rateDollar = request.getParameter("vRateDollar");
    		String productColor = request.getParameter("color")==null?"NA":request.getParameter("color");
    		String productSize = request.getParameter("size")==null?"NA":request.getParameter("size");
    		CustomProduct product = new CustomProduct();
    		product.setProduct_id(Integer.parseInt(productId));
    		product.setProductName(productName);
    		product.setRateInRupee(price);
    		product.setProductColor(productColor);
    		product.setProductSize(productSize);
    		//product.setRateInDollar(Integer.parseInt(rateDollar));
    		product.setImg_loc(request.getParameter("vImgLoc"));
    		if(checkcart){
    		if(cart == null) {
    			cart = new ShoppingCart();
    			session.setAttribute("cart", cart);
    		}
    		
    		cart.addToCart(1, product);
    		}
    	} else if(GeneralConstants.UPDATE_TO_CART.equals(action)) {
    		CustomProduct product = new CustomProduct();
    		product.setProduct_id(Integer.parseInt(productId));
    		int qty = Integer.parseInt(request.getParameter("qty"));

    		if(cart != null) {
    			cart.setQuantity(qty, product);
    		}		
    	} else if(GeneralConstants.REMOVE_FROM_CART.equals(action)) {
    		CustomProduct product = new CustomProduct();
    		product.setProduct_id(Integer.parseInt(productId));

    		if(cart != null) {
    			cart.removeFromCart(product);
    		}	
    	}
    	
    response.sendRedirect("cart");
}catch(Exception e){
 	System.out.println("Error "+e.getMessage());
 }
    %>
    
    