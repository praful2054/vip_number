<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.razorpay.RazorpayException"%>
<%@page import="com.razorpay.Order"%>
<%@page import="com.razorpay.RazorpayClient"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="java.util.Map"%>
<%@page import="com.paytm.pg.merchant.CheckSumServiceHelper"%>
<%@page import="com.techgate.util.QueryConstants"%>
<%@page import="com.techgate.domain.CustomerLoginDetail"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.techgate.domain.CustomerAddressDetails"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.TreeMap"%>
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

String orderID=request.getParameter("param1");

String custID="";

DBConnection dbcon = new DBConnection();
Connection con = dbcon.getCon();
Statement stmt = con.createStatement();
int amount=0,total=0, coupounDiscount=0;
String product_id="";
ResultSet res = stmt.executeQuery("select cust_id from OrderTransaction where orderId='"+orderID+"' ");
if(res.next()){
	custID = res.getString(1);
}


res = stmt.executeQuery("select productprice,gst,product_id from OrderPurchaseDetails where orderId='"+orderID+"' ");
if(res.next()){
	amount=res.getInt(1);
	coupounDiscount = res.getInt(2);
	product_id = res.getString("product_id");
}

total = amount - coupounDiscount;


System.out.println("custID >>>> "+custID);
ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");

DBAction dbAction = (DBAction) context.getBean("dbaction");

CustomerAddressDetails detail = dbAction.getSingleData(QueryConstants.CUSTOMER_BILLING_ADDRESS_SINGLE_DATE_QUERY,CustomerAddressDetails.class,custID);
CustomerLoginDetail lDetail = dbAction.getSingleData(QueryConstants.CUSTOMER_LOGIN_DETAILS_SINGLE_DATE_QUERY_USING_ID,CustomerLoginDetail.class,custID);

System.out.println("Mobile >>>> "+detail.getContactNo1());

session.setAttribute("custId", custID);
session.setAttribute("custLoginDetails", lDetail);
session.setAttribute("custBillingDetails", detail);
session.setAttribute("custShippingDetails", detail);


String razororderId="";
try {
	  JSONObject orderRequest = new JSONObject();
	 
	 // int famount = Integer.parseInt(Math.round(total));
	  int famount = (int) total;
	  System.out.println("total >>>>>> "+famount);
	  orderRequest.put("amount", famount*100); // amount in the smallest currency unit
	  orderRequest.put("currency", "INR");
	  orderRequest.put("receipt", "order_rcptid_"+String.valueOf(orderID));
	  orderRequest.put("payment_capture", 1);
	  
	// RazorpayClient razorpay = new RazorpayClient("rzp_live_UwEAXiMWbcaG2p", "X1JcvRzg0XkJGXqk64FahlBU");
	  
	  RazorpayClient razorpay = new RazorpayClient("rzp_live_gxHqH0N1wEeEEB", "uguxxjQPa6yUt1TfdvvAhOvr");
	  
	//	RazorpayClient razorpay = new RazorpayClient();
	  Order order = razorpay.Orders.create(orderRequest);
	  
	  razororderId =  order.get("id");
	  
	} catch (RazorpayException e) {
	  // Handle Exception
	  System.out.println(e.getMessage());
	}


PreparedStatement prepare =con.prepareStatement("update OrderTransaction set Emp_id='"+razororderId+"' where orderId='"+orderID+"' ");
prepare.executeUpdate();


DBConnection.close(con, stmt, res);
//cart.removeFromCart(item.getProduct());


%>
<form method="POST" name="redirect" action="https://api.razorpay.com/v1/checkout/embedded">
<input type="hidden" name="key_id" value="rzp_live_gxHqH0N1wEeEEB">
<input type="hidden" name="order_id" value="<%=razororderId%>">
<input type="hidden" name="name" value="VIP NUMBER STORE">
<input type="hidden" name="description" value="">
<input type="hidden" name="image" value="https://www.vipnumberstore.in/assets/img/logo.png">
<input type="hidden" name="prefill[name]" value="<%=detail.getFirstName()%>">
<input type="hidden" name="prefill[contact]" value="<%=detail.getContactNo1()%>">
<input type="hidden" name="prefill[email]" value="<%=lDetail.getEmailid()%>">
<input type="hidden" name="notes[shipping address]" value="<%=razororderId%>">
<input type="hidden" name="callback_url" value="https://www.vipnumberstore.in/razorResponse.jsp">
<input type="hidden" name="cancel_url" value="https://www.vipnumberstore.in/cart">
<script language='javascript'>document.redirect.submit();</script>
</form>

</body>
</html>