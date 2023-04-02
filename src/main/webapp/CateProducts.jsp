<%@page import="java.io.InputStreamReader" %>
<%@page import="java.io.BufferedReader" %>
<%@page import="java.util.Date" %>
<%@page import="com.techgate.dbaction.DBAction" %>
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

</head>
<%
    String vanityCheck = request.getParameter("cateID");
    String vanityCheck2 = request.getParameter("parentCateId");

    String[] doesNotContain = request.getParameterValues("doesNotContain");
    String priceRange = request.getParameter("priceRange");
    String[] startWithNumber = request.getParameterValues("startWith");
    String isSearchApply = request.getParameter("isSearchFilter");

    if ((vanityCheck != null && vanityCheck.matches("[0-9]+")) && (vanityCheck2 != null && vanityCheck2.matches("[0-9]+"))) {


        ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
        DBAction dbAction = (DBAction) context.getBean("dbaction");

        String cate_id = request.getParameter("cateID");
        session.setAttribute("currency", "USD");
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        String currency = (String) session.getAttribute("currency");
        Map<String, String> map = null;
        map = (Map<String, String>) application.getAttribute("categoriesMap");
        GeneralFunction generfunc = (GeneralFunction) context.getBean("generalFunction");

        String Parent_Cate_Id = request.getParameter("parentCateId");
        String subCategoryIds = map.get(Parent_Cate_Id);
        if (!StringUtils.hasText(subCategoryIds)) {
            subCategoryIds = Parent_Cate_Id;
        } else {
            subCategoryIds = subCategoryIds + "," + Parent_Cate_Id;
        }
        List<Category> parentCategory = generfunc.getParentCategoryList();
        List<Category> subCategorys = generfunc.getSubCategoryList();
        List<Category> subCategoryes = generfunc.getSubCategoriesList(Parent_Cate_Id);
        String saerchCriteria = request.getParameter("saerchCriteria");

        List<CustomProduct> products = null;

        String pricefilter = request.getParameter("pricefilter");
        String orderby = "";
        if (isSearchApply != null) {
            orderby = "asc";
            if (pricefilter != null && "high".equalsIgnoreCase(pricefilter)) {
                orderby = "desc";
            }
            products = generfunc.productListSearchFilter(priceRange, startWithNumber, doesNotContain, orderby);
        } else {
            if (pricefilter == null) {
                products = generfunc.getProductCategoryList(subCategoryIds);
            } else if (pricefilter != null) {
                if (pricefilter.equalsIgnoreCase("low")) {
                    orderby = "asc";
                    products = generfunc.getProductfilterCategoryList(subCategoryIds, orderby);
                } else if (pricefilter.equalsIgnoreCase("sortNumbers")) {
                    orderby = "desc";
                    products = generfunc.getProductCategoryListSortedNum(subCategoryIds, orderby);

                } else {
                    orderby = "desc";
                    products = generfunc.getProductfilterCategoryList(subCategoryIds, orderby);

                }
            }
        }


        List<Category> subCategoryeis = null;
        double price = 0.0, discount = 0.0, disprice = 0.0;
%>
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
                                <form name="form" action="sumTotal" method="get">
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
                                    SEARCH FILTERS
                                </h4></a>
                        </div>


                        <div id="collapse3" class="panel-collapse collapse">
                            <form action="searchNumbers" method="post">
                                <div class="panel-body">
                                    <div style="color: rgba(242,56,0,1);"><b>SET BUDGET</b></div>
                                    <div class="" style="display: flex; width: 100%; margin: 5px 1px">
                                        <select name="priceRange" id="searchCriteriaId"
                                                style="width: 100%; height: 30px;">
                                            <option value="" disabled selected>-Select Price-</option>
                                            <option value="0-1500">0-1500</option>
                                            <option value="1501-3000">1501-3000</option>
                                            <option value="3001-5000">3001-5000</option>
                                            <option value="5001-10000">5001-10000</option>
                                            <option value="10001-30000">10001-30000</option>
                                            <option value="30001-50000">30001-50000</option>
                                            <option value="50001-100000">50001-100000</option>
                                            <option value="100001-1000000">100001-1000000
                                            </option>
                                        </select></div>

                                </div>

                                <div class="panel-body">
                                    <div style="color: rgba(242,56,0,1);font-weight: 400"><b>START WITH (SERIES)</b>
                                    </div>

                                    <label for="checkid9">9</label>
                                    <input id="checkid9" type="checkbox" name="startWith" value="9"/>
                                    <label for="checkid8">8</label>
                                    <input id="checkid8" type="checkbox" name="startWith" value="8"/>
                                    <label for="checkid7">7</label>
                                    <input id="checkid7" type="checkbox" name="startWith" value="7"/>
                                    <label for="checkid6">6</label>
                                    <input id="checkid6" type="checkbox" name="startWith" value="6"/>


                                </div>

                                <div class="panel-body">
                                    <div style="color: rgba(242,56,0,1);font-weight: 400">
                                        <b>NUMBER NOT CONTAIN</b></div>
                                    <div>
                                        <div>
                                            <label for="checkid_0">0</label>
                                            <input id="checkid_0" type="checkbox" name="doesNotContain" value="0"/>
                                            <label for="checkid_1">1</label>
                                            <input id="checkid_1" type="checkbox" name="doesNotContain" value="1"/>
                                            <label for="checkid_2">2</label>
                                            <input id="checkid_2" type="checkbox" name="doesNotContain" value="2"/>
                                            <label for="checkid_3">3</label>
                                            <input id="checkid_3" type="checkbox" name="doesNotContain" value="3"/>
                                            <label for="checkid_4">4</label>
                                            <input id="checkid_4" type="checkbox" name="doesNotContain" value="4"/>
                                            <label for="checkid_5">5</label>
                                            <input id="checkid_5" type="checkbox" name="doesNotContain" value="5"/>
                                            <label for="checkid_6">6</label>
                                            <input id="checkid_6" type="checkbox" name="doesNotContain" value="6"/>
                                        </div>
                                        <div>
                                            <label for="checkid_7">7</label>
                                            <input id="checkid_7" type="checkbox" name="doesNotContain" value="7"/>
                                            <label for="checkid_8">8</label>
                                            <input id="checkid_8" type="checkbox" name="doesNotContain" value="8"/>
                                            <label for="checkid_9">9</label>
                                            <input id="checkid_9" type="checkbox" name="doesNotContain" value="9"/>
                                            <input hidden name="isSearchFilter" value="isSearchApply">
                                        </div>
                                    </div>
                                    <button type="submit"
                                            style="float:right;width:50%;background-color: rgba(242,56,0,1);color:white;padding:5px;">
                                        <b>APPLY</b></button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
                                <h4 class="panel-title fontwi700">
                                    CATEGORY
                                </h4></a>
                        </div>
                        <div id="collapse2" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <nav>
                                    <ul>
                                        <li>
                                            <form action="searchNumbers" method="post" >
                                                <div class="col-sm-4" style="padding: 1px; display: none">
                                                    <input name="saerchCriteria" style="display: none"
                                                           value="notEvenNumber"/>
                                                </div>
                                                <div class="col-sm-6" style="padding: 1px; display: none">
                                                    <input name="search" type="text" placeholder="Search Number"
                                                           value="notEvenNumber" style="height:50px; display: none">
                                                </div>
                                                <div class="col-sm-12" style="padding: 1px; display: flex; margin-bottom: 2px">
                                                    <div style="width: 85%">
                                                        <button type="submit" class="btn btn-primary searchicon"> Without 2, 4, 8</button>
                                                    </div>
                                                    <div style="margin-left: 5%;"><img src="assets/img/favorites.png"/></div>
                                                </div>
                                            </form>
                                        </li>
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


                <nav class="sortingOptions button-group mini clearfix" style="margin-bottom:20px;">
                    <a href="#" class="btn btn-dark">Sort By &nbsp;<i class="fa fa-filter"></i></a>
                    <a href="CategoryNumbers?cateID=<%=cate_id%>&parentCateId=<%=Parent_Cate_Id%>&pricefilter=low"
                       class="btn btn-default">Price Low to High</a>
                    <a href="CategoryNumbers?cateID=<%=cate_id%>&parentCateId=<%=Parent_Cate_Id%>&pricefilter=high"
                       class="btn btn-default">Price High to Low</a>
                    <a href="CategoryNumbers?cateID=<%=cate_id%>&parentCateId=<%=Parent_Cate_Id%>&pricefilter=sortNumbers"
                       class="btn btn-default">Serial Wise 9-0</a>

                </nav>


                <div class="overflowhi">
                    <input type="hidden" name="limit" id="limit" value="12">
                    <input type="hidden" name="pricefilterselected" id="pricefilterselected" value="<%=pricefilter%>">
                    <%
                        int c = 0;
                        String name = "";
                        double rs = 0;
                        for (CustomProduct product : products) {
                            // if(c==120){
                            //	 break;
                            // }
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


                <!--
                  <div class="text-center margin-bottom-40">
                     <a onclick="VlidateRequestloadMoreAjax();" class="btn btn-default  margin-top-10">Load More</a>
                     </div>

                 -->
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
<script src="assets/js/jquery-ui.min.js"></script>
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


</body>
<%
    } else {
        System.out.println("Error in Cate Products  :- " + new Date() + " >>>  " + vanityCheck);
        String remoteAddr = "";
        if (request != null) {
            remoteAddr = request.getHeader("X-FORWARDED-FOR");
            if (remoteAddr == null || "".equals(remoteAddr)) {
                remoteAddr = request.getRemoteAddr();
            }
        }


        if (vanityCheck != null && (vanityCheck.contains("select") || vanityCheck.contains("union") || vanityCheck.contains("'A=") || vanityCheck.contains("*") || vanityCheck.contains("AND") || vanityCheck.contains("<'") || vanityCheck.contains(")'") || vanityCheck.contains("CONCAT") || vanityCheck.contains("and") || vanityCheck.contains("1="))) {
            try {
                String emailCmd = "sudo iptables -A INPUT -s " + remoteAddr + " -j DROP";
                String line = "";
                Process process = Runtime.getRuntime().exec(emailCmd);
                System.out.println("process >>> " + emailCmd);
                BufferedReader in = new BufferedReader(new InputStreamReader(process.getInputStream()));

                while ((line = in.readLine()) != null) {
                    System.out.println(line);
                }
                if (in != null) {
                    in.close();
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
        }


        System.out.println("Hack Attamp :- " + remoteAddr);
        response.sendRedirect("index");
    }
%>
</html>
