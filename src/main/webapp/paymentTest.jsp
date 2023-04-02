<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.paytm.pg.merchant.CheckSumServiceHelper"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.razorpay.RazorpayException"%>
<%@page import="com.razorpay.Order"%>
<%@page import="com.razorpay.RazorpayClient"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="com.ccavenue.security.AesCryptUtil"%>
<%@page import="com.techgate.cart.ShoppingCartItem"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.techgate.util.QueryConstants"%>
<%@page import="com.techgate.query.AbstractQueryParameter"%>
<%@page import="com.techgate.util.GeneralConstants"%>
<%@page import="com.techgate.cart.ShoppingCart"%>
<%@page import="com.techgate.domain.CustomerAddressDetails"%>
<%@page import="com.techgate.domain.CustomerLoginDetail"%>
<%@page import="org.springframework.util.StringUtils"%>
<%@page import="com.techgate.query.OrderTransactionShippingQueryParameter"%>
<%@page import="com.techgate.domain.OrderTransactionShipping"%>
<%@page import="com.techgate.query.OrderTransactionQueryParameter"%>
<%@page import="com.techgate.domain.OrderTransaction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<! DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*" %>
<% 	
    
        // Number orderId =0;
		String action1 ="";
		int error=0;
		String hashString="";
		double total = 11, price = 0, value=0;
		double amount =0.0;
		String udf2="";
		Random rand = new Random();
		//String orderId = Integer.toString(rand.nextInt())+(System.currentTimeMillis() / 1000L);
		long txnid = new Date().getTime();
		Number orderId=111;

				
				


				String Transaction_URL= "https://securegw.paytm.in/theia/processTransaction" ;
				    //String Transaction_Status_URL= "https://securegw.paytm.in/merchant-status/getTxnStatus" ;
					String  MID = "Krishn62282532870073";
					String Merchant_KEY = "Xgd@7KixNBqNZrkt";
					String WEBSITE = "DEFAULT";
					String  CHANNEL_ID= "WEB";
					String  INDUSTRY_TYPE_ID= "Retail105";
					String CALLBACK_URL = "https://vipnumberstore.in/pgResponse.jsp";
					TreeMap<String,String> parameters = new TreeMap<String,String>();
					//String paytmChecksum =  "";
					int otp = 10000 + new Random().nextInt(90000);
					parameters.put("MID",MID);
					parameters.put("CHANNEL_ID",CHANNEL_ID);
					parameters.put("INDUSTRY_TYPE_ID",INDUSTRY_TYPE_ID);
					parameters.put("WEBSITE",WEBSITE);
					parameters.put("MOBILE_NO","9004264566");
					parameters.put("EMAIL","mukesh@techgate.in");
					parameters.put("ORDER_ID",String.valueOf(orderId+"_"+otp));
					parameters.put("TXN_AMOUNT",String.valueOf(total));
					parameters.put("CUST_ID",String.valueOf("0001"));
					parameters.put("CALLBACK_URL", CALLBACK_URL);
					
					String checkSum =  CheckSumServiceHelper.getCheckSumServiceHelper().genrateCheckSum(Merchant_KEY, parameters);
					
					//System.out.println("Order_ID >>> "+orderId+"_"+otp);	
					//System.out.println("checkSum >>> "+checkSum);	
					
					StringBuilder outputHtml = new StringBuilder();
					outputHtml.append("<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'https://www.w3.org/TR/html4/loose.dtd'>");
					outputHtml.append("<html>");
					outputHtml.append("<head>");
					outputHtml.append("<title>Merchant Check Out Page</title>");
					outputHtml.append("</head>");
					outputHtml.append("<body>");
					outputHtml.append("<center><h1>Please do not refresh this page...</h1></center>");
					outputHtml.append("<form method='post' action='"+Transaction_URL+"' name='f1'>");
					outputHtml.append("<table border='1'>");
					outputHtml.append("<tbody>");
					for(Map.Entry<String,String> entry : parameters.entrySet()) {
						String key = entry.getKey();
						String values = entry.getValue();
						outputHtml.append("<input type='hidden' name='"+key+"' value='" +values+"'>");	
					}	  
						  
					outputHtml.append("<input type='hidden' name='CHECKSUMHASH' value='"+checkSum+"'>");
					outputHtml.append("</tbody>");
					outputHtml.append("</table>");
					outputHtml.append("<script type='text/javascript'>");
					outputHtml.append("document.f1.submit();");
					outputHtml.append("</script>");
					outputHtml.append("</form>");
					outputHtml.append("</body>");
					outputHtml.append("</html>");
					out.println(outputHtml);
				
			%>