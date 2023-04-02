<!DOCTYPE html>
<%@page import="com.techgate.util.Email"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="com.techgate.util.QueryConstants"%>
<%@page import="com.techgate.util.GeneralConstants"%>
<%@page import="com.techgate.query.ProductOtherdDetailQueryParameter"%>
<%@page import="com.techgate.query.AbstractQueryParameter"%>
<%@page import="org.springframework.util.StringUtils"%>
<%@page import="com.techgate.domain.ProductOtherDetail"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <html lang="en">
    <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>VIP NUMBER STORE | Admin</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="./CP/css/bootstrap.min.css">
  <!-- Font Awesome -->
   <link rel="icon" type="images/ico" href="./CP/img/fav.ico" />
   <!-- jvectormap -->
   <link rel="stylesheet" href="./CP/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="./CP/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the ./CP/css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="./CP/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-red layout-top-nav">
    <div class="content-wrapper">
					    <!-- Content Header (Page header) -->
					    <section class="content-header">
					      <h1>
					        Order Status
					      </h1>
					      <ol class="breadcrumb">
					        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					        <li class="active">Order Status</li>
					      </ol>
					    </section>
					
					    <!-- Main content -->
					    <section class="content">
						<div class="box box-success">
						 <div class="box-body">
<%
String id=(String)session.getAttribute("euserid"); 

String profile = (String) session.getAttribute("profile");

try{
PreparedStatement prepare = null, prepare1=null;
Connection con=new DBConnection().getCon();

   /*
	prepare=con.prepareStatement("insert into orderfollowup values(0, ?, ?, ?,Now())");
	prepare.setString(1,request.getParameter("enq_id"));
	prepare.setString(2,id);
	prepare.setString(3,request.getParameter("comments"));
	prepare.executeUpdate();
	
	*/
		prepare1=con.prepareStatement("update OrderTransaction set orderStatus=?,Emp_id=? where orderId=? ");
		prepare1.setString(1,request.getParameter("status"));
		prepare1.setString(2,request.getParameter("assignTo"));
		prepare1.setString(3,request.getParameter("enq_id"));
		prepare1.executeUpdate();
	
	
	
	
		Statement stmt =  con.createStatement();
		ResultSet res  = null;
		String Number ="";	
		
		String custName="",contactNo="",custEmail="",custID="";
		 res = stmt.executeQuery("select cb.*,cl.emailid from CustomerBillingDetails cb, CustomerLoginDetails cl where cb.cust_id = cl.cust_id and  cb.cust_id in (select cust_id from OrderTransaction where orderId='"+request.getParameter("enq_id")+"')");
		if(res.next()) {
			custID  = res.getString("cust_id");
			custName = res.getString("firstName");
			contactNo = res.getString("contactNo1");
			custEmail = res.getString("emailid");
			
		}
		
		res = stmt.executeQuery("select productName from OrderPurchaseDetails where orderId='"+request.getParameter("enq_id")+"'");
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
			
		}
		
	if(request.getParameter("status").equalsIgnoreCase("Order Confirmed")){
		String Message ="Order Confirmed!! Your Vanity Number "+Number+" has been booked successfully. You will receive MNP Code shortly. Regards Vipnumberstore.in";
		//String Message ="Order Confirmed!! Your Vanity Number "+Number+" has been booked successfully. You will receive Porting Code shortly. Regards Vipnumberstore.in";
		//String Message ="Order Confirmed!! Your Vanity Number "+Number+" has been booked successfully. You will receive UPC Code shortly. Regards Vipnumberstore.in";
		//String Message = "Dear "+custName+", Thank you for chossing us. Your Payment is Confirmed for Vanity Number "+Number+" through online transaction of Rs. "+TXNAMOUNT+". Your order is under Approval our executive will get in touch with you shortly. Regards Vipnumberstore.in";		
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
				"			<a href='https://vipnumberstore.in/myInvoice?orderId="+request.getParameter("enq_id")+"&custId="+custID+"' target='_blank'>View Invoice</a>" + 
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
						
		Email.mailsend(custEmail, sub, body, "");
		
	}else if(request.getParameter("status").equalsIgnoreCase("Cancelled")){
		
		prepare = con.prepareStatement("update OrderTransaction set paymentStatus='N', updatedDate=Now()  where orderId="+request.getParameter("enq_id")+"");
		prepare.executeUpdate();	
		String Message ="Order Cancelled!! Your Vanity Number "+Number+" has been Cancelled. Regards Vipnumberstore.in";
		//String Message ="Order Cancelled!! Your Vanity Number "+Number+" has been Cancelled. Regards Vipnumberstore.in";
		
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
	}
	
	DBConnection.close(con, prepare, null);
%>
<div class="alert alert-success">
<button type="button" class="close" data-dismiss="alert">×</button>
<strong> Updated Sucess....</strong>
</div>
<%
}
catch(Exception e){
	 %>
         <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>Oh !</strong> Error While Processing Data. Please Try Again. <%=e.getMessage()%>
        </div>
    <%
	e.printStackTrace();
}

%>
     </div>
   </div>
	

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
      <!-- content ends -->
</body>
</html>