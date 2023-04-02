<!DOCTYPE html>
<html lang="en-US">

<head>

<!-- Basic Page Head -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Vip Number Store</title>
<meta name="description" content="">
<meta name="author" content="">
<meta name="keywords">

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
<body>
<!--<div class="righticon" style=""> <a href="https://www.facebook.com/vipnumberstore.in" target="_blank"><img src="assets/img/fbicon.png" width="41" height="47"></a> 

  <a href="http://instagram.com/vipnumberstore" target="_blank"><img src="assets/img/inicon.png" width="41" height="47"></a>
</div>-->

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
					
                    	<form action="#" style="float:left;">
						<input name="search" type="text" placeholder="SEARCH">
						<button type="submit" class="search-btn"><i class="fa fa-search"></i></button>
					</form>
                    
                    
                    	<a href="cart"> <div class="carticon"> <i class="fa fa-shopping-cart"></i> </div> </a>
                    
						<a href="login.html"><div class="singin">Sing In</div></a>
					
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
	
	<!-- Slider -->
	<section id="site-slider" style="border-bottom:1px solid #f23c00;">
		<div class="wrapper">
			<img src="assets/img/login.jpg" alt="Slide" class="img-full" />
		</div>
	</section>
	<!-- Slider End -->
		
		
		
		<!-- Contact Info -->
		<div class="box-white">
			<div class="wrapper padding-all">
				<div class="row">
                
                
                <div class="col-md-1 col-sm-12"> </div>
                
                
					<!-- Contact Information -->
					<div class="col-md-4 col-sm-12">
                    <img src="assets/img/loginpage.jpg" width="100%"> </div>
					<!-- Contact Information End -->
					
					<!-- Contact Form -->
					<div class="col-md-5 col-sm-12 boxshadow padding-all-20">
						<div class="data-form">
							<form action="AuthenticateLogin" method="post">
							<div class="row">
							<p><%=request.getParameter("status")==null?"":request.getParameter("status")%></p>
								<div class="col-md-12 col-sm-12 margin-bottom-10">
									<h2 class="heading_for_subtitle">Login</h2>
									<!-- <label>E-Mail</label> -->
									<div class="form-field">
										<i class="fa fa-envelope-o"></i>
										<input type="text" name="email" placeholder="Enter your Registered Mobile No / Email" required>
									</div>
								</div>
								<div class="col-md-12 col-sm-12 margin-bottom-10">
									<!-- <label>Name</label> -->
									<div class="form-field">
										<i class="fa fa-key"></i>
										<input type="password" name="password" placeholder="Enter your Password" class="margin-bottom-10" required>
										<div class="text-right" style="font-size:12px;">
										<a href="forgotpassword.html" class="margin-top-10">Forgot Password</a>  </div>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12 col-sm-12">
									<input type="submit" class="btn btn-default" value="Login">
									<input type="hidden" name="shipping_address" id="shipping_address" value="1" />
							 <input type="hidden" name="redirectTo" value="<%=request.getParameter("redirectTo")%>"/>
								</div>
							</div>
							
							</form>
						</div>
					</div>
					<!-- Contact Form End -->
                    
                    
                  <div class="col-md-1 col-sm-12">
                    </div>
                    
			  </div>
			</div>
		</div>
		<!-- Contact Info End -->



		



	</section>
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