<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="java.util.List"%>
<%@page import="com.techgate.domain.OrderTransaction"%>
<%@page import="com.techgate.util.QueryConstants"%>
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
  
  <link rel="stylesheet" href="./CP/plugins/bootstrap-daterangepicker/daterangepicker.css">
  
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

</head>
<body class="hold-transition skin-yellow fixed sidebar-mini">
<div class="wrapper">

  <header class="main-header">

    <!-- Logo -->
    <a href="#" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>T</b>GT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>VIP NUMBER STORE</b></span>
    </a>
	<%
			String id=(String)session.getAttribute("euserid"); 
    		  if(id==null){
  				response.sendRedirect("login");
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
  <%@ include file="menu.jsp" %>
  
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <%
    
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    %>
    <section class="content-header">
      <h1>
        Sales Report 
        
        &nbsp;&nbsp;&nbsp;&nbsp;
        
        <button type="button" class="btn btn-default" id="daterange-btn">
                    <span>
                      <i class="fa fa-calendar"></i> Date range picker
                    </span>
                    <i class="fa fa-caret-down"></i>
                  </button>
       
       
        
      </h1>

      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"> Sales Report</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	          <div class="box">
            <!-- /.box-header -->
            <div class="box-body">
            
          
            <form name="search" id="search" method="post" action="salesReport">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                <th>SR NO</th>
                 <th>Order No</th>
                <th>Order Date</th>
                <th>Number</th>
                <th>Name</th>
			    <th>Mobile No</th>
			    <th>Number Status</th>
			    <th>Number Rate</th>
			    <th>Order Status</th>
					
                </tr>
                </thead>
                <tbody>
               <%
						               SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");
						               SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						               
						             //  String startDate = request.getParameter("startDate");
						              // String endDate = request.getParameter("endDate");
						               
                                        DBConnection dbcon = new DBConnection();
                                		Connection con = dbcon.getCon();
                                		Statement stmt =  con.createStatement();
                                		ResultSet rs=null;
                                		int sr=0;
                                        String payment_status="";
                                        int discount=0,flatDiscount=0,finalDiscount=0, rate=0, percentageDiscount=0;
                                        
                                       System.out.println(startDate);
                                       System.out.println(endDate);
                                        
                                        if(startDate !=null && endDate!=null){
                                        	rs =  stmt.executeQuery("select ot.orderId, ot.orderPlacedDate,ot.orderTotal,ot.paymentStatus,ot.orderStatus,ot.cust_id,ot.updatedDate,cb.firstName,cb.contactNo1,cb.companyName,pd.number,pd.vegProduct,pd.packing,"+
                                            		" po.rateInRupee, po.rateblack, op.discount, op.flatDiscount "+  
                                            		" from OrderTransaction ot, CustomerBillingDetails cb, ProductDetails pd,  ProductOtherDetails po, OrderPurchaseDetails op"+
                                            		" where "+
                                            		" ot.cust_id = cb.cust_id and op.orderId = ot.orderId and op.product_id = pd.product_id and op.product_id = po.product_id  and ot.paymentStatus in ('Y') and DATE(ot.updatedDate) between '"+startDate+"' and '"+endDate+"' order by ot.updatedDate desc,ot.orderId desc");
                                        	
                                        }else{
                                        	rs =  stmt.executeQuery("select ot.orderId, ot.orderPlacedDate,ot.orderTotal,ot.paymentStatus,ot.orderStatus,ot.cust_id,ot.updatedDate,cb.firstName,cb.contactNo1,cb.companyName,pd.number,pd.vegProduct,pd.packing,"+
                                            		" po.rateInRupee, po.rateblack, op.discount, op.flatDiscount "+  
                                            		" from OrderTransaction ot, CustomerBillingDetails cb, ProductDetails pd,  ProductOtherDetails po, OrderPurchaseDetails op"+
                                            		" where "+
                                            		" ot.cust_id = cb.cust_id and op.orderId = ot.orderId and op.product_id = pd.product_id and op.product_id = po.product_id  and ot.paymentStatus in ('Y') order by ot.updatedDate desc,ot.orderId desc");
                                        	
                                        }
                                        
                                        String name="";
                                        while(rs.next()){
                                    		
                                        	sr++;
                                        	
                                        	if(rs.getString("paymentStatus").equalsIgnoreCase("N")){
                                        		payment_status="Pending";
                                        	}else if(rs.getString("paymentStatus").equalsIgnoreCase("C")){
                                        		payment_status="COD";
                                        	}else if(rs.getString("paymentStatus").equalsIgnoreCase("Y")){
                                        		payment_status="Paid";
                                        	}else{
                                        		payment_status="NA";
                                        	}
                                        	
                                        	discount=0;flatDiscount=0;finalDiscount=0; rate=0;percentageDiscount=0;
                                       	    discount = rs.getInt("discount");
                                       	    rate = rs.getInt("rateInRupee");
                                       	    flatDiscount = rs.getInt("flatDiscount");
                                       	 
                                       	 if(discount > 0){
                                       		 
                                       		 percentageDiscount = rate * discount /100;
                                       		 rate = rate - percentageDiscount;
                                       	 }else{
                                       		
                                       		 rate = rate-flatDiscount;
                                       	 }
                                       	
										%>
                                        <tr>
                                        <td><%=sr %></td>
                                        <td>VN000<%=rs.getString("orderId") %></td>
                                        <td><%=outputFormat.format(inputFormat.parse(rs.getString("updatedDate"))) %></td>
                                        <td><%=rs.getString("number") %></td>
                                        <td>
                                         <%if(rs.getString("companyName")!=null && !rs.getString("companyName").equalsIgnoreCase("") && !rs.getString("companyName").equalsIgnoreCase("null") && !rs.getString("companyName").equalsIgnoreCase("NA")){ %>
                                          <%=rs.getString("companyName") %>
                                          <%} else{ %>
                                          <%=rs.getString("firstName") %>
                                          <%} %>
                                          </td>
                                        <td><%=rs.getString("contactNo1") %></td>
                                        <td><%=rs.getString("vegProduct") %> | <%=rs.getString("packing") %></td>
                                        <td><%=rate %></td>
                                       <td><%=rs.getString("orderStatus") %></td>
                                       	
											
											</tr>
                                       <%} DBConnection.close(con, stmt, rs);%>
               
               
                </tbody>
                <tfoot>
                <tr>
               <th>SR NO</th>
                 <th>Order No</th>
                <th>Order Date</th>
                <th>Number</th>
                <th>Name</th>
			    <th>Mobile No</th>
			    <th>Number Status</th>
			    <th>Number Rate</th>
			    <th>Order Status</th>
					
                </tr>
                </tfoot>
                
              </table>
              <input type="hidden" name="startDate" id="startDate" value="" />
              <input type="hidden" name="endDate" id="endDate" value="" />
              </form>
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
<!-- date-range-picker -->
<script src="./CP/plugins/moment/min/moment.min.js"></script>
<script src="./CP/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>


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
      "autoWidth": false
    });
  });
</script>

<script>
  $(function () {
    //Initialize Select2 Elements
    $('#daterange-btn').daterangepicker(
      {
        ranges   : {
          'Today'       : [moment(), moment()],
          'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month'  : [moment().startOf('month'), moment().endOf('month')],
          'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        startDate: moment().subtract(29, 'days'),
        endDate  : moment()
      },
      function (start, end) {
        $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        $('#startDate').val(start.format('YYYY-MM-D'));
        $('#endDate').val(end.format('YYYY-MM-D'));
        $("#search").submit();
      }
    )

    
  })
</script>
<%} %>
</body>
</html>
