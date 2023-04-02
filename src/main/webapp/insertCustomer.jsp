<%@page import="com.techgate.util.Email"%>
<%@page import="com.techgate.query.CustomerAddressQueryParameter"%>
<%@page import="com.techgate.util.GeneralConstants"%>
<%@page import="com.techgate.util.QueryConstants"%>
<%@page import="com.techgate.query.CustomerLoginQueryParameter"%>
<%@page import="com.techgate.domain.CustomerAddressDetails"%>
<%@page import="com.techgate.domain.CustomerLoginDetail"%>
<%@page import="com.techgate.query.AbstractQueryParameter"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
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
        Customer
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Customer</li>
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
		PreparedStatement prepare1=con.prepareStatement("select emailid from CustomerLoginDetails where answer='"+request.getParameter("telephone")+"'");
		ResultSet rs = prepare1.executeQuery();
		if(rs.next()){
			%>
			<div class="alert alert-error">
         <button type="button" class="close" data-dismiss="alert">×</button>
         <strong>Customer Already Exits....</strong>
        </div>
			
			<%
		}else{
			ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
			DBAction dbAction = (DBAction) context.getBean("dbaction");
			String sameAddress = (request.getParameter("shipping_address") != null && request.getParameter("shipping_address").equals("1"))? "Y" : "N";
			Number customerId = null;
			AbstractQueryParameter obj = null;
			CustomerLoginDetail customerLoginDetail = null;
			CustomerAddressDetails billingAddress = null;
			CustomerAddressDetails shippingAddress = null;
			//Inserting Customer Details
			
				customerLoginDetail = new CustomerLoginDetail();
				customerLoginDetail.setEmailid(request.getParameter("email"));
				customerLoginDetail.setPassword(request.getParameter("password"));
				customerLoginDetail.setForgetpasswordquestion("");
				customerLoginDetail.setAnswer(request.getParameter("telephone"));


				obj = new CustomerLoginQueryParameter(customerLoginDetail);
				obj.setSql(QueryConstants.CUSTOMER_LOGIN_DETAILS_INSERT_QUERY);
				obj.setAction(GeneralConstants.INSERT);
				customerId = dbAction.executeDMLToGetId(obj);

			if(customerId != null) {
				billingAddress = new CustomerAddressDetails();	
				billingAddress.setCust_id(customerId.intValue());
				billingAddress.setAddress(request.getParameter("address_1"));
				billingAddress.setCity(request.getParameter("city"));
				billingAddress.setContactNo1(request.getParameter("telephone"));
				billingAddress.setContactNo2(request.getParameter("mobile"));
				billingAddress.setCountry(request.getParameter("country_id"));
				billingAddress.setFirstName(request.getParameter("firstname"));
				billingAddress.setLastName(request.getParameter("lastname"));
				billingAddress.setPincode(request.getParameter("postcode"));
				billingAddress.setState(request.getParameter("state"));
				billingAddress.setCompanyName(request.getParameter("companyName"));
				billingAddress.setGstinNO(request.getParameter("gstin"));
				
				shippingAddress = billingAddress;
				if(sameAddress.equals("N")) {
					shippingAddress = new CustomerAddressDetails();
					shippingAddress.setCust_id(customerId.intValue());
					shippingAddress.setAddress(request.getParameter("address_11"));
					shippingAddress.setCity(request.getParameter("city1"));
					shippingAddress.setContactNo1("");
					shippingAddress.setContactNo2("");
					shippingAddress.setCountry(request.getParameter("country_id1"));
					shippingAddress.setFirstName(request.getParameter("firstname1"));
					shippingAddress.setLastName(request.getParameter("lastname1"));
					shippingAddress.setPincode(request.getParameter("postcode1"));
					shippingAddress.setState(request.getParameter("state1"));	
				}
				
				obj = new CustomerAddressQueryParameter(billingAddress);
				obj.setSql(QueryConstants.CUSTOMER_BILLING_ADDRESS_INSERT_QUERY );
				obj.setAction(GeneralConstants.INSERT);
				dbAction.executeDML(obj);
				
				obj = new CustomerAddressQueryParameter(shippingAddress);
				obj.setSql(QueryConstants.CUSTOMER_SHIPPING_ADDRESS_INSERT_QUERY);
				obj.setAction(GeneralConstants.INSERT);
				dbAction.executeDML(obj);
				
				String sub ="Thank you for Registering!";
				String body="<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'> \r\n" + 
						"			<html xmlns='http://www.w3.org/1999/xhtml'> \r\n" + 
						"			<head> " + 
						"			<meta http-equiv='Content-Type' content='text/html; charset=utf-8' /> " + 
						"			<title>Number Wale</title> " + 
						"			</head> " + 
						"			<body style='margin: 0px;'> " + 
						"			<table align='center' style='width: 650px; font-size: 10.5pt; color: #000000; border-width: 1px; border-style: solid; border-color: #e5e5e5; font-family: arial' cellpadding='10' cellspacing='0'> " + 
						"			  <tr> " + 
						"			    <td style='background-color:#ff8400;'><table width='100%' border='0' cellspacing='0' cellpadding='0'> " + 
						"			  <tbody> " + 
						"			    <tr> " + 
						"			      <td><img src='https://www.numberwale.com/emailImgs/logo.png' width='200' height='72' alt=''/></td> " + 
						"			      <td align='right' style='color: #ffffff; font-size: 13pt;'><b>Numberwale.com</b></td> " + 
						"			    </tr> " + 
						"			  </tbody> " + 
						"			</table> " + 
						"			</td> " + 
						"			  </tr> " + 
						"			  <tr> " + 
						"			    <td style='border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: #e5e5e5;'><table width='100%' border='0' cellspacing='0' cellpadding='0'> " + 
						"			        <tbody> " + 
						"			          <tr> " + 
						"			            <td colspan='3'><p style='font-size: 13pt;'><b>Dear '"+request.getParameter("firstname")+"',</b></p> " + 
						"			            <p>Greetings from Numberwale.com.</p>" + 
						"						<p>Thank you for Registering!</p>" + 
						"							" + 
						"			            <p>We are delighted to have you as our valued customer and wish you good health and prosperity.</p> " + 
						"						<p>You can login to your account with username <b>'"+request.getParameter("email")+"'</b></p> " + 
						"						<p>Please click the link below to set your password</p>" + 
						"						<a href='https://www.numberwale.com/forgotpassword.html' target='_blank'>Reset Password</a>" + 
						"						</td> " + 
						"			          </tr> " + 
						"			          <tr> " + 
						"			            <td colspan='3'> " + 
						"			<p>Now you can also reach us or can send us any Vanity Number related Document to the following address:<br/> " + 
						"			  <br/><b>Numberwale.com,  " + 
						"			Office No.6, Building No.1,  " + 
						"			Sagar Complex, Jesal Park,  " + 
						"			Bhayander (East),  " + 
						"			Mumbai - 401105.</b></p> " + 
						"			<p>You may also visit our website <a href='https://www.numberwale.com' target='_blank' style='color: #c5342a;'>https://www.numberwale.com</a> to view your order history. " + 
						"			</p> " + 
						"			<p>Thank you for choosing us  We value your association and look forward to serving you with our products and services for many more years to come.</p> " + 
						"			<br> " + 
						"			<p> " + 
						"			Warm regards,<br> " + 
						"			<b>Numberwale.com</b><br/></p></td> " + 
						"			          </tr> " + 
						"			        </tbody> " + 
						"			      </table></td> " + 
						"			  </tr> " + 
						"			  <tr> " + 
						"			    <td style='background-color: #4a4a4a;'><table width='100%' border='0' cellspacing='0' cellpadding='0' style='background-color: #4a4a4a; '> " + 
						"			        <tbody> " + 
						"			          <tr> " + 
						"			            <td width='67%' style='font-size: 9pt; color: #ffffff;'>In case you need any clarification, kindly get in touch with us at<br/> 9222222007 or email us at <a href='mailto:support@numberwale.com' style='color: #f38226;'>support@numberwale.com</a> and we'd be happy to assist you with your queries</td> " + 
						"			            <td width='33%'><table width='100%' border='0' align='right' cellpadding='1' cellspacing='0'> " + 
						"			                <tbody> " + 
						"			                  <tr> " + 
						"			                    <td width='20%'><a href='https://www.facebook.com/NumberWale/' target='_blank'><img src='https://www.numberwale.com/emailImgs/fb.jpg' width='39' height='38' alt=''/></a></td> " + 
						"			                    <td width='20%'><a href='https://twitter.com/Numberwale' target='_blank'><img src='https://www.numberwale.com/emailImgs/twitter.jpg' width='39' height='38' alt=''/></a></td> " + 
						"			                    <td width='20%'><a href='https://www.youtube.com/channel/UCYYOGkiZ14I6yGr2NjhGYzg/featured' target='_blank'><img src='https://www.numberwale.com/emailImgs/Youtube.jpg' width='39' height='38' alt=''/></a></td> " + 
						"			                    <td width='20%'><a href='https://www.instagram.com/numberwale/' target='_blank'><img src='https://www.numberwale.com/emailImgs/instagram.jpg' width='39' height='38' alt=''/></a></td> " + 
						"			                    <td width='20%'><a href='https://www.linkedin.com/company/numberwale/' target='_blank'><img src='https://www.numberwale.com/emailImgs/linkedin.jpg' width='39' height='38' alt=''/></a></td> " + 
						"			                  </tr> " + 
						"			                </tbody> " + 
						"			            </table></td> " + 
						"			          </tr> " + 
						"			        </tbody> " + 
						"			      </table></td> " + 
						"			  </tr> " + 
						"			</table> " + 
						"			</body> " + 
						"			</html>";
		    	
		    	
		    	//Email.mailsend(customerLoginDetail.getEmailid(), sub, body);
			}
	 %>
		 <div class="callout callout-success">
                <h4>success callout!</h4>

                <p>Customer Add Sucess........</p>
              </div>
		 <%}}
		
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
