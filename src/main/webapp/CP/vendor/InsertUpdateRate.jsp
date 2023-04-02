<!DOCTYPE html>
<%@page import="com.techgate.util.QueryConstants"%>
<%@page import="com.techgate.util.GeneralConstants"%>
<%@page import="com.techgate.query.ProductOtherdDetailQueryParameter"%>
<%@page import="com.techgate.query.AbstractQueryParameter"%>
<%@page import="org.springframework.util.StringUtils"%>
<%@page import="com.techgate.domain.ProductOtherDetail"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
					        Product Rate
					      </h1>
					      <ol class="breadcrumb">
					        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					        <li class="active">Product Rate Form</li>
					      </ol>
					    </section>
					
					    <!-- Main content -->
					    <section class="content">
						<div class="box box-success">
						 <div class="box-body">
<%
String eid=(String)session.getAttribute("euserid"); 
try{
String id = request.getParameter("hdnId");
String action = request.getParameter("hdnAction");
ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
DBAction dbAction = (DBAction) context.getBean("dbaction");
String rateRuppes = request.getParameter("rateRuppes").trim();
//String rateDollar = request.getParameter("rateDollar").trim();
//String rateWhite = request.getParameter("rateWhite");
//String rateIvory = request.getParameter("rateIvory");
String rateBlack = request.getParameter("rateBlack").trim();;
String discount = request.getParameter("discount").trim();
String fdiscount = request.getParameter("fdiscount").trim();


ProductOtherDetail productOtherDetail = new ProductOtherDetail();

productOtherDetail.setProduct_id(Integer.parseInt(id));
productOtherDetail.setRateInRupee(Integer.parseInt(rateRuppes));
//productOtherDetail.setRateInDollar(Integer.parseInt(rateDollar));
//productOtherDetail.setRatewhite(Double.parseDouble(rateWhite));
//productOtherDetail.setRateivory(Double.parseDouble(rateIvory));
productOtherDetail.setRateblack(Integer.parseInt(rateBlack));
productOtherDetail.setDiscount(Integer.parseInt(discount));
productOtherDetail.setFlatdiscountedrate(Integer.parseInt(fdiscount));
productOtherDetail.setUpdated_by("NWV"+eid);
AbstractQueryParameter query = new ProductOtherdDetailQueryParameter(productOtherDetail);

if(action.equals("Insert")) {
	query.setAction(GeneralConstants.INSERT);
	query.setSql(QueryConstants.PRODUCT_RATE_INSERT_QUERY);
} else {
	query.setAction(GeneralConstants.UPDATE);
	query.setSql(QueryConstants.PRODUCT_RATE_UPDATE_QUERY);
}
	
dbAction.executeDML(query);
%>
<div class="alert alert-success">
<button type="button" class="close" data-dismiss="alert">×</button>
<strong>Rate Updated Sucess....</strong>
</div>
<%
}
catch(Exception e){
	 %>
         <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>Oh !</strong> Error While Processing Data. Please Try Again. <%=e.getMessage()%>
        </div>
    <%
	e.printStackTrace();
}

%>
     </div>
   </div>
	

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
      <!-- content ends -->
</body>
</html>