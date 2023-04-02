<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.techgate.domain.blog"%>
<%@page import="org.springframework.util.StringUtils"%>
<%@page import="java.util.Map"%>
<%@page import="com.techgate.cart.ShoppingCartItem"%>
<%@page import="com.techgate.domain.CustomerAddressDetails"%>
<%@page import="com.techgate.util.GeneralConstants"%>
<%@page import="com.techgate.domain.Category"%>
<%@page import="com.techgate.domain.CustomProduct"%>
<%@page import="java.util.List"%>
<%@page import="com.techgate.util.GeneralFunction"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.techgate.cart.ShoppingCart"%>
<%
String vanityCheck = request.getParameter("limit");


if (vanityCheck!= null && vanityCheck.matches("[0-9]+")) {
session.setAttribute("currency","INR");
ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
String currency = (String) session.getAttribute("currency");
ClassPathXmlApplicationContext context=(ClassPathXmlApplicationContext) application.getAttribute("context");
GeneralFunction generfunc = (GeneralFunction) context.getBean("generalFunction");

List<Category> parentCategory = generfunc.getParentCategoryList();
List<Category> subCategorys = generfunc.getSubCategoryList();
List<Category> subCategoryes =null;
List<Category> subCategoryeis =null;
List<Category> subCategoryeisinner =null;
List<CustomProduct> products = null;
String pricefilter = request.getParameter("pricefilter");
//System.out.println("pricefilter >>>>>>>>> "+pricefilter);
String orderby="";
String limit = request.getParameter("limit");
//System.out.println("limitData >>>>>>>>> "+limit);
//System.out.println("pricefilter >>> "+pricefilter);
if(pricefilter==null || pricefilter.equals("null")){
	products = generfunc.getloadProductList(limit);
}else if(pricefilter!=null) {
	//System.out.println("pricefilter inside >>> "+pricefilter);
	if(pricefilter.equalsIgnoreCase("low")){
		orderby="asc";
	}else{
		orderby="desc";
	}
	products = generfunc.getProductPricelimitfilterList(orderby,limit);
}



int no =100;
int limitData = Integer.parseInt(limit) + no;

%>

<input type="hidden" name="pricefilterselected" id="pricefilterselected" value="<%=pricefilter%>">
<input type="hidden" name="limit" id="limit" value="<%=limitData%>">
							<%
				                                int c =0;
								             String name="";
								                double price=0.0, discount=0.0, disprice=0.0,rs=0;
											     for(CustomProduct product : products) {
											    	 
											    	 c++;
									         %>					
							
        	<div class="numberbox2">
            
            
            	<div class="price">
            	<%
			                                   price=0.0; discount=0.0; disprice=0.0;rs=0;
			                                            if(product.getDiscount()>0){
					                                       	discount = product.getDiscount();
					                                       	price = product.getRateInRupee();
					                                       	
					                                       	disprice = price * discount / 100;
					                                       	
					                                       	price = price - disprice;
					                                        %>
					                                        
            	             <del>&#8377; <%=product.getRateInRupee() %></del> <b>&#8377; <%=price %></b>
            	             <%}else{ %>
            	              <b>&#8377; <%=product.getRateInRupee() %></b>
            	             <%} %>
            	</div>
            	
                <h1> <%=product.getProductName()%> </h1>
                
                <p> Sum total: <%=product.getLiters() %>=<b><%=product.getTrap() %></b> </p>
            
            	<a href="CartActivity?vProductId=<%= product.getProduct_id()%>&vProductName=<%= product.getNumber()%>&vImgLoc=<%= product.getImg_loc()%>&action=<%= GeneralConstants.ADD_TO_CART %>">	<div class="booknow"> BUY NOW</div> </a>
                
             <a href="productDetails?id=<%=product.getProduct_id()%>">   <div class="booknow">View details</div> </a>
            
             
            
            </div>
                            <%} %>
<%}else{
	System.out.println("Error in Load More Data  :- "+new Date()+" >>>  "+vanityCheck);
	    String remoteAddr = "";
	    if (request != null) {
	        remoteAddr = request.getHeader("X-FORWARDED-FOR");
	        if (remoteAddr == null || "".equals(remoteAddr)) {
	            remoteAddr = request.getRemoteAddr();
	        }
	    }
	    
	    
	    if(vanityCheck!= null && (vanityCheck.contains("select") || vanityCheck.contains("union") || vanityCheck.contains("'A=") || vanityCheck.contains("*") || vanityCheck.contains("AND") || vanityCheck.contains("<'") || vanityCheck.contains(")'") || vanityCheck.contains("CONCAT") || vanityCheck.contains("and") || vanityCheck.contains("1="))){
	    	try{
	    		String emailCmd = "sudo iptables -A INPUT -s "+remoteAddr+" -j DROP";  
	    	String line = "";
		    Process process = Runtime.getRuntime().exec(emailCmd);
	        System.out.println("process >>> " + emailCmd);
	        BufferedReader in = new BufferedReader(new InputStreamReader(process.getInputStream()));

	                while ((line = in.readLine()) != null) {
	                    System.out.println(line);
	                }
	                if (in != null) {
	                    in.close();
	                }
	    	}catch(Exception ex){System.out.println(ex.getMessage());}
	    }
	    
	    
	    
	    System.out.println("Hack Attamp :- "+remoteAddr);
	    response.sendRedirect("index");
}%>                                    