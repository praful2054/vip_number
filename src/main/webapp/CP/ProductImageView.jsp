<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="java.util.List"%>
<%@page import="com.techgate.domain.ProductImage"%>
<%@page import="com.techgate.util.QueryConstants"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
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
<body class="hold-transition skin-red layout-top-nav">
	<%
	
		ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
		DBAction dbAction = (DBAction) context.getBean("dbaction");
		int productId = Integer.parseInt(request.getParameter("productId"));
		List<ProductImage> productImageList = dbAction.getDataList(QueryConstants.PRODUCT_IMAGE_ALL_DATE_QUERY, ProductImage.class,new Object[]{productId});
	
		DateFormat format = new SimpleDateFormat("dd/MM/yyyy");
	%>
	                  <div class="content-wrapper">

    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Product Image Details
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Product Image Details</li>
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
                                            <th>Product Image</th>
											<th>Product Seq No</th>
											<th>Product Comment</th>
											<th>Edit</th>
											<th>Delete</th>
                                        </tr>
                                    </thead>   
                                    <tbody>
                                       <%
											for(ProductImage detail : productImageList){
										%>
										<form method="post" action="UpdateProductImageDetails?productImageId=<%=detail.getProduct_img_id() %>&productId=<%=detail.getProduct_id() %>">
											<tr>
												<td class="center"><img src="ProductImg/<%=productId %>/<%=detail.getImg_loc() %>" width="150px" height="150px"></td>
												<td class="center"><input type="text" name="imgSeqNo" id="imgSeqNo" value="<%=detail.getImg_seq_no()%>"></td>
												<td class="center"><input type="text" name="imgComment" id="imgComment" value="<%=detail.getImg_comment()%>"></td>
												<td class="center"><input type="submit" class="btn btn-primary" value="update"></td>
												<td class="center"><a href="delete?id=<%=detail.getProduct_img_id()%>&type=productimage&productId=<%=detail.getProduct_id() %>" >Delete</a></td>
											</tr>
										</form>
                                        
                                        <%
                                            }

                                        %>
                                    </tbody>
                <tfoot>
                <tr>
                  <th>Product Image</th>
				<th>Product Seq No</th>
				<th>Product Comment</th>
				<th>Edit</th>
				<th>Delete</th>
                </tr>
                </tfoot>
              </table>
            </div>
	</div>

    </section>
</div>
</body>
</html>