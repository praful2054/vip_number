<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Connection con=null;ResultSet rs =null;PreparedStatement prepare1=null;
boolean check=false;
try{
	
	PreparedStatement prepare = null;
	 con=new DBConnection().getCon();
	 String mobileNO = request.getParameter("vMobileNo").replaceAll("\\<[^>]*>","");
	 mobileNO = mobileNO.replaceAll("\\s+","").trim();
	 prepare1=con.prepareStatement("select * from enquiry where Mobile_NO='"+mobileNO+"' ");
	 rs = prepare1.executeQuery();
	if(rs.next()){%>
	Customer Alredy Exists
    <%}
	
	
}

catch(Exception e){e.printStackTrace();
}finally{DBConnection.close(con, prepare1, rs);} %>