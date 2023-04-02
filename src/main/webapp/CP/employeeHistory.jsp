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
        Employee
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Employee Details</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	          <div class="box">
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                     <th>SR NO</th>
                     <th>Employee Name</th>
                     <th>Profile</th>
                      <th>Total Leads</th>
                      <th>New</th>
                      <th>Won</th>
                      <th>Lost</th>
                      <th>Inprocess</th>
                      <th>Not Contacted</th>
                       <th>ON Hold</th>
                </tr>
                </thead>
                <tbody>
                <%
                                        DBConnection dbcon = new DBConnection();
                                		Connection con = dbcon.getCon();
                                		Statement stmt =  con.createStatement();
                                		Statement stmt1 =  con.createStatement();
                                		String employeeName="", eprofile="";
                                	     int leads=0,won=0,lost=0,Inprocess=0,notContacted=0,onHold=0;
                                	     int newEnquires=0,totalenqury=0,enquirywon=0,enquirylost=0,enquiryInprocess=0,enquirynotContacted=0,enquiryonHold=0,enquiryduplicate=0;
                                		ResultSet rs = stmt1.executeQuery("select * from employee");
                                		ResultSet res = null;
                                		int sr=0;
                                        while(rs.next()) {
                                        	employeeName=""; eprofile=""; leads=0;won=0;lost=0;Inprocess=0;notContacted=0;onHold=0;
                                        	newEnquires=0;totalenqury=0;enquirywon=0;enquirylost=0;enquiryInprocess=0;enquirynotContacted=0;enquiryonHold=0;enquiryduplicate=0;
                                        	sr++;
                                        	employeeName=rs.getString("firstname")+" "+rs.getString("lastname");
                                        	eprofile=rs.getString("profile");
                                        	
                                        	res = stmt.executeQuery("select count(*) from customerEnquiry where  MONTH(createdDate)=MONTH(CURRENT_DATE) and EmployeeId='"+rs.getString("loginId")+"'");
                                             
                                        	if(res.next()) {
                                            	 totalenqury = res.getInt(1);
                                             }
                                             
                                             res = stmt.executeQuery("select count(*) from customerEnquiry where status='Inprocess' and MONTH(createdDate)=MONTH(CURRENT_DATE) and EmployeeId='"+rs.getString("loginId")+"'");

                                             if(res.next()) {
                                            	 enquiryInprocess = res.getInt(1);
                                             }
											
                                             res = stmt.executeQuery("select count(*) from customerEnquiry where status='Closed Won' and MONTH(createdDate)=MONTH(CURRENT_DATE) and EmployeeId='"+rs.getString("loginId")+"'");

                                             if(res.next()) {

                                            	 enquirywon = res.getInt(1);

                                             }
                                             
                                             res = stmt.executeQuery("select count(*) from customerEnquiry where status='Closed Lost' and MONTH(createdDate)=MONTH(CURRENT_DATE) and EmployeeId='"+rs.getString("loginId")+"'");

                                             if(res.next()) {

                                            	 enquirylost = res.getInt(1);

                                             }
                                        	
                                             res = stmt.executeQuery("select count(*) from customerEnquiry where status='New' and MONTH(createdDate)=MONTH(CURRENT_DATE) and EmployeeId='"+rs.getString("loginId")+"'");

                                             if(res.next()) {

                                            	 newEnquires = res.getInt(1);

                                             }
                                             
                                             res = stmt.executeQuery("select count(*) from customerEnquiry where status='Not Contacted' and MONTH(createdDate)=MONTH(CURRENT_DATE) and EmployeeId='"+rs.getString("loginId")+"'");

                                             if(res.next()) {

                                            	 enquirynotContacted = res.getInt(1);

                                             }
                                             
                                             res = stmt.executeQuery("select count(*) from customerEnquiry where status='ON Hold' and MONTH(createdDate)=MONTH(CURRENT_DATE) and EmployeeId='"+rs.getString("loginId")+"'");

                                             if(res.next()) {

                                            	 enquiryonHold = res.getInt(1);

                                             }
                                             
                                             
										%>
                                        <tr>
                                        <td class="center"><%=sr %></td>
                                           <td class="center"><%=employeeName %></td>
                                            <td class="center"><%=eprofile %></td>
                                            <td class="center"><%=totalenqury %></td>
                                            <td class="center"><%=newEnquires%></td>
                                            <td class="center"><b><%=enquirywon %></b></td>
											<td class="center"><%=enquirylost%></td>
											<td class="center"><%=enquiryInprocess%></td>
											<td class="center"><%=enquirynotContacted%></td>
											<td class="center"><%=enquiryonHold%></td>
											
											
                                        <%
                                            }
                                        DBConnection.close(con, stmt, res);
                                        %>
                </tbody>
                <tfoot>
               <tr>
                     <th>SR NO</th>
                     <th>Employee Name</th>
                     <th>Profile</th>
                      <th>Total Leads</th>
                      <th>New</th>
                      <th>Won</th>
                      <th>Lost</th>
                      <th>Inprocess</th>
                      <th>Not Contacted</th>
                       <th>ON Hold</th>
                </tr>
                </tfoot>
              </table>
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
<%} %>
</body>
</html>
