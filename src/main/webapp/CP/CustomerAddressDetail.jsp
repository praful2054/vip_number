<%@page import="com.techgate.domain.CustomerLoginDetail"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="com.techgate.domain.CustomerAddressDetails"%>
<%@page import="org.springframework.util.StringUtils"%>
<%@page import="com.techgate.util.QueryConstants"%><html>
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
					        Customer Address Detail
					      </h1>
					      <ol class="breadcrumb">
					        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					        <li class="active">Customer Address Detail</li>
					      </ol>
					    </section>
					
					    <!-- Main content -->
					    <section class="content">
						<div class="box box-success">
						 <div class="box-body">
<%
SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
DBAction dbAction = (DBAction) context.getBean("dbaction");

CustomerAddressDetails detail = null;
CustomerLoginDetail lDetail = null;
String address = request.getParameter("address");

int id = 0;

if(StringUtils.hasText(request.getParameter("id"))) {
	id = Integer.parseInt(request.getParameter("id"));
}

int cust_id=0;
if(StringUtils.hasText(request.getParameter("cust_id"))) {
	cust_id = Integer.parseInt(request.getParameter("cust_id"));
}


if(StringUtils.hasText(address) && address.equalsIgnoreCase("billing")) {
	detail = dbAction.getSingleData(QueryConstants.CUSTOMER_BILLING_ADDRESS_SINGLE_DATE_QUERY,CustomerAddressDetails.class,id);
	lDetail = dbAction.getSingleData(QueryConstants.CUSTOMER_LOGIN_DETAILS_SINGLE_DATE_QUERY_USING_ID,CustomerLoginDetail.class,id);
} else if(StringUtils.hasText(address) && address.equalsIgnoreCase("shipping")){
	detail = dbAction.getSingleData(QueryConstants.CUSTOMER_SHIPPING_ADDRESS_SINGLE_DATE_QUERY,CustomerAddressDetails.class,id);
	lDetail = dbAction.getSingleData(QueryConstants.CUSTOMER_LOGIN_DETAILS_SINGLE_DATE_QUERY_USING_ID,CustomerLoginDetail.class,id);
} else {
	detail = dbAction.getSingleData(QueryConstants.ORDER_TRANSACTION_SHIPPING_ADDRESS_SINGLE_DATE_QUERY,CustomerAddressDetails.class,id);
	lDetail = dbAction.getSingleData(QueryConstants.CUSTOMER_LOGIN_DETAILS_SINGLE_DATE_QUERY_USING_ID,CustomerLoginDetail.class,cust_id);
}



if(detail != null) {
%>
<div class="form-group">
<label class="col-sm-2 control-label" for="focusedInput">Name</label>
<div class="col-sm-10">
	<%= detail.getFirstName() %>&nbsp;<%= detail.getLastName()==null?"":detail.getLastName() %>
</div>
</div>

<div class="form-group">
<label class="col-sm-2 control-label" for="focusedInput">Contact No </label>
<div class="col-sm-10">
	<%= detail.getContactNo1()%>
</div>
</div>

<div class="form-group">
<label class="col-sm-2 control-label" for="focusedInput">Email Address </label>
<div class="col-sm-10">
	<%= lDetail.getEmailid()%>
</div>
</div>


<div class="form-group">
<label class="col-sm-2 control-label" for="focusedInput">Address </label>
<div class="col-sm-10">
	<%= detail.getAddress()%>
</div>
</div>


<div class="form-group">
<label class="col-sm-2 control-label" for="focusedInput">Pincode </label>
<div class="col-sm-10">
	<%= detail.getPincode()%>
</div>
</div>

<div class="form-group">
<label class="col-sm-2 control-label" for="focusedInput">State </label>
<div class="col-sm-10">
	<%= detail.getState()%>
</div>
</div>


<%
}else{
	%><b><center>No Records Found</center></b><%
}
%>
</div>
   </div>
	

    </section>
    <!-- /.content -->
  </div>
</body>
</html>