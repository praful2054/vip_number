<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.text.DateFormat"%>

<%@page import="com.techgate.util.QueryConstants"%>

<%@page import="com.techgate.dbaction.DBAction"%>

<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>

<%@page import="com.techgate.domain.Product"%>

<%@page import="java.util.List"%>

<%@page import="java.util.Date"%>

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

  <title>TechGate | Dashboard</title>

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

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

  <!--[if lt IE 9]>

  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>

  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

  <![endif]-->

  <script language="JavaScript" type="text/javascript">

        function GetCalculateAjax(){



            var vNumberId=document.getElementById("Number").value;

			//alert(vNumberId);

            if(typeof XMLHttpRequest != "undefined") {

                req = new XMLHttpRequest();

            } else if (window.ActiveXObject) {

                req = new ActiveXObject("Microsoft.XMLHTTP");

            }



            req.open("POST", "getNumberCalc", true);



            req.onreadystatechange = callbackRelevantSubCategories;



            req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            req.send("vNumberId=" + encodeURIComponent(vNumberId));

        }

        function callbackRelevantSubCategories(){



            if (req.readyState == 4) {

                if (req.status == 200) {

                    

                    var vreldet = document.getElementById("divNumberResult");

                    vreldet.innerHTML = req.responseText;

                }

                else{

                    alert("Error"+req.responseText);

                }

            }

        }

 </script>  

 <script language="JavaScript" type="text/javascript">

        function GetPhoneWordAjax(){



            var vNumberId=document.getElementById("phword").value;

			//alert(vNumberId);

            if(typeof XMLHttpRequest != "undefined") {

                req = new XMLHttpRequest();

            } else if (window.ActiveXObject) {

                req = new ActiveXObject("Microsoft.XMLHTTP");

            }



            req.open("POST", "getPhoneWord", true);



            req.onreadystatechange = callbackRelevantphoneWord;



            req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            req.send("vNumberId=" + encodeURIComponent(vNumberId));

        }

        function callbackRelevantphoneWord(){



            if (req.readyState == 4) {

                if (req.status == 200) {

                    

                    var vreldet = document.getElementById("divphoneWordResult");

                    vreldet.innerHTML = req.responseText;

                }

                else{

                    alert("Error"+req.responseText);

                }

            }

        }

 </script>     

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

        Dashboard

        <small>Version 2.0</small>

      </h1>

      <ol class="breadcrumb">

        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>

        <li class="active">Dashboard</li>

      </ol>

    </section>

<%

        DBConnection dbcon = new DBConnection();

		Connection con = dbcon.getCon();

		PreparedStatement pst = null;

		Statement stmt =  con.createStatement();

		ResultSet res = null;

		

		String totalenquiry="", vanityenquiry="",phoneWordenquiry="",otherenquiry="", products="",orders="",customers="",confirmorders="",Pendingorders="";

		String category="", pendingProducts="";

        

       

        

        

     //   DBConnection.close(con, stmt, res);

        

        

%>





    <!-- Main content -->

    <section class="content">

 

     <%

    
    	 res = stmt.executeQuery("select count(*) from ProductDetails where number_status ='Available'");

         if(res.next()) {

         	products = res.getString(1);

         }

         

         res = stmt.executeQuery("select count(*) from OrderTransaction where paymentStatus='Y'");

         if(res.next()) {

         	confirmorders = res.getString(1);

         }
         
         res = stmt.executeQuery("select count(*) from OrderTransaction where paymentStatus='N'");

         if(res.next()) {

         	Pendingorders = res.getString(1);

         }

         

         res = stmt.executeQuery("select count(*) from CustomerLoginDetails");

         if(res.next()) {

         	customers = res.getString(1);

         }
         
         
         res = stmt.executeQuery("select count(*) from ProductDetails where status ='N'");

         if(res.next()) {

        	 pendingProducts = res.getString(1);

         }
         
        

     %>

     

           <!-- Info boxes -->

      <div class="row">

       

        <!-- /.col -->

        

        <!-- /.col -->

	    <div class="col-md-3 col-sm-6 col-xs-12">

          <div class="small-box bg-yellow">

            <div class="inner">

              <h3><%=products %></h3>

              <p>Products</p>

            </div>

            <div class="icon">

              <i class="fa fa-fw fa-gift"></i>

            </div>

            <a href="productView" class="small-box-footer">

              More info <i class="fa fa-arrow-circle-right"></i>

            </a>

            <a href="exportProducts" class="small-box-footer">

              Export <i class="fa fa-arrow-circle-right"></i>

            </a>

          </div>

          <!-- /.info-box -->

        </div>



       
        <!-- fix for small devices only -->

        <div class="clearfix visible-sm-block"></div>

        <div class="col-md-3 col-sm-6 col-xs-12">

          <div class="small-box bg-aqua">

            <div class="inner">

              <h3><%=confirmorders %></h3>



              <p>Confirm Orders</p>

            </div>

            <div class="icon">

              <i class="fa fa-shopping-cart"></i>

            </div>

            <a href="confirmOrder" class="small-box-footer">

              More info <i class="fa fa-arrow-circle-right"></i>

            </a>

            <a href="#" class="small-box-footer">

              Export <i class="fa fa-arrow-circle-right"></i>

            </a>

          </div>

          </div>
          
          <div class="col-md-3 col-sm-6 col-xs-12">

          <div class="small-box bg-yellow">

            <div class="inner">

              <h3><%=Pendingorders %></h3>



              <p>Pending Orders</p>

            </div>

            <div class="icon">

              <i class="fa fa-shopping-cart"></i>

            </div>

            <a href="orderDetails" class="small-box-footer">

              More info <i class="fa fa-arrow-circle-right"></i>

            </a>

            <a href="#" class="small-box-footer">

              Export <i class="fa fa-arrow-circle-right"></i>

            </a>

          </div>

          </div>
          
          
        <!-- /.col -->

        
        <div class="col-md-3 col-sm-6 col-xs-12">

          <div class="small-box bg-aqua">

            <div class="inner">

              <h3><%=customers %></h3>



              <p>User Registrations</p>

            </div>

            <div class="icon">

              <i class="ion ion-person-add"></i>

            </div>

            <a href="customerDetails" class="small-box-footer">

              More info <i class="fa fa-arrow-circle-right"></i>

            </a>

             <a href="#" class="small-box-footer">

              Export <i class="fa fa-arrow-circle-right"></i>

            </a>

          </div>

          <!-- /.info-box -->

        </div>

       <div class="col-md-3 col-sm-6 col-xs-12">

          <div class="small-box bg-yellow">

            <div class="inner">

              <h3><%=pendingProducts%></h3>

              <p>Pending Approval</p>

            </div>

            <div class="icon">

              <i class="fa fa-fw fa-gift"></i>

            </div>

            <a href="pendingApproval" class="small-box-footer">

              More info <i class="fa fa-arrow-circle-right"></i>

            </a>

          </div>

          <!-- /.info-box -->

        </div>

         

        
        <!-- /.col -->

       

        

        

        

        <!-- fix for small devices only -->



       

        <!-- /.col -->

      </div>

      <!-- /.row -->

      

     

      <div class="row">

        <div class="col-md-12">

          <div class="box">

            <div class="box-header with-border">

              <h3 class="box-title">Calculator</h3>



            </div>

            <!-- /.box-header -->

            <div class="box-body">

              <div class="row">

              <div class="form-group">

                  <label class="col-sm-2 control-label">Number</label>

                  <div class="col-sm-6">

                      <input class="form-control" name="number" id="Number" type="text" value="" >

                  </div>

                  <button type="button" class="btn btn-info" onclick="GetCalculateAjax();">Calculate</button>

              </div> 

              <div id="divNumberResult"></div> 

              </div>

              <!-- /.row -->

            </div>

            <!-- ./box-body -->

           
                        <%
try{
           
	              Date schedularDate=null, currentDate=null;
	               
	               ResultSet res1 = null;
	               Statement stmt1 =  con.createStatement();
	              
				    res = stmt.executeQuery("select s.*,CURDATE() as currentDate from schedular s");
				
				    if(res.next()) {
				    	
				    	schedularDate = res.getDate("UpdatedDate");

		            	currentDate = res.getDate("currentDate");

		            	//System.out.println("schedularDate "+schedularDate);

		            	//System.out.println("currentDate "+currentDate);

		            	if(schedularDate.equals(currentDate)){
		            		
		            		res1 =  stmt1.executeQuery("select ot.orderId, ot.orderPlacedDate,ot.orderTotal,ot.paymentStatus,ot.orderStatus,ot.cust_id,ot.updatedDate,cb.firstName,cb.contactNo1,cb.companyName,pd.number,pd.vegProduct,pd.packing,"+
                            		" po.rateInRupee, po.rateblack, op.discount, op.flatDiscount "+  
                            		" from OrderTransaction ot, CustomerBillingDetails cb, ProductDetails pd,  ProductOtherDetails po, OrderPurchaseDetails op"+
                            		" where "+
                            		" ot.cust_id = cb.cust_id and op.orderId = ot.orderId and op.product_id = pd.product_id and op.product_id = po.product_id  and ot.paymentStatus in ('Y') and ot.orderStatus='Order Confirmed' and DATE(ot.updatedDate) = CURDATE() - INTERVAL 4 DAY");
                        	while(res1.next()) {
						    	
                        		 String Message = "Important Notice! Aapke Mobile no. "+res1.getString("number")+" ke UPC code ki vaidhta aaj samapt ho jaegi.Number Shuru krvane ke liye aaj he port krwaye.Kal apka number port nhi hoga.";		
									String sendUrl = "https://alerts.kaleyra.com/api/v4/?method=sms&api_key=A95f6ac715c8eb5e4eac8a88b231a4d8a&to="+res1.getString("contactNo1").trim()+"&sender=VIPNUM&message="+Message+"";	
								    sendUrl = sendUrl.replace(" ", "%20");	
									URL url = new URL(sendUrl);		
									//System.out.println(sendUrl);	
									URLConnection urlConn = url.openConnection();	
									urlConn.setDoOutput(true);							
									HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
									httpConn.connect();										      
									BufferedReader br = new BufferedReader(new InputStreamReader(httpConn.getInputStream()));	
									br.close();	
									
                        	}
		            		
		            		pst = con.prepareStatement("update schedular set UpdatedDate=CURDATE()+1");

					       	 pst.executeUpdate();
		            	}


			       	 DBConnection.close(con, stmt, res);

				    }

            	

            	

         	   

            

            
}catch(Exception e){
out.print(e.getMessage());	
}

            %>
            
				
            <!-- /.box-footer -->

          </div>



          

          <!-- /.box -->

        </div>

        <!-- /.col -->

      </div>

      <!-- /.row -->



      <!-- Main row -->

      <!-- /.row -->

    </section>

    <!-- /.content -->

  </div>

  <!-- /.content-wrapper -->
<%} %>


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

<script src="./CP/plugins/chartjs/Chart.min.js"></script>

<script src="./CP/js/dashboard2.js"></script>

<!-- AdminLTE for demo purposes -->

<script src="./CP/js/demo.js"></script>

</body>

</html>

