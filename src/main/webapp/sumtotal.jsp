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


    <!--<link href="https://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700,900&display=swap" rel="stylesheet">-->


    <script language="JavaScript" type="text/javascript">
        function VlidateRequestloadMoreAjax() {
            var limit = document.getElementById("limit").value;
            var pricefilterselected = document.getElementById("pricefilterselected").value;
            // alert(limit);
            if (typeof XMLHttpRequest != "undefined") {
                req = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                req = new ActiveXObject("Microsoft.XMLHTTP");
            }

            req.open("POST", "loadData", true);

            req.onreadystatechange = callbackRelevantSubCategories;

            req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            req.send("limit=" + encodeURIComponent(limit) + "&pricefilter=" + encodeURIComponent(pricefilterselected));
        }

        function callbackRelevantSubCategories() {

            if (req.readyState == 4) {
                if (req.status == 200) {
                    var vreldet = document.getElementById("loadNumberData");
                    vreldet.innerHTML = req.responseText;
                } else {
                    alert("Error" + req.responseText);
                }
            }
        }
    </script>

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
        <img height="1" width="1"
             src="https://www.facebook.com/tr?id=2409116105970793&ev=PageView
&noscript=1"/>
    </noscript>


    <!-- End Facebook Pixel Code -->
</head>
<%

    session.setAttribute("currency", "INR");
    ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
    String currency = (String) session.getAttribute("currency");
    ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
    GeneralFunction generfunc = (GeneralFunction) context.getBean("generalFunction");


    String sumTotal = request.getParameter("sumTotal");


    List<Category> parentCategory = generfunc.getParentCategoryList();
    List<Category> subCategorys = generfunc.getSubCategoryList();
    List<Category> subCategoryes = null;
    List<Category> subCategoryeis = null;
    List<Category> subCategoryeisinner = null;
    List<CustomProduct> products = null;


    String pricefilter = request.getParameter("pricefilter");
    String orderby = "";
    if (pricefilter == null) {
        if (sumTotal.length() == 1) {

            products = generfunc.getProductListSearchSumTotal(sumTotal);
        } else if (sumTotal.length() == 2) {
            products = generfunc.getProductListSearchSumTotalTwo(sumTotal);
        } else {
            products = generfunc.getProductList();
        }
    } else if (pricefilter != null) {
        if (pricefilter.equalsIgnoreCase("low")) {
            orderby = "asc";
        } else {
            orderby = "desc";
        }
        if (sumTotal.length() == 1) {

            products = generfunc.getProductListSearchSumTotalPrice(sumTotal, orderby);
        } else if (sumTotal.length() == 2) {
            products = generfunc.getProductListSearchSumTotalTwoPrice(sumTotal, orderby);
        } else {
            products = generfunc.getProductList();
        }
    }

%>
<body>

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
                    <!--
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


            <div class="col-md-3 col-sm-12 filteroption displaynonefilter">

                <div class="panel-group" id="accordion">

                    <div class="panel panel-default">
                        <div class="panel-heading gradiyant">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                                <h4 class="panel-title fontwi700">
                                    SUM TOTAL
                                </h4></a>
                        </div>
                        <div id="collapse1" class="panel-collapse collapse in">
                            <div class="panel-body blog-search">
                                <form name="form" action="sumTotal" method="post">
                                    <input name="sumTotal" type="text" placeholder="Like 12 or 3">
                                    <button type="submit" class="search-btn"><i class="fa fa-search"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>


                    <div class="panel panel-default">
                        <div class="panel-heading gradiyant">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
                                <h4 class="panel-title fontwi700">
                                    PRICING
                                </h4></a>
                        </div>
                        <div id="collapse3" class="panel-collapse collapse">
                            <div class="panel-body">

                                <nav>
                                    <ul>
                                        <li><a href="priceNumbers?param1=0&param2=1500"
                                               class="btn btn-default">0-1500 </a></li>
                                        <li><a href="priceNumbers?param1=1501&param2=3000" class="btn btn-default">1501-3000</a>
                                        </li>
                                        <li><a href="priceNumbers?param1=3001&param2=5000" class="btn btn-default">3001-5000</a>
                                        </li>
                                        <li><a href="priceNumbers?param1=5001&param2=10000" class="btn btn-default">5001
                                            - 10000 </a></li>
                                        <li><a href="priceNumbers?param1=10001&param2=30000" class="btn btn-default">10001
                                            - 30000 </a></li>
                                        <li><a href="priceNumbers?param1=30001&param2=50000" class="btn btn-default">30001
                                            - 50000 </a></li>
                                        <li><a href="priceNumbers?param1=50001&param2=100000" class="btn btn-default">50001
                                            - 100000 </a></li>
                                        <li><a href="priceNumbers?param1=100001&param2=1000000" class="btn btn-default">100001
                                            -1000000 </a></li>
                                    </ul>
                                </nav>

                            </div>
                        </div>
                    </div>


                    <div class="panel panel-default">
                        <div class="panel-heading gradiyant">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
                                <h4 class="panel-title fontwi700">
                                    CATEGORY
                                </h4></a>
                        </div>
                        <div id="collapse2" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <nav>
                                    <ul>
                                        <%
                                            for (Category category : parentCategory) {
                                        %>
                                        <li>
                                            <a href="CategoryNumbers?cateID=<%=category.getCate_id()%>&Name=<%=category.getCate_name() %>&parentCateId=<%=category.getCate_id() %>"
                                               class="btn btn-default"><%=category.getCate_name() %>
                                            </a></li>
                                        <%} %>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>

                </div>

            </div>


            <div class="col-md-9 col-sm-12">


                <aside class="blog-search" style="margin-bottom:10px;">
                    <form name="form" action="sumTotal" method="post">
                        <input name="sumTotal" type="text" placeholder="Search SUM TOTAL Like 12 or 3"
                               style="height:50px">
                        <button type="submit" class="search-btn" style="top: 9px;
    right: 12px;"><i class="fa fa-search"></i> Search
                        </button>
                    </form>
                </aside>


                <nav class="button-group mini clearfix" style="margin-bottom:20px;">
                    <a href="#" class="btn btn-dark">Sort By &nbsp;<i class="fa fa-filter"></i></a>
                    <a href="VIPNumbers?pricefilter=low" class="btn btn-default">Price Low to High</a>
                    <a href="VIPNumbers?pricefilter=high" class="btn btn-default">Price High to Low</a>

                </nav>


                <div class="overflowhi" id="loadNumberData">
                    <input type="hidden" name="limit" id="limit" value="100">
                    <input type="hidden" name="pricefilterselected" id="pricefilterselected" value="<%=pricefilter%>">
                    <%
                        int c = 0;
                        String name = "";
                        double price = 0.0, discount = 0.0, disprice = 0.0, rs = 0;
                        for (CustomProduct product : products) {
                            if (c == 200) {
                                break;
                            }
                            c++;
                    %>

                    <div class="numberbox2">


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

                        <a href="productDetails?id=<%=product.getProduct_id()%>">
                            <div class="booknow">View details</div>
                        </a>


                    </div>


                    <%} %>

                </div>


            </div>

        </div>
    </section>


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

<a href="#top">
    <img src="assets/img/filter02.svg" class="filterop">
</a>


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


</body>

</html>