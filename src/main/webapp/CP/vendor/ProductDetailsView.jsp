<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.techgate.domain.ProductOtherDetail"%>
<%@page import="com.techgate.util.GeneralDAO"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="com.techgate.util.QueryConstants"%>
<%@page import="com.techgate.domain.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
  <link rel="stylesheet" href="./CP/plugins/datatables/dataTables.bootstrap.css">
  
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
			String eid=(String)session.getAttribute("vendorId"); 
    		  //String profile = (String) session.getAttribute("profile");
    		  if(eid==null){
  				response.sendRedirect("vendorLogin");
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
              <span class="hidden-xs"><%=session.getAttribute("VendorName") %></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="./CP/img/avatar5.png" class="img-circle" alt="User Image">

                <p>
                  <%=session.getAttribute("VendorName") %>
                </p>
              </li>
              <!-- Menu Body -->
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="vendorlogout" class="btn btn-default btn-flat">Sign out</a>
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
  <%@ include file="menu.jsp" %>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Product
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Product Details</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	          <div class="box">
            <!-- /.box-header -->
            <div class="box-body">
            
            <%
            String  CateName="", vendorName="";
			
			ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
			DBAction dbAction = (DBAction) context.getBean("dbaction");
			List<Product> productList = dbAction.getDataList(QueryConstants.PRODUCT_ALL_Vendor_QUERY, Product.class,eid);
			GeneralDAO gdao = new  GeneralDAO();
			DateFormat format = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
			DateFormat tformat = new SimpleDateFormat("MM/dd/yyyy");
			DateFormat myformat = new SimpleDateFormat("dd MM yyyy");
			
			
			//DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd MM yyyy");
		    //LocalDate localDate = LocalDate.now();
	        //String d1 = dtf.format(localDate);
	        
	        DateFormat dateFormat = new SimpleDateFormat("dd MM yyyy");
	    	Date date = new Date();
	    	 String d1 = dateFormat.format(date);    
	        Date dd = null;
            %>
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>Code</th>
					<th>Number</th>
					<th>Sum Total</th>
					<th>Category</th>
					<th>Rate</th>
					<th>Updated Date</th>
					<th>Status</th>			
					<th>Action</th>
                </tr>
                </thead>
                <tbody>
                <%
				                Date dateBefore = null, dateAfter=null;
				                long difference = 0,daysBetween=0;
				                String updatedby="", actdate="";
                                       for(Product details : productList){
												CateName=""; dateBefore = null; dateAfter=null;difference = 0;daysBetween=0;updatedby="";
												CateName =gdao.getCateDetails(details.getCate_id());
												ProductOtherDetail productOtherDetail = dbAction.getSingleData(QueryConstants.PRODUCT_RATE_SINGLE_DATA_QUERY, ProductOtherDetail.class, details.getProduct_id());
												actdate = details.getSizeheight()==null?"": details.getSizeheight();
												actdate = actdate.trim();
												actdate = actdate.replaceAll(" ", "");
												if(actdate==null || actdate.isEmpty() || actdate.equalsIgnoreCase("") || actdate.equalsIgnoreCase(" ")){}else{
												
												//	System.out.println("d1 >>>>> "+d1);
												//	System.out.println("details.getSizeheight() >>>>> "+details.getSizeheight());
													
													dd = tformat.parse(details.getSizeheight());
													dateAfter  = myformat.parse(d1);
													dateBefore = myformat.parse(myformat.format(dd));
											       
												 difference = dateAfter.getTime() - dateBefore.getTime();
											        daysBetween = (difference / (1000*60*60*24));
												}
												
												
												
										%>

                                        <tr>
	                                            <td><%=details.getProduct_id() %></td>
												<td><%=details.getNumber() %></td>
												<td><%=details.getLiters() %>=<%=details.getTrap() %></td>
												<td><%=CateName %></td>
												<td><%if(productOtherDetail != null) { %> <%=productOtherDetail.getRateblack() %> <%} else{%>0<%}%></td>
												
												<td><%= format.format(details.getUpdated_date()) %></td>
												<%if(details.getNumber_status().equalsIgnoreCase("Available")){ %>
												<td><a onclick="window.open('vendorstatusUpdate.jsp?productId=<%= details.getProduct_id()%>&status=<%= details.getNumber_status()%>', '_blank', 'height=400, width=500, left=150, top=150,  titlebar=no, toolbar=no, addressbar=no, menubar=no, location=no, resizable=no');" href="#" ><%=details.getNumber_status()%></a></td>
												
												 <%}else{ %>
												 <td><%=details.getNumber_status()%></td>
												 <%} %>
												 <td>
													<a class="glyphicon glyphicon-edit" onclick="window.open('vendorProductEditForm?productId=<%= details.getProduct_id()%>', '_blank', 'height=500, width=800, left=150, top=150,  titlebar=no, toolbar=no, addressbar=no, menubar=no, location=no, resizable=no');" href="#" ></a>&nbsp;&nbsp;
												</td>
                                            </tr>
                                        <%
                                            }

                                        %>
                </tbody>
                <tfoot>
                <tr>
                   <th>Code</th>
					<th>Number</th>
					<th>Sum Total</th>
					<th>Category</th>
					<th>Operator|Circle</th>
					<th>Number Status</th>
					<th>Days</th>
					<th>Rate</th>
					<th>Updated Date</th>
					<th>Status</th>			
					<th>Action</th>
                </tr>
                </tfoot>
              </table>
              
            </div>
            <!-- /.box-body -->
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
<!-- SlimScroll 1.3.0 -->
<script src="./CP/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="./CP/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="./CP/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="./CP/js/demo.js"></script>
<script>
  $(function () {
	  $("#example1").DataTable({"pageLength" : 100});
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "pageLength" : 100
    });
  });
</script>
<%} %>
</body>
</html>
