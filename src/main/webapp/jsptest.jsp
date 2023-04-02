<html>
    <head><title>Test JSP page</title></head>
    <body>
<!--<div class="righticon" style=""> <a href="https://www.facebook.com/vipnumberstore.in" target="_blank"><img src="assets/img/fbicon.png" width="41" height="47"></a> 

  <a href="http://instagram.com/vipnumberstore" target="_blank"><img src="assets/img/inicon.png" width="41" height="47"></a>
</div>-->
        <h1>Working JSP page!</h1>
        <p>This is a page to verify that .jsp support has been enabled</p>

        <table border="0">
            <tr>
                <td align="right"><b>Date:</b></td>
                <td align="left"><%= new java.util.Date() %></td>
            </tr>
            <tr>
                <td align="right"><b>Remote Address:</b></td>
                <td align="left"><%= request.getRemoteAddr() %></td>
            </tr>
            <tr>
                <td align="right"><b>Request Method:</b></td>
                <td align="left"><%= request.getMethod() %></td>
            </tr>
            <tr>
                <td align="right"><b>Servlet Path:</b></td>
                <td align="left"><%= request.getServletPath() %></td>
            </tr>
        </table>
    </body>
</html>
