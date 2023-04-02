<%@page import="com.techgate.domain.ShippingDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="com.techgate.domain.ProductOtherDetail"%>
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

<%
String profile = (String) session.getAttribute("profile");
                String id = request.getParameter("orderId");
				String contact = request.getParameter("contact");
				String number = request.getParameter("productName").replaceAll("\\<[^>]*>","");
				number = number.replaceAll("&nbsp;","");
				number = number.replaceAll("\\s+","").trim();
				
                ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
                DBAction dbAction = (DBAction) context.getBean("dbaction");
                ShippingDetails shippingDetail = dbAction.getSingleData(QueryConstants.ORDER_TRANSACTION_SHIPPING_DATA_QUERY, ShippingDetails.class, Integer.parseInt(id));
               

                String action = "Update";

                if (shippingDetail == null || shippingDetail.getOrderId() == 0) {
                    action = "Insert";
                }
                String custom = "The UPC for your mobile no. "+number+" is XXXX, valid upto XXXX. Do not share UPC with anyone except the recipient operator personnel. Regards VipNumberStore";
               // String custom = "The UPC for your mobile no. "+number+" is XXXX, valid upto XXXX. Do not share UPC with anyone except the recipient operator personnel.";
              //  String custom = "Unique Porting Code for your mobile number "+number+" is XXXX, Your UPC will be valid till XXXX. Please do not disclose these details to anyone except the authorized personnel of operator where you wish to port.";

                //TODO:To Check whether productOtherDetail is null or object created with blank/Null value

            %>
             <div class="content-wrapper">
					    <!-- Content Header (Page header) -->
					    <section class="content-header">
					      <h1>
					        UPC Detail
					      </h1>
					      <ol class="breadcrumb">
					        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					        <li class="active">UPC Detail</li>
					      </ol>
					    </section>
					
					    <!-- Main content -->
					    <section class="content">
						<div class="box box-success">
						 <div class="box-body">
                            <form class="form-horizontal" action="InsertUpdateShipping"  method="post" name="form" >
                                    
                                    <div class="form-group">
                                            <label class="col-sm-2 control-label">Description</label>
                                           <div class="col-sm-10">
                                                <textarea id="editor1" name="shippingDetails" rows="10" cols="80"><%if(shippingDetail != null) { %> <%=shippingDetail.getCourierName()%><%}else{%><%=custom%><%} %></textarea>
                                            </div>
                                        </div>
                                        <%if(!profile.equalsIgnoreCase("Sales")){ %>
                                   <div class="box-footer">
                                            <button type="submit" class="btn btn-info pull-right">Add UPC Details</button>
                                        </div>
                                        <%} %>
                                    
                                    	<input type="hidden" name="hdnId" id="hdnId" value="<%=id %>">
                                    	<input type="hidden" name="contact" id="contact" value="<%=contact %>">
                                    	<input type="hidden" name="vanityNumber" id="vanityNumber" value="<%=number %>">
                                    	
	                                    <input type="hidden" name="hdnAction" id="hdnAction" value="<%=action %>">
                                </form>

                           </div>
   </div>
	

    </section>
    <!-- /.content -->
  </div>
</body>
</html>