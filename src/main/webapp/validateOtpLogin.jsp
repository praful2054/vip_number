<%@page import="com.techgate.domain.CustomerAddressDetails"%>
<%@page import="com.techgate.domain.CustomerLoginDetail"%>
<%@page import="java.util.Map"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.techgate.util.GeneralFunction"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
boolean validOTP=false;
String loginId = request.getParameter("email");
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
ClassPathXmlApplicationContext context=(ClassPathXmlApplicationContext) application.getAttribute("context");
GeneralFunction generalFunction = (GeneralFunction) context.getBean("generalFunction");



Map<String,Object> customerDetails = null;
if(validOTP){
	if(loginId.contains("@")){
        customerDetails = generalFunction.getCustomerDetailsOTP(loginId);
       }else{
       	 customerDetails = generalFunction.getCustomerDetailsMobileOTP(loginId);
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
    	response.sendRedirect("checkout");
    }
}else{
	response.sendRedirect("cartLoginCheck.jsp");
}

%>
</body>
</html>