<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="com.techgate.domain.blog"%>
<%@page import="org.springframework.util.StringUtils"%>
<%@page import="java.util.Map"%>
<%@page import="com.techgate.cart.ShoppingCartItem"%>
<%@page import="com.techgate.domain.CustomerAddressDetails"%>
<%@page import="com.techgate.util.GeneralConstants"%>
<%@page import="com.techgate.domain.Category"%>
<%@page import="com.techgate.domain.CustomProduct"%>
<%@page import="java.util.List"%>
<%@page import="com.techgate.util.GeneralFunction"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.techgate.cart.ShoppingCart"%>  
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


<link rel="stylesheet" href="assets/css/libs/animate.css">
<!--
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/v4-shims.css">

-->
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
<!--  New Shared by  -->


<!-- End Facebook Pixel Code -->
<!--<link href="https://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700,900&display=swap" rel="stylesheet">-->

</head>
<%
               session.setAttribute("currency","INR");
				ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
				String currency = (String) session.getAttribute("currency");
				ClassPathXmlApplicationContext context=(ClassPathXmlApplicationContext) application.getAttribute("context");
				GeneralFunction generfunc = (GeneralFunction) context.getBean("generalFunction");

				List<CustomProduct> products = generfunc.getSoldProductList();
				%>
<body>
<!--<div class="righticon" style="">

 <a href="https://www.facebook.com/vipnumberstore.in" target="_blank"><img src="assets/img/fbicon.png" width="41" height="47"></a> 

  <a href="http://instagram.com/vipnumberstore" target="_blank"><img src="assets/img/inicon.png" width="41" height="47"></a>
  
  <a href="whatsapp://send?phone=+919530000007&amp;text=Hi!" data-action="share/whatsapp/share"><img src="assets/img/whicon.png" width="41" height="47"></a>

</div>-->

<!-- Site Loader -->
<!--<div class="site-loader"><img src="assets/img/loader.gif" alt="Loading"></div>-->
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
                
                
					<a href="cart"> <div class="carticon mobiledisnone"> <i class="fa fa-shopping-cart">  </i> <b><%if(cart!=null){%><%=cart.getAllCartItem().size() %><%} else {%>0<%} %></b> </div> </a>
                    	
                        <% if(session.getAttribute("custId")==null){%>
                        	<a href="login.html"><div class="singin2">Sign In</div></a>
					    <%} %>
                             <a href="vendorLogin"><div class="singin">Vendor Login</div></a>
                </div>
                
				
				<!-- Header Menu -->
				<nav class="header-menu">
					<ul class="nav-default clearfix">
                    <img src="assets/img/logo.png" class="menulogo">
						<li class="active"><a href="index">HOME</a></li>
                        <li><a href="VIPNumbers">VIP NUMBERS</a></li>
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
			<img src="assets/img/SoldOut.jpg" alt="Slide" class="img-full" />
		</div>
	</section>
	<!-- Slider End -->
		
	
    
    
    
    
    
	<!-- Services -->
	<section id="services" class="box-grey mobileovhi">
		<div class="wrapper padding-all overflowhi">
        
        
           <div class="">
        
        
        <div class="overflowhi">
        
        
           <%
				                                
								             String name="";
								                double price=0.0, discount=0.0, disprice=0.0,rs=0;
											     for(CustomProduct product : products) {
											    	 
									         %>
        	<div class="numberbox2">
            
            	<div class="price cod">
                
                
                <div class="price2right" style="width:50%"> &#8377; <%=product.getRateInRupee() %></div>
                
                
                </div>
            	
                <h1> <%=product.getProductName()%> </h1>
                
                <p> Sum total: <%=product.getLiters() %>=<b><%=product.getTrap() %></b> </p>
            
       	    <img src="assets/img/soldoutfile.png" width="76" height="64" style="float:right; margin-right:10px; margin-top:-25px;"> 
       	    
       	    </div>
        <%} %>
        
        
        
        	
            
           
            
            </div>
            
            
        
        
       		 </div>
             
            
	  </div>
	</section>
	<!-- Services End -->
	
    
    
    
        
        
        
        
        
        
        
        
        
        
  <style>
  .grid-list.grid-vertical.with-icons .grid .fa:before{
	      color: #ff6400;
  }
  
    .grid-list.grid-vertical .text-semibold {
    font-weight: 800;
	color: #ff6400;
}

.text-box h2  {
   line-height: 41px !important;
}
  
  </style>      
    
    
    
	
		
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


<script src="assets/js/dist/wow.js"></script>
  <script>
    wow = new WOW(
      {
        animateClass: 'animated',
        offset:       100,
        callback:     function(box) {
          console.log("WOW: animating <" + box.tagName.toLowerCase() + ">")
        }
      }
    );
    wow.init();
    document.getElementById('moar').onclick = function() {
      var section = document.createElement('section');
      section.className = 'section--purple wow fadeInDown';
      this.parentNode.insertBefore(section, this);
    };
  </script>


<!-- Custom Scripts -->
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


<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5da2bc55f82523213dc6ff29/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->

</body>

</html>