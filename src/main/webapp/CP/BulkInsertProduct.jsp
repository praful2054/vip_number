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
			String str = "";String message ="Product Upload Sucess";
			if (multi != null) {
				File file = new File(strUploadDir+"/"+multi.getFilesystemName("product_upload"));
				BufferedReader br = new BufferedReader(new FileReader(file));
				br.readLine();
				String productName="";
				boolean status=true;
				
				Random rand = new Random();
				int fileId = rand.nextInt();
				while((str = br.readLine()) != null) {
					//out.println(str);
					
					
					try{
						
					String[] values = str.split(",");
					//System.out.println(Arrays.toString(values));
					final Product product = new Product();
					
					if(values[12]==null){
						message ="Invalid File Kindly check the file and upload Again";
						break;
					}
					
					product.setCate_id(Integer.parseInt(values[0]));
					product.setVendor_id(Integer.parseInt(values[1]));
					productName = values[2]==null?"":values[2];
					product.setProductName("<p>"+productName+"</p>");
					//product.setNumber(values[2].replaceAll("\\s+","").trim());
					//product.setType(values[3]==null?"None":values[3]);
					product.setProductCode(values[3]==null?"":values[3]);
					product.setProductBrand(values[4]==null?"":values[4]);
					product.setPacking(values[5]==null?"":values[5]);
					product.setVegProduct(values[6]==null?"":values[6]);
					product.setBuyerName(values[7]==null?"":values[7]);
					product.setBuyerContact(values[8]==null?"":values[8]);
					product.setType(values[9]==null?"":values[9]);
					//product.setBuyerName(values[13]==null?"":values[13]);
					product.setCurrentNumber("");
					
					product.setFileID(String.valueOf(fileId));
					
					
				//	product.setLastCall(values[13]==null?"":values[13]);
					//product.setDescript(values[13]==null?"":values[13]);
					//product.setAdditinalDescription(values[14]==null?"":values[14]);
					//product.setIndication(values[18]==null?" ":values[18]);
					//product.setUseDirection(values[19]==null?" ":values[19]);
					//product.setNatureOfProduct(values[20]==null?" ":values[20]);
					product.setStatus("Y");
					product.setNumber_status("Available");
					
					if(values[2]!=null){
					String prdtName = values[2].replaceAll("\\<[^>]*>","");
					//System.out.println(prdtName);	
					prdtName = prdtName.replaceAll("&nbsp;","");
					prdtName = prdtName.replaceAll("-","");
					prdtName = prdtName.replaceAll("\\s+","").trim();
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
			        product.setNumber(prdtName.replaceAll("\\s+","").trim());
					product.setLiters(String.valueOf(twoDigit));
					product.setTrap(String.valueOf(sum));
					product.setCreated_by(eid);
					}
					AbstractQueryParameter obj = new ProductQueryParameter(product);
					obj.setSql(QueryConstants.PRODUCT_INSERT_QUERY);
					obj.setAction(GeneralConstants.INSERT);
					Number id = dbAction.executeDMLToGetId(obj);
					id.intValue();
					ProductOtherDetail productOtherDetail = new ProductOtherDetail();
					//out.println(id.intValue());
					productOtherDetail.setProduct_id(id.intValue());
					productOtherDetail.setRateInRupee(Integer.parseInt(values[10]));
					productOtherDetail.setRateblack(Integer.parseInt(values[11]));
					productOtherDetail.setDiscount(Integer.parseInt(values[12]));
					productOtherDetail.setCreated_by(eid);
					AbstractQueryParameter query = new ProductOtherdDetailQueryParameter(productOtherDetail);
					query.setAction(GeneralConstants.INSERT);
					query.setSql(QueryConstants.PRODUCT_RATE_INSERT_QUERY);
					dbAction.executeDML(query);
					}catch(Exception e){
						//dbAction.delete(QueryConstants.PRODUCT_STUCK_DELETE_QUERY, new Object[]{});
						e.printStackTrace();
					}
				}
				br.close();
				
			}
			
		
	%>
		 <div class="callout callout-success">
                <h4>success callout!</h4>

                <p> <%=message %> ...</p>
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
