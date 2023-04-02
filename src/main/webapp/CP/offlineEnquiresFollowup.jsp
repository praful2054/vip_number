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
        Enquiry Followup
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Enquiry Followup</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	<div class="box box-success">
	 <div class="box-body">
	                   
                       <form class="form-horizontal" action="offlineEnquiresFollowupComment"  method="post" name="form">
                                     <%
                                        String eid = request.getParameter("id");
                                        String status="", requirement ="",budget="",Customer_Name="",Customer_Mobile="",Customer_Email="",Customer_Address="",Customer_City="",Customer_Pincode="",Enquiry_Source="",empId="";
                                        DBConnection dbcon = new DBConnection();
                                		Connection con = dbcon.getCon();
                                		Statement stmt =  con.createStatement();
                                		Statement stmt1 =  con.createStatement();
                                	
                                		 ResultSet rs = stmt1.executeQuery("select * from offlineenquiry where id="+eid);
                                		 if(rs.next()) {
                                			 requirement = rs.getString("requirement");
                                			 budget= rs.getString("budget");
                                			 Customer_Name = rs.getString("Customer_Name");
                                			 Customer_Mobile = rs.getString("Customer_Mobile");
                                			 Customer_Email = rs.getString("Customer_Email");
                                			 Customer_Address = rs.getString("Customer_Address");
                                			 Customer_City = rs.getString("Customer_City");
                                			 Customer_Pincode = rs.getString("Customer_Pincode");
                                			 Enquiry_Source = rs.getString("Enquiry_Source");
                                        	 empId = rs.getString("EmployeeId");
                                        	 status = rs.getString("status");
                                        	 
                                        	 
                                		 }
                                		if(profile.equalsIgnoreCase("Admin") || profile.equalsIgnoreCase("Lead") || profile.equalsIgnoreCase("SEO") || profile.equalsIgnoreCase("Data Entry")){
                                			ResultSet res = stmt.executeQuery("select * from employee");
										%>
										 <div class="form-group">
                                            <label class="col-sm-2 control-label">Assign TO</label>
                                            <div class="col-sm-6">
                                                <select style="width:250px" id="selectError3" name="assignTo" required>
                                                <option value="">---Select-----</option>
                                                <% while(res.next()) { %>
                                                   
                                                   <option value="<%=res.getString("loginId")%>" <%if(empId.equalsIgnoreCase(res.getString("loginId"))){%>selected<%} %>><%=res.getString("firstname")%> <%=res.getString("lastname")%></option>
                                                   <%} %>
                                                   
                                                </select>
                                            </div>
                                        </div>
                                        <%} %>
                                         
                                       
                                        <table width="100%" >
                                        <tr>
                                            <td>Requirement :</td>
                                            <td><%=requirement %></td>
                                            <td>Budget :</td>
                                            <td><%=budget %></td>
                                        </tr>

										<tr>
                                            <td>Customer Name :</td>
                                            <td><%=Customer_Name %></td>
                                            <td>Customer Mobile :</td>
                                            <td><%=Customer_Mobile %></td>
                                            
                                        </tr>

										<tr>
                                            <td>Customer Email :</td>
                                            <td><%=Customer_Email%></td>
                                            <td>Customer Address :</td>
                                            <td><%=Customer_Address %></td>
                                            
                                        </tr>
                                        
                                        <tr>
                                            <td>Customer City :</td>
                                            <td><%=Customer_City%>  <%=Customer_Pincode%></td>
                                            <td>Enquiry Source :</td>
                                            <td><%=Enquiry_Source %></td>
                                            
                                        </tr>
                                        </table>
                                        
                                        <div style="height:200px; overflow:scroll" >
                                        <table id="example1" class="table table-bordered table-striped">
							                <thead>
							                <tr>
							                     <th>ID</th>
							                     <th>Comment By</th>
							                      <th>Comment</th>
							                     <th>Date</th>
							                      
							                </tr>
							                </thead>
							                <tbody>
							                <%
							                ResultSet rees = stmt.executeQuery("select e.*,emp.firstname,emp.lastname  from offlineenquiryfollowup e, employee emp where enq_id="+eid+" and emp.loginId = e.commenyBy order by UpdatedDate desc ");
	                                        while(rees.next()) {
							                
							                %>
                                        <tr>
                                        <td class="center"><%=rees.getString("id") %></td>
                                           <td class="center"><%=rees.getString("firstname") %> <%=rees.getString("lastname") %></td>
                                           <td class="center"><%=rees.getString("comment") %></td>
                                            <td class="center"><%=rees.getString("UpdatedDate") %></td>
                                            
											
                                           
                                            </tr>
                                            <%} %>
                                             </tbody>
                                              </table>
                                              </div>
                                              <div class="form-group">
                                            <label class="col-sm-2 control-label">Status</label>
                                            <div class="col-sm-10">
                                                <select style="width:250px" id="selectError3" name="status">
                                                     <option value="New" <%if(status.equalsIgnoreCase("New")){%>selected<%} %>>New</option>
                                                  <option value="Not Contacted" <%if(status.equalsIgnoreCase("Not Contacted")){%>selected<%} %>>Not Contacted</option>
                                                   <option value="Inprocess" <%if(status.equalsIgnoreCase("Inprocess")){%>selected<%} %>>Inprocess</option>
													<option value="ON Hold" <%if(status.equalsIgnoreCase("ON Hold")){%>selected<%} %>>ON Hold</option>
													<option value="Closed Won" <%if(status.equalsIgnoreCase("Closed Won")){%>selected<%} %>>Closed Won</option>
													<option value="Closed Lost" <%if(status.equalsIgnoreCase("Closed Lost")){%>selected<%} %>>Closed Lost</option>
													<option value="Duplicate" <%if(status.equalsIgnoreCase("Duplicate")){%>selected<%} %>>Duplicate</option>
                                                </select>
                                            </div>
                                        </div>
                                              <div class="form-group">
		                                            <label class="col-sm-2 control-label">Comment</label>
		                                           <div class="col-sm-6">
		                                                <textarea name="comments" rows="10" cols="80" required></textarea>
		                                            </div>
		                                        </div>
		                                        <input type="hidden" name="enq_id" value="<%=eid%>">
                                        <div class="box-footer">
                                            <button type="submit" class="btn btn-info pull-right">Update Details</button>
                                        	
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
<!-- CK Editor -->
<%} %>
</body>
</html>
