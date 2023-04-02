
<%@page import="com.techgate.util.Email"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="com.techgate.cart.ShoppingCartItem"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techgate.query.OrderTransactionShippingQueryParameter"%>
<%@page import="com.techgate.domain.OrderTransactionShipping"%>
<%@page import="com.techgate.query.OrderTransactionQueryParameter"%>
<%@page import="com.techgate.domain.OrderTransaction"%>
<%@page import="com.techgate.cart.ShoppingCart"%>
<%@page import="com.techgate.query.CustomerAddressQueryParameter"%>
<%@page import="com.techgate.query.CustomerLoginQueryParameter"%>
<%@page import="com.techgate.domain.CustomerAddressDetails"%>
<%@page import="com.techgate.domain.CustomerLoginDetail"%>
<%@page import="com.techgate.util.GeneralConstants"%>
<%@page import="com.techgate.util.QueryConstants"%>
<%@page import="com.techgate.query.ProductQueryParameter"%>
<%@page import="com.techgate.query.AbstractQueryParameter"%>
<%@page import="com.techgate.domain.Product"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String redirectTo = request.getParameter("redirectTo")==null?"":request.getParameter("redirectTo");
System.out.println(redirectTo);


if(session.getAttribute("custId") == null) {
	try{
	
boolean validOTP=false;
		
		PreparedStatement prepare = null;
		Connection con=new DBConnection().getCon();
		PreparedStatement prepare1=con.prepareStatement("select * from otpRequest where Mobile_NO='"+request.getParameter("telephone")+"' and OTP='"+request.getParameter("otp")+"' and status='Y'");
		ResultSet rs = prepare1.executeQuery();
		if(rs.next()){
			validOTP = true;
			PreparedStatement prepare2 = con.prepareStatement("update  otpRequest set status='N' where id="+rs.getString("id")+"");
			prepare2.executeUpdate();
		}		
		DBConnection.close(con, prepare, rs);
		
		//validOTP=true;
		if(validOTP){
	ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
	DBAction dbAction = (DBAction) context.getBean("dbaction");
	String sameAddress = (request.getParameter("shipping_address") != null && request.getParameter("shipping_address").equals("1"))? "Y" : "N";
	Number customerId = null;
	AbstractQueryParameter obj = null;
	CustomerLoginDetail customerLoginDetail = null;
	CustomerAddressDetails billingAddress = null;
	CustomerAddressDetails shippingAddress = null;
	//Inserting Customer Details
	
		customerLoginDetail = new CustomerLoginDetail();
		customerLoginDetail.setEmailid(request.getParameter("email"));
		customerLoginDetail.setPassword(request.getParameter("password"));
		customerLoginDetail.setForgetpasswordquestion("");
		customerLoginDetail.setAnswer(request.getParameter("telephone"));


		obj = new CustomerLoginQueryParameter(customerLoginDetail);
		obj.setSql(QueryConstants.CUSTOMER_LOGIN_DETAILS_INSERT_QUERY);
		obj.setAction(GeneralConstants.INSERT);
		customerId = dbAction.executeDMLToGetId(obj);

	if(customerId != null) {
		billingAddress = new CustomerAddressDetails();	
		billingAddress.setCust_id(customerId.intValue());
		billingAddress.setAddress(request.getParameter("address_1")+" "+request.getParameter("address_2"));
		billingAddress.setCity(request.getParameter("city"));
		billingAddress.setContactNo1(request.getParameter("telephone"));
		billingAddress.setContactNo2(request.getParameter("mobile"));
		billingAddress.setCountry(request.getParameter("country_id"));
		billingAddress.setFirstName(request.getParameter("firstname"));
		billingAddress.setLastName(request.getParameter("lastname"));
		billingAddress.setPincode(request.getParameter("postcode"));
		billingAddress.setState(request.getParameter("state"));
		billingAddress.setCompanyName(request.getParameter("companyName"));
		billingAddress.setGstinNO(request.getParameter("gstin"));
		
		shippingAddress = billingAddress;
		if(sameAddress.equals("N")) {
			shippingAddress = new CustomerAddressDetails();
			shippingAddress.setCust_id(customerId.intValue());
			shippingAddress.setAddress(request.getParameter("address_11"));
			shippingAddress.setCity(request.getParameter("city1"));
			shippingAddress.setContactNo1("");
			shippingAddress.setContactNo2("");
			shippingAddress.setCountry(request.getParameter("country_id1"));
			shippingAddress.setFirstName(request.getParameter("firstname1"));
			shippingAddress.setLastName(request.getParameter("lastname1"));
			shippingAddress.setPincode(request.getParameter("postcode1"));
			shippingAddress.setState(request.getParameter("state1"));	
		}
		
		obj = new CustomerAddressQueryParameter(billingAddress);
		obj.setSql(QueryConstants.CUSTOMER_BILLING_ADDRESS_INSERT_QUERY );
		obj.setAction(GeneralConstants.INSERT);
		dbAction.executeDML(obj);
		
		obj = new CustomerAddressQueryParameter(shippingAddress);
		obj.setSql(QueryConstants.CUSTOMER_SHIPPING_ADDRESS_INSERT_QUERY);
		obj.setAction(GeneralConstants.INSERT);
		dbAction.executeDML(obj);
	}

	
	
		session.setAttribute("custId", customerId);
		session.setAttribute("custLoginDetails", customerLoginDetail);
		session.setAttribute("custBillingDetails", billingAddress);
		session.setAttribute("custShippingDetails", shippingAddress);
	

if(redirectTo == null || redirectTo.equalsIgnoreCase("")) {
	response.sendRedirect("index");
} else {
	response.sendRedirect("checkout");
}
		}else{
			response.sendRedirect("cart?status=Invalid OTP !!");	
		}
	}catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("signin.jsp?status=Email Alredy Registered Kindly Login!!&redirectTo=Checkout");	
	}
	

} else{
	response.sendRedirect("index");
}


%>