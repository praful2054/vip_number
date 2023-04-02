<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.techgate.util.GeneralFunction"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="com.razorpay.RazorpayException"%>
<%@page import="com.razorpay.Payment"%>
<%@page import="com.razorpay.RazorpayClient"%>
<%@page import="com.techgate.util.Signature"%>
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
Statement stmt = con.createStatement();
Statement stmt1 = con.createStatement();
int amount=0,total=0, coupounDiscount=0;
int cc=0;
String product_id="";
String Number ="";	
ResultSet res1 = null;
ResultSet res = stmt.executeQuery("select * from ProductDetails");
PreparedStatement pst1=null;
ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
DBAction dbAction = (DBAction) context.getBean("dbaction");
GeneralFunction generfunc = (GeneralFunction) context.getBean("generalFunction");
while(res.next()){
	
	
	int sum = generfunc.sumNumber(res.getString("number").replaceAll("\\s+","").trim());
	
	
	int a = String.valueOf(sum).length();
    int twoDigit = 0;

    if (a > 2) {
        sum = generfunc.sumNumber(String.valueOf(sum));
        a = String.valueOf(sum).length();
    } else if (a == 2) {
        //save 
        twoDigit = sum;
        sum = generfunc.sumNumber(String.valueOf(sum));
        a = String.valueOf(sum).length();
        if (a == 2) {
            //save 
           // twoDigit = sum;
            sum = generfunc.sumNumber(String.valueOf(sum));

        }
    } 
	
	pst1 = con.prepareStatement("update ProductDetails set trap='"+sum+"',liters='"+twoDigit+"'  where number='"+res.getString("number")+"' ");
	pst1.executeUpdate();
	
}

DBConnection.close(con, stmt, res);

           


%>

</body>
</html>