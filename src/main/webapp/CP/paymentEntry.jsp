<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techgate.connection.DBConnection"%>
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
       
       <link rel="stylesheet" href="./CP/plugins/datepicker/datepicker3.css">
       
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
			String id=(String)session.getAttribute("euserid"); 
    		  if(id==null){
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
  <%@ include file="menu.jsp" %>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Payments
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Payment Form</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	<div class="box box-success">
	 <div class="box-body">
	                   
                       <form class="form-horizontal" action="insertPayment"  method="post" name="form">
                                   
                                     <%
                                     
                                     String type = request.getParameter("type");
                                    DBConnection dbcon = new DBConnection();
                                	Connection con = dbcon.getCon();
                                	Statement stmt =  con.createStatement();
                                	ResultSet res =null;
                                	if(type.equalsIgnoreCase("New")){
                                	 res = stmt.executeQuery("select * from OrderTransaction where paymentStatus='N' order by orderId desc");
                                	}else{
                                		res = stmt.executeQuery("select * from OrderTransaction where paymentStatus='Y' order by orderId desc");
                                	}
                                    	%>
                                    	
                                    	<input type="hidden" name="paymentType" value="<%=type%>">
                                    	
                                        
                                       <div class="form-group">
                                            <label class="col-sm-2 control-label">Order Id</label>
                                            <div class="col-sm-6">
                                                <select style="width:250px" id="selectError3" name="orderId">
                                                <% while(res.next()) { %>
                                                 <option value="<%=res.getString("orderId")%>"><%=res.getString("orderId")%></option>	
                                                 <% }DBConnection.close(con, stmt, res); %>
                                                </select>
                                            </div>
                                        </div>
									
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Transcation Id</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="transId" type="text" value="" required="required">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Amount</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="amount" type="text" value="" required="required">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group" id="activation">
								                <label class="col-sm-2 control-label">Payment Date:</label>
								                <div class="col-sm-6 input-group date">
								                  <div class="input-group-addon">
								                    <i class="fa fa-calendar"></i>
								                  </div>
								                  <input type="text" name="orderDate" class="form-control pull-right" id="datepicker" required="required">
								                </div>
								                <!-- /.input group -->
								         </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Payment Source</label>
                                            <div class="col-sm-10">
                                                <select style="width:250px" id="selectError3" name="paymentSource" required>
                                                <option value="">------Select--------</option>	
                                                    <option value="Online Paytm Gateway">Online Paytm Gateway</option>	
                                                    <option value="Bank Transfer">Bank Transfer</option>
                                                    <option value="Cash">Cash</option>
                                                    <option value="Paytm">Paytm</option>
                                                    <option value="Paytm QR">Paytm QR</option>
                                                    <option value="Phone Pay">Phone Pay</option>
                                                    <option value="BHIM UPI">BHIM UPI</option>
                                                    <option value="JD Pay">JD Pay</option>
                                                    <option value="G Pay">G Pay</option>
                                                </select>
                                            </div>
                                        </div>
										
                                        <div class="box-footer">
                                            <button type="submit" class="btn btn-info pull-right">Add Payment Details</button>
                                        </div>
                                        
                                </form>
        
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
<script src="./CP/plugins/jQuery/jquery.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="./CP/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="./CP/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="./CP/js/app.min.js"></script>
<!-- Sparkline -->

<!-- ChartJS 1.0.1 -->
<!-- AdminLTE for demo purposes -->
<script src="./CP/js/demo.js"></script>
<!-- CK Editor -->

<script src="./CP/plugins/datepicker/bootstrap-datepicker.js"></script>
<script>
  $(function () {
    //Initialize Select2 Elements

    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    });
    $('#datepicker1').datepicker({
        autoclose: true
      });
    $('#datepicker2').datepicker({
        autoclose: true
      });
  });
</script>
<%} %>
</body>
</html>
