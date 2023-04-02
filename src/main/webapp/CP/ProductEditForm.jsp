<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="com.techgate.domain.ProductOtherDetail"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.techgate.util.GeneralFunction"%>
<%@page import="java.util.List"%>
<%@page import="com.techgate.domain.Category"%>
<%@page import="com.techgate.domain.Product"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="com.techgate.util.QueryConstants"%>
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
   <link rel="stylesheet" href="./CP/plugins/datepicker/datepicker3.css">
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
        function GetSubCategoryListAjax(){

            var vParentCategoryId=document.form.cate_id.value;

            if(typeof XMLHttpRequest != "undefined") {
                req = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                req = new ActiveXObject("Microsoft.XMLHTTP");
            }

            req.open("POST", "getSubCategoryAjax", true);

            req.onreadystatechange = callbackRelevantSubCategories;

            req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            req.send("vParentCategoryId=" + encodeURIComponent(vParentCategoryId));
        }
        function callbackRelevantSubCategories(){

            if (req.readyState == 4) {
                if (req.status == 200) {
                    
                    var vreldet = document.getElementById("divSubCategory");
                    vreldet.innerHTML = req.responseText;
                }
                else{
                    alert("Error");
                }
            }
        }



        function checkProductCode(){

            var vProdCode = document.form.prodCode.value;
            if(typeof XMLHttpRequest != "undefined") {
                req = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                req = new ActiveXObject("Microsoft.XMLHTTP");
            }

            req.open("POST", "CheckProductCodeAjax", true);

            req.onreadystatechange = callbackRelevantProductCode;

            req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            req.send("vProdCode=" + encodeURIComponent(vProdCode));
        }
        function callbackRelevantProductCode(){

            if (req.readyState == 4) {
                if (req.status == 200) {
                    
                    var vreldet = document.getElementById("divProductCodeCheck");
                    vreldet.innerHTML = req.responseText;
                }
                else{
                    alert("Error");
                }
            }
        }
        </script>
         <script language="JavaScript" type="text/javascript">
        function hideshow(){
        	var type =  document.form.veg.value;
        	if(type=='FRESH'){
        		document.getElementById("activation").style.display = "none";
        		document.getElementById("recharge").style.display = "none";
        		document.getElementById("amt").style.display = "none";
        		document.getElementById("validity").style.display = "none";
        		document.getElementById("lastcall").style.display = "none";
        		document.getElementById("nextcall").style.display = "none";
        	}else{
        		document.getElementById("activation").style.display = "block";
        		document.getElementById("recharge").style.display = "block";
        		document.getElementById("amt").style.display = "block";
        		document.getElementById("validity").style.display = "block";
        		document.getElementById("lastcall").style.display = "block";
        		document.getElementById("nextcall").style.display = "block";
        	}
        	
        }
        </script>
</head>
<body class="hold-transition skin-red layout-top-nav" onload="hideshow();">
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

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Product Edit
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Product Edit Form</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
	<div class="box box-success">
	 <div class="box-body">
	                   <%
	                   String profile = (String) session.getAttribute("profile");
							ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext)application.getAttribute("context");
							GeneralFunction generfunc = (GeneralFunction) context.getBean("generalFunction");
							DBAction dbAction = (DBAction) context.getBean("dbaction");
						    int productId = Integer.parseInt(request.getParameter("productId"));
						    System.out.println("productId >>> "+productId);
							Product product = dbAction.getSingleData(QueryConstants.PRODUCT_Edit_SINGLE_DATE_QUERY,Product.class,productId);
							List<Category> parentCategoryList = generfunc.getParentCategoryList();
							ProductOtherDetail productOtherDetail = dbAction.getSingleData(QueryConstants.PRODUCT_RATE_SINGLE_DATA_QUERY, ProductOtherDetail.class, productId);
							int parent_cate_id = product.getCate_id();
							String cate_id = String.valueOf(product.getCate_id());
							boolean bln = false;							
							List<Category> subCategoriesList = generfunc.getSubCategoriesList(cate_id);
							if(subCategoriesList == null || subCategoriesList.size() == 0) {
								subCategoriesList = generfunc.getSubCategoriesFromChildList(cate_id);
								if(subCategoriesList != null && subCategoriesList.size() > 0){
									parent_cate_id = subCategoriesList.get(0).getCate_parent_id();
									if(parent_cate_id != 0) {
										bln = true;
									} else {
										subCategoriesList.clear();
									}
								}
							}
						%>
                       <form class="form-horizontal" action="UpdateProductDetails"  method="post" name="form">
                                    
                                    <div class="form-group">
                                            <label class="col-sm-2 control-label">Category</label>
                                            <div class="col-sm-10">
                                                <select style="width:250px" name="sub_cate_id">
                                                    <%
                                                    for(Category categories : parentCategoryList){
															%>
																<option value="<%= categories.getCate_id() %>" <%if(product.getCate_id() == categories.getCate_id()){%>selected<%} %>><%=categories.getCate_name() %></option>
															<%
														}
													%>
                                                </select>
                                            </div>
                                        </div>
                                        <!-- 
                                    	<div class="form-group">
                                            <label class="col-sm-2 control-label">Sub-Category</label>
                                            <div class="col-sm-10" id="divSubCategory">
                                                <select style="width:250px" id="selectError3" name="sub_cate_id">
                                                    <option value="select">select</option>
                                                    <option value="select">select</option>
                                                    <%
															for(Category categories : subCategoriesList){
													%>
														<option value="<%= categories.getCate_id() %>" <%if(product.getCate_id() == categories.getCate_id() && bln){%>selected<%} %>><%=categories.getCate_name() %></option>
													<% } %>
                                                </select>
                                            </div>
                                        </div>
                                         -->
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Product Type</label>
                                            <div class="col-sm-10">
                                                <select style="width:250px" id="selectError3" name="prodType">
                                                <option value="" <%if(product.getType()==null){%>selected<%} %>>---Select-----</option>
                                                
                                                     <option value="FAVORITES" <%if(product.getType()!=null && product.getType().equalsIgnoreCase("FAVORITES")){%>selected<%} %>>FAVORITES</option>
                                                   <option value="New" <%if(product.getType()!=null && product.getType().equalsIgnoreCase("New")){%>selected<%} %>>New Products</option>
													<option value="Featured" <%if(product.getType()!=null && product.getType().equalsIgnoreCase("Featured")){%>selected<%} %>>Featured Products</option>
													<option value="Sale" <%if(product.getType()!=null && product.getType().equalsIgnoreCase("Sale")){%>selected<%} %>>On Sale</option>
													<option value="None" <%if(product.getType()!=null && product.getType().equalsIgnoreCase("None")){%>selected<%} %>>None</option>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Parent Operator</label>
                                            <div class="col-sm-10">
                                                <select style="width:250px" id="selectError3" name="prodCode">
                                                 <option value="" <%if(product.getProductCode()==null){%>selected<%} %>>---Select-----</option>
                                                 <option value="Airtel" <%if(product.getProductCode()!=null && product.getProductCode().equalsIgnoreCase("Airtel")){%>selected<%} %>>Airtel</option>
                                                 <option value="Aircel" <%if(product.getProductCode()!=null && product.getProductCode().equalsIgnoreCase("Aircel")){%>selected<%} %>>Aircel</option>
                                                  <option value="BSNL" <%if(product.getProductCode()!=null && product.getProductCode().equalsIgnoreCase("BSNL")){%>selected<%} %>>BSNL</option>
                                                   <option value="Idea" <%if(product.getProductCode()!=null && product.getProductCode().equalsIgnoreCase("Idea")){%>selected<%} %>>Idea</option>
                                                   <option value="Jio" <%if(product.getProductCode()!=null && product.getProductCode().equalsIgnoreCase("Jio")){%>selected<%} %>>Jio</option>
                                                    <option value="MTNL" <%if(product.getProductCode()!=null && product.getProductCode().equalsIgnoreCase("MTNL")){%>selected<%} %>>MTNL</option>
                                                   <option value="MTS" <%if(product.getProductCode()!=null && product.getProductCode().equalsIgnoreCase("MTS")){%>selected<%} %>>MTS</option>
                                                   <option value="Reliance" <%if(product.getProductCode()!=null && product.getProductCode().equalsIgnoreCase("Reliance")){%>selected<%} %>>Reliance</option>
                                                   <option value="Tata Docomo" <%if(product.getProductCode()!=null && product.getProductCode().equalsIgnoreCase("Tata Docomo")){%>selected<%} %>>Tata Docomo</option>
                                                   <option value="Telenor" <%if(product.getProductCode()!=null && product.getProductCode().equalsIgnoreCase("Telenor")){%>selected<%} %>>Telenor</option>
                                                    <option value="Vodafone" <%if(product.getProductCode()!=null && product.getProductCode().equalsIgnoreCase("Vodafone")){%>selected<%} %>>Vodafone</option>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Current Operator</label>
                                            <div class="col-sm-10">
                                                <select style="width:250px" id="selectError3" name="brandName">
                                                  <option value="" <%if(product.getProductBrand()==null){%>selected<%} %>>---Select-----</option>
                                                 <option value="Airtel-Docomo" <%if(product.getProductBrand()!=null && product.getProductBrand().equalsIgnoreCase("Airtel")){%>selected<%} %>>Airtel</option>
                                                 <option value="Aircel" <%if(product.getProductBrand()!=null && product.getProductBrand().equalsIgnoreCase("Aircel")){%>selected<%} %>>Aircel</option>
                                                  <option value="BSNL" <%if(product.getProductBrand()!=null && product.getProductBrand().equalsIgnoreCase("BSNL")){%>selected<%} %>>BSNL</option>
                                                   <option value="Idea" <%if(product.getProductBrand()!=null && product.getProductBrand().equalsIgnoreCase("Idea")){%>selected<%} %>>Idea</option>
                                                   <option value="Jio" <%if(product.getProductBrand()!=null && product.getProductBrand().equalsIgnoreCase("Jio")){%>selected<%} %>>Jio</option>
                                                    <option value="MTNL" <%if(product.getProductBrand()!=null && product.getProductBrand().equalsIgnoreCase("MTNL")){%>selected<%} %>>MTNL</option>
                                                   <option value="MTS" <%if(product.getProductBrand()!=null && product.getProductBrand().equalsIgnoreCase("MTS")){%>selected<%} %>>MTS</option>
                                                   <option value="Reliance" <%if(product.getProductBrand()!=null && product.getProductBrand().equalsIgnoreCase("Reliance")){%>selected<%} %>>Reliance</option>
                                                   <option value="Tata Docomo" <%if(product.getProductBrand()!=null && product.getProductBrand().equalsIgnoreCase("Tata Docomo")){%>selected<%} %>>Tata Docomo</option>
                                                   <option value="Telenor" <%if(product.getProductBrand()!=null && product.getProductBrand().equalsIgnoreCase("Telenor")){%>selected<%} %>>Telenor</option>
                                                    <option value="Vodafone" <%if(product.getProductBrand()!=null && product.getProductBrand().equalsIgnoreCase("Vodafone")){%>selected<%} %>>Vodafone</option>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Current Number</label>
                                            <div class="col-sm-10">
                                                <select style="width:250px" id="selectError3" name="currentNumber" >
                                                 <option value="" <%if(product.getCurrentNumber()==null || product.getCurrentNumber().equals("null") ){%>selected<%} %>>---Select-----</option>
                                                 <option value="Postpaid" <%if(product.getCurrentNumber().equalsIgnoreCase("Postpaid")){%>selected<%} %>>Postpaid</option>
                                                 <option value="Prepaid" <%if(product.getCurrentNumber().equalsIgnoreCase("Prepaid")){%>selected<%} %>>Prepaid</option>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Number Status</label>
                                            <div class="col-sm-10">
                                                <select style="width:250px" id="selectError3" name="veg" onchange="hideshow();" required="required">
                                                  <option value="" <%if(product.getVegProduct()==null || product.getVegProduct().equals("null") ){%>selected<%} %>>---Select-----</option>
                                                 <option value="FRESH" <%if(product.getVegProduct().equalsIgnoreCase("FRESH")){%>selected<%} %>>FRESH</option>
                                                 <option value="RTP" <%if(product.getVegProduct().equalsIgnoreCase("RTP")){%>selected<%} %>>RTP</option>
                                                 <option value="V2V" <%if(product.getVegProduct().equalsIgnoreCase("V2V")){%>selected<%} %>>V2V</option>
                                                 <option value="I2I" <%if(product.getVegProduct().equalsIgnoreCase("I2I")){%>selected<%} %>>I2I</option>
                                                 <option value="A2A" <%if(product.getVegProduct().equalsIgnoreCase("A2A")){%>selected<%} %>>A2A</option>
                                                 <option value="Pretopost" <%if(product.getVegProduct().equalsIgnoreCase("Pretopost")){%>selected<%} %>>PRE TO POST</option>
                                                 <option value="Posttopre" <%if(product.getVegProduct().equalsIgnoreCase("Posttopre")){%>selected<%} %>>POST TO PRE</option>
                                                 <option value="C CODE RTP" <%if(product.getVegProduct().equalsIgnoreCase("C CODE RTP")){%>selected<%} %>>C CODE RTP</option>
                                                 <option value="Non RTP" <%if(product.getVegProduct().equalsIgnoreCase("Non RTP")){%>selected<%} %>>Non RTP</option>
                                                </select>
                                            </div>
                                        </div>
                                        
                                       <div class="form-group" id="activation">
								                <label class="col-sm-2 control-label">Activation Date:</label>
								                <div class="col-sm-6 input-group date">
								                  <div class="input-group-addon">
								                    <i class="fa fa-calendar"></i>
								                  </div>
								                  <input type="text" name="veg1" class="form-control pull-right" id="datepicker" value="<%=product.getSizeheight()==null?"":product.getSizeheight() %>">
								                </div>
								                <!-- /.input group -->
								         </div>
								         
								         <div class="form-group" id="recharge">
								                <label class="col-sm-2 control-label">Recharge Date:</label>
								                <div class="col-sm-6 input-group date">
								                  <div class="input-group-addon">
								                    <i class="fa fa-calendar"></i>
								                  </div>
								                  <input type="text" name="veg2" class="form-control pull-right" id="datepicker1" value="<%=product.getSizelength()==null?"":product.getSizelength()%>">
								                </div>
								                <!-- /.input group -->
								         </div>
                                         <div class="form-group" id="amt">
                                            <label class="col-sm-2 control-label">Recharge Amount</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="color" type="text" value="<%=product.getProductColor() %>" >
                                            </div>
                                        </div>
                                        
                                         <div class="form-group" id="validity">
                                            <label class="col-sm-2 control-label">Recharge Validity</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="validtill" type="text" value="<%=product.getRecharge_validity()%>" >
                                            </div>
                                        </div>
                                        
                                        <div class="form-group" id="lastcall">
								                <label class="col-sm-2 control-label">Last Calling Date:</label>
								                <div class="col-sm-6 input-group date">
								                  <div class="input-group-addon">
								                    <i class="fa fa-calendar"></i>
								                  </div>
								                  <input type="text" name="lastcall" class="form-control pull-right" id="datepicker2" value="<%=product.getLastCall()%>">
								                </div>
								                <!-- /.input group -->
								         </div>
								         
								         <div class="form-group" id="nextcall">
								                <label class="col-sm-2 control-label">Next Calling Date:</label>
								                <div class="col-sm-6 input-group date">
								                  <div class="input-group-addon">
								                    <i class="fa fa-calendar"></i>
								                  </div>
								                  <input type="text" name="nextcall" class="form-control pull-right" id="datepicker3" value="<%=product.getNextCall()==null?"":product.getNextCall()%>">
								                </div>
								                <!-- /.input group -->
								         </div>
								         
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Circle</label>
                                            <div class="col-sm-10">
                                                <select style="width:250px" id="selectError3" name="packing">
                                                 <option value="" <%if(product.getPacking()==null){%>selected<%} %>>---Select-----</option>
                                                 <option value="Andhra Pradesh" <%if(product.getPacking()!=null && product.getPacking().equalsIgnoreCase("Andhra Pradesh")){%>selected<%} %>>Andhra Pradesh</option>
													<option value="Assam" <%if(product.getPacking()!=null && product.getPacking().equalsIgnoreCase("Assam")){%>selected<%} %>>Assam</option>
													<option value="Bihar" <%if(product.getPacking()!=null && product.getPacking().equalsIgnoreCase("Bihar")){%>selected<%} %>>Bihar</option>
													<option value="Delhi" <%if(product.getPacking()!=null && product.getPacking().equalsIgnoreCase("Delhi")){%>selected<%} %>>Delhi</option>
													<option value="Gujarat" <%if(product.getPacking()!=null && product.getPacking().equalsIgnoreCase("Gujarat")){%>selected<%} %>>Gujarat</option>
													<option value="Haryana" <%if(product.getPacking()!=null && product.getPacking().equalsIgnoreCase("Haryana")){%>selected<%} %>>Haryana</option>
													<option value="Himachal Pradesh" <%if(product.getPacking()!=null && product.getPacking().equalsIgnoreCase("Himachal Pradesh")){%>selected<%} %>>Himachal Pradesh</option>
													<option value="Jammu & Kashmir" <%if(product.getPacking()!=null && product.getPacking().equalsIgnoreCase("Jammu & Kashmir")){%>selected<%} %>>Jammu & Kashmir</option>
													<option value="Karnataka" <%if(product.getPacking()!=null && product.getPacking().equalsIgnoreCase("Karnataka")){%>selected<%} %>>Karnataka</option>
													<option value="Kerala" <%if(product.getPacking()!=null && product.getPacking().equalsIgnoreCase("Kerala")){%>selected<%} %>>Kerala</option>
													<option value="Kolkata" <%if(product.getPacking()!=null && product.getPacking().equalsIgnoreCase("Kolkata")){%>selected<%} %>>Kolkata</option>
													<option value="Madhya Pradesh" <%if(product.getPacking()!=null && product.getPacking().equalsIgnoreCase("Madhya Pradesh")){%>selected<%} %>>Madhya Pradesh</option>
													<option value="Maharashtra" <%if(product.getPacking()!=null && product.getPacking().equalsIgnoreCase("Maharashtra")){%>selected<%} %>>Maharashtra</option>
													<option value="Mumbai" <%if(product.getPacking()!=null && product.getPacking().equalsIgnoreCase("Mumbai")){%>selected<%} %>>Mumbai</option>
													<option value="Northeast" <%if(product.getPacking()!=null && product.getPacking().equalsIgnoreCase("Northeast")){%>selected<%} %>>Northeast</option>
													<option value="Orissa" <%if(product.getPacking()!=null && product.getPacking().equalsIgnoreCase("Orissa")){%>selected<%} %>>Orissa</option>
													<option value="Punjab" <%if(product.getPacking()!=null && product.getPacking().equalsIgnoreCase("Punjab")){%>selected<%} %>>Punjab</option>
													<option value="Rajasthan" <%if(product.getPacking()!=null && product.getPacking().equalsIgnoreCase("Rajasthan")){%>selected<%} %>>Rajasthan</option>
													<option value="Tamil Nadu" <%if(product.getPacking()!=null && product.getPacking().equalsIgnoreCase("Tamil Nadu")){%>selected<%} %>>Tamil Nadu</option>
													<option value="Uttar Pradesh (East)" <%if(product.getPacking()!=null && product.getPacking().equalsIgnoreCase("Uttar Pradesh (East)")){%>selected<%} %>>Uttar Pradesh (East)</option>
													<option value="Uttar Pradesh (West)" <%if(product.getPacking()!=null && product.getPacking().equalsIgnoreCase("Uttar Pradesh (West)")){%>selected<%} %>>Uttar Pradesh (West)</option>
													<option value="West Bengal" <%if(product.getPacking()!=null && product.getPacking().equalsIgnoreCase("West Bengal")){%>selected<%} %>>West Bengal</option>
                                                </select>
                                            </div>
                                        </div>
                                        

                                        
                                       
                                        
                                        <!-- 
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Product Code</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="prodCode" type="text" value="<%=product.getProductCode()%>" required="required">
                                            </div>
                                        </div>
                                        
                                         -->
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Vanity Number</label>
                                            <div class="col-sm-6">
                                            <textarea id="editor3" name="prodName" rows="10" cols="80" required="required"><%=product.getProductName() %></textarea>
                                            </div>
                                        </div>

										<div class="form-group">
                                            <label class="col-sm-2 control-label">Number Rate</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="rateRuppes" type="text" value="<%=productOtherDetail.getRateInRupee() %>" required="required">
                                            	<input type="hidden" name="oldRate" value="<%=productOtherDetail.getRateInRupee() %>">
                                            	
                                            </div>
                                        </div>
                                        
                                        
                                         <div class="form-group">
                                            <label class="col-sm-2 control-label">Vendor Name</label>
                                            <div class="col-sm-10">
                                                <select style="width:250px" id="selectError3" name="vendorId"  required>
                                                 <option value="">---Select-----</option>
                                                 <%
                                                 DBConnection dbcon = new DBConnection();
                                         		Connection con = dbcon.getCon();
                                         		Statement stmt =  con.createStatement();
                                         		ResultSet res = stmt.executeQuery("select * from vendorDetails where status='Y'");
                                                 while(res.next()) {
                                                 %>
                                                 <option value="<%=res.getString("id") %>" <%if(product.getVendor_id()==res.getInt("id")){ %>selected<%} %>><%=res.getString("firstname") %></option>
                                                <%} %>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Vendor Rate</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="rateBlack" type="text" value="<%=productOtherDetail.getRateblack() %>" required="required">
                                            	<input type="hidden" name="oldVendorRate" value="<%=productOtherDetail.getRateblack() %>">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Dealer Name</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="buyerName" type="text" value="<%=product.getBuyerName() %>" >
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Dealer Contact</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="buyerContact" type="text" value="<%=product.getBuyerContact() %>" >
                                            </div>
                                        </div>
                                        
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Discount %</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="discount" type="text" value="<%=productOtherDetail.getDiscount()%>">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Flat Discount</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="fdiscount" type="text" value="<%=productOtherDetail.getFlatdiscountedrate()%>">
                                            </div>
                                        </div>
                                        
                                        
                                        
                                        <input type="hidden" name="Comments" value="">
                                        
                                        <!-- 
                                        
                                         <div class="form-group">
                                            <label class="col-sm-2 control-label">Packing</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="packing" type="text" value="<%=product.getPacking() %>" >
                                            </div>
                                        </div>
                                        
                                        
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Pack Size</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="veg2" type="text" value="<%=product.getSizelength()%>" >
                                            </div>
                                        </div>
                                       
                                         -->
                                        <%if(profile.equalsIgnoreCase("SEO")){ %>
										 <div class="form-group">
                                            <label class="col-sm-2 control-label">Short Description</label>
                                           <div class="col-sm-10">
                                                <textarea id="editor1" name="productDescript" rows="10" cols="80"><%=product.getDescript() %></textarea>
                                            </div>
                                        </div>

										<div class="form-group">
                                            <label class="col-sm-2 control-label">Additional Description</label>
                                           <div class="col-sm-10">
                                                <textarea id="editor2" name="addDescript" rows="10" cols="80"><%=product.getAdditinalDescription() %></textarea>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Page Title</label>
                                           <div class="col-sm-6">
                                                <textarea name="indication" rows="10" cols="80"><%=product.getIndication()==null?"":product.getIndication() %></textarea>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Page Keyword</label>
                                           <div class="col-sm-6">
                                                <textarea  name="directionOfUse" rows="10" cols="80"><%=product.getUseDirection()==null?"":product.getUseDirection() %></textarea>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Page Description</label>
                                           <div class="col-sm-6">
                                                <textarea  name="natOfProd" rows="10" cols="80"><%=product.getNatureOfProduct()==null?"":product.getNatureOfProduct() %></textarea>
                                            </div>
                                        </div>
                                        <%}else{ %>
                                         <input type="hidden" name="productDescript" value="<%=product.getDescript()==null?"":product.getDescript() %>">
                                        <input type="hidden" name="addDescript" value="<%=product.getAdditinalDescription()==null?"":product.getAdditinalDescription() %>">
                                         <input type="hidden" name="indication" value="<%=product.getIndication()==null?"":product.getIndication() %>">
                                        <input type="hidden" name="directionOfUse" value="<%=product.getUseDirection()==null?"":product.getUseDirection() %>">
                                        <input type="hidden" name="indication" value="<%=product.getIndication()==null?"":product.getIndication() %>">
                                        <input type="hidden" name="directionOfUse" value="<%=product.getUseDirection()==null?"":product.getUseDirection() %>">
                                        <input type="hidden" name="natOfProd" value="<%=product.getNatureOfProduct()==null?"":product.getNatureOfProduct() %>">
                                        <%} %>
										<!-- 
										<div class="form-group">
                                            <label class="col-sm-2 control-label">Ingredients & Benefits</label>
                                           <div class="col-sm-10">
                                                <textarea id="editor4" name="indication" rows="10" cols="80"><%=product.getIndication()==null?"":product.getIndication() %></textarea>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">How to Use</label>
                                           <div class="col-sm-10">
                                                <textarea id="editor3" name="directionOfUse" rows="10" cols="80"><%=product.getUseDirection()==null?"":product.getUseDirection() %></textarea>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Ideal For</label>
                                           <div class="col-sm-10">
                                                <textarea id="editor5" name="natOfProd" rows="10" cols="80"><%=product.getNatureOfProduct()==null?"":product.getNatureOfProduct() %></textarea>
                                            </div>
                                        </div>
										
										 -->
                                        <div class="box-footer">
                                            <button type="submit" class="btn btn-info pull-right">Update Product Details</button>
                                        </div>
                                        <input type="hidden" name="hdnProductId" id="hdnProductId" value="<%=product.getProduct_id() %>">
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
<!-- CK Editor -->
<script src="./CP/js/bckeditor/ckeditor.js"></script>
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
    $('#datepicker3').datepicker({
        autoclose: true
      });
  });
</script>
<script>
  $(function () {
    // Replace the <textarea id="editor1"> with a CKEditor
    // instance, using default configuration.
      CKEDITOR.replace('editor3')
    CKEDITOR.replace('editor1')
    CKEDITOR.replace('editor2')
    

  })
</script>
<%} %>
</body>
</html>
