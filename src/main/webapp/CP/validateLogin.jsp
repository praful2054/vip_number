<%@page import="java.sql.ResultSet"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.techgate.util.GeneralFunction"%>
<%@page import="java.util.List"%>
<%@page import="com.techgate.domain.EmployeeDetails"%>
<%@page import="com.techgate.util.QueryConstants"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Techgate</title>
 <link rel="icon" type="images/ico" href="img/fav.ico" />
</head>
<body>
<%
String loginId = request.getParameter("loginId");
String password = request.getParameter("password");	

System.out.println("loginId >>> "+loginId);
System.out.println("password >>> "+password);
try{
	
	String remoteAddr = "";

    if (request != null) {
        remoteAddr = request.getHeader("X-FORWARDED-FOR");
        if (remoteAddr == null || "".equals(remoteAddr)) {
            remoteAddr = request.getRemoteAddr();
        }
    }
    
    System.out.println("IP Address >>> "+remoteAddr);
	ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
	GeneralFunction generfunc = (GeneralFunction) context.getBean("generalFunction");
	PreparedStatement prepare = null, pst= null;
	Connection con=new DBConnection().getCon();
	boolean invalidvalidLogin= true;
	String euserid="",employeeName="", profile="";
	pst=con.prepareStatement("select loginId, firstname, lastname, profile from employee where status='Y' and loginId=? and password=? ");
	pst.setString(1,loginId);
	pst.setString(2,password);
	ResultSet rs = pst.executeQuery();
	if(rs.next()){
		invalidvalidLogin= false;
		euserid=rs.getString("loginId");
		employeeName=rs.getString("firstname")+" "+rs.getString("lastname");
		profile=rs.getString("profile");
		
	}
	    
    if(invalidvalidLogin){
    		response.sendRedirect("VIP-login");
    	}else{
    		
		    	HttpSession ses=request.getSession(true);
	    		String sesid=(String)ses.getId();
	    		ses.setAttribute("euserid", euserid);
	    		ses.setAttribute("employeeName", employeeName);
	    		ses.setAttribute("profile", profile);
	    		/*
	    		prepare=con.prepareStatement("insert into loginHistory values(0, ?, ?, ?, ?, ?, Now())");
				prepare.setString(1,euserid);
				prepare.setString(2,employeeName);
				prepare.setString(3,profile);
				prepare.setString(4,"Login");
				prepare.setString(5, remoteAddr);
				int row=prepare.executeUpdate();
	    		*/
	    		
	    			response.sendRedirect("dashboard");
	    		
		    
	       
    	}
    DBConnection.close(con, prepare, null);
}catch(Exception e){
	e.printStackTrace();
}
%>

</body>
</html>