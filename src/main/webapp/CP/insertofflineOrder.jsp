<%@page import="com.techgate.util.Email"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.techgate.query.OrderTransactionShippingQueryParameter"%>
<%@page import="com.techgate.domain.CustomerAddressDetails"%>
<%@page import="com.techgate.domain.OrderTransactionShipping"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techgate.util.QueryConstants"%>
<%@page import="com.techgate.util.GeneralConstants"%>
<%@page import="com.techgate.query.OrderTransactionQueryParameter"%>
<%@page import="com.techgate.domain.OrderTransaction"%>
<%@page import="com.techgate.query.AbstractQueryParameter"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>VIP NUMBER STORE | Admin</title>
   <link rel="icon" type="images/ico" href="./CP/img/fav.ico" />
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="./CP/css/bootstrap.min.css">
  <!-- Font Awesome -->
  
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
<body class="hold-transition skin-red fixed sidebar-mini">
<div class="wrapper">

  <header class="main-header">

    <!-- Logo -->
    <a href="#" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>T</b>GT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>VIP&nbsp;NUMBER&nbsp;STORE</b></span>
    </a>
	<%
			String eid=(String)session.getAttribute("euserid"); 
    		  if(eid==null){
  				response.sendRedirect("VIP-login");
  			}else{
		%>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <!-- Notifications: style can be found in dropdown.less -->
          <!-- Tasks: style can be found in dropdown.less -->
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="./CP/img/avatar5.png" class="user-image" alt="User Image">
              <span class="hidden-xs"><%=session.getAttribute("employeeName") %></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="./CP/img/avatar5.png" class="img-circle" alt="User Image">

                <p>
                  <%=session.getAttribute("employeeName") %> - <%=session.getAttribute("profile") %>
                </p>
              </li>
              <!-- Menu Body -->
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="logout" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>

    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <%@ include file="menu.jsp"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Employee
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Employee</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	<div class="box box-success">
	 <div class="box-body">
	 <%
	 try{
		
		PreparedStatement prepare = null;
		Connection con=new DBConnection().getCon();
		Statement stmt = con.createStatement();
		Statement stmt1 = con.createStatement();
		ResultSet res = null;
		ResultSet rs = null;
		boolean status=false;
		boolean numberStatus=false;
		Number orderId=0;
		Number custId = Integer.parseInt(request.getParameter("custId"));
		String Number[] = request.getParameter("numbers").split(",");
		String gstin = request.getParameter("gst")==null?"":request.getParameter("gst");
		String customerEmail = request.getParameter("email");
		String orderDate = request.getParameter("orderDate")==null?"":request.getParameter("orderDate");
		String emailFlag= request.getParameter("emailFlag");
		
		

		
		DateFormat inputFormat = new SimpleDateFormat("MM/dd/yyyy");
	    Date date = null;
	    //System.out.println(amc_start);
	    
	    if(orderDate!=null){
	    	date = inputFormat.parse(orderDate);
	    	orderDate = new SimpleDateFormat("yyyy-MM-dd").format(date);
	    }
		
		
        
       
		
		int pdid=0;
		String number ="";
		for(int i=0;i<Number.length;i++){
			numberStatus=false;
			number = Number[i].trim();
			number = number.replaceAll("\\s+","").trim();
			 res = stmt1.executeQuery("select * from ProductDetails where number='"+number+"' and status='Y' and number_status='Available'");
			 while(res.next()){
				 
				 pdid = res.getInt("product_id");
				  rs = stmt.executeQuery("select orderId from OrderTransaction where cust_id='"+custId+"' and orderStatus not in ('Cancelled','Duplicate','Test','Wrong Data','Refund') and orderId in(select orderId from OrderPurchaseDetails where product_id='"+pdid+"')");
					if(rs.next()){
						orderId = rs.getInt("orderId");
						status = true;
						break;
					}
					
					numberStatus=true;
			}
		}
		
		
		
		if(status){
			%>
			<div class="alert alert-error">
         <button type="button" class="close" data-dismiss="alert">×</button>
         <strong>Order Alredy Exits....</strong>
        </div>
			
			<%
		}else if(!numberStatus){
			%>
			<div class="alert alert-error">
         <button type="button" class="close" data-dismiss="alert">×</button>
         <strong>Number Not Available.... <%=Arrays.toString(Number) %></strong>
        </div>
			
			<%
		}else{
			
			
			double total=0.0,price=0.0, discount=0.0, disprice=0.0,flatdiscountedrate=0.0,gst=0.0;
			for(int i=0;i<Number.length;i++){
				number="";
				number = Number[i].trim();
				number = number.replaceAll("\\s+","").trim();
				//System.out.println("Number >>>>>>>>>>>>>>>>>. "+number);
				res = stmt1.executeQuery("select rateInRupee,discount,flatdiscountedrate from ProductOtherDetails where product_id in( select product_id from ProductDetails where number='"+number+"' and status='Y' and number_status='Available')");
				 if(res.next()){
					 
					 
					    discount = res.getInt(2);
					    flatdiscountedrate = res.getInt(3);
                    	price = res.getInt(1);
                    	if(discount >0){
                    	disprice = price * discount / 100;
                    	
                    	price = price - disprice;
                    	
                    	total=total+price;
                    	}else if(flatdiscountedrate > 0){
                    		price = price - flatdiscountedrate;
                    		total=total+price;
                    	}else{
                    		total=total+price;
                    	}
                    	
					// System.out.println("total >>>>>>>>>>>>>. "+total);
				 }
			}
			 
			
			ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
			DBAction dbAction = (DBAction) context.getBean("dbaction");
			AbstractQueryParameter obj = null;
			final OrderTransaction orderTransaction = new OrderTransaction();
			orderTransaction.setCust_id(custId.intValue());
			orderTransaction.setOrderTotal(total);
			orderTransaction.setPaymentStatus("N");
			orderTransaction.setEmp_id(eid);
			orderTransaction.setChannel("Offline");
			orderTransaction.setGstin(gstin);
			orderTransaction.setOrderPlacedDate(orderDate);
			obj = new OrderTransactionQueryParameter(orderTransaction);
			obj.setAction(GeneralConstants.INSERT);
			obj.setSql(QueryConstants.ORDER_TRANSACTION_INSERT_QUERY);
			orderId = dbAction.executeDMLToGetId(obj);
			
			CustomerAddressDetails shippingAddressDetails = dbAction.getSingleData(QueryConstants.CUSTOMER_BILLING_ADDRESS_SINGLE_DATE_QUERY,CustomerAddressDetails.class,custId);
			
			if(shippingAddressDetails!=null){
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
			for(int i=0;i<Number.length;i++){
				total=0.0;price=0.0; discount=0.0; disprice=0.0;flatdiscountedrate=0.0;gst=0.0;
				number="";
				number = Number[i].trim();
				number = number.replaceAll("\\s+","").trim();
				//System.out.println("Number >>>>>>>>>>>>>>>>>. "+number);
				res = stmt1.executeQuery("select * from ProductOtherDetails where product_id in( select product_id from ProductDetails where number='"+number+"' and status='Y' and number_status='Available')");
				 if(res.next()){
					 discount = res.getInt("discount");
					 flatdiscountedrate = res.getInt("flatdiscountedrate");
                 	price = res.getInt("rateInRupee");
                 	if(discount >0){
                 	disprice = price * discount / 100;
                 	
                 	price = price - disprice;
                 	}else if(flatdiscountedrate > 0){
                		price = price - flatdiscountedrate;
                		
                	}
                 	
                 	if(gstin.equalsIgnoreCase("Yes")){
                 		 gst = price*18/100;
                 	}
                 	
					 parameters.add(new Object[] {orderId.intValue(),res.getInt("product_id"),number, "", 1,price,price,"","",discount,flatdiscountedrate,gst});
				 }
				
			}
			
			dbAction.executeBatchUpdate(QueryConstants.ORDER_TRANSACTION_PRDOUCT_INSERT_QUERY,parameters);
			
			
	
			
			
	 %>
		 <div class="callout callout-success">
                <h4>success callout!</h4>

                <p>Order Add Sucess........ Order id is <%=orderId %></p>
              </div>
		 <%}}
		
		catch(Exception e){
		e.printStackTrace();
		%>
	           <div class="callout callout-danger">
                <h4>danger callout!</h4>

                <p>Error While Processing Data. Please Try Again.</p>
              </div>
        <%
        } %>
	 </div>
   </div>
	

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.3.3
    </div>
    <strong>Copyright &copy; 2010 <a href="http://www.techgate.in" target="_blank">Techgate</a>.</strong> All rights
    reserved.
  </footer>

  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->


</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="./CP/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="./CP/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="./CP/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="./CP/js/app.min.js"></script>
<!-- Sparkline -->
<script src="./CP/plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="./CP/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="./CP/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="./CP/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS 1.0.1 -->
<!-- AdminLTE for demo purposes -->
<script src="./CP/js/demo.js"></script>
<%} %>
</body>
</html>
