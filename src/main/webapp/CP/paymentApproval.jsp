<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
String payId = request.getParameter("payId");
String orderId = request.getParameter("orderId");
try{
	DBConnection dbcon = new DBConnection();
	 Connection con = dbcon.getCon();
	 PreparedStatement pst = null, pst1=null;
	 pst = con.prepareStatement("update OrderPaymentDetail set Approve='Y' where orderid="+orderId+"");
	 pst.executeUpdate();
	 
	 pst1 = con.prepareStatement("update OrderTransaction set paymentStatus='Y' where orderId="+orderId+"");
	 pst1.executeUpdate();
	 
	 pst1 = con.prepareStatement("select gstin from  OrderTransaction where orderId="+orderId+"");
	 ResultSet rs = pst1.executeQuery();
	String gstFlag="";
	 if(rs.next()){
		 gstFlag = rs.getString("gstin");
	 }
	 
	 if(gstFlag.equalsIgnoreCase("Yes")){
		 pst = con.prepareStatement("insert into myInvoices values('0','"+orderId+"',curDate());");
		 pst.executeUpdate();
	 }else{
		 pst = con.prepareStatement("insert into numberInvoices values('0','"+orderId+"',curDate());");
		 pst.executeUpdate();
	 }
	 
	 
	 DBConnection.close(con, pst, rs);
		
		response.sendRedirect("pendingPaymentApproval");
}catch(Exception e){
	e.printStackTrace();
}


%>
</body>
</html>