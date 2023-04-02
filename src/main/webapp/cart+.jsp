<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="org.springframework.util.StringUtils"%>
<%@page import="java.util.Map"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.techgate.util.GeneralFunction"%>
<%@page import="com.techgate.domain.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.techgate.util.GeneralConstants"%>
<%@page import="com.techgate.domain.CustomerAddressDetails"%>
<%@page import="com.techgate.cart.ShoppingCart"%>
<%@page import="com.techgate.cart.ShoppingCartItem"%>
<%@page import="com.techgate.util.GeneralConstants"%>
<%@page import="com.techgate.domain.CustomerLoginDetail"%>
<%@page import="com.techgate.domain.CustomProduct"%>   
<!DOCTYPE html>
<html lang="en-US">

<head>

<!-- Basic Page Head -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>VIP Mobile Number | Fancy Number | VIP Mobile Number | Vip Number Store</title>
<meta name="description" content="VIP NUMBER STORE is known across India as a company that provides valuable and high quality services since 2010.">
<meta name="author" content="VIP NUMBER STORE - vipnumberstore.in">
<meta name="keywords" content="vip number, vanity number, buy vip mobile number online, vip mobile India ,fancy number, fancy mobile number">


<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Favicons -->
<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
<link rel="apple-touch-icon" href="assets/img/logo.png">

<!-- Css -->
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/jquery.bxslider.css">
<link rel="stylesheet" type="text/css" href="assets/css/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="assets/css/owl.theme.css">
<link rel="stylesheet" type="text/css" href="assets/css/prettyPhoto.css">
<link rel="stylesheet" type="text/css" href="assets/css/style.css">
<link rel="stylesheet" type="text/css" href="assets/css/responsive.css">

<!-- Google Fonts -->
<link rel="stylesheet" type="text/css" href="fonts/Raleway.css">
<link rel="stylesheet" type="text/css" href="fonts/Roboto.css">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/v4-shims.css">



<script language="JavaScript" type="text/javascript">
        function VlidateRequestAjax(){

            var vParentCategoryId=document.form.telephone.value;
            var vParentCategoryName=document.form.firstname.value;

            if(typeof XMLHttpRequest != "undefined") {
                req = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                req = new ActiveXObject("Microsoft.XMLHTTP");
            }

            req.open("POST", "sendOTP", true);

            req.onreadystatechange = callbackRelevantSubCategories;

            req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            req.send("vParentCategoryId=" + encodeURIComponent(vParentCategoryId)+"&vParentCategoryName="+encodeURIComponent(vParentCategoryName));
        }
        function callbackRelevantSubCategories(){

            if (req.readyState == 4) {
                if (req.status == 200) {
                	document.getElementById("otp").style.display = "block";
            		document.getElementById("sbutton").style.display = "block";
                	document.getElementById("requestOT").style.display = "none";
                    var vreldet = document.getElementById("divSubCategory");
                    vreldet.innerHTML = req.responseText;
                }
                else{
                    alert("Error"+req.responseText);
                }
            }
        }
</script>

<script language="JavaScript" type="text/javascript">
        function hideshow(){
        	
        		document.getElementById("otp").style.display = "none";
        		document.getElementById("sbutton").style.display = "none";
        	
        		
        	}
        	
        </script>
        
        <script language="JavaScript" type="text/javascript">
        function validationResend(){
        	
        	var mobileNo=document.form.telephone.value;
            var Name=document.form.firstname.value;
            if(mobileNo==""){
            	document.form.mobileNo.focus();
            }else if(Name==""){
            	document.form.cname.focus();
                 return false;
        	}else{
        		alert("OTP Resend Sucessfully");
        		VlidateRequestAjax();
        		
        	}
        }
        	
        </script>
        
        <script language="JavaScript" type="text/javascript">
        function validation(){
        	
        	var mobileNo=document.form.telephone.value;
            var Name=document.form.firstname.value;
             if(mobileNo==""){
            	document.form.mobileNo.focus();
            }else if(Name==""){
            	document.form.cname.focus();
                 return false;
        	}else{
        		
        		VlidateRequestAjax();
        	}
        }
        	
        </script>
        
   <script type="text/javascript">
	function getDiscount(){
	//var amount =  document.form.totalAmount.value;
	var coupoun =  document.getElementById("coupoun").value;
    //alert(coupoun);
    if(typeof XMLHttpRequest != "undefined") {
        req = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        req = new ActiveXObject("Microsoft.XMLHTTP");
    }

    req.open("POST", "getDiscount.jsp", true);

    req.onreadystatechange = callbackRelevantUpperChangemain;

    req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    req.send("coupoun="+encodeURIComponent(coupoun));
}
function callbackRelevantUpperChangemain(){

    if (req.readyState == 4) {

        if (req.status == 200 || req.status == 500) {

            var vreldet = document.getElementById("coupounDiv");
            vreldet.innerHTML = req.responseText;
        //   var vreldet = document.getElementById("coupounDiv");
           // document.form.totalAmount.value = req.responseText;
           //document.form.aprice.value = req.responseText;
           //  alert("Coupoun Applied Sucessfully");
        }
    }
}
</script>       

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-150357017-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-150357017-1');
</script>

<!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window,document,'script',
'https://connect.facebook.net/en_US/fbevents.js');
 fbq('init', '2409116105970793'); 
fbq('track', 'PageView');
</script>
<noscript>
 <img height="1" width="1" 
src="https://www.facebook.com/tr?id=2409116105970793&ev=PageView
&noscript=1"/>
</noscript>


</head>
 <%
 if(session.getAttribute("custId")!=null || session.getAttribute("custBillingDetails")!=null){
	   response.sendRedirect("checkout");
}
 
 
ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
String currency = (String) session.getAttribute("currency");
ClassPathXmlApplicationContext context=(ClassPathXmlApplicationContext) application.getAttribute("context");
GeneralFunction generfunc = (GeneralFunction) context.getBean("generalFunction");
List<Category> parentCategory = generfunc.getParentCategoryList();
List<Category> subCategorys = generfunc.getSubCategoryList();
List<Category> subCategoryes =null;
 List<Category> subCategoryeis =null;
	Map<String, String> map = null;
	map = (Map<String, String>)application.getAttribute("categoriesMap");
	String Parent_Cate_Id = request.getParameter("parentCateId")==null?"0":request.getParameter("parentCateId");
	String subCategoryIds = map.get(Parent_Cate_Id);
 List<CustomProduct> cproducts = generfunc.getProductCategoryList(subCategoryIds);
%>
<body onload="hideshow();">

<!-- Site Loader -->
<div class="site-loader"><img src="assets/img/loader.gif" alt="Loading"></div>
<!-- Site Loader End -->

<!-- Site Back Top -->
<div class="site-back-top" title="Back to top">
	<i class="fa fa-angle-up"></i>
</div>
<!-- Site Back Top End -->

<!-- Site Navigation -->
<div class="site-nav"></div>
<!-- Site Navigation End -->

<!-- Site Container -->
<div id="site-container" class="site-fullscreen site-sticky">
	<!-- Header -->
	<header id="site-header">
		<div class="header-inner">
			<div class="wrapper clearfix">
				<!-- Header Logo -->
				<div class="header-logo"><a href="index"><img src="assets/img/logo.png" alt=""></a></div>
				<!-- Header Logo End -->
				
				
				<div class="header-search">
					
                    	<!--<form action="searchNumbers" method="post" style="float:left;">
						<input name="search" type="text" placeholder="Search Number">
						<button type="submit" class="search-btn"><i class="fa fa-search"></i></button>
					</form>-->
                    
                    
                    	<a href="cart"> <div class="carticon"> <i class="fa fa-shopping-cart"></i> </div> </a>
                    
						<% if(session.getAttribute("custId")==null){%>
                        	<a href="login.html"><div class="singin">Sign In</div></a>
					    <%} %>
					
              </div>
                
				
				<!-- Header Menu -->
				<nav class="header-menu">
					<ul class="nav-default clearfix">
                    <img src="assets/img/logo.png" class="menulogo">
						<li><a href="index">HOME</a></li>
                        <li class="active"><a href="VIPNumbers">VIP NUMBERS</a></li>
<li><a href="SoldOut.jsp">SOLD OUT</a></li>
                        <li><a href="aboutus.html">ABOUT US</a></li>
                        <li><a href="gallery.html">GALLERY</a></li>
                        <li><a href="contact_us.html">CONTACT US</a></li>
                        <% if(session.getAttribute("custId")!=null){ %>
                         <li><a href="#"> My Account </a>
							<ul>
								<li><a href="myorder.jsp">Your Orders</a></li>
								<li><a href="signout.jsp">Logout</a></li>
							</ul>
						</li>
                        <%}%>
                    </ul>
				</nav>
				<!-- Header Menu End -->
				
				<!-- Header Nav -->
                <div class="header-nav"><i class="fa fa-bars fa-2x"></i></div>
                
                <a href="cart"> <div class="carticon mobiledisblock"> <i class="fa fa-shopping-cart">  </i> <b><%if(cart!=null){%><%=cart.getAllCartItem().size() %><%} else {%>0<%} %></b> </div> </a>
				<!-- Header Nav End -->
			</div>
		</div>
	</header>
	<!-- Header End -->
	
	<!-- Slider -->
	<section id="site-slider" style="border-bottom:1px solid #f23c00;">
		<div class="wrapper">
			<img src="assets/img/checkout.jpg" alt="Slide" class="img-full" />
		</div>
	</section>
	<!-- Slider End -->
		
		
		<form action="registerCustomer" method="post" name="form">
		<!-- Contact Info -->
		<div class="box-white">
			<div class="wrapper padding-all">
				<div class="row">
					
					<!-- Contact Form -->
					<div class="col-md-7 col-sm-12 boxshadow padding-all">
						<h2 class="heading_for_subtitle">BILLING INFORMATION</h2>
						<p>IF Already Registered <b>Click Here to Login.  </b>  <a class="btn btn-default margin-top-10 gradiyant" href="signin.jsp?redirectTo=checkout">Login</a> </p>
						<div class="data-form">
							
							<div class="row">
								<div class="col-md-6 col-sm-12">
									<label>Name</label>
									<div class="form-field">
										<i class="fa fa-user"></i>
										<input type="text" name="firstname" placeholder="Enter your Name" required>
									</div>
								</div>
								<div class="col-md-6 col-sm-12">
									<label>E-Mail</label>
									<div class="form-field">
										<i class="fa fa-envelope-o"></i>
										<input type="email" name="email" placeholder="Enter your Email" required>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 col-sm-12">
									<label>Mobile No</label>
									<div class="form-field">
										<i class="fa fa-phone"></i>
										<input type="number" name="telephone" placeholder="Enter your Mobile No" maxlength="10" required>
									</div>
								</div>
								<div class="col-md-6 col-sm-12">
									<label>Password</label>
									<div class="form-field">
										<i class="fa fa-lock"></i>
										<input type="Password" name="password" placeholder="Enter New Password" required>
									</div>
								</div>
							</div>
							
							
							 
							<div class="row">
								<div class="col-md-6 col-sm-12">
									<label>Flat / Building / Area</label>
									<div class="form-field">
										<i class="fa fa-map-marker"></i>
										<input type="text" name="address_1" placeholder="Enter your Address 1">
									</div>
								</div>
								<div class="col-md-6 col-sm-12">
									<label>Street / City</label>
									<div class="form-field">
										<i class="fa fa-map-marker"></i>
										<input type="text" name="address_2" placeholder="Enter your Address 2" >
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 col-sm-12">
									<label>Pin Code</label>
									<div class="form-field">
										<i class="fa fa-user"></i>
										<input type="text" name="postcode" placeholder="Enter your Post Code">
									</div>
								</div>
								<div class="col-md-6 col-sm-12">
									<label>State</label>
									<div class="form-field">
										<i class="fa fa-map-marker"></i>
										<input type="text" name="state" placeholder="Enter your State" required>
									</div>
								</div>
							</div>


   							<div class="row" id="otp">
								<div class="col-md-6 col-sm-12">
									<label>OTP Number</label>
									<div class="form-field">
										<i class="fa fa-key"></i>
										<input type="text" name="otp" placeholder="Enter your OTP Number" required>
									</div>
								</div>
								
								
								<div class="col-md-6 col-sm-6">
									<p> <b><a onclick="validationResend();" >Click Here RESEND OTP.</a></b> </p>
									
									
								</div>
								
							</div>
                            <p id="divSubCategory"></p>
                            
                             <div class="row" id="requestOT">
								<div class="col-md-12 col-sm-12">
									<input type="button" class="btn btn-default margin-top-10 gradiyant" onclick="validation();" value="REQUEST OTP">
								</div>
							</div>
							
							<div class="row" id="sbutton">
								<div class="col-md-12 col-sm-12">
									<input type="submit" class="btn btn-default margin-top-10 gradiyant" value="Procced to Checkout ">
								</div>
							</div>
							
                           
							 <input type="hidden" name="shipping_address" id="shipping_address" value="1" />
							         <input type="hidden" name="redirectTo" value="checkout"/> 
							
							 
							 
							 
							<%
							String status = request.getParameter("status");
							if(status!=null && !status.equals("")){
							%>
							<b> <%=status %></b> <a href="signin.jsp?redirectTo=checkout" class="btn btn-default margin-top-10 gradiyant">Login	</a>
							   
							<%} %>
							
							
						</div>
					</div>
                    
                    
                    
                    
                   
                    
                    
                    <div class="col-md-5 col-sm-12">
                    <div class="cart_description">
								<div class="table-content table-responsive mb-50 boxshadow">
						<table class="">
										<thead>
											<tr class="tabletop">
												<th width="7%" class="product-remove gradiyant"></th>
												<th width="43%" class="product-name gradiyant">Product</th>
												<th width="25%" class="product-price gradiyant gradiyant">Price</th>
												
											</tr>
										</thead>
										<tbody>
										<%
												Double subtotal=0.00, Total=0.00;
										        if(cart != null && cart.getAllCartItem().size()>0) {
										        	int i=1;
										        	
												   for(ShoppingCartItem item : cart.getAllCartItem()) {
													   i++;
													   subtotal = subtotal + item.getTotalInRuppes();
										 %>
											<tr class="cart-item">
												<td class="product-remove">
													<a href="CartActivity?vProductId=<%= item.getProduct().getProduct_id()%>&action=<%= GeneralConstants.REMOVE_FROM_CART %>" class="" title="Remove this item"><i class="fa fa-trash-o"></i></a>
												</td>
												<td class="product-name">
													<a href="#"><%=item.getProduct().getProductName() %></a>
												</td>
												<td class="product-price">
													<span class="amounte"><%=item.getProductCostInRuppes()%></span>
												</td>
												
												
											</tr>
											
											<%}} %>
											<!-- 
											<tr class="cart-item">
											
												<td class="product-name" colspan="2">
											    <input type="text" name="coupoun" id="coupoun" value="" placeholder="Enter Promo Code">
											    </td>
											   
											    <td class="product-price">
												<input type="button" class="btn btn-default margin-top-10 gradiyant"  value="Apply Promo" onclick="getDiscount();">
												</td>
												
												
											</tr>
											<p id="coupounDiv"></p>
											 -->
										</tbody>
									</table>
                                    </div>
                                    </div>
                                    
                                    
                                     <br>
<br>

                                    
                                    
                                    
					</div>
                    
                    
                    
                    
                    
                    
                    
                    
					<!-- Contact Form End -->
				</div>
			</div>
		</div>
		<!-- Contact Info End -->
</form>

  <div class="box-white">
			<div class="wrapper padding-all indbox">
				<div class="grid-list">
					<div class="row margin-none">
                    
                    
                     
         <div class="text-center">
        <h2 class="headingpage" style="line-height:30px;">QUICK STEPS TO BUY  <br>
<span>YOUR VIP NUMBER</span>
        </h2>
        </div>
		
        
						<div class="grid col-md-3 col-sm-6 col-xs-6 boxhi">
							<p><img src="assets/img/s01.png"></p>
							<h4 class="text-semibold text-space"><strong>FIND YOUR DESIRED NUMBER</strong></h4>
							<p class="line-bottom">Select your favourable mobile number. The one you like and which suits your personality. </p>

<br>

						</div>
						
                        
						<div class="grid col-md-3 col-sm-6 col-xs-6 boxhi">
							<p><img src="assets/img/s02.png"></p>
							<h4 class="text-semibold text-space"><strong>MAKE THE PAYMENT</strong></h4>
							<p class="line-bottom">Once your chosen mobile number is finalised, proceed to checkout and make the payment. </p>
 <br>

 <br>

						</div>
						
                        
						<div class="grid col-md-3 col-sm-6 col-xs-6 boxhi">
							<p><img src="assets/img/s03.png"></p>
							<h4 class="text-semibold text-space"><strong>GET THE UNIQUE PORTING CODE</strong></h4>
							<p class="line-bottom"> You will receive a Unique Porting Code (UPC) along with invoice within 24 hour on your Registered Mobile Number . </p>
                            
						</div>
						
                        
                        
						<div class="grid col-md-3 col-sm-6 col-xs-6 boxhi">
							<p><img src="assets/img/s04.png"></p>
							<h4 class="text-semibold text-space"><strong>GET YOUR SIM CARD</strong></h4>
							<p class="line-bottom">Visit any Telecom Gallery or Mobile Shop and port the number. You can get your number ported to any network, on your Name.</p>
                            
					  </div>
						
						
					</div>
				</div>
			</div>
		</div>

	<!-- Contact End -->
		
	<!-- Footer -->
	<footer id="site-footer" class="box-grey">
		<div class="wrapper">
			<!-- Footer Top -->
			<div class="footer-top">
				<div class="row margin-none">
					
					<div class="col-md-3 footer-nav">
						<h3>CONTACT US</h3>
						<nav>
							<ul>
								<li>Shop No 23, Old idea point, Main market, Police station Road, Anupgarh Distt. Sri ganganagar Rajasthan 335701</li>
								<li>Email: <a href="mailto:cs@vipnumberstore.in">cs@vipnumberstore.in</a></li>
							</ul>
						</nav>
					</div>




					<div class="col-md-3 footer-nav">
						<h3>SUPPORT</h3>
						<nav>
							<ul>
								<li><a href="contact_us.html">Contact Us</a></li>
								<li><a href="faqs.html">FAQ'S</a></li>
							</ul>
						</nav>
					</div>

					<div class="col-md-3 footer-nav">
						<h3>WE ACCEPT</h3>
						<nav>
							<ul>
								<li><a href="terms_and_condition.html">Terms &amp; conditions</a></li>
								<li><a href="privacy-policy.html">Privacy policy</a></li>
                                <li><a href="refund-policy.html">Refund Policy</a></li>
								
							</ul>
						</nav>
					</div>

					<div class="col-md-3 footer-nav">
						<h3>SOCIAL MEDIA</h3>
						<ul class="social-icons nav-default clearfix">
							<li><a href="http://facebook.com/vipnumberstore.in" class="facebook" target="_blank"><i class="fa fa-facebook"></i></a></li>
							<li><a href="https://twitter.com/vvipnumberstore" class="twitter" target="_blank"><i class="fa fa-twitter"></i></a></li>
							<li><a href="http://instagram.com/vipnumberstore" class="linkedin" target="_blank"><i class="fa fa-instagram"></i></a></li>
						</ul>
					</div>


					<!-- Footer Top Menu -->
					












                    
				</div>
			</div>
			<!-- Footer Top End -->
			
			<!-- Footer Middle -->
			<div class="footer-middle">
				<div class="row margin-none">
					<!-- Footer Middle Address -->
                    
                    <div class="col-md-6 col-sm-12 padding-none">
						<p class="text-medium text-left text-small">&copy; Vip Number Store. All Rights Reserved.</p>
					</div>
                    
                    
                    
                    
					
				</div>
			</div>
			<!-- Footer Middle End -->
			
		</div>
	</footer>
	<!-- Footer End -->
</div>
<!-- Site Container End -->



<img src="assets/img/chat.png" width="50" height="50" class="chatmob">

<div class="iconmobilebottom">
<a href="http://instagram.com/vipnumberstore" target="_blank"><img src="assets/img/mail.svg" width="45" height="45"> </a>

<a href="https://www.facebook.com/vipnumberstore.in" target="_blank"><img src="assets/img/call.svg" width="45" height="45"></a> 

<a href="whatsapp://send?phone=+91 81001 80000&amp;text=Hi!" data-action="share/whatsapp/share"><img src="assets/img/what.svg" width="45" height="45"> </a>

<a href="tel:+918100180000" data-action="share/whatsapp/share"><img src="assets/img/phone.svg" width="45" height="45"></a>
</div>






<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/owl.carousel.js"></script>
<script src="assets/js/jquery.bxslider.min.js"></script>
<script src="assets/js/jquery.matchHeight.js"></script>
<script src="assets/js/jquery.prettyPhoto.js"></script>
<script src="assets/js/jquery.countTo.js"></script>
<script src="assets/js/jquery.stellar.js"></script>
<script src="assets/js/jquery.fitvids.js"></script>
<script src="assets/js/imagesloaded.pkgd.js"></script>
<script src="assets/js/masonry.pkgd.js"></script>

<!-- Map Scripts -->
<script src="https://maps.google.com/maps/api/js?sensor=false&amp;language=en"></script>
<script src="assets/js/gmap3.min.js"></script>

<!-- Custom Scripts -->
<script src="assets/js/scripts.js"></script>
</body>

</html>