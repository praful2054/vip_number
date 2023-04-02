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
String orderby="";
String limit = request.getParameter("limit");
//System.out.println("pricefilter >>> "+pricefilter);
if(pricefilter==null || pricefilter.equals("null")){
	products = generfunc.getloadofferProductList(limit);
}else if(pricefilter!=null) {
	//System.out.println("pricefilter inside >>> "+pricefilter);
	if(pricefilter.equalsIgnoreCase("low")){
		orderby="asc";
	}else{
		orderby="desc";
	}
	products = generfunc.getofferProductPricelimitfilterList(orderby,limit);
}



int no =12;
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
							 <form method="post"  id="form<%=c %>" action="CartActivity">
                            <div class="col-lg-4 col-md-12">
                                <figcaption class="boxprice boxpriceinner">
			                        <div class="price">
			                                   <%
			                                   price=0.0; discount=0.0; disprice=0.0;rs=0;
			                                            if(product.getDiscount()>0){
					                                       	discount = product.getDiscount();
					                                       	price = product.getRateInRupee();
					                                       	
					                                       	disprice = price * discount / 100;
					                                       	
					                                       	price = price - disprice;
					                                        %>
			                                  <div class="text-left pricenum01">    <del><b>  &#8377; <%=product.getRateInRupee() %> </b></del> </div>
			                                  <div class="text-right pricenum02">    <b> &#8377; <%=price %></b> </div>
			                                    <%}else{ %>
			                                  <div class="text-right pricenum02">    <b> &#8377; <%=product.getRateInRupee() %></b> </div>
			                        		 <%} %>
			                        
			                        </div>
                                    
                                    <div class="number">
                                    <h2><%=product.getProductName()%></h2>
                                    <p class="pull-left">Sum total: <%=product.getLiters() %>=<b><%=product.getTrap() %></b></p>
                                    
                                    <p class="pull-left viewdet">  <a href="productDetails?id=<%=product.getProduct_id()%>" class="pull-left" style="font-size:11px; width:100%"> view details</a> </p>
			                         <div class="pull-left wi100">
			                              <a href="vanityNumberEnquiry?vanity=<%=product.getNumber()%>&type=Vanity Number" class="pull-left"> <div class="booknow">Enquire Now</div></a>
			                             <a onclick="document.getElementById('form<%=c %>').submit();"> <div class="booknow">BUY NOW</div></a>
			                         </div>
                                    
                                    <input type="hidden" name="vProductId" id="vProductId" value="<%= product.getProduct_id()%>">
													<input type="hidden" name="vProductName" id="vProductName" value="<%= product.getNumber()%>">
													<input type="hidden" name="vRateRuppes" id="vRateRuppes" value="<%= product.getRateInRupee()%>">
													<input type="hidden" name="vRateDollar" id="vRateDollar" value="<%= product.getRateInDollar()%>">
													<input type="hidden" name="vImgLoc" id="vImgLoc" value="<%= product.getImg_loc()%>">
													<input type="hidden" name="vDiscount" id="vDiscount" value="<%= product.getDiscount()%>">
													<input type="hidden" name="action" id="action" value="<%= GeneralConstants.ADD_TO_CART %>">
                        
                                    
                                    </div>
                                </figcaption>
                            </div>
                            </form>
                            <%} %>