<%@page import="com.razorpay.RazorpayClient"%>
<%@page import="com.razorpay.RazorpayException"%>
<%@page import="com.razorpay.Order"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.techgate.domain.ProductOtherDetail"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.paytm.pg.merchant.CheckSumServiceHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techgate.connection.DBConnection"%>
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
<! DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*" %>
<% 	
if(session.getAttribute("cart")==null){
	   response.sendRedirect("index");
}else if(session.getAttribute("custId")==null){
	   response.sendRedirect("login.html?redirectTo=checkout");
}else{
	ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
    CustomerLoginDetail customerLoginDetail = (CustomerLoginDetail) session.getAttribute("custLoginDetails");
    CustomerAddressDetails billingAddressDetails = (CustomerAddressDetails) session.getAttribute("custBillingDetails");
    CustomerAddressDetails shippingAddressDetails = (CustomerAddressDetails) session.getAttribute("custShippingDetails");
  //  Number custID = (Long)session.getAttribute("custId");
        // Number orderId =0;
		String action1 ="";
		int error=0;
		String hashString="";
		double total = 0, price = 0, value=0;
		double amount =0;
		double gst = 0;
		String udf2="";
		Random rand = new Random();
		//String orderId = Integer.toString(rand.nextInt())+(System.currentTimeMillis() / 1000L);
		long txnid = new Date().getTime();
		
		
		Number orderId=0;
		if(cart != null) {	
			 for(ShoppingCartItem item : cart.getAllCartItem()) {
				 amount = amount + item.getTotalInRuppes();
			 }
			    String coupoun = (String) session.getAttribute("coupoun");
			    String coupoun_type="", user_for="",userID="";
				DBConnection dbcon = new DBConnection();
				Connection con = dbcon.getCon();
				Statement stmt = con.createStatement();
				
				ResultSet res = stmt.executeQuery("select * from Coupoun where coupoun_code='"+coupoun+"'");
				if(res.next()){
				     coupoun_type = res.getString("coupoun_type");
					 user_for = res.getString("user_for");
					 userID = res.getString("user_id");
					 value = Double.parseDouble(res.getString("value"));
					 if(user_for.equalsIgnoreCase("ALL") || userID.contains(customerLoginDetail.getEmailid())){
						 if(coupoun_type.equalsIgnoreCase("Flat")){
							 price = (amount * value) / 100;
							 total = amount-price;
						 }
						 else if(coupoun_type.equalsIgnoreCase("Fix")){
							 total = value;
						 }
						 else if(coupoun_type.equalsIgnoreCase("Percentage")){
	                    	 price = (amount * value) / 100;
							 total = amount-price;
						 }
						 else{
							  gst = amount*18/100;
							// amount = amount+amount*18/100;
							// total = amount + gst;
							 total = amount;
						 }
					 } 
				}
				if(total<=0){
					  gst = amount*18/100;
						// amount = amount+amount*18/100;
						// total = amount + gst;
					 total = amount;
				}

		
		String pay_type="";//request.getParameter("radio_2");
		//String pay_type="RazorPay";
		 String payment_type[] = request.getParameterValues("pmode");		
		 if(payment_type != null){
		   for(int i=0; i<payment_type.length; i++){
			   pay_type = payment_type[i];
		      }
	    }
		 
		 System.out.println("pay_type >>>> "+pay_type);
		 
		 
				if(pay_type.equalsIgnoreCase("Paytm")){
			
			ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
			DBAction dbAction = (DBAction) context.getBean("dbaction");
			String customerType = request.getParameter("account");//guest/login
			Number custId = (Number)session.getAttribute("custId");//customerLoginDetail.getCust_id();
	
			String sameAddress = (request.getParameter("shipping_address") != null && request.getParameter("shipping_address").equals("1"))? "Y" : "N";
			int pdid=0;
			for(ShoppingCartItem item : cart.getAllCartItem()) {
				pdid = item.getProduct().getProduct_id();
			}
			boolean status=true;
	
			ResultSet rs = stmt.executeQuery("select orderId from OrderTransaction where cust_id='"+custId+"' and orderId in(select orderId from OrderPurchaseDetails where product_id='"+pdid+"') and paymentStatus='N'");
			if(rs.next()){
				orderId = rs.getInt("orderId");
				status = false;
			}
			
			
			
			if(status){
				String orderDate =  new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar.getInstance().getTime());

			AbstractQueryParameter obj = null;
			final OrderTransaction orderTransaction = new OrderTransaction();
			orderTransaction.setCust_id(custId.intValue());
			orderTransaction.setOrderTotal(amount);
			orderTransaction.setPaymentStatus("N");
			orderTransaction.setEmp_id("");
			orderTransaction.setChannel("Online");
			orderTransaction.setGstin("Yes");
			orderTransaction.setOrderPlacedDate(orderDate);
			obj = new OrderTransactionQueryParameter(orderTransaction);
			obj.setAction(GeneralConstants.INSERT);
			obj.setSql(QueryConstants.ORDER_TRANSACTION_INSERT_QUERY);
			orderId = dbAction.executeDMLToGetId(obj);
			if(orderId != null) {
				session.setAttribute("orderId",orderId);
				if(shippingAddressDetails != null) {
					OrderTransactionShipping orderTransactionShipping = new OrderTransactionShipping();
					orderTransactionShipping.setFirstName(shippingAddressDetails.getFirstName());
					orderTransactionShipping.setLastName(shippingAddressDetails.getLastName());
					orderTransactionShipping.setAddress(shippingAddressDetails.getAddress());
					orderTransactionShipping.setCity(shippingAddressDetails.getCity());
					orderTransactionShipping.setContactNo1(shippingAddressDetails.getContactNo1());
					orderTransactionShipping.setContactNo2(shippingAddressDetails.getContactNo2());
					orderTransactionShipping.setCountry(shippingAddressDetails.getCountry());
					orderTransactionShipping.setOrder_id(orderId.intValue());
					orderTransactionShipping.setPincode(shippingAddressDetails.getPincode());
					orderTransactionShipping.setState(shippingAddressDetails.getState());	
					obj = new OrderTransactionShippingQueryParameter(orderTransactionShipping);
					obj.setAction(GeneralConstants.INSERT);
					obj.setSql(QueryConstants.ORDER_TRANSACTION_SHIPPING_ADDRESS_INSERT_QUERY);
					dbAction.executeDML(obj);	
				}
				List<Object[]> parameters = new ArrayList<Object[]>();
				ProductOtherDetail productOtherDetail =null;
				for(ShoppingCartItem item : cart.getAllCartItem()) {
					 productOtherDetail = dbAction.getSingleData(QueryConstants.PRODUCT_RATE_SINGLE_DATA_QUERY, ProductOtherDetail.class, item.getProduct().getProduct_id());
					parameters.add(new Object[] {orderId.intValue(),item.getProduct().getProduct_id(),item.getProduct().getProductName(), item.getProduct().getImg_loc(), item.getQty(),item.getProduct().getRateInRupee(),item.getTotalInRuppes(),item.getProductColor(),item.getProductSize(),productOtherDetail.getDiscount(), productOtherDetail.getFlatdiscountedrate(), price});
				}
				dbAction.executeBatchUpdate(QueryConstants.ORDER_TRANSACTION_PRDOUCT_INSERT_QUERY,parameters);
				//cart.removeFromCart(item.getProduct());
			}
			}else{
				session.setAttribute("orderId",orderId);
				List<Object[]> parameters = new ArrayList<Object[]>();
				
				 PreparedStatement pst1 = con.prepareStatement("delete from OrderPurchaseDetails where orderId=?");
				 pst1.setString(1, String.valueOf(orderId));  // Vendor ID
				 pst1.executeUpdate();
				
				 pst1 = con.prepareStatement("update OrderTransaction set orderTotal=? where orderId=?");
				 pst1.setString(1, String.valueOf(amount));  // Vendor ID
				 pst1.setString(2, String.valueOf(orderId));
				 pst1.executeUpdate();
				 
				ProductOtherDetail productOtherDetail =null;
				for(ShoppingCartItem item : cart.getAllCartItem()) {
					 productOtherDetail = dbAction.getSingleData(QueryConstants.PRODUCT_RATE_SINGLE_DATA_QUERY, ProductOtherDetail.class, item.getProduct().getProduct_id());
					parameters.add(new Object[] {orderId.intValue(),item.getProduct().getProduct_id(),item.getProduct().getProductName(), item.getProduct().getImg_loc(), item.getQty(),item.getProduct().getRateInRupee(),item.getTotalInRuppes(),item.getProductColor(),item.getProductSize(),productOtherDetail.getDiscount(), productOtherDetail.getFlatdiscountedrate(), price});
				}
				dbAction.executeBatchUpdate(QueryConstants.ORDER_TRANSACTION_PRDOUCT_INSERT_QUERY,parameters);
			}
			
			String Transaction_URL= "https://securegw.paytm.in/theia/processTransaction" ;


			//String Transaction_URL= "https://securegw.paytm.in/theia/processTransaction" ;
			    //String Transaction_Status_URL= "https://securegw.paytm.in/merchant-status/getTxnStatus" ;
				String  MID = "VIPNUM28379536222345";
				String Merchant_KEY = "ig7hfknTyhMDknyE";
				String WEBSITE = "DEFAULT";
				String  CHANNEL_ID= "WEB";
				String  INDUSTRY_TYPE_ID= "Retail105";
				String CALLBACK_URL = "https://www.vipnumberstore.in/pgResponse";
				TreeMap<String,String> parameters = new TreeMap<String,String>();
				//String paytmChecksum =  "";
				int otp = 10000 + new Random().nextInt(90000);
				parameters.put("MID",MID);
				parameters.put("CHANNEL_ID",CHANNEL_ID);
				parameters.put("INDUSTRY_TYPE_ID",INDUSTRY_TYPE_ID);
				parameters.put("WEBSITE",WEBSITE);
				parameters.put("MOBILE_NO",billingAddressDetails.getContactNo1());
				parameters.put("EMAIL",customerLoginDetail.getEmailid());
				parameters.put("ORDER_ID",String.valueOf(orderId+"_"+otp));
				parameters.put("TXN_AMOUNT",String.valueOf(total));
				parameters.put("CUST_ID",String.valueOf(customerLoginDetail.getCust_id()));
				parameters.put("CALLBACK_URL", CALLBACK_URL);
				
				String checkSum =  CheckSumServiceHelper.getCheckSumServiceHelper().genrateCheckSum(Merchant_KEY, parameters);
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
		
		}else{
			
			
			String razororderId="";
			ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
			DBAction dbAction = (DBAction) context.getBean("dbaction");
			String customerType = request.getParameter("account");//guest/login
			Number custId = (Number)session.getAttribute("custId");//customerLoginDetail.getCust_id();
	
			String sameAddress = (request.getParameter("shipping_address") != null && request.getParameter("shipping_address").equals("1"))? "Y" : "N";
			int pdid=0;
			for(ShoppingCartItem item : cart.getAllCartItem()) {
				pdid = item.getProduct().getProduct_id();
			}
			boolean status=true;
			
			
			ResultSet rs = stmt.executeQuery("select orderId,Emp_id from OrderTransaction where cust_id='"+custId+"' and orderId in(select orderId from OrderPurchaseDetails where product_id='"+pdid+"') and paymentStatus='N' and orderStatus <> 'Cancelled'");
			if(rs.next()){
				orderId = rs.getInt("orderId");
				razororderId = rs.getString("Emp_id");
				status = false;
			}
			
			try {
				  JSONObject orderRequest = new JSONObject();
				 
				 // int famount = Integer.parseInt(Math.round(total));
				  int famount = (int) total;
				  System.out.println("total >>>>>> "+famount);
				  orderRequest.put("amount", famount*100); // amount in the smallest currency unit
				  orderRequest.put("currency", "INR");
				  orderRequest.put("receipt", "order_rcptid_"+String.valueOf(orderId));
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
			
			if(status){
				
				
				
				
				String orderDate =  new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar.getInstance().getTime());

			AbstractQueryParameter obj = null;
			final OrderTransaction orderTransaction = new OrderTransaction();
			orderTransaction.setCust_id(custId.intValue());
			orderTransaction.setOrderTotal(amount);
			orderTransaction.setPaymentStatus("N");
			orderTransaction.setEmp_id(razororderId);
			orderTransaction.setChannel("RazorPay");
			orderTransaction.setGstin("Yes");
			orderTransaction.setOrderPlacedDate(orderDate);
			obj = new OrderTransactionQueryParameter(orderTransaction);
			obj.setAction(GeneralConstants.INSERT);
			obj.setSql(QueryConstants.ORDER_TRANSACTION_INSERT_QUERY);
			orderId = dbAction.executeDMLToGetId(obj);
			if(orderId != null) {
				session.setAttribute("orderId",orderId);
				if(shippingAddressDetails != null) {
					OrderTransactionShipping orderTransactionShipping = new OrderTransactionShipping();
					orderTransactionShipping.setFirstName(shippingAddressDetails.getFirstName());
					orderTransactionShipping.setLastName(shippingAddressDetails.getLastName());
					orderTransactionShipping.setAddress(shippingAddressDetails.getAddress());
					orderTransactionShipping.setCity(shippingAddressDetails.getCity());
					orderTransactionShipping.setContactNo1(shippingAddressDetails.getContactNo1());
					orderTransactionShipping.setContactNo2(shippingAddressDetails.getContactNo2());
					orderTransactionShipping.setCountry(shippingAddressDetails.getCountry());
					orderTransactionShipping.setOrder_id(orderId.intValue());
					orderTransactionShipping.setPincode(shippingAddressDetails.getPincode());
					orderTransactionShipping.setState(shippingAddressDetails.getState());	
					obj = new OrderTransactionShippingQueryParameter(orderTransactionShipping);
					obj.setAction(GeneralConstants.INSERT);
					obj.setSql(QueryConstants.ORDER_TRANSACTION_SHIPPING_ADDRESS_INSERT_QUERY);
					dbAction.executeDML(obj);	
				}
				List<Object[]> parameters = new ArrayList<Object[]>();
				ProductOtherDetail productOtherDetail =null;
				for(ShoppingCartItem item : cart.getAllCartItem()) {
					 productOtherDetail = dbAction.getSingleData(QueryConstants.PRODUCT_RATE_SINGLE_DATA_QUERY, ProductOtherDetail.class, item.getProduct().getProduct_id());
					parameters.add(new Object[] {orderId.intValue(),item.getProduct().getProduct_id(),item.getProduct().getProductName(), item.getProduct().getImg_loc(), item.getQty(),item.getProduct().getRateInRupee(),item.getTotalInRuppes(),item.getProductColor(),item.getProductSize(),productOtherDetail.getDiscount(), productOtherDetail.getFlatdiscountedrate(), price});
				}
				dbAction.executeBatchUpdate(QueryConstants.ORDER_TRANSACTION_PRDOUCT_INSERT_QUERY,parameters);
				//cart.removeFromCart(item.getProduct());
			}
			}else{
				PreparedStatement pst = null;
				pst = con.prepareStatement("update OrderTransaction set Emp_id='"+razororderId+"' where orderId="+orderId+"");
    			pst.executeUpdate();
    			
    			session.setAttribute("orderId",orderId);
				List<Object[]> parameters = new ArrayList<Object[]>();
				
				 PreparedStatement pst1 = con.prepareStatement("delete from OrderPurchaseDetails where orderId=?");
				 pst1.setString(1, String.valueOf(orderId));  // Vendor ID
				 pst1.executeUpdate();
				
				 pst1 = con.prepareStatement("update OrderTransaction set orderTotal=? where orderId=?");
				 pst1.setString(1, String.valueOf(amount));  // Vendor ID
				 pst1.setString(2, String.valueOf(orderId));
				 pst1.executeUpdate();
				 
				ProductOtherDetail productOtherDetail =null;
				for(ShoppingCartItem item : cart.getAllCartItem()) {
					 productOtherDetail = dbAction.getSingleData(QueryConstants.PRODUCT_RATE_SINGLE_DATA_QUERY, ProductOtherDetail.class, item.getProduct().getProduct_id());
					parameters.add(new Object[] {orderId.intValue(),item.getProduct().getProduct_id(),item.getProduct().getProductName(), item.getProduct().getImg_loc(), item.getQty(),item.getProduct().getRateInRupee(),item.getTotalInRuppes(),item.getProductColor(),item.getProductSize(),productOtherDetail.getDiscount(), productOtherDetail.getFlatdiscountedrate(), price});
				}
				dbAction.executeBatchUpdate(QueryConstants.ORDER_TRANSACTION_PRDOUCT_INSERT_QUERY,parameters);
				
				session.setAttribute("orderId",orderId);
			}
			
			%>
			<form method="POST" name="redirect" action="https://api.razorpay.com/v1/checkout/embedded">
			  <input type="hidden" name="key_id" value="rzp_live_gxHqH0N1wEeEEB">
			  <input type="hidden" name="order_id" value="<%=razororderId%>">
			  <input type="hidden" name="name" value="VIP NUMBER STORe">
			  <input type="hidden" name="description" value="">
			  <input type="hidden" name="image" value="https://www.vipnumberstore.in/assets/img/logo.png">
			  <input type="hidden" name="prefill[name]" value="<%=billingAddressDetails.getFirstName()%>">
			  <input type="hidden" name="prefill[contact]" value="<%=billingAddressDetails.getContactNo1()%>">
			  <input type="hidden" name="prefill[email]" value="<%=customerLoginDetail.getEmailid()%>">
			  <input type="hidden" name="notes[shipping address]" value="VN000<%=orderId%>">
			  <input type="hidden" name="callback_url" value="https://www.vipnumberstore.in/razorResponse.jsp">
			<input type="hidden" name="cancel_url" value="https://www.vipnumberstore.in/cart">
			 <script language='javascript'>document.redirect.submit();</script>
			</form>
			
			<%
			
		}
				DBConnection.close(con, stmt, res);
		}
		
		

%>

	<%} %>
