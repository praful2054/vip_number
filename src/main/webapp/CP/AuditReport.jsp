<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <html lang="en">
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
<body class="hold-transition skin-red layout-top-nav">
    <div class="content-wrapper">
					    <!-- Content Header (Page header) -->
					    <section class="content-header">
					      <h1>
					        Number Audit
					      </h1>
					      <ol class="breadcrumb">
					        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					        <li class="active">Number Audit</li>
					      </ol>
					    </section>
					
					    <!-- Main content -->
					    <section class="content">
						<div class="box box-success">
						 <div class="box-body">
                                     <div style="overflow:scroll" >
                                        <table id="example1" class="table table-bordered table-striped">
							                <thead>
							                <tr>
							                     <th>Product Type</th>
							                     <th>Parent Operator</th>
							                     <th>Current Operator</th>
							                     <th>Circle</th>
							                     <th>Current Number</th>
							                     <th>Number Status</th>
							                     <th>Activation Date</th>
							                     <th>Recharge Date</th>
							                     <th>Recharge Amount</th>
							                     <th>Recharge Validity</th>
							                     <th>Last Calling Date</th>
							                     <th>Next Calling Date</th>
							                     <th>Vanity Number</th>
							                     <th>Buyer Number</th>
							                     <th>Created By</th>
							                      <th>Created Date</th>
							                      <th>Updated By</th>
							                      <th>Updated Date</th>
							                      
							                </tr>
							                </thead>
							                <tbody>
							                 <%
							                 DBConnection dbcon = new DBConnection();
		                                		Connection con = dbcon.getCon();
		                                		Statement stmt =  con.createStatement();
								                ResultSet rees = stmt.executeQuery("select * from auditProductDetails where product_id='"+request.getParameter("Id")+"'");
		                                        while(rees.next()) {
							                
							                %>
                                        <tr>
                                        <td class="center"><%=rees.getString("type") %></td>
                                        <td class="center"><%=rees.getString("productCode") %></td>
                                        <td class="center"><%=rees.getString("productBrand") %></td>
                                        <td class="center"><%=rees.getString("packing") %></td>
                                        <td class="center"><%=rees.getString("currentNumber") %></td>
                                        <td class="center"><%=rees.getString("vegProduct") %></td>
                                        <td class="center"><%=rees.getString("sizeheight") %></td>
                                        <td class="center"><%=rees.getString("sizelength") %></td>
                                        <td class="center"><%=rees.getString("productColor") %></td>
                                        <td class="center"><%=rees.getString("recharge_validity") %></td>
                                        <td class="center"><%=rees.getString("lastcall") %></td>
                                        <td class="center"><%=rees.getString("nextcall") %></td>
                                        <td class="center"><%=rees.getString("number") %></td>
                                        <td class="center"><%=rees.getString("buyerName") %></td>
                                        <td class="center"><%=rees.getString("created_by") %></td>
                                        <td class="center"><%=rees.getString("Created_date") %></td>
                                        <td class="center"><%=rees.getString("updated_by") %></td>
                                        <td class="center"><%=rees.getString("updated_date") %></td> 
											
                                           
                                            </tr>
                                            <%} 
                                            DBConnection.close(con, stmt, rees);
                                            %>
                                             </tbody>
                                              </table>
                                              </div>
     </div>
   </div>
	

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
      <!-- content ends -->
</body>
</html>