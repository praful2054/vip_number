<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techgate.connection.DBConnection"%>
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
DBConnection dbcon = new DBConnection();
Connection con = dbcon.getCon();
Statement stmt =  con.createStatement();
Statement stmt2 =  con.createStatement();
Statement stmt3 =  con.createStatement();
String sql = "select * from CustomerBillingDetails";
ResultSet rs = stmt.executeQuery(sql);
PreparedStatement prepare = null, prepare2=null, prepare3=null;
ResultSet res = null, res2=null, res3=null;
int generatedKey = 0;
while(rs.next()) {
	     
	   
	   
	    prepare=con.prepareStatement("update CustomerLoginDetails set answer=? where cust_id=?");
		prepare.setString(1,rs.getString("contactNo1"));
		prepare.setString(2,rs.getString("cust_id"));
		int row=prepare.executeUpdate();
	
}


%>
</body>
</html>