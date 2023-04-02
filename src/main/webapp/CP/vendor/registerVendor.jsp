<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<html lang="en-US">


<head>

<!-- Basic Page Head -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>VIP Number | Fancy Number | Cloud Telephony in India | VIP NUMBER STORE</title>
<meta name="description" content="One Page &amp; Multi Page Responsive HTML5 Template">
<meta name="author" content="Loco Theme - locotheme.com">
<meta name="keywords" content="one page, multi page, multipurpose, clean, modern, corporate, company, business, agency, bootstrap, responsive, fullscreen, css3, html5">

<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Favicons -->
<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
<link rel="stylesheet" type="text/css" href="fonts/stylesheet.css">

<!-- Css -->
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/jquery.bxslider.css">
<link rel="stylesheet" type="text/css" href="assets/css/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="assets/css/owl.theme.css">
<link rel="stylesheet" type="text/css" href="assets/css/prettyPhoto.css">
<link rel="stylesheet" type="text/css" href="assets/css/style.css">
<link rel="stylesheet" type="text/css" href="assets/css/responsive.css">


</head>
<body>

<!--<div style="" class="search">
    <form action="">
        <input type="search">
        <i class="fa fa-search"></i>
    </form>
</div>-->



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
				<div class="header-logo displaynone"><a href="index"><img src="assets/img/logo.png" alt=""></a></div>
				<!-- Header Logo End -->
				
				
				<!-- Header Menu -->
				<nav class="header-menu">
					<div class="menutop">
					  	<ul class="nav-default menutopright clearfix mobilenone">
				            <li class="active"> 
				            	<a href="scheduledemo.html" class="vender">Schedule Demo</a>
					        </li>
					        <li class=""><a href="http://voice.numberwale.com/#/login" class="vender" target="_blank">IVR Login</a></li>
				            <li class=""><a href="login.html" class="vender">Sign in</a></li>
				            <li class=""><a href="vendorlogin.html" class="vender">Vendor login</a></li>
				            <li class=""><a href="cart"><i class="fa fa-shopping-cart"></i></a></li>
				        </ul>
					</div>

					<ul class="nav-default clearfix">
                    <li class="logonone text-center"><img src="assets/img/logo.png" alt="" style="width:50%;"></li>
						<li class="active"><a href="index">Home</a></li>
                                                
                        <li><a href="PremiumNumbers"> Premium Numbers </a></li>
                        
                        
                        <li class=""><a href="phonewords.html">Phone Words</a></li>
                        
						<li><a href="smartivr.html">Smart IVR</a></li></li>
                        
						<li><a href="contactus.html"> Contact Us </a></li>
                        
                        <!-- <li><a href="login.html"> Sign In</a></li> -->
                        
                        <!--<li><a href="#"> My Account </a>
							<ul>
								<li><a href="contactus.html">Your Orders</a></li>
								<li><a href="faqs.html">Logout</a></li>
							</ul>
						</li>-->
                        
                        <!-- <li class=""><a href="cart"><i class="fa fa-shopping-cart"></i></a></li>
                        
                        <li class=""><a href="vendorlogin.html" class="vender">Vendor login</a></li> -->
                     </ul>
				</nav>
				<!-- Header Menu End -->
                
                   
				
				<!-- Header Nav -->
				<div class="header-nav"><i class="fa fa-bars fa-2x"></i></div>
				<!-- Header Nav End -->
                
           
            
            
            
                
			</div>
		</div>
	</header>
	<!-- Header End -->
	
	<!-- Blog -->
	<section id="blog">
		<!-- Section Header -->
		<div class="box-white innerpageback">
			<div class="wrapper padding-all innerpage">
				<div class="section-header inline">
					<h1>Thank You</h1>
				</div>
			</div>
		</div>
		<!-- Section Header End -->
		
		<!-- Section Content -->
		<div class="box-grey">
			<div class="wrapper padding-all">
				<div class="row">
					<!-- Project Image -->
					<div class="col-md-2 col-sm-12">
						
					</div>
					<!-- Project Image End -->
					
					<!-- Project Description -->
					
					<!-- Project Description End -->
                    
                    
               	  <div class="col-md-8 col-sm-12 box-radius">
                        <div class="row">
                            <div class="col-md-6 col-sm-12">
                            <div class="row">
                            <img src="assets/img/login.png" width="100%" height="" class="bor-left"> 
                            </div>
                            </div>
                            
                        
                        
						<div class="data-form col-md-6 col-sm-12 padding-all30">
                        <h2>Thank YOu</h2><hr>
                            
                             <%
	 try{
		 
		PreparedStatement prepare = null;
		Connection con=new DBConnection().getCon();
		PreparedStatement prepare1=con.prepareStatement("select loginId from vendorDetails where loginId='"+request.getParameter("email")+"'");
		ResultSet rs = prepare1.executeQuery();
		if(rs.next()){
			%>
			<div class="alert alert-error">
         <button type="button" class="close" data-dismiss="alert">�</button>
         <strong>Vendor Login Already Registered....</strong>
        </div>
			
			<%
		}else{
			prepare=con.prepareStatement("insert into vendorDetails values(0, ?, ?, ?, ?, ?, ?, ?, ? ,curDate(),? ,?, ?, ?, ?, ?, ?, ?, ?, ?)");
			prepare.setString(1,request.getParameter("email"));
			prepare.setString(2,request.getParameter("password"));
			prepare.setString(3,request.getParameter("name"));
			prepare.setString(4,request.getParameter("address"));
			prepare.setString(5,request.getParameter("address2"));
			prepare.setString(6,request.getParameter("tel"));
			prepare.setString(7,request.getParameter("website"));
			prepare.setString(8,"N");
			prepare.setString(9,request.getParameter("paytmNo"));
			prepare.setString(10,request.getParameter("GPayNO"));
			prepare.setString(11,"Yes");
			prepare.setString(12,"");
			prepare.setString(13,"");
			prepare.setString(14,"");
			prepare.setString(15,"");
			prepare.setString(16,"");
			prepare.setString(17,"");
			prepare.setString(18,"");
			
			
			int row=prepare.executeUpdate();
	 %>


               Thank you for registering as a vendor. One of our colleagues will get back to you shortly.
                            <br>
		 <%}}
		
		catch(Exception e){%>
	           

                Error While Processing Data. Please Try Again.
              <br>
        <%
        } %>
							
<br>


Have a great day!
                            
						</div>
					</div>
                    </div>
				</div>
			</div>
		</div>
		<!-- Section Content End -->
	</section>
	<!-- Blog End -->
		
	
		
	<!-- Footer -->
	<footer id="site-footer" class="box-grey">
		<div class="wrapper">
			<!-- Footer Top -->
			<div class="footer-top">
				<div class="row margin-none">
					
					
					
                    
                    <!-- <div class="col-md-8 col-sm-12 padding-none">
                    	<nav class="top-menu clearfix">
							<ul class="nav-default pull-right clearfix">
								<li><a href="terms-conditions.html">Terms & conditions</a></li>
								<li><a href="privacy-policy.html">Privacy policy</a></li>
								<li><a href="order-policy.html">Order policy</a></li>
								<li><a href="refund-shipping.html">Refund and Shipping</a></li>
							</ul>
						</nav>
                    
						<ul class="social-icons nav-default pull-right clearfix">
                       	 <li><a href="https://www.youtube.com/channel/UCYYOGkiZ14I6yGr2NjhGYzg/featured" class="youtube" target="_blank"><i class="fa fa-youtube"></i></a></li>
							<li><a href="https://www.facebook.com/NumberWale/" class="facebook" target="_blank"><i class="fa fa-facebook"></i></a></li>
							<li><a href="https://twitter.com/VIP NUMBER STORE" class="twitter" target="_blank"><i class="fa fa-twitter"></i></a></li>
							<li><a href="https://www.linkedin.com/company/numberwale/" class="linkedin" target="_blank"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="https://www.linkedin.com/company/numberwale/" class="instagram" target="_blank"><i class="fa fa-instagram"></i></a></li>
						</ul>
					</div> -->




					<div class="col-md-3 footer-nav">
						<h3>QUICK LINKS</h3>
						<nav>
							<ul>
								<li><a href="#">Career</a></li>
								<li><a href="#">Testimonial</a></li>
								<li><a href="videogallery.html">Video Gallery</a></li>
								<li><a href="imagegallery.html">Image Gallery</a></li>
								
							</ul>
						</nav>
					</div>

					<div class="col-md-3 footer-nav">
						<h3>SUPPORT</h3>
						<nav>
							<ul>
								<li><a href="contactus.html">Contact Us</a></li>
								<li><a href="faqs.html">FAQ'S</a></li>
                                <li><a href="whyus.html">Why us?</a></li>
							</ul>
						</nav>
					</div>

					<div class="col-md-3 footer-nav">
						<h3>WE ACCEPT</h3>
						<nav>
							<ul>
								<li><a href="#">Terms & conditions</a></li>
								<li><a href="#">Privacy policy</a></li>
								<li><a href="#">Order policy</a></li>
								<li><a href="#">Refund and Shipping</a></li>
							</ul>
						</nav>
					</div>

					<div class="col-md-3 footer-nav">
						<h3>SOCIAL MEDIA</h3>
						<ul class="social-icons nav-default clearfix">
                       	 <li><a href="https://www.youtube.com/channel/UCYYOGkiZ14I6yGr2NjhGYzg/featured" class="youtube" target="_blank"><i class="fa fa-youtube"></i></a></li>
							<li><a href="https://www.facebook.com/NumberWale/" class="facebook" target="_blank"><i class="fa fa-facebook"></i></a></li>
							<li><a href="https://twitter.com/VIP NUMBER STORE" class="twitter" target="_blank"><i class="fa fa-twitter"></i></a></li>
							<li><a href="https://www.linkedin.com/company/numberwale/" class="linkedin" target="_blank"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="https://www.linkedin.com/company/numberwale/" class="instagram" target="_blank"><i class="fa fa-instagram"></i></a></li>
						</ul>
					</div>


					<!-- Footer Top Menu -->
					<div class="col-md-4 col-sm-12 padding-none clearfix">
						
						<!-- Footer Top Newsletter -->
						<div class="top-newsletter pull-left">
							<form>
								<input type="text" name="newsletter" placeholder="Please enter your email address">
								<button type="button"><i class="fa fa-paper-plane"></i></button>
							</form>
						</div>
						<!-- Footer Top Newsletter End -->
					</div>












                    
				</div>
			</div>
			<!-- Footer Top End -->
			
			<!-- Footer Middle -->
			<div class="footer-middle">
				<div class="row margin-none">
					<!-- Footer Middle Address -->
                    
                    <div class="col-md-6 col-sm-12 padding-none">
						<p class="text-medium text-small">� VIP NUMBER STORE.com. All Rights Reserved.</p>
					</div>
                    
                    <div class="col-md-6 col-sm-12 padding-none">
						<p class="text-medium text-right text-small">Design By : <a href="https://www.techgate.in/" target="_blank">Techgate</a></p>
					</div>
                    
                    
					
				</div>
			</div>
			<!-- Footer Middle End -->
			
		</div>
	</footer>
	<!-- Footer End -->
</div>
<!-- Site Container End -->

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



<!-- Custom Scripts -->
<script src="assets/js/scripts.js"></script>
</body>


</html>