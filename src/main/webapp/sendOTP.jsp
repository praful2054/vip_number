<%@page import="com.techgate.util.Email"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Random"%>
<%@page import="java.io.BufferedReader"%>
<%@page import ="java.io.IOException" %>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%>
<%@page import=" java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script> (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  
  ga('create', 'UA-63690194-1', 'auto');
  ga('send', 'pageview');
</script>
</head>
<body>
<!--<div class="righticon" style=""> <a href="https://www.facebook.com/vipnumberstore.in" target="_blank"><img src="assets/img/fbicon.png" width="41" height="47"></a> 

  <a href="http://instagram.com/vipnumberstore" target="_blank"><img src="assets/img/inicon.png" width="41" height="47"></a>
</div>-->
<%
int otp = 10000 + new Random().nextInt(90000);
String Name = request.getParameter("vParentCategoryName");
String type = request.getParameter("type");
String email = request.getParameter("vParentCategoryemail"); 
String textmessage= "";
if(type==null){
	 textmessage="Dear "+Name+", Thank you For Registration. "+otp+" is The OTP For Request. Regards Vipnumberstore.in";
}else{
	 textmessage="Dear "+Name+", Thank you For inquiring about "+type+" services. "+otp+" is the OTP for request. Don't share this with anyone. Regards Team Vipnumberstore.in";
}



String phone=request.getParameter("vParentCategoryId");
String authkey = "A95f6ac715c8eb5e4eac8a88b231a4d8a";
String senderId = "VIPNUM";
String method = "sms";
URLConnection myURLConnection=null;
URL myURL=null;
BufferedReader reader=null;
//encoding message
String encoded_message=URLEncoder.encode(textmessage);
String mainUrl="https://alerts.kaleyra.com/api/v4/?";//Your sms gateway provider API
//Prepare parameter string
StringBuilder sbPostData= new StringBuilder(mainUrl);
sbPostData.append("api_key="+authkey);
sbPostData.append("&method="+method);
sbPostData.append("&message="+encoded_message);
sbPostData.append("&to="+phone);
sbPostData.append("&sender="+senderId);
//final string
mainUrl = sbPostData.toString();
Connection con=null;PreparedStatement prepare=null;
try
{
System.out.println(mainUrl);
myURL = new URL(mainUrl);
myURLConnection = myURL.openConnection();
myURLConnection.connect();
reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
String success="OTP sent sucessfully  !! Kindly Check your email";
out.println(success);
//finally close connection
reader.close();

 con=new DBConnection().getCon();
prepare=con.prepareStatement("insert into otpRequest values(0, ?, ?,Now(),'Y')");
prepare.setString(1,phone);
prepare.setString(2,String.valueOf(otp));
int row=prepare.executeUpdate();

if(email!=null){
	String sub ="OTP For Registration";
	Email.mailsend(email, sub, textmessage, "");
}

}
catch (IOException e)
{
e.printStackTrace();
}finally{DBConnection.close(con, prepare, null);} 
%>
</body>
</html>