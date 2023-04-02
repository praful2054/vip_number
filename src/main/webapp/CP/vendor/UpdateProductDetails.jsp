<%@page import="com.techgate.query.ProductOtherdDetailQueryParameter"%>
<%@page import="com.techgate.domain.ProductOtherDetail"%>
<%@page import="com.techgate.util.GeneralFunction"%>
<%@page import="com.techgate.domain.Product"%>
<%@page import="com.techgate.query.ProductQueryParameter"%>
<%@page import="com.techgate.util.GeneralConstants"%>
<%@page import="com.techgate.util.QueryConstants"%>
<%@page import="com.techgate.query.AbstractQueryParameter"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
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
<body class="hold-transition skin-red layout-top-nav">
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
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Product Edit
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Product Edit</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	<div class="box box-success">
	 <div class="box-body">
	 <%
	 try{
		 ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
			DBAction dbAction = (DBAction) context.getBean("dbaction");
			GeneralFunction generfunc = (GeneralFunction) context.getBean("generalFunction");
			final Product product = new Product();

			String cate_id = request.getParameter("sub_cate_id");
			if(cate_id != null && cate_id.equalsIgnoreCase("select")){
				cate_id = request.getParameter("cate_id");		
			}
			
			String prdtName = request.getParameter("prodName").replaceAll("\\<[^>]*>","");
			//System.out.println(prdtName);	
			prdtName = prdtName.replaceAll("&nbsp;","");
			int sum = generfunc.sumNumber(prdtName.replaceAll("\\s+","").trim());
			
			int a = String.valueOf(sum).length();
	        int twoDigit = 0;

	        if (a > 2) {
	            sum = generfunc.sumNumber(String.valueOf(sum));
	            a = String.valueOf(sum).length();
	        } else if (a == 2) {
	            //save 
	            twoDigit = sum;
	            sum = generfunc.sumNumber(String.valueOf(sum));
	            a = String.valueOf(sum).length();
	            if (a == 2) {
	                //save 
	              //  twoDigit = sum;
	                sum = generfunc.sumNumber(String.valueOf(sum));

	            }
	        } 
	        
	        
			product.setProduct_id(Integer.parseInt(request.getParameter("hdnProductId")));
			product.setCate_id(Integer.parseInt(cate_id));
			product.setType(request.getParameter("prodType"));
			product.setProductName(request.getParameter("prodName"));
			product.setProductCode(request.getParameter("prodCode"));
			product.setNatureOfProduct(request.getParameter("natOfProd"));
			product.setIndication(request.getParameter("indication"));
			product.setUseDirection(request.getParameter("directionOfUse"));
			product.setPacking(request.getParameter("packing"));
			product.setDescript(request.getParameter("productDescript"));
			product.setVegProduct(request.getParameter("veg"));
			product.setAdditinalDescription(request.getParameter("addDescript"));
			product.setProductBrand(request.getParameter("brandName"));
			product.setProductColor(request.getParameter("color"));
			product.setSizeheight(request.getParameter("veg1"));
			product.setSizelength(request.getParameter("veg2"));
			product.setLiters(String.valueOf(twoDigit));
			product.setTrap(String.valueOf(sum));
			product.setUpdated_by("NWV"+eid);
			product.setRecharge_validity(request.getParameter("validtill"));
			product.setLastCall(request.getParameter("lastcall"));
			product.setNextCall(request.getParameter("nextcall"));
			product.setNumber(prdtName.replaceAll("\\s+","").trim());
			product.setBuyerName(request.getParameter("buyerName"));
			product.setCurrentNumber(request.getParameter("currentNumber"));
			product.setBuyerContact(request.getParameter("buyerContact"));
			product.setComments(request.getParameter("Comments"));
			product.setVendor_id(Integer.parseInt(eid));
			product.setStatus("N");
			
			AbstractQueryParameter obj = new ProductQueryParameter(product);
			obj.setSql(QueryConstants.PRODUCT_UPDATE_QUERY);
			obj.setAction(GeneralConstants.UPDATE);
			dbAction.executeDML(obj);
			
			ProductOtherDetail productOtherDetail = new ProductOtherDetail();
			//out.println(id.intValue());
			productOtherDetail.setProduct_id(Integer.parseInt(request.getParameter("hdnProductId")));
			productOtherDetail.setRateInRupee(Integer.parseInt(request.getParameter("rateRuppes")));
			productOtherDetail.setRateblack(Integer.parseInt(request.getParameter("rateBlack")));
			productOtherDetail.setDiscount(Integer.parseInt(request.getParameter("discount")));
			
			AbstractQueryParameter query = new ProductOtherdDetailQueryParameter(productOtherDetail);
			query.setAction(GeneralConstants.UPDATE);
			query.setSql(QueryConstants.PRODUCT_RATE_UPDATE_QUERY);
			dbAction.executeDML(query);
			
			
	 %>
		 <div class="callout callout-success">
                <h4>Product Update successfully!</h4>
              </div>
		 <%}
		
		catch(Exception e){%>
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
