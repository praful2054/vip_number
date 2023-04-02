<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
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
String sql = "select DISTINCT * from CustomerBillingDetails where cust_id not in (select ot.cust_id from OrderTransaction ot where ot.paymentStatus <> 'Y')";
ResultSet rs = stmt.executeQuery(sql);
PreparedStatement prepare = null, prepare2=null, prepare3=null;
ResultSet res = null, res2=null, res3=null;
int generatedKey = 0;
while(rs.next()) {

	String Message = "Dear "+rs.getString("firstName")+", Welcome to VIP Number Store We'd love to see you again! Book your Vanity Number @ http://tis.bz/HZLp today and get Additional 10% Discount. Use Promo Code Return10";	
	String sendUrl = "https://alerts.kaleyra.com/api/v4/?method=sms&api_key=A95f6ac715c8eb5e4eac8a88b231a4d8a&to="+rs.getString("contactNo1").trim()+"&sender=VIPNUM&message="+Message+"";	
	sendUrl = sendUrl.replace(" ", "%20");	
	URL url = new URL(sendUrl);		
	//System.out.println(sendUrl);	
	URLConnection urlConn = url.openConnection();	
	urlConn.setDoOutput(true);							
	HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();
	httpConn.connect();										      
	BufferedReader br = new BufferedReader(new InputStreamReader(httpConn.getInputStream()));	
	br.close();	
	
}


%>
</body>
</html>