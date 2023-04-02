<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@page import="com.techgate.domain.blog" %>
<%@page import="org.springframework.util.StringUtils" %>
<%@page import="java.util.Map" %>
<%@page import="com.techgate.cart.ShoppingCartItem" %>
<%@page import="com.techgate.domain.CustomerAddressDetails" %>
<%@page import="com.techgate.util.GeneralConstants" %>
<%@page import="com.techgate.domain.Category" %>
<%@page import="com.techgate.domain.CustomProduct" %>
<%@page import="java.util.List" %>
<%@page import="com.techgate.util.GeneralFunction" %>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@page import="com.techgate.cart.ShoppingCart" %>
<!DOCTYPE html>
<html lang="en-US">
<head>

    <!-- Basic Page Head -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>VIP Mobile Number | Fancy Number | VIP Mobile Number | Vip Number Store</title>
    <meta name="description"
          content="VIP NUMBER STORE is known across India as a company that provides valuable and high quality services since 2010.">
    <meta name="author" content="VIP NUMBER STORE - vipnumberstore.in">
    <meta name="keywords"
          content="vip number, vanity number, buy vip mobile number online, vip mobile India ,fancy number, fancy mobile number">


    <!-- Mobile Meta -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- Favicons -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
    <link rel="apple-touch-icon" href="assets/img/logo.png">

    <!-- Css -->
    <link rel="stylesheet" type="text/css" href="assets/css/jquery-ui.css">
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

        function gtag() {
            dataLayer.push(arguments);
        }

        gtag('js', new Date());

        gtag('config', 'UA-150357017-1');
    </script>

    <!-- Facebook Pixel Code -->
    <script>
        !function (f, b, e, v, n, t, s) {
            if (f.fbq) return;
            n = f.fbq = function () {
                n.callMethod ?
                    n.callMethod.apply(n, arguments) : n.queue.push(arguments)
            };
            if (!f._fbq) f._fbq = n;
            n.push = n;
            n.loaded = !0;
            n.version = '2.0';
            n.queue = [];
            t = b.createElement(e);
            t.async = !0;
            t.src = v;
            s = b.getElementsByTagName(e)[0];
            s.parentNode.insertBefore(t, s)
        }(window, document, 'script',
            'https://connect.facebook.net/en_US/fbevents.js');
        fbq('init', '2409116105970793');
        fbq('track', 'PageView');
    </script>
</head>
<noscript>
    <img height="1" width="1"
         src="https://www.facebook.com/tr?id=2409116105970793&ev=PageView
&noscript=1"/>
</noscript>
<!--  New Shared by  -->


<!-- End Facebook Pixel Code -->
<!--<link href="https://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700,900&display=swap" rel="stylesheet">-->


<%
    session.setAttribute("currency", "INR");
    ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
    String currency = (String) session.getAttribute("currency");
    ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
    GeneralFunction generfunc = (GeneralFunction) context.getBean("generalFunction");

    List<CustomProduct> products = generfunc.getProductList();
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
            <div class="wrapper clearfix" >

                <div class="header-logo"><a href="index"><img src="assets/img/logo.png" alt="" ></a></div>
                <!-- Header Logo End -->

                <div class="header-search">


                    <a href="cart">
                        <div class="carticon mobiledisnone"><i class="fa fa-shopping-cart"> </i>
                            <b><%if (cart != null) {%><%=cart.getAllCartItem().size() %><%} else {%>0<%} %></b></div>
                    </a>

                    <% if (session.getAttribute("custId") == null) {%>
                    <a href="login.html">
                        <div class="singin2">Sign In</div>
                    </a>
                    <%} %>
                    <a href="vendorLogin">
                        <div class="singin">Vendor Login</div>
                    </a>
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

                        <% if (session.getAttribute("custId") != null) { %>
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

                <a href="cart">
                    <div class="carticon mobiledisblock"><i class="fa fa-shopping-cart"> </i>
                        <b><%if (cart != null) {%><%=cart.getAllCartItem().size() %><%} else {%>0<%} %></b></div>
                </a>
                <!-- Header Nav End -->
            </div>
        </div>
    </header>
    <!-- Header End -->

    <!-- Slider -->
    <section id="site-slider">
        <div class="wrapper">
            <ul class="bxslider">


                <!-- Slider Item -->
                <li>
                    <div class="slide-image"><img src="assets/img/slide-0.jpg" alt="Slide" class="img-full"/></div>

                </li>
                <!-- Slider Item End -->

                <!-- Slider Item -->
                <li>
                    <div class="slide-image"><img src="assets/img/slide-1.jpg" alt="Slide" class="img-full"/></div>

                </li>
                <!-- Slider Item End -->

                <!-- Slider Item -->
                <li>
                    <div class="slide-image"><img src="assets/img/slide-2.jpg" alt="Slide" class="img-full"/></div>

                </li>

                <!-- Slider Item -->
                <%--<li>
                    <div class="slide-image"><img src="assets/img/inner-banner.jpg.jpg" alt="Slide" class="img-full"/></div>

                </li>--%>


                <!-- Slider Item End -->
                <!-- Slider Item 
				<li>
					<div class="slide-image"><img src="assets/img/slide-3.gif" alt="Slide" class="img-full" /></div>
					
				</li>
				<!-- Slider Item End -->
            </ul>
        </div>
    </section>
    <!-- Slider End -->

    <!-- Services -->

    <section id="services" class="box-grey mobileovhi" style="">
        <div class="wrapper padding-top-bottom overflowhi">
            <div class="col-sm-12">
                <aside class="blog-search" style="margin-bottom:0px;">
                    <form action="searchNumbers" method="post" id="searchNumbersFormId">
                        <div class="col-sm-3" style="padding: 1px">
                            <select name="saerchCriteria" id="saerchCriteriaId" style="width: 100%; height: 50px; border: 1px solid #e1e1df; font-family: 'Roboto', sans-serif; outline: 0;">
                                <option value="anywhere">Any Where</option>
                                <option value="startwith">Start With</option>
                                <option value="endwith">End With</option>
                            </select>
                        </div>
                        <div class="col-sm-9" style="padding: 1px">
                            <input name="search" type="text" placeholder="Search Number" style="height:50px" id="searchNumbersSearchId">
                        </div>
                        <div class="col-sm-0" style="padding: 1px">
                            <button type="submit" class="search-btn searchicon" style=""><i class="fa fa-search"></i> Search</button>
                        </div>
                    </form>
                </aside>
            </div>
        </div>
    </section>

<section id="services" class="box-grey" style="">
    <div class="wrapper padding-top-bottom padding-top-bottom2 overflowhi">
        <div class="text-center">
            <h2 class="headingpage" style="line-height:25px;">Launches <br>
                <span style="font-size:25px;">NEW NUMBERS</span>
            </h2>
        </div>

        <div class="col-sm-12">
            <div class="team-horizontal" id="owl-team">

                <%
                    int c = 0;
                    String name = "";
                    double price = 0.0, discount = 0.0, disprice = 0.0, rs = 0;
                    for (CustomProduct product : products) {
                        if (c == 6) {
                            break;
                        }
                        if (product.getType().contains("New")) {

                            c++;
                %>
                <div class="">
                    <div class="numberbox">

                        <div class="price">
                            <%
                                price = 0.0;
                                discount = 0.0;
                                disprice = 0.0;
                                rs = 0;
                                if (product.getDiscount() > 0) {
                                    discount = product.getDiscount();
                                    price = product.getRateInRupee();

                                    disprice = price * discount / 100;

                                    price = price - disprice;
                            %>

                            <del>&#8377; <%=product.getRateInRupee() %>
                            </del>
                            <b>&#8377; <%=price %>
                            </b>
                            <%} else { %>
                            <b>&#8377; <%=product.getRateInRupee() %>
                            </b>
                            <%} %>


                        </div>

                        <h1><%=product.getProductName()%>
                        </h1>

                        <p> Sum total: <%=product.getLiters() %>=<b><%=product.getTrap() %>
                        </b></p>

                        <a href="CartActivity?vProductId=<%= product.getProduct_id()%>&vProductName=<%= product.getNumber()%>&vImgLoc=<%= product.getImg_loc()%>&action=<%= GeneralConstants.ADD_TO_CART %>">
                            <div class="booknow"> BUY NOW</div>
                        </a>

                        <a href="productDetails?id=<%=product.getProduct_id()%>" class="buttonleft">
                            <div class="booknow">View details</div>
                        </a>

                    </div>
                </div>

                <%
                        }
                    }
                %>


            </div>
        </div>

    </div>
</section>


<section id="services" class="box-grey">
    <div class="wrapper padding-top-bottom overflowhi">
        <div class="text-center">
            <h2 class="headingpage" style="line-height:25px;">Get Your <br>
                <span style="font-size:25px;">VIP NUMBERS</span>
            </h2>
        </div>


        <!--<div class="col-md-4 col-sm-12">
          <img src="assets/img/mobilevip.png" width="" height="" class="mobileimag"> </div>-->


        <div class="col-sm-12">

            <div class="mobileovhi">
                <%
                    c = 0;
                    name = "";
                    price = 0.0;
                    discount = 0.0;
                    disprice = 0.0;
                    rs = 0;
                    for (CustomProduct product : products) {
                        if (c == 6) {
                            break;
                        }
                        if (product.getType().contains("FAVORITES")) {

                            c++;
                %>

                <div class="numberbox">

                    <div class="price">
                        <%
                            price = 0.0;
                            discount = 0.0;
                            disprice = 0.0;
                            rs = 0;
                            if (product.getDiscount() > 0) {
                                discount = product.getDiscount();
                                price = product.getRateInRupee();

                                disprice = price * discount / 100;

                                price = price - disprice;
                        %>

                        <del>&#8377; <%=product.getRateInRupee() %>
                        </del>
                        <b>&#8377; <%=price %>
                        </b>
                        <%} else { %>
                        <b>&#8377; <%=product.getRateInRupee() %>
                        </b>
                        <%} %>


                    </div>

                    <h1><%=product.getProductName()%>
                    </h1>

                    <p> Sum total: <%=product.getLiters() %>=<b><%=product.getTrap() %>
                    </b></p><b>

                    <a href="CartActivity?vProductId=<%= product.getProduct_id()%>&vProductName=<%= product.getNumber()%>&vImgLoc=<%= product.getImg_loc()%>&action=<%= GeneralConstants.ADD_TO_CART %>">
                        <div class="booknow"> BUY NOW</div>
                    </a>

                    <a class="buttonleft" href="productDetails?id=<%=product.getProduct_id()%>">
                        <div class="booknow">View details</div>
                    </a>

                </b></div>
                <b>

                    <%
                            }
                        }
                    %>

                </b></div>
            <b>

                <div class="text-center">
                    <div class="col-sm-12">
                        <a href="VIPNumbers" class="btn btn-default wi100 gradiyant margin-top-10 "><i
                                class="fa fa-pencil-square-o"></i> MORE NUMBER</a>
                    </div>
                </div>

            </b></div>


    </div>
</section>
<b>
    <!-- Services End -->


    <div class="box-white text-box qstb">
        <div class="wrapper padding-top-bottom">
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <h2 class="headingpage" style="line-height:30px;">QUICK STEPS TO BUY <br>
                        <span>YOUR VIP NUMBER</span>
                    </h2>
                    <!-- <p><img src="assets/img/banner.jpg" alt="Services" class="img-full  wow bounceIn" data-wow-duration="1s"></p> -->
                    <p>
                        <iframe width="100%" height="315" src="https://www.youtube.com/embed/9kV-wiGKs3Y"
                                frameborder="0"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                allowfullscreen></iframe>
                    </p>
                </div>
                <div class="col-md-6 col-sm-12">
                    <div class="grid-list grid-vertical with-icons">
                        <div class="row margin-none">
                            <!-- Grid Col -->
                            <div class="grid col-md-12 col-sm-12 wow fadeInRight" data-wow-duration="2s">
                                <i class="fa fa-eye fa-4x"></i>
                                <h4 class="text-semibold text-space">FIND YOUR DESIRED NUMBER</h4>
                                <p class="line-bottom">Select your favourable mobile number. The one you like and which
                                    suits your personality.</p>
                            </div>
                            <!-- Grid Col End-->

                            <!-- Grid Col -->
                            <div class="grid col-md-12 col-sm-12 wow fadeInRight" data-wow-duration="4s">
                                <i class="fa fa-money fa-4x"></i>
                                <h4 class="text-semibold text-space">MAKE THE PAYMENT</h4>
                                <p class="line-bottom">Once your chosen mobile number is finalised, proceed to checkout
                                    and make the payment.
                                </p>
                            </div>
                            <!-- Grid Col End-->

                            <!-- Grid Col -->
                            <div class="grid col-md-12 col-sm-12 wow fadeInRight" data-wow-duration="6s">
                                <i class="fa fa-qrcode fa-4x"></i>
                                <h4 class="text-semibold text-space">GET THE UNIQUE PORTING CODE</h4>
                                <p class="line-bottom">You will receive a Unique Porting Code (UPC) along with invoice
                                    within 24 hour on your Registered Mobile Number.</p>
                            </div>
                            <!-- Grid Col End-->

                            <!-- Grid Col -->
                            <div class="grid col-md-12 col-sm-12 wow fadeInRight" data-wow-duration="8s">
                                <i class="fa top50"> <img src="assets/img/sim.jpg" width="119" height="66"></i>
                                <h4 class="text-semibold text-space">GET YOUR SIM CARD</h4>
                                <p class="line-bottom">Visit any Telecom Gallery or Mobile Shop and port the number. You
                                    can get your number ported to any network, on your Name. </p>
                            </div>
                            <!-- Grid Col End-->


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Works -->

    <section id="works" class="box-grey">
        <img src="assets/img/index-banner.gif" width="100%" height="">
    </section>

    <!-- Works End -->


    <section id="services" class="box-grey">
        <div class="wrapper padding-top-bottom overflowhi">


            <div class="text-center">
                <h2 class="headingpage" style="line-height:25px;">Get Your <br>
                    <span style="font-size:25px;">Dream Numbers</span>
                </h2>
            </div>


            <div class="col-sm-12">


                <div class="overflowhi">

                    <%
                        c = 0;
                        for (CustomProduct product : products) {
                            if (c == 6) {
                                break;
                            }
                            if (product.getType().contains("Featured")) {

                                c++;
                    %>

                    <div class="numberbox">

                        <div class="price"><%
                            price = 0.0;
                            discount = 0.0;
                            disprice = 0.0;
                            rs = 0;
                            if (product.getDiscount() > 0) {
                                discount = product.getDiscount();
                                price = product.getRateInRupee();

                                disprice = price * discount / 100;

                                price = price - disprice;
                        %>

                            <del>&#8377; <%=product.getRateInRupee() %>
                            </del>
                            <b>&#8377; <%=price %>
                            </b>
                            <%} else { %>
                            <b>&#8377; <%=product.getRateInRupee() %>
                            </b>
                            <%} %></div>

                        <h1><%=product.getProductName()%>
                        </h1>

                        <p> Sum total: <%=product.getLiters() %>=<b><%=product.getTrap() %>
                        </b></p><b>

                        <a href="CartActivity?vProductId=<%= product.getProduct_id()%>&vProductName=<%= product.getNumber()%>&vImgLoc=<%= product.getImg_loc()%>&action=<%= GeneralConstants.ADD_TO_CART %>">
                            <div class="booknow"> BUY NOW</div>
                        </a>

                        <a class="buttonleft" href="productDetails?id=<%=product.getProduct_id()%>">
                            <div class="booknow">View details</div>
                        </a>

                    </b></div>
                    <b>


                        <%
                                }
                            }
                        %>

                    </b></div>
                <b>


                    <div class="text-center">
                        <div class="col-sm-12">
                            <a href="VIPNumbers" class="btn btn-default wi100 gradiyant margin-top-10"><i
                                    class="fa fa-pencil-square-o"></i> MORE NUMBER</a>
                        </div>
                    </div>


                </b></div>

        </div>
    </section>
    <b>


        <section id="customers" class="box-white padding-top-bottom">
            <div class="wrapper">
                <div class="row margin-none col-half">
                    <div class="text-center">
                        <h2 class="headingpage" style="line-height:25px;">CUSTOMIZE <br>
                            <span style="font-size:25px;">YOUR NUMBERS</span>
                        </h2>

                    </div>


                    <div class="col-sm-12">
                        <div class="team-horizontal" id="cn">

                            <div class="team">
                                <a href="contact_us.html">
                                    <img src="assets/img/cn01.png" class="img-responsive">
                                </a>
                            </div>


                            <div class="team">
                                <a href="contact_us.html">
                                    <img src="assets/img/cn02.png" class="img-responsive">
                                </a>
                            </div>


                            <div class="team">
                                <a href="contact_us.html">
                                    <img src="assets/img/cn03.png" class="img-responsive">
                                </a>
                            </div>


                            <div class="team">
                                <a href="contact_us.html">
                                    <img src="assets/img/cn04.png" class="img-responsive">
                                </a>
                            </div>


                            <div class="team">
                                <a href="contact_us.html">
                                    <img src="assets/img/cn05.png" class="img-responsive">
                                </a>
                            </div>


                        </div>
                    </div>


                </div>
            </div>
        </section>


        <!-- Customers -->
        <section id="customers" class="box-white">
            <div class="wrapper">
                <div class="row margin-none col-half">
                    <!-- Clients -->

                    <!-- Clients End -->

                    <!-- Testimonials
                    <div class="col-md-12 col-sm-12 half padding-all center">


                          <div class="text-center">
            <h2 class="headingpage">CUSTOMER TESTIMONIALS
            </h2>
            </div>


                        <div class="testimonials-horizontal" id="owl-testimonials">
                            <div class="item">
                                <div class="item-image circle"><img src="assets/img/team-1.png" alt="Name" class="img-full"></div>
                                <div class="item-comment">"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et eros et sapien bibendum porta. Sed vel enim leo.<br>
     Maecenas porttitor ipsum ut est mattis, at dignissim elit scelerisque."</div>
                                <div class="item-name"><b>Marilyn Suttle</b> / Ville Corp.</div>
                            </div>
                            <div class="item">
                                <div class="item-image circle"><img src="assets/img/team-2.png" alt="Name" class="img-full"></div>
                                <div class="item-comment">"Aenean aliquet tempus mi. Nulla ac eros et justo scelerisque faucibus. Cras eget consectetur eros, eget fermentum lorem."</div>
                                <div class="item-name"><b>Jack Mason</b> / Demint Corp.</div>
                            </div>
                            <div class="item">
                                <div class="item-image circle"><img src="assets/img/team-3.png" alt="Name" class="img-full"></div>
                                <div class="item-comment">"Cras fringilla, ipsum sed tempor tempus, nisl orci laoreet mauris, eget faucibus ligula nunc et diam. Suspendisse non augue ligula."</div>
                                <div class="item-name"><b>Michael Feldstein</b> / Asviate Corp.</div>
                            </div>
                        </div>

                    </div>
                    <!-- Testimonials End -->
                </div>
            </div>
        </section>
        <!-- Customers End -->


        <section id="customers" class="box-yellow">
            <div class="wrapper">
                <div class="row margin-none col-half">
                    <!-- Clients -->

                    <!-- Clients End -->

                    <!-- Testimonials -->
                    <div class="col-md-12 col-sm-12 half padding-top-bottom center">
                        <!-- Section Header -->

                        <div class="text-center">
                            <h2 class="headingpage" style="color:#FFF">Testimonial</h2>
                        </div>

                        <!-- Section Header End -->

                        <!-- Section Content -->
                        <div class="testimonials-horizontal" id="owl-testimonials">
                            <div class="item">

                                <div class="item-name"><b>Ankit Gupta Kanpur</b></div>
                                <div class="item-comment">"I find this site very good value for money.Highly
                                    recommended.You will get N Number of option and even the prices are Good"
                                </div>


                            </div>


                            <div class="item">

                                <div class="item-name"><b>Saurabh Chaudhary Baghpat, UP</b></div>
                                <div class="item-comment">"Very good service, I appreciate and recommend to trust this
                                    organisation, I am from Baghpat, UP recently buy good mobile number, worth for
                                    money.."
                                </div>


                            </div>


                            <div class="item">

                                <div class="item-name"><b>Sagar Kewlani Raipur, Chhattisgarh</b></div>
                                <div class="item-comment">"Amazing variety of numbers to choose from. Prices are also
                                    very reasonable! Worth the money"
                                </div>


                            </div>

                            <div class="item">

                                <div class="item-name"><b>Sachin Kumar Delhi</b></div>
                                <div class="item-comment">"There is a variety of numbers to choose from. Good experience
                                    overall including staff and everything else. Would recommend for sure!!"
                                </div>


                            </div>


                        </div>
                        <!-- Section Content End -->
                    </div>
                    <!-- Testimonials End -->
                </div>
            </div>
        </section>


        <footer id="site-footer" class="box-grey">
            <div class="wrapper">
                <!-- Footer Top -->
                <div class="footer-top">
                    <div class="row margin-none">

                        <div class="col-md-3 footer-nav">
                            <h3>CONTACT US</h3>
                            <nav>
                                <ul>
                                    <li>Shop No 23, Old idea point, Main market, Police station Road, Anupgarh Distt.
                                        Sri ganganagar Rajasthan 335701
                                    </li>
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
                                <li><a href="http://facebook.com/vipnumberstore.in" class="facebook" target="_blank"><i
                                        class="fa fa-facebook"></i></a></li>
                                <li><a href="https://twitter.com/vvipnumberstore" class="twitter" target="_blank"><i
                                        class="fa fa-twitter"></i></a></li>
                                <li><a href="http://instagram.com/vipnumberstore" class="linkedin" target="_blank"><i
                                        class="fa fa-instagram"></i></a></li>
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
                            <p class="text-medium text-left text-small">&copy; Vip Number Store. All Rights
                                Reserved.</p>
                        </div>


                    </div>
                </div>
                <!-- Footer Middle End -->

            </div>
        </footer>


    </b></b></div><b><b>
    <!-- Site Container End -->


    <img src="assets/img/chat.png" width="50" height="50" class="chatmob">

    <div class="iconmobilebottom">
        <a href="http://instagram.com/vipnumberstore" target="_blank"><img src="assets/img/mail.svg" width="45"
                                                                           height="45"> </a>

        <a href="https://www.facebook.com/vipnumberstore.in" target="_blank"><img src="assets/img/call.svg" width="45"
                                                                                  height="45"></a>

        <a href="whatsapp://send?phone=+91 81001 80000&amp;text=Hi!" data-action="share/whatsapp/share"><img
                src="assets/img/what.svg" width="45" height="45"> </a>


        <a href="tel:+918100180000" data-action="share/whatsapp/share"><img src="assets/img/phone.svg" width="45"
                                                                            height="45"></a>

    </div>


    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery-ui.min.js"></script>
    <script src="assets/js/jquery.blockUI.js"></script>

    <script src="assets/js/dist/wow.js"></script>
    <script>
        wow = new WOW(
            {
                animateClass: 'animated',
                offset: 100,
                callback: function (box) {
                    console.log("WOW: animating <" + box.tagName.toLowerCase() + ">")
                }
            }
        );
        wow.init();
        document.getElementById('moar').onclick = function () {
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
    <script src="assets/js/searchnumberAutocomplete.js"></script>

    <!--Start of Tawk.to Script-->

    <!--End of Tawk.to Script-->

</b></b>
<script type="text/javascript">
    var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
    (function () {
        var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
        s1.async = true;
        s1.src = 'https://embed.tawk.to/5da2bc55f82523213dc6ff29/default';
        s1.charset = 'UTF-8';
        s1.setAttribute('crossorigin', '*');
        s0.parentNode.insertBefore(s1, s0);
    })();
</script>
</body>

</html>