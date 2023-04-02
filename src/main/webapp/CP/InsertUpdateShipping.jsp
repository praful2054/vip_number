<!DOCTYPE html>
<%@page import="com.techgate.util.Email"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="com.techgate.query.ShippingDetailQueryParameter"%>
<%@page import="com.techgate.domain.ShippingDetails"%>
<%@page import="com.techgate.util.QueryConstants"%>
<%@page import="com.techgate.util.GeneralConstants"%>
<%@page import="com.techgate.query.ProductOtherdDetailQueryParameter"%>
<%@page import="com.techgate.query.AbstractQueryParameter"%>
<%@page import="org.springframework.util.StringUtils"%>
<%@page import="com.techgate.domain.ProductOtherDetail"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
					        Dispatch Detail
					      </h1>
					      <ol class="breadcrumb">
					        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					        <li class="active">Dispatch Detail</li>
					      </ol>
					    </section>
					
					    <!-- Main content -->
					    <section class="content">
						<div class="box box-success">
						 <div class="box-body">
<%
try{
String id = request.getParameter("hdnId");
String action = request.getParameter("hdnAction");
String contact = request.getParameter("contact");
ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
DBAction dbAction = (DBAction) context.getBean("dbaction");
String shippingDetail = request.getParameter("shippingDetails");

ShippingDetails shippingDetails = new ShippingDetails();

shippingDetails.setOrderId(Integer.parseInt(id));
shippingDetails.setCourierName(shippingDetail);
shippingDetails.setTrackingNo(0);


AbstractQueryParameter query = new ShippingDetailQueryParameter(shippingDetails);

if(action.equals("Insert")) {
	query.setAction(GeneralConstants.INSERT);
	query.setSql(QueryConstants.OrderShippingDetails_INSERT_QUERY);
} else {
	query.setAction(GeneralConstants.UPDATE);
	query.setSql(QueryConstants.OrderShippingDetails_UPDATE_QUERY);
}


dbAction.executeDML(query);


String sendUrl = "https://alerts.kaleyra.com/api/v4/?method=sms&api_key=A95f6ac715c8eb5e4eac8a88b231a4d8a&to="+contact+"&sender=VIPNUM&message="+shippingDetail+"";
sendUrl = sendUrl.replace(" ", "%20");
URL url = new URL(sendUrl);
URLConnection urlConn = url.openConnection();
urlConn.setDoOutput(true);
HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
httpConn.connect();
BufferedReader br = new BufferedReader(new InputStreamReader(httpConn.getInputStream()));
br.close();


String vanityNumber = request.getParameter("vanityNumber");
String msg = "Dear Customer, Apka Vanity mobile no. "+vanityNumber+" ka Unique Code apko hmari taraf se bhej diya gya hai.Code ki vailidity 4 dino ke liye hai.Kirpya ajj hi nearest mobile Shop ya Store par jakkr Number Port karwale. Dhanyawad! Regards Vipnumberstore.in";
//String msg = "Dear Customer, Apka Vanity mobile no. "+vanityNumber+" ka Upc Code apko hmari taraf se bhej diya gya hai.Code ki vailidity 4 dino ke liye hai.Kirpya ajj hi nearest mobile Shop ya Store par jakkr Number Port karwale. Dhanyawad! Regards Vipnumberstore.in";
String sendUrl1 = "https://alerts.kaleyra.com/api/v4/?method=sms&api_key=A95f6ac715c8eb5e4eac8a88b231a4d8a&to="+contact+"&sender=VIPNUM&message="+msg+"";
sendUrl1 = sendUrl1.replace(" ", "%20");
URL url1 = new URL(sendUrl1);
URLConnection urlConn1 = url1.openConnection();
urlConn1.setDoOutput(true);
HttpURLConnection httpConn1 = (HttpURLConnection) url1.openConnection();
httpConn1.connect();
BufferedReader br1 = new BufferedReader(new InputStreamReader(httpConn1.getInputStream()));
br1.close();


DBConnection dbcon = new DBConnection();								 
Connection con = dbcon.getCon();	
Statement stmt =  con.createStatement();

String custName="",contactNo="",custEmail="", custID="";
ResultSet res = stmt.executeQuery("select cb.*,cl.emailid from CustomerBillingDetails cb, CustomerLoginDetails cl where cb.cust_id = cl.cust_id and  cb.contactNo1 = '"+contact+"'");
if(res.next()) {
	custName = res.getString("firstName");
	contactNo = res.getString("contactNo1");
	custEmail = res.getString("emailid");
	custID= res.getString("cust_id");
	
}

String sub ="UPC Code";
Email.mailsend(custEmail, sub, shippingDetail, "");

DBConnection.close(con, stmt, res);

%>
<div class="alert alert-success">
<button type="button" class="close" data-dismiss="alert">×</button>
<strong>Details Updated Sucess....</strong>
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
</body>
</html>