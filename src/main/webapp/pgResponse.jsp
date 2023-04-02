<!DOCTYPE html>
<%@page import="com.techgate.domain.Product"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.techgate.util.Email"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="com.techgate.cart.ShoppingCartItem"%>
<%@page import="com.techgate.cart.ShoppingCart"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.techgate.util.QueryConstants"%>
<%@page import="com.techgate.util.GeneralConstants"%>
<%@page import="com.techgate.query.PaymentQueryParameter"%>
<%@page import="com.techgate.query.AbstractQueryParameter"%>
<%@page import="com.techgate.domain.OrderPaymentDetail"%>
<%@page import="com.techgate.domain.CustomerAddressDetails"%>
<%@page import="com.techgate.domain.CustomerLoginDetail"%><%@page
	import="com.paytm.pg.merchant.CheckSumServiceHelper"%><%@page
	import="java.util.TreeMap"%><%@page import="java.util.Map"%><%@page
	import="java.util.Enumeration"%><html lang="en-US">
<head>
<!-- Basic Page Head -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>VIP Mobile Number | Fancy Number | VIP Mobile Number | Vip Number Store</title>
<meta name="description" content="VIP NUMBER STORE is known across India as a company that provides valuable and high quality services since 2010.">
<meta name="author" content="VIP NUMBER STORE - vipnumberstore.in">
<meta name="keywords" content="vip number, vanity number, buy vip mobile number online, vip mobile India ,fancy number, fancy mobile number">

<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!-- Favicons -->
<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
<link rel="apple-touch-icon" href="assets/img/logo.png">
<!-- Css -->
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/jquery.bxslider.css">
<link rel="stylesheet" type="text/css" href="assets/css/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="assets/css/owl.theme.css">
<link rel="stylesheet" type="text/css" href="assets/css/prettyPhoto.css">
<link rel="stylesheet" type="text/css" href="assets/css/style.css">
<link rel="stylesheet" type="text/css" href="assets/css/responsive.css">
<!-- Google Fonts -->
<link rel="stylesheet" type="text/css" href="fonts/Raleway.css">
<link rel="stylesheet" type="text/css" href="fonts/Roboto.css">

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-150357017-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-150357017-1');
</script>

<!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window,document,'script',
'https://connect.facebook.net/en_US/fbevents.js');
 fbq('init', '2409116105970793'); 
fbq('track', 'PageView');
</script>
<noscript>
 <img height="1" width="1" 
src="https://www.facebook.com/tr?id=2409116105970793&ev=PageView
&noscript=1"/>
</noscript>

</head>
<body>
	<!-- Site Loader -->
	<div class="site-loader">
		<img src="assets/img/loader.gif" alt="Loading">
	</div>
	<!-- Site Loader End -->
	<!-- Site Back Top -->
	<div class="site-back-top" title="Back to top">
		<i class="fa fa-angle-up"></i>
	</div>
	<!-- Site Back Top End -->
	<!-- Site Navigation -->
	<div class="site-nav"></div>
	<!-- Site Navigation End -->
	<!-- Site Container -->
	<div id="site-container" class="site-fullscreen site-sticky">
		<!-- Header -->
	<header id="site-header">
		<div class="header-inner">
			<div class="wrapper clearfix">
				<!-- Header Logo -->
				<div class="header-logo"><a href="index"><img src="assets/img/logo.png" alt=""></a></div>
				<!-- Header Logo End -->
				
                
                <div class="header-search">
					
                    
                    	<form action="searchNumbers" method="post" style="float:left;">
						<input name="search" type="text" placeholder="Search Number">
						<button type="submit" class="search-btn"><i class="fa fa-search"></i></button>
					</form>
                    
                    
                    	<a href="cart"> <div class="carticon"> <i class="fa fa-shopping-cart"></i> </div> </a>
                    	
                        <% if(session.getAttribute("custId")==null){%>
                        	<a href="login.html"><div class="singin">Sign In</div></a>
					    <%} %>
					       <a href="vendorLogin"><div class="singin">Vendor</div></a>
                </div>
                
				
				<!-- Header Menu -->
				<nav class="header-menu">
					<ul class="nav-default clearfix">
                    <img src="assets/img/logo2.png" class="menulogo">
						<li class="active"><a href="index">HOME</a></li>
                        <li><a href="VIPNumbers">VIP NUMBERS</a></li>
                        <li><a href="aboutus.html">ABOUT US</a></li>
                        <li><a href="gallery.html">GALLERY</a></li>
                        <li><a href="contact_us.html">CONTACT US</a></li>
                        <% if(session.getAttribute("custId")!=null){ %>
                         <li><a href="#"> My Account </a>
							<ul>
								<li><a href="myorder.jsp">Your Orders</a></li>
								<li><a href="signout.jsp">Logout</a></li>
							</ul>
						</li>
                        <%}%>
					</ul>
				</nav>
				<!-- Header Menu End -->
				
				<!-- Header Nav -->
				<div class="header-nav"><i class="fa fa-bars fa-2x"></i></div>
				<!-- Header Nav End -->
			</div>
		</div>
	</header>
		<!-- Header End -->
		<!-- Contact -->
		<!-- Slider -->
	<section id="site-slider" style="border-bottom:1px solid #f23c00;">
		<div class="wrapper">
			<img src="assets/img/thankyou.jpg" alt="Slide" class="img-full" />
		</div>
	</section>
	<!-- Slider End -->
			<!-- Section Header End -->
			<!-- Contact Info -->
			<div class="box-white">
				<div class="wrapper padding-all">
					<div class="row">
						<div class="col-md-1 col-sm-12"></div>
						<!-- Contact Information -->
						<div class="col-md-4 col-sm-12">
							<img src="assets/img/loginpage.jpg" width="100%" alt="">
						</div>
						<!-- Contact Information End -->
						<%	
						            Enumeration<String> paramNames = request.getParameterNames();					
						            Map<String, String[]> mapData = request.getParameterMap();					
						            TreeMap<String,String> parameters = new TreeMap<String,String>();	
						            String paytmChecksum =  "";					
						            while(paramNames.hasMoreElements()) {
						            	String paramName = (String)paramNames.nextElement();						
						            	if(paramName.equals("CHECKSUMHASH")){							
						            		paytmChecksum = mapData.get(paramName)[0];						
						            		}else{	
						            			parameters.put(paramName,mapData.get(paramName)[0]);						
						            			}	
						            	}
						            
						            
						            DBConnection dbcon = new DBConnection();								 
			            			Connection con = dbcon.getCon();	
			            			PreparedStatement pst = null, pst1=null;
			            			Statement stmt =  con.createStatement();
			            			 boolean isValidrequest = true;
			            			pst1=con.prepareStatement("select * from OrderPaymentDetail where tracking_id=?");
			            			pst1.setString(1, parameters.get("TXNID"));
			            			 ResultSet rs = pst1.executeQuery();
			            			if(rs.next()){
			            				isValidrequest = false;
			            			}
						            
						            boolean isValideChecksum = false;					
						            String outputHTML="",RESPCODE="";					
						            String BANKNAME="",BANKTXNID="",CURRENCY="",GATEWAYNAME="",ORDERID="",PAYMENTMODE="",RESPMSG="",STATUS="Failed",TXNAMOUNT="",TXNDATE="",TXNID="";
						            try{	
						            	isValideChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum("ig7hfknTyhMDknyE",parameters,paytmChecksum);
						            	if(isValideChecksum && isValidrequest){	
						            		BANKNAME = parameters.get("BANKNAME");							
						            		BANKTXNID = parameters.get("BANKTXNID");	
						            		CURRENCY = parameters.get("CURRENCY");	
						            		GATEWAYNAME = parameters.get("GATEWAYNAME");	
						            		ORDERID = parameters.get("ORDERID").split("\\_")[0];	
						            		PAYMENTMODE = parameters.get("PAYMENTMODE");	
						            		RESPMSG = parameters.get("RESPMSG");	
						            		STATUS = parameters.get("STATUS").trim();	
						            		TXNAMOUNT = parameters.get("TXNAMOUNT");	
						            		TXNDATE = parameters.get("TXNDATE");	
						            		TXNID = parameters.get("TXNID");	
						            		RESPCODE =  parameters.get("RESPCODE");
						            		System.out.println("VIP PG Response  >>> ");	
						            		System.out.println("BANKNAME >>> "+BANKNAME);	
						            		System.out.println("BANKTXNID >>> "+BANKTXNID);	
						            		System.out.println("CURRENCY >>> "+CURRENCY);	
						            		System.out.println("GATEWAYNAME >>> "+GATEWAYNAME);
						            		System.out.println("ORDERID >>> "+ORDERID);	
						            		System.out.println("PAYMENTMODE >>> "+PAYMENTMODE);
						            		System.out.println("RESPMSG >>> "+RESPMSG);	
						            		System.out.println("STATUS >>> "+STATUS);	
						            		System.out.println("TXNAMOUNT >>> "+TXNAMOUNT);	
						            		System.out.println("TXNDATE >>> "+TXNDATE);	
						            		System.out.println("TXNID >>> "+TXNID);	
						            		System.out.println("RESPCODE >>> "+RESPCODE);
						            		ClassPathXmlApplicationContext context=(ClassPathXmlApplicationContext) application.getAttribute("context");
						            		DBAction dbAction = (DBAction) context.getBean("dbaction");
						            		
						            		
					            			String custName="",contactNo="",custEmail="", custID="";
					            			ResultSet res = stmt.executeQuery("select cb.*,cl.emailid from CustomerBillingDetails cb, CustomerLoginDetails cl where cb.cust_id = cl.cust_id and  cb.cust_id in (select cust_id from OrderTransaction where orderId='"+ORDERID+"')");
					            			if(res.next()) {
					            				custName = res.getString("firstName");
					            				contactNo = res.getString("contactNo1");
					            				custEmail = res.getString("emailid");
					            				custID= res.getString("cust_id");
					            				
					            			}
						            
						            		
						            		String paymentDate =  new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar.getInstance().getTime());
						            		OrderPaymentDetail orderPaymentDetail = new OrderPaymentDetail();	
						            		orderPaymentDetail.setTracking_id(TXNID);	
						            		orderPaymentDetail.setAmount(TXNAMOUNT);	
						            		orderPaymentDetail.setOrderid(ORDERID);	
						            		orderPaymentDetail.setEmail(custEmail);	
						            		orderPaymentDetail.setStatus(STATUS);	
						            		orderPaymentDetail.setBank_ref_no(BANKTXNID);	
						            		orderPaymentDetail.setPayment_mode(PAYMENTMODE);
						            		orderPaymentDetail.setCard_name(GATEWAYNAME);	
						            		orderPaymentDetail.setStatus_code(RESPCODE);	
						            		orderPaymentDetail.setStatus_message(RESPMSG);	
						            		orderPaymentDetail.setResponse_code(RESPCODE);	
						            		orderPaymentDetail.setFailure_message(RESPMSG);	
						            		orderPaymentDetail.setPayment_date(paymentDate);
						            		orderPaymentDetail.setApprove("Y");	
						            		AbstractQueryParameter obj = null;	
						            		obj = new PaymentQueryParameter(orderPaymentDetail);
						            		obj.setAction(GeneralConstants.INSERT);
						            		obj.setSql(QueryConstants.ORDER_TRANSACTION_PAYMENT_INSERT_QUERY);
						            		dbAction.executeDML(obj);	
						            		if(STATUS.equalsIgnoreCase("TXN_SUCCESS") || STATUS.equalsIgnoreCase("Txn Success")){
						            			
						            			pst = con.prepareStatement("update OrderTransaction set paymentStatus='Y',orderStatus='Order Placed',updatedDate=Now()  where orderId="+ORDERID+"");
						            			pst.executeUpdate();	
						            			pst1 = con.prepareStatement("update ProductDetails set number_status='Sold' where product_id in (select product_id from  OrderPurchaseDetails where orderId="+ORDERID+")");
						            			pst1.executeUpdate();
						            			pst = con.prepareStatement("insert into myInvoices values('0','"+ORDERID+"',curDate());");
						            			pst.executeUpdate();	
						            			String Number ="";	
						            			
						            			
						            			res = stmt.executeQuery("select productName from OrderPurchaseDetails where orderId='"+ORDERID+"'");
						            			int cc=0;
						            			while(res.next()) {
						            				cc++;
						            				
						            				
						            				
						            				if(cc==1){
						            					Number =  res.getString("productName");
						            				}else{
						            					Number = Number +","+ res.getString("productName");
						            				}
						            				
						            				Number = Number.replaceAll("\\<[^>]*>","");
						            				Number = Number.replaceAll("\\s+","").trim();
							            			Number = Number.replaceAll("&nbsp;","");
							            			Number = Number.replaceAll("-","");
							            			
						            			}
							            			
							            			try{
							            			 Product product = dbAction.getSingleData(QueryConstants.PRODUCT_Number_SINGLE_DATE_QUERY,Product.class,Number.replaceAll("\\s+","").trim());
							            			 if(product.getVendor_id()>0){
				            				 			res = stmt.executeQuery("select contactno1 from vendorDetails where id='"+product.getVendor_id()+"'");
						                                   if (res.next()){
							            			    // String Message = "Dear Vendor, Your Vanity Number "+Number+" has been SOLD through Vipnumberstore.in. Kindly share Code as soon as possible. Regards VipNumberStore";
								            			 String Message = "Dear Vendor, Your Vanity Number "+Number+" has been SOLD through Vipnumberstore.in. Kindly share Code as soon as possible. Regards VipNumberStore";		
			            									String sendUrl = "https://alerts.kaleyra.com/api/v4/?method=sms&api_key=A95f6ac715c8eb5e4eac8a88b231a4d8a&to="+res.getString("contactno1").trim()+"&sender=VIPNUM&message="+Message+"";	
		           										    sendUrl = sendUrl.replace(" ", "%20");	
		            										URL url = new URL(sendUrl);		
		            										//System.out.println(sendUrl);	
		            										URLConnection urlConn = url.openConnection();	
		            										urlConn.setDoOutput(true);							
		            										HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
		            										httpConn.connect();										      
		            										BufferedReader br = new BufferedReader(new InputStreamReader(httpConn.getInputStream()));	
		            										br.close();	
								            			 }
							            			 }
							            			}catch(Exception e){
							            				e.printStackTrace();
							            			}
						            			     
						            			
						            			

						            			try {			
						            				
							            			
						            				
						            				
						            				//String Message = "Dear "+custName+", Thank you for chossing us. Your Vanity Number "+Number+" has been booked through online transaction of Rs. "+TXNAMOUNT+". Our executive will get in touch with you shortly. Regards Vipnumberstore.in";
						            				String Message = "Dear "+custName+", Thank you for chossing us. Your Payment is Confirmed for Vanity Number "+Number+" through online transaction of Rs. "+TXNAMOUNT+". Your order is under Approval our executive will get in touch with you shortly. Regards Vipnumberstore.in";		
						            				Message = Message.replaceAll("&", "%26");	
						            			    String sendUrl = "https://alerts.kaleyra.com/api/v4/?method=sms&api_key=A95f6ac715c8eb5e4eac8a88b231a4d8a&to="+contactNo.trim()+"&sender=VIPNUM&message="+Message+"";	
           										    sendUrl = sendUrl.replace(" ", "%20");	
            										URL url = new URL(sendUrl);		
            										//System.out.println(sendUrl);	
            										URLConnection urlConn = url.openConnection();	
            										urlConn.setDoOutput(true);							
            										HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
            										httpConn.connect();										      
            										BufferedReader br = new BufferedReader(new InputStreamReader(httpConn.getInputStream()));	
            										br.close();										         	
            										//  Admin	
            										
            										String Message1 = "Your Vanity Number "+Number+" has been booked through online transaction of Rs. "+TXNAMOUNT+". Order ID is "+ORDERID+" VipNumberStore";
            										//String Message1 = "Your Vanity Number "+Number+" has been booked through online transaction of Rs. "+TXNAMOUNT+". Order ID is "+ORDERID+"";			
            										Message1 = Message1.replaceAll("&", "%26");		
            										String sendUrl1 = "https://alerts.kaleyra.com/api/v4/?method=sms&api_key=A95f6ac715c8eb5e4eac8a88b231a4d8a&to=9530000007&sender=VIPNUM&message="+Message1+"";	
            										sendUrl1 = sendUrl1.replace(" ", "%20");	
            										URL url1 = new URL(sendUrl1);			
            										// System.out.println(sendUrl1);	
            										URLConnection urlConn1 = url1.openConnection();		
            										urlConn1.setDoOutput(true);					
            										HttpURLConnection httpConn1 = (HttpURLConnection) url1.openConnection();
            										httpConn1.connect();										
            										BufferedReader br1 = new BufferedReader(new InputStreamReader(httpConn1.getInputStream()));	
            										br1.close();
            										
            										
            										// Vendor
            										
            										
            										
            										// Email
            										
            										String sub ="Thank you for Order!";
            										String body="<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'> \r\n" + 
            												"			<html xmlns='http://www.w3.org/1999/xhtml'> \r\n" + 
            												"			<head> " + 
            												"			<meta http-equiv='Content-Type' content='text/html; charset=utf-8' /> " + 
            												"			<title>VIP Number Store</title> " + 
            												"			</head> " + 
            												"			<body style='margin: 0px;'> " + 
            												"			<table align='center' style='width: 650px; font-size: 10.5pt; color: #000000; border-width: 1px; border-style: solid; border-color: #e5e5e5; font-family: arial' cellpadding='10' cellspacing='0'> " + 
            												"			  <tr> " + 
            												"			    <td style='border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: #e5e5e5;'><table width='100%' border='0' cellspacing='0' cellpadding='0'> " + 
            												"			        <tbody> " + 
            												"			          <tr> " + 
            												"			            <td colspan='3'><p style='font-size: 13pt;'><b>Dear "+custName+",</b></p> " + 
            												"			            <p>Greetings from VIP NUMBER STORE.</p>" + 
            												"						 <p>We are delighted to have you as our valued customer and wish you good health and prosperity.</p> " + 
            														"				 <p>Your invoice  can be viewed, printed or downloaded as PDF from the link below.</p> " + 
            												"			<a href='https://vipnumberstore.in/myInvoice?orderId="+ORDERID+"&custId="+custID+"' target='_blank'>View Invoice</a>" + 
            												"			</p> " + 
            												"			<p>Thank you for choosing us  We value your association and look forward to serving you with our products and services for many more years to come.</p> " + 
            												"			<br> " + 
            												"			<p> " + 
            												"			Warm Regards,<br> " + 
            												"			<b>VIP NUMBER STORE</b><br/></p></td> " + 
            												"			          </tr> " + 
            												"			        </tbody> " + 
            												"			      </table></td> " + 
            												"			  </tr> " + 
            												"			</table> " + 
            												"			</body> " + 
            												"			</html>";
            														
            										Email.mailsend(custEmail, sub, body, "pankajsetia007@gmail.com");
            										
            														
            										
            										} catch (Exception e) {		
           											e.printStackTrace();	
           											}						
						            			DBConnection.close(con, pst, res);						
						            			}									
						            		session.removeAttribute("cart");					
						            		}else{										
						            			outputHTML="<b>Checksum mismatched.</b>";	
						            			}								
						            	}catch(Exception e){	
						            		e.printStackTrace();	
						            		}				
						            %>
						            
						<!-- Contact Form -->
						
						<div class="col-md-5 col-sm-12 boxshadow padding-all-20">
							<div class="data-form">
								<div class="row">
									<div class="col-md-12 col-sm-12 margin-bottom-10">
										<h2 class="heading_for_subtitle">Please find below Your Transcation Details</h2>
										<!-- <label>E-Mail</label> -->
										<hr>
										<b>Status :- </b> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <b> <%= STATUS %></b><br />
										<br /> <b>Order ID </b> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <b>
											VN000<%= ORDERID %>
										</b><br />
										<br /> <b>TXN ID </b> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <b>
											<%= TXNID %>
										</b><br />
										<br /> <b>Amount </b> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <b>
											<%= TXNAMOUNT %>
										</b><br />
										<br /> <b>Message </b> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <b>
											<%= RESPMSG %>
										</b><br />
										<br />
									</div>
								</div>
							</div>
						</div>
						<!-- Contact Form End -->
						<div class="col-md-1 col-sm-12"></div>
					</div>
				</div>
			</div>
			<!-- Contact Info End -->
		</section>
		<!-- Contact End -->
		<!-- Footer -->
		<footer id="site-footer">
			<div class="wrapper">
				<!-- Footer Top -->
				<!-- Footer Top End -->
				<!-- Footer Middle -->
				<div class="footer-middle">
					<div class="row margin-none">
						<div class="col-md-8 col-sm-12 padding-none menubarbo"></div>
						
						<!-- Footer Middle Address End -->
						<!-- Footer Middle Social -->
						<div class="col-md-4 col-sm-12 padding-none">
							<ul class="social-icons nav-default pull-right clearfix">
								<li><a href="#" class="facebook"><i
										class="fa fa-facebook"></i></a></li>
								<li><a href="#" class="twitter"><i
										class="fa fa-twitter"></i></a></li>
								<li><a href="#" class="google"><i
										class="fa fa-google-plus"></i></a></li>
								<li><a href="#" class="linkedin"><i
										class="fa fa-linkedin"></i></a></li>
							</ul>
						</div>
						<!-- Footer Middle Social End -->
					</div>
				</div>
				<!-- Footer Middle End -->
				<!-- Footer Bottom -->
				<div class="footer-bottom">
					<div class="row margin-none">
						<div class="col-md-12 col-sm-12 padding-none">
							<p class="text-medium text-small">© Vip Number Store. All
								Rights Reserved.</p>
						</div>
					</div>
				</div>
				<!-- Footer Bottom End -->
			</div>
		</footer>
		<!-- Footer End -->
	</div>
	<!-- Site Container End -->
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="assets/js/owl.carousel.js" type="text/javascript"></script>
	<script src="assets/js/jquery.bxslider.min.js" type="text/javascript"></script>
	<script src="assets/js/jquery.matchHeight.js" type="text/javascript"></script>
	<script src="assets/js/jquery.prettyPhoto.js" type="text/javascript"></script>
	<script src="assets/js/jquery.countTo.js" type="text/javascript"></script>
	<script src="assets/js/jquery.stellar.js" type="text/javascript"></script>
	<script src="assets/js/jquery.fitvids.js" type="text/javascript"></script>
	<script src="assets/js/imagesloaded.pkgd.js" type="text/javascript"></script>
	<script src="assets/js/masonry.pkgd.js" type="text/javascript"></script>
	<!-- Map Scripts -->
	<script src="https://maps.google.com/maps/api/js?sensor=false&amp;language=en" type="text/javascript"></script>
	<script src="assets/js/gmap3.min.js" type="text/javascript"></script>
	<!-- Custom Scripts -->
	<script src="assets/js/scripts.js" type="text/javascript"></script>
</body>
</html>