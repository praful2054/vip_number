<%@page import="java.sql.ResultSet" %>
<%@page import="com.techgate.connection.DBConnection" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="com.techgate.util.GeneralFunction" %>
<%@page import="java.util.List" %>
<%@page import="com.techgate.domain.EmployeeDetails" %>
<%@page import="com.techgate.util.QueryConstants" %>
<%@page import="com.techgate.dbaction.DBAction" %>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Techgate</title>
    <link rel="icon" type="images/ico" href="img/fav.ico"/>
</head>
<body>
<%
    String loginId = request.getParameter("loginId");
    String password = request.getParameter("password");

    System.out.println("Vendor loginId >>> " + loginId);
    System.out.println("vendor password ...>>> " + password);
    try {

        String remoteAddr = "";

        if (request != null) {
            remoteAddr = request.getHeader("X-FORWARDED-FOR");
            if (remoteAddr == null || "".equals(remoteAddr)) {
                remoteAddr = request.getRemoteAddr();
            }
        }

        System.out.println("IP Address,,,,,,, >>> " + remoteAddr);
        System.out.println("I am here.");
        ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
        GeneralFunction generfunc = (GeneralFunction) context.getBean("generalFunction");

        PreparedStatement prepare = null, pst = null;
        Connection con = new DBConnection().getCon();
        boolean invalidvalidLogin = true;
        String euserid = "", employeeName = "", profile = "";
        pst = con.prepareStatement("select * from vendorDetails where status='Y' and contactno1=? and password=? ");
        pst.setString(1, loginId);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            invalidvalidLogin = false;
            euserid = rs.getString("id");
            employeeName = rs.getString("firstname");
            profile = rs.getString("loginId");

        }

        if (invalidvalidLogin) {
			System.out.println("I am in invalid session.");
            response.sendRedirect("vendorLogin");
        } else {
			System.out.println("I am in valid session.");
            HttpSession ses = request.getSession(true);
            String sesid = (String) ses.getId();
            ses.setAttribute("vendorId", euserid);
            ses.setAttribute("VendorName", employeeName);
            ses.setAttribute("email", profile);
            response.sendRedirect("vendordashboard");


        }
        DBConnection.close(con, prepare, rs);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</body>
</html>