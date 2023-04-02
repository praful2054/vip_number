<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="java.text.Format"%>
<%@page import="java.util.List"%>
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
    <section class="content-header">
      <h1>
        Vendor&nbsp;&nbsp;&nbsp;&nbsp;  <a href="vendorPaymentsEntry?type=Y">Add Payment</a>
        <!-- 
        &nbsp;&nbsp;&nbsp;&nbsp;
        
        <button type="button" class="btn btn-default" id="daterange-btn">
                    <span>
                      <i class="fa fa-calendar"></i> Date range picker
                    </span>
                    <i class="fa fa-caret-down"></i>
                  </button>
                  
                   -->
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Vendor Details</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	          <div class="box">
            <!-- /.box-header -->
            <div class="box-body">
            <form name="search" id="search" method="post" action="vendorPayments">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Vendor Name</th>
	    			<th>Contact No</th>
					<th>Total Credit</th>
					<th>Total Debit</th>
					<th>Balance</th>
					<th>Statement</th>
                </tr>
                </thead>
                <tbody>
                <%
                                        DBConnection dbcon = new DBConnection();
                                		Connection con = dbcon.getCon();
                                		Statement stmt =  con.createStatement();
                                		Statement stmt1 =  con.createStatement();
                                		Statement stmt2 =  con.createStatement();
                                		Statement stmt3 =  con.createStatement();
                                		Statement stmt4 =  con.createStatement();
                                		Statement stmt5 =  con.createStatement();
                                		ResultSet rs1 = null, rs2 = null, rs3=null,res1=null;
                                		
                                		int rateblack=0, totalPaid=0,totaltobepaid=0,totalpending=0;
                                		int  ttotalPaid=0,ttotaltobepaid=0,ttotalpending=0;
                                		double totalcredit=0.0, totaldebit=0.0, balance=0.0; 
                                		double sumtotalcredit=0,sumtotaldebit=0;
                                		String Number="",productprice="", PaymentStatus="";
                                		
                                		String startDate = request.getParameter("startDate");
                                	    String endDate = request.getParameter("endDate");
                                	    
                                	    
                                		ResultSet res = stmt.executeQuery("select * from vendorDetails where firstname is not null and status='Y' and id <> 1 order by firstname asc");
                                        while(res.next()) {
                                        	totalPaid=0;totaltobepaid=0;totalpending=0;
                                        	totalcredit=0.0; totaldebit=0.0; balance=0.0; 
                                           
                                        	
                                        	if(startDate !=null && endDate!=null){
                                        		rs1 = stmt1.executeQuery("select sum(po.rateblack) from OrderPurchaseDetails op, OrderTransaction ot, ProductDetails pd, ProductOtherDetails po where pd.vendor_id='"+res.getString("id")+"' and op.product_id = pd.product_id and ot.orderId = op.orderId  and pd.product_id = po.product_id and ot.paymentStatus='Y' and ot.orderStatus='Order Confirmed'");
     										   
                                    	    }else{
                                    	    	rs1 = stmt1.executeQuery("select sum(po.rateblack) from OrderPurchaseDetails op, OrderTransaction ot, ProductDetails pd, ProductOtherDetails po where pd.vendor_id='"+res.getString("id")+"' and op.product_id = pd.product_id and ot.orderId = op.orderId  and pd.product_id = po.product_id and ot.paymentStatus='Y' and ot.orderStatus='Order Confirmed'");
     										   
                                    	    }
                                           if(rs1.next()){
											   totalcredit = rs1.getDouble(1);
										   }
										   
                                           if(startDate !=null && endDate!=null){
										   rs1 = stmt2.executeQuery("select sum(amount) from vendorPaymentDetails  where vendorId='"+res.getString("id")+"' and DATE(paymentDate) between '"+startDate+"' and '"+endDate+"'");
                                           }else{
                                        	   rs1 = stmt2.executeQuery("select sum(amount) from vendorPaymentDetails  where vendorId='"+res.getString("id")+"'");
                                                
                                           }
										   if(rs1.next()){
											   totaldebit = rs1.getDouble(1);
										   }
										   
										   
										   balance = totalcredit - totaldebit;
										   
										   sumtotalcredit = sumtotalcredit + totalcredit;
										   sumtotaldebit = sumtotaldebit + totaldebit;
										   
										  
	                                		
	                                		
										%>
                                        <tr>
                                            <td class="center"><%=res.getString("id") %></td>
                                            <td class="center"><%=res.getString("firstname") %> </td>
                                            <td class="center"><%=res.getString("contactno1") %></td>
                                            <td class="center"><a href="vendorTotalCredit?vendorId=<%=res.getString("id")%>&startDate=<%=startDate%>&endDate=<%=endDate%>"><%=totalcredit %></a></td> 
                                            <td class="center"><a href="vendorTotalDebit?vendorId=<%=res.getString("id")%>&startDate=<%=startDate%>&endDate=<%=endDate%>"><%=totaldebit %></a></td>
                                            <td class="center"><%=balance %></td>
											<td class="center"><a class="glyphicon glyphicon-file" href="vendorStatements?vendorId=<%=res.getString("id")%>&startDate=<%=startDate%>&endDate=<%=endDate%>" target="_blank"></a></td>
                                           
                                            </tr>
                                        <%
                                            }
                                        DBConnection.close(con, stmt, res);
                                        %>
                </tbody>
                <tfoot>
               <tr>
                    <th>ID</th>
                    <th>Vendor Name</th>
	    			<th>Contact No</th>
					<th>Total Credit</th>
					<th>Total Debit</th>
					<th>Balance</th>
					<th>Statement</th>
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
<!-- AdminLTE for demo purposes -->

<!-- date-range-picker -->
<script src="./CP/plugins/moment/min/moment.min.js"></script>
<script src="./CP/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
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
        //startDate: moment().subtract(29, 'days'),
        //endDate  : moment()
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
