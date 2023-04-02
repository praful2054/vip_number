
<%@page import="com.techgate.domain.CustomerAddressDetails"%>
<%@page import="com.techgate.domain.CustomerLoginDetail"%>
<%@page import="java.util.Map"%>
<%@page import="com.techgate.util.GeneralFunction"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

String loginId = request.getParameter("email");
String password = request.getParameter("password");
String redirectTo = request.getParameter("redirectTo");

ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
GeneralFunction generalFunction = (GeneralFunction) context.getBean("generalFunction");



Map<String,Object> customerDetails = null;

if(loginId.contains("@")){
 customerDetails = generalFunction.getCustomerDetails(loginId, password);
}else{
	 customerDetails = generalFunction.getCustomerDetailsMobile(loginId, password);
}

if(customerDetails != null) {
	CustomerLoginDetail customerLoginDetail = (CustomerLoginDetail) customerDetails.get("custLoginDetails");
	CustomerAddressDetails billingAddressDetails = (CustomerAddressDetails) customerDetails.get("custBillingDetails");
	CustomerAddressDetails shippingAddressDetails = (CustomerAddressDetails) customerDetails.get("custShippingDetails");
	//System.out.println("id "+customerLoginDetail.getCust_id());
	session.setAttribute("custId", customerLoginDetail.getCust_id());
	session.setAttribute("custLoginDetails", customerLoginDetail);
	session.setAttribute("custBillingDetails", billingAddressDetails);
	session.setAttribute("custShippingDetails", shippingAddressDetails);
} 
if(customerDetails==null){
	response.sendRedirect("signin.jsp?status=Invalid UserName or Password&redirectTo="+redirectTo);
}
else if(redirectTo == null || redirectTo.equalsIgnoreCase("")) {
	response.sendRedirect("index");
} else {
	response.sendRedirect("checkout");
}

%>