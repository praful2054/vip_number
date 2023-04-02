<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%
String coupoun = request.getParameter("coupoun")==null?"0":request.getParameter("coupoun");
DBConnection dbcon = new DBConnection();
Connection con = dbcon.getCon();
Statement stmt = con.createStatement();
String coupoun_type="", user_for="",userID="";
double total = 0, price = 0, value=0;
ResultSet res = stmt.executeQuery("select * from Coupoun where coupoun_code='"+coupoun+"'");
if(res.next()){
     coupoun_type = res.getString("coupoun_type");
	 user_for = res.getString("user_for");
	 userID = res.getString("user_id");
	 value = Double.parseDouble(res.getString("value"));
	 
}
session.setAttribute("coupoun", coupoun);
//System.out.println("coupoun"+coupoun);
if(value > 0){
%>
<%=value%> % Coupoun Applied Sucessfully Kindly Proceed to Checkout.
<%}else{%>
<b>Invalid Coupoun Code.</b>
<%}%>