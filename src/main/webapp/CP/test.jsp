<%@page import="java.sql.ResultSet"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String prdtName="";
PreparedStatement prepare = null;
DBConnection dbcon = new DBConnection();

Connection con = dbcon.getCon();

PreparedStatement prepare1=con.prepareStatement("select * from productDetails");
ResultSet rs = prepare1.executeQuery();
while(rs.next()){
	prdtName = rs.getString("productName");
	prdtName = prdtName.replaceAll("\\<[^>]*>","");
	//System.out.println(prdtName);	
	prdtName = prdtName.replaceAll("&nbsp;","");
	prdtName = prdtName.replaceAll("\\s+","").trim();
	
	PreparedStatement prepare2 = con.prepareStatement("update  productDetails set number='"+prdtName+"' where product_id="+rs.getString("product_id")+"");
	prepare2.executeUpdate();
}

%>
</body>
</html>