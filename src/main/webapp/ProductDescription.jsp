<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@page import="org.springframework.util.StringUtils" %>
<%@page import="com.techgate.util.QueryConstants" %>
<%@page import="com.techgate.dbaction.DBAction" %>
<%@page import="com.techgate.domain.Product" %>
<%@page import="com.techgate.util.GeneralConstants" %>
<%@page import="com.techgate.domain.CustomerAddressDetails" %>
<%@page import="com.techgate.domain.CustomProduct" %>
<%@page import="com.techgate.domain.Category" %>
<%@page import="java.util.List" %>
<%@page import="com.techgate.util.GeneralFunction" %>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@page import="com.techgate.cart.ShoppingCart" %>
<%@page import="java.util.Map" %>

<%
    String vanityCheck = request.getParameter("id");
    if (vanityCheck != null && vanityCheck.matches("[0-9]+") && vanityCheck.length() < 10) {
        session.setAttribute("currency", "USD");
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        String currency = (String) session.getAttribute("currency");
        ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
        Map<String, String> map = null;
        map = (Map<String, String>) application.getAttribute("categoriesMap");
        GeneralFunction generfunc = (GeneralFunction) context.getBean("generalFunction");
        String Parent_Cate_Id = request.getParameter("parentCateId") == null ? "0" : request.getParameter("parentCateId");
        String subCategoryIds = map.get(Parent_Cate_Id);
        if (!StringUtils.hasText(subCategoryIds)) {
            subCategoryIds = Parent_Cate_Id;
        } else {
            subCategoryIds = subCategoryIds + "," + Parent_Cate_Id;
        }
        int id = Integer.parseInt(request.getParameter("id"));
        double price = 0.0, discount = 0.0, disprice = 0.0;
        List<Category> parentCategory = generfunc.getParentCategoryList();
        List<Category> subCategorys = generfunc.getSubCategoryList();
        //List<Category> subCategoryes = generfunc.getSubCategoriesList(Parent_Cate_Id);
        List<Category> subCategoryeis = null;


        DBAction dbAction = (DBAction) context.getBean("dbaction");
        Product product = dbAction.getSingleData(QueryConstants.PRODUCT_SINGLE_DATE_QUERY, Product.class, id);
        if (product != null) {
            List<CustomProduct> cproducts = generfunc.getProductCategoryList(String.valueOf(product.getCate_id()));
            CustomProduct cproduct = dbAction.getSingleData(QueryConstants.PRODUCT_SINGLE_DETAILS_QUERY, CustomProduct.class, id);
%>
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


    <meta property="og:title" content="<%=product.getNumber()%>">
    <meta property="og:description" content="<%=product.getNumber()%>">
    <meta property="og:url" content="https://vipnumberstore.in/productDetails?id=<%=id%>">
    <meta property="og:image" content="https://www.vipnumberstore.in/assets/img/logo.png">
    <meta property="product:brand" content="VIP NUMBER STORE">
    <meta property="product:availability" content="in stock">
    <meta property="product:condition" content="new">
    <meta property="product:price:amount" content="<%=cproduct.getRateInRupee() %>">
    <meta property="product:price:currency" content="INR">
    <meta property="product:retailer_item_id" content="<%=product.getProduct_id()%>">
    <meta property="google_product_category" content="Unique Numbers">
    <meta property="google:product:category" content="Unique Numbers"/>


    <!-- Mobile Meta -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

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
    <noscript>
        <img src="https://www.facebook.com/tr?id=2409116105970793
  &amp;ev=ViewContent
  &amp;cd[content_name]=<%=product.getNumber()%>
  &amp;cd[content_category]=VIP NUMBER
  &amp;cd[content_type]=product
  &amp;cd[content_ids]=<%=product.getProduct_id()%>
  &amp;cd[value]=<%=cproduct.getRateInRupee() %>
  &amp;cd[currency]=INR" height="1" width="1" style="display:none"/>
    </noscript>


    <!--<link href="https://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700,900&display=swap" rel="stylesheet">-->
    <script language="JavaScript">
        function CopyToClipboard() {
            var text = document.createElement("textarea");
            text.innerHTML = window.location.href;
            Copied = text.createTextRange();
            Copied.execCommand("Copy");
        }
    </script>
</head>

<body>
<!--<div class="righticon" style=""> <a href="https://www.facebook.com/vipnumberstore.in" target="_blank"><img src="assets/img/fbicon.png" width="41" height="47"></a> 

  <a href="http://instagram.com/vipnumberstore" target="_blank"><img src="assets/img/inicon.png" width="41" height="47"></a>
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

                    <!--<form action="searchNumbers" method="post" style="float:left;">
                    <input name="search" type="text" placeholder="Search Number">
                    <button type="submit" class="search-btn"><i class="fa fa-search"></i></button>
                </form>-->


                    <a href="cart">
                        <div class="carticon"><i
                                class="fa fa-shopping-cart"></i> <%if (cart != null) {%><%=cart.getAllCartItem().size() %><%} else {%>
                            0<%} %></div>
                    </a>

                    <% if (session.getAttribute("custId") == null) {%>
                    <a href="login.html">
                        <div class="singin">Sign In</div>
                    </a>
                    <%} %>
                    <a href="vendorLogin">
                        <div class="singin">Vendor</div>
                    </a>
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
    <section id="site-slider" style="border-bottom:1px solid #f23c00;">
        <div class="wrapper">
            <img src="assets/img/inner-banner.jpg" alt="Slide" class="img-full"/>
        </div>
    </section>
    <!-- Slider End -->


    <section id="services" class="box-grey">
        <div class="wrapper padding-all overflowhi">


            <div class="col-md-5 col-sm-12">


                <div class="overflowhi">

                    <div class="numberbox">
                        <div class="price">
                            <%
                                price = 0.0;
                                discount = 0.0;
                                disprice = 0.0;
                                if (cproduct.getDiscount() > 0) {
                                    discount = cproduct.getDiscount();
                                    price = cproduct.getRateInRupee();

                                    disprice = price * discount / 100;

                                    price = price - disprice;
                            %>
                            <del>&#8377; <%=cproduct.getRateInRupee() %>
                            </del>
                            <b>&#8377; <%=price %>
                            </b>
                            <%} else { %>
                            <b>&#8377; <%=cproduct.getRateInRupee() %>
                            </b>
                            <%} %>
                        </div>
                        <h1><%=product.getProductName()%>
                        </h1>

                        <p> Sum total: <%=product.getLiters() %>=<b><%=product.getTrap() %>
                        </b></p>
                        <%if (product.getNumber_status().equalsIgnoreCase("Available")) { %>
                        <form method="post" id="form1" action="CartActivity">

                            <a onclick="document.getElementById('form1').submit();">
                                <div class="booknow">BUY NOW</div>
                            </a>
                            <input type="hidden" name="vProductId" id="vProductId"
                                   value="<%= product.getProduct_id()%>">
                            <input type="hidden" name="vProductName" id="vProductName"
                                   value="<%= product.getProductName()%>">
                            <input type="hidden" name="vRateRuppes" id="vRateRuppes"
                                   value="<%= cproduct.getRateInRupee()%>">
                            <input type="hidden" name="vRateDollar" id="vRateDollar"
                                   value="<%= cproduct.getRateInDollar()%>">
                            <input type="hidden" name="vImgLoc" id="vImgLoc" value="<%= cproduct.getImg_loc()%>">
                            <input type="hidden" name="vDiscount" id="vDiscount" value="<%= cproduct.getDiscount()%>">
                            <input type="hidden" name="action" id="action" value="<%= GeneralConstants.ADD_TO_CART %>">
                        </form>

                        <%} %>


                    </div>

                </div>

            </div>


            <div class="col-md-4 col-sm-12">
                <%if (product.getNumber_status().equalsIgnoreCase("Available")) { %>

                <h3 style="font-weight:800;">Number Details</h3>

                <ul class="list-default">


                    <li><b>Number :</b> <%=product.getNumber()%>
                    </li>
                    <div class="space-20"></div>
                    <li><b>Number Status :</b> Ready To Port</li>
                    <div class="space-20"></div>
                    <li><b>Number Type :</b> <%=product.getCurrentNumber()%>
                    </li>

                </ul>

                <%} else { %>
                <img src="assets/img/sold.png">
                <%} %>
            </div>


            <%if (product.getNumber_status().equalsIgnoreCase("Available")) { %>

            <div class="col-md-3 col-sm-12 iconso">

                <h3 style="font-weight:800; font-size:18px;">Share Number with your friend &nbsp;
                    <a onclick="myFunction();"><!--
              <i class="fa fa-share-alt" aria-hidden="true"></i>-->
                    </a>
                    <% String url = "https://vipnumberstore.in/productDetails?id=" + id; %>
                    <input type="hidden" value="<%=url%>" id="myInput">
                </h3>

                <ul class="social-icons nav-default clearfix">
                    <li><a href="http://facebook.com/vipnumberstore.in" target="_blank" class="facebook"><i
                            class="fa fa-facebook"></i></a></li>
                    <li><a href="https://twitter.com/vvipnumberstore" class="twitter" target="_blank"><i
                            class="fa fa-twitter"></i></a></li>
                    <li><a href="http://instagram.com/vipnumberstore" class="linkedin" target="_blank"><i
                            class="fa fa-instagram"></i></a></li>
                    <li>
                        <a href="whatsapp://send?text=Hey I found a very unique number <%=product.getNumber()%> on www.vipnumberstore.in Interested? Check it out https://vipnumberstore.in/productDetails?id=<%=id%>"
                           data-action="share/whatsapp/share"><img src="assets/img/whatsappicon.png"> </a></li>
                </ul>

            </div>
            <%} %>


        </div>
    </section>


    <div class="box-grey">
        <div class="wrapper padding-all indbox">
            <div class="grid-list">
                <div class="row margin-none">


                    <div class="text-center">
                        <h2 class="headingpage" style="line-height:30px;">QUICK STEPS TO BUY <br>
                            <span>YOUR VIP NUMBER</span>
                        </h2>
                    </div>


                    <div class="grid col-md-3 col-sm-6 col-xs-6 boxhi">
                        <p><img src="assets/img/s01.png"></p>
                        <h4 class="text-semibold text-space"><strong>FIND YOUR DESIRED NUMBER</strong></h4>
                        <p class="line-bottom">Select your favourable mobile number. The one you like and which suits
                            your personality. </p>

                        <br>

                    </div>


                    <div class="grid col-md-3 col-sm-6 col-xs-6 boxhi">
                        <p><img src="assets/img/s02.png"></p>
                        <h4 class="text-semibold text-space"><strong>MAKE THE PAYMENT</strong></h4>
                        <p class="line-bottom">Once your chosen mobile number is finalised, proceed to checkout and make
                            the payment. </p>
                        <br>

                        <br>

                    </div>


                    <div class="grid col-md-3 col-sm-6 col-xs-6 boxhi">
                        <p><img src="assets/img/s03.png"></p>
                        <h4 class="text-semibold text-space"><strong>GET THE UNIQUE PORTING CODE</strong></h4>
                        <p class="line-bottom"> You will receive a Unique Porting Code (UPC) along with invoice within
                            24 hour on your Registered Mobile Number . </p>

                    </div>


                    <div class="grid col-md-3 col-sm-6 col-xs-6 boxhi">
                        <p><img src="assets/img/s04.png"></p>
                        <h4 class="text-semibold text-space"><strong>GET YOUR SIM CARD</strong></h4>
                        <p class="line-bottom">Visit any Telecom Gallery or Mobile Shop and port the number. You can get
                            your number ported to any network, on your Name.</p>

                    </div>


                </div>
            </div>
        </div>
    </div>


    <div class="box-grey">
        <div class="wrapper padding-all">
            <!-- Section Header -->
            <div class="section-header text-center">
                <h1><strong>SIMILAR PRODUCT</strong>S</h1>
            </div>
            <!-- Section Header End -->

            <!-- Section Content -->
            <div class="row">
                <div class="team-horizontal" id="owl-team">
                    <%
                        int c = 0;
                        for (CustomProduct sproduct : cproducts) {
                            if (c == 10) {
                                break;
                            }
                            if (sproduct.getProduct_id() != product.getProduct_id()) {
                                c++;
                    %>

                    <div class="">
                        <div class="numberbox">

                            <div class="price">&#8377; <%=sproduct.getRateInRupee() %>
                            </div>

                            <h1><%=sproduct.getProductName()%>
                            </h1>

                            <p> Sum total: <%=sproduct.getLiters() %>=<b><%=sproduct.getTrap() %>
                            </b></p>

                            <a onclick="document.getElementById('form<%=c %>').submit();">
                                <div class="booknow"> BUY NOW</div>
                            </a>

                            <a class="buttonleft" href="productDetails?id=<%=sproduct.getProduct_id()%>">
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
            <!-- Section Content End -->
        </div>
    </div>


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
                                <li>Shop No 23, Old idea point, Main market, Police station Road, Anupgarh Distt. Sri
                                    ganganagar Rajasthan 335701
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
    <a href="http://instagram.com/vipnumberstore" target="_blank"><img src="assets/img/mail.svg" width="45" height="45">
    </a>

    <a href="https://www.facebook.com/vipnumberstore.in" target="_blank"><img src="assets/img/call.svg" width="45"
                                                                              height="45"></a>

    <a href="whatsapp://send?phone=+91 81001 80000&amp;text=Hi!" data-action="share/whatsapp/share"><img
            src="assets/img/what.svg" width="45" height="45"> </a>

    <a href="tel:+918100180000" data-action="share/whatsapp/share"><img src="assets/img/phone.svg" width="45"
                                                                        height="45"></a>
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

<%
        } else {
            System.out.println("Error in Caategories Life Time Number :- " + new Date() + " >>>  " + vanityCheck);
        }
    } else {
        System.out.println("Error in CateData Vip Number Store  :- " + new Date() + " >>>  " + vanityCheck);
        String remoteAddr = "";
        if (request != null) {
            remoteAddr = request.getHeader("X-FORWARDED-FOR");
            if (remoteAddr == null || "".equals(remoteAddr)) {
                remoteAddr = request.getRemoteAddr();
            }
        }

        System.out.println("Hack Attamp :- " + remoteAddr);
        response.sendRedirect("index");
    }
%>


</body>

</html>