<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
  <%@ include file="menu.jsp"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Vendor
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Vendor</li>
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
		String strUploadDir = application.getRealPath("/VendorDocs/");
        DefaultFileRenamePolicy dfrp=new DefaultFileRenamePolicy();
	    MultipartRequest multi = new MultipartRequest(request,strUploadDir,10*1024*1024,dfrp);
	   if (multi!=null){	
			prepare=con.prepareStatement("update vendorDetails set password=?,firstname=?,address=?,address2=?,contactno1=?,Website=?,paytmNo=?,gpayNo=?,docs=?, updatedDate=Now() where id=?");
			prepare.setString(1,multi.getParameter("password"));
			prepare.setString(2,multi.getParameter("name"));
			prepare.setString(3,multi.getParameter("address"));
			prepare.setString(4,multi.getParameter("address2"));
			prepare.setString(5,multi.getParameter("tel"));
			prepare.setString(6,multi.getParameter("website"));
			prepare.setString(7,multi.getParameter("paytmNo"));
			prepare.setString(8,multi.getParameter("GPayNO"));
			prepare.setString(9,multi.getFilesystemName("cate_img_upload"));
			prepare.setString(10,multi.getParameter("id"));
			
			int row=prepare.executeUpdate();
	   }
	 %>
		 <div class="callout callout-success">
                <h4>Profiler Update Sucessfully !</h4>
              </div>
		 <%}
		
		catch(Exception e){ e.printStackTrace();%>
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
