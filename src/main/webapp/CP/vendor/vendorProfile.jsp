<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techgate.connection.DBConnection"%>
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
  <link rel="stylesheet" href="./CP/plugins/datepicker/datepicker3.css">
  
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
			String eid=(String)session.getAttribute("vendorId"); 
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
        My Profile
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"> My Profile</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	<div class="box box-success">
	 <div class="box-body">
	 
	  <%
	                   String loginId="",password="",Fname="",address="",address2="",contactno1="",Website="",paytmNo="",gpayNo="",isRegistered="",docs="";
	  String nickName="",bankName="",accountName="",accountNumber="",branchLocation="",ifscCode="";                 
	  DBConnection dbcon = new DBConnection();
               		Connection con = dbcon.getCon();
               		Statement stmt =  con.createStatement();
               		String id = request.getParameter("id");
               		ResultSet res = stmt.executeQuery("select * from vendorDetails where id="+eid);
                       if(res.next()) {
                    	   loginId = res.getString("loginId");
                    	   password = res.getString("password");
                    	   Fname = res.getString("firstname");
                    	   address = res.getString("address");
                    	   address2 = res.getString("address2");
                    	   contactno1 = res.getString("contactno1");
                    	   Website = res.getString("Website");
                    	   paytmNo = res.getString("paytmNo");
                    	   gpayNo = res.getString("gpayNo");
                    	   docs = res.getString("docs");
                    	   isRegistered = res.getString("isRegistered")==null?"":res.getString("isRegistered");
                    	   nickName = res.getString("nickName");
                    	   bankName = res.getString("bankName");
                    	   accountName = res.getString("accountName");
                    	   accountNumber = res.getString("accountNumber");
                    	   branchLocation = res.getString("branchLocation");
                    	   ifscCode = res.getString("ifscCode");
                       }
	                   %>
	                   
	                   
                       <form class="form-horizontal" action=""  method="post" name="form" ENCTYPE="multipart/form-data">
                        <input type="hidden" name="id" value="<%=eid %>" />
                                     <div class="form-group">
                                            <label class="col-sm-2 control-label">Name</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="name" type="text" value="<%=Fname %>" required="required">
                                            </div>
                                        </div>
                                       <div class="form-group">
                                            <label class="col-sm-2 control-label">Nick Name</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="nickName" type="text" value="<%=nickName %>" >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">E-Mail</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="email" type="text" value="<%=loginId %>" readonly="readonly" required="required">
                                            </div>
                                        </div>
                                     
                                     <div class="form-group">
                                            <label class="col-sm-2 control-label">Password</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="password" type="text" value="<%=password %>" required="required">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Address</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="address" type="text" value="<%=address %>" required="required">
                                            </div>
                                        </div>
                                         <div class="form-group">
                                            <label class="col-sm-2 control-label">Area</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="address2" type="text" value="<%=address2 %>" required="required">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Mobile</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="tel" type="text" value="<%=contactno1 %>" required="required">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Website</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="website" type="text" value="<%=Website %>" >
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Paytm Number</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="paytmNo" type="text" value="<%=paytmNo %>" required="required">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">GPay Number</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="GPayNO" type="text" value="<%=gpayNo %>" required="required">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Bank Name</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="bankName" type="text" value="<%=bankName %>" >
                                            </div>
                                        </div>
                                         <div class="form-group">
                                            <label class="col-sm-2 control-label">Account Name</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="accountName" type="text" value="<%=accountName %>" >
                                            </div>
                                        </div>
                                         <div class="form-group">
                                            <label class="col-sm-2 control-label">Account Number</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="accountNumber" type="text" value="<%=accountNumber %>" >
                                            </div>
                                        </div>
                                         <div class="form-group">
                                            <label class="col-sm-2 control-label">Branch Location</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="branchLocation" type="text" value="<%=branchLocation %>" >
                                            </div>
                                        </div>
                                         <div class="form-group">
                                            <label class="col-sm-2 control-label">IFSC CODE</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="ifscCode" type="text" value="<%=ifscCode %>" >
                                            </div>
                                        </div>
                                        
                                        <%
											if(docs != null && !docs.equalsIgnoreCase("null")) {
												//System.out.println(docs);
										%>

										<div class="form-group">
                                            <label class="col-sm-2 control-label">Aadhar Image</label>
                                            <div class="col-sm-10">
                                               <img src="./VendorDocs/<%=docs %>" height="200" width="200">
                                            </div>
                                        </div>
                                       
									<%
											} 
										%>
										
                                       
									<p><b>Note-</b> This Profile you can just view it. For any changes kindly mails us at support@numberwale.com or Whatsaap on your Respective Vendor Group. </p>
                                        
                                        
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
<!-- CK Editor -->
<%} %>
</body>
</html>
