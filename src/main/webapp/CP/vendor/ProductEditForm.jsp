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
							ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext)application.getAttribute("context");
							GeneralFunction generfunc = (GeneralFunction) context.getBean("generalFunction");
							DBAction dbAction = (DBAction) context.getBean("dbaction");
						    int productId = Integer.parseInt(request.getParameter("productId"));
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
                       <form class="form-horizontal" action="vendorUpdateProductDetails"  method="post" name="form">
                                    
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
                                        
                                        
                                        <input type="hidden" name="prodType" value="<%=product.getType() %>">
                                       
                                       
                                        
                                       
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Current Number</label>
                                            <div class="col-sm-10">
                                                <select style="width:250px" id="selectError3" name="currentNumber" >
                                                <option value="">---Select-----</option>
                                                 <option value="Postpaid" <%if(product.getCurrentNumber().equalsIgnoreCase("Postpaid")){%>selected<%} %>>Postpaid</option>
                                                 <option value="Prepaid" <%if(product.getCurrentNumber().equalsIgnoreCase("Prepaid")){%>selected<%} %>>Prepaid</option>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Number Status</label>
                                            <div class="col-sm-10">
                                                <select style="width:250px" id="selectError3" name="veg" onchange="hideshow();" required="required">
                                                 <option value="">---Select-----</option>
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
                                        
                                       

                                        

										<div class="form-group">
                                            <label class="col-sm-2 control-label">Vanity Number</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="prodNameNumber" type="text" value="<%=product.getNumber() %>" required="required" readonly="readonly">
                                                <input type="hidden" name="prodName" id="prodName" value="<%=product.getProductName() %>">
                                            </div>
                                        </div>
                                        
										<div class="form-group">
                                            <label class="col-sm-2 control-label">Number Rate</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="rateBlack" type="text" value="<%=productOtherDetail.getRateblack() %>" required="required" <%if(product.getNumber_status().equalsIgnoreCase("SOLD")){ %>readonly="readonly"<%}%>>
                                            	<input type="hidden" name="rateRuppes" value="<%=productOtherDetail.getRateInRupee() %>">
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
                                            <label class="col-sm-2 control-label">Discount</label>
                                            <div class="col-sm-6">
                                                <input class="form-control" id="focusedInput" name="discount" type="text" value="<%=productOtherDetail.getFlatdiscountedrate()%>" <%if(product.getNumber_status().equalsIgnoreCase("SOLD")){ %>readonly="readonly"<%}%>>
                                            	
                                            </div>
                                        </div>
                                        
                                       
                                        
                                         
                                        
                                       <input type="hidden" name="productDescript" value="<%=product.getDescript()==null?"":product.getDescript() %>">
                                        <input type="hidden" name="addDescript" value="<%=product.getAdditinalDescription()==null?"":product.getAdditinalDescription() %>">
                                         <input type="hidden" name="indication" value="<%=product.getIndication()==null?"":product.getIndication() %>">
                                        <input type="hidden" name="directionOfUse" value="<%=product.getUseDirection()==null?"":product.getUseDirection() %>">
                                        <input type="hidden" name="indication" value="<%=product.getIndication()==null?"":product.getIndication() %>">
                                        <input type="hidden" name="directionOfUse" value="<%=product.getUseDirection()==null?"":product.getUseDirection() %>">
                                        <input type="hidden" name="natOfProd" value="<%=product.getNatureOfProduct()==null?"":product.getNatureOfProduct() %>">
                                       
                                        
                                       
										
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
<%} %>
</body>
</html>
