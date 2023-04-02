<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Arrays"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.techgate.query.ProductOtherdDetailQueryParameter"%>
<%@page import="com.techgate.domain.ProductOtherDetail"%>
<%@page import="com.techgate.util.GeneralConstants"%>
<%@page import="com.techgate.util.QueryConstants"%>
<%@page import="com.techgate.query.AbstractQueryParameter"%>
<%@page import="com.techgate.query.ProductQueryParameter"%>
<%@page import="com.techgate.domain.Product"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.techgate.util.GeneralFunction"%>
<%@page import="com.techgate.dbaction.DBAction"%>
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
        Product
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Product</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	<div class="box box-success">
	 <div class="box-body">
	 	<%
		try {
			ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application
					.getAttribute("context");
			DBAction dbAction = (DBAction) context.getBean("dbaction");
			GeneralFunction generfunc = (GeneralFunction) context.getBean("generalFunction");
			String strUploadDir = application.getRealPath("/BulkProductFile/");
			DefaultFileRenamePolicy dfrp = new DefaultFileRenamePolicy();
			MultipartRequest multi = new MultipartRequest(request, strUploadDir, 10 * 1024 * 1024, dfrp);
			String str = "";
			if (multi != null) {
				File file = new File(strUploadDir+"/"+multi.getFilesystemName("product_upload"));
				BufferedReader br = new BufferedReader(new FileReader(file));
				br.readLine();
				String productName="";
				Random rand = new Random();
				int fileId = rand.nextInt();
				
				DBConnection dbcon = new DBConnection();
				 Connection con = dbcon.getCon();
				 PreparedStatement pst = null, pst1=null, prepare=null, prepare1=null, prepare2=null;
				
				while((str = br.readLine()) != null) {
					//out.println(str);
					try{
					String[] values = str.split(",");
					//out.println(Arrays.toString(values));
					
					
					 pst = con.prepareStatement("update ProductDetails set cate_id=?,productCode=?,productBrand=?,packing=?,vegProduct=?,type=?,buyerName=?,buyerContact=?,number_status=?,fileID=?,updated_by=?,status=?,Comments=?, updated_date=Now()  where number=? and number_status <> 'Sold' ");
					 pst.setString(1, values[0]); //cate Id
				     pst.setString(2, values[2]); //Product Name
				     pst.setString(3, values[3]);
				     pst.setString(4, values[4]);
				     pst.setString(5, values[5]);
				     pst.setString(6, values[6]);
				     pst.setString(7, values[7]);
				     pst.setString(8, values[8]);
				     pst.setString(9, values[12]);
				     pst.setString(10, String.valueOf(fileId));
				     pst.setString(11, eid);
				     pst.setString(12, "Y");
				     pst.setString(13, "Bulk Update");
				     pst.setString(14, values[1].replaceAll("\\s+","").trim());
					 pst.executeUpdate();
					 
					 pst1 = con.prepareStatement("update ProductOtherDetails set rateInRupee=?,rateblack=?, discount=? where product_id in (select product_id from ProductDetails where number_status <> 'Sold' and number='"+values[1].replaceAll("\\s+","").trim()+"')");
					 pst1.setString(1, values[9]); //cate Id
					 pst1.setString(2, values[10]); // Vendor ID
					 pst1.setString(3, values[11]); // Discount
					 pst1.executeUpdate();
					
					}catch(Exception e){
						e.printStackTrace();
					}
				}
				br.close();
				DBConnection.close(con, pst, null);
			}
			
		
	%>
		 <div class="callout callout-success">
                <h4>success callout!</h4>

                <p>Product Upload Sucess........</p>
              </div>
		 <%}
		
		catch(Exception e){e.printStackTrace();%>
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
