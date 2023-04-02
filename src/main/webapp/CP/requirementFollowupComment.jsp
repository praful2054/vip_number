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
try{
	String id=(String)session.getAttribute("euserid"); 
	
	 String profile = (String) session.getAttribute("profile");
	 
	 
	PreparedStatement prepare = null, prepare1=null;
	Connection con=new DBConnection().getCon();
	
		prepare=con.prepareStatement("insert into requirementsfollowup values(0, ?, ?, ?,Now())");
		prepare.setString(1,request.getParameter("enq_id"));
		prepare.setString(2,id);
		prepare.setString(3,request.getParameter("comments"));
		prepare.executeUpdate();
		
		if(profile.equalsIgnoreCase("Admin") || profile.equalsIgnoreCase("Lead")|| profile.equalsIgnoreCase("SEO") || profile.equalsIgnoreCase("Data Entry")){
			prepare1=con.prepareStatement("update requirements set status=?,EmployeeId=?,Buyer_Name=?,Buyer_Contact=?,Buyer_Rate=? where id=? ");
			prepare1.setString(1,request.getParameter("status"));
			prepare1.setString(2,request.getParameter("assignTo"));
			
			prepare1.setString(3,request.getParameter("buyerName"));
			prepare1.setString(4,request.getParameter("buyerContact"));
			prepare1.setString(5,request.getParameter("buyerRate"));
			prepare1.setString(6,request.getParameter("enq_id"));
			prepare1.executeUpdate();
		}else{
		
		prepare1=con.prepareStatement("update requirements set status=? where id=? ");
		prepare1.setString(1,request.getParameter("status"));
		prepare1.setString(2,request.getParameter("enq_id"));
		prepare1.executeUpdate();
		
		}
		
		DBConnection.close(con, prepare, null);
		
		response.sendRedirect("requirementFollowup?id="+request.getParameter("enq_id"));
		
}catch(Exception e){
	out.println(e.getMessage());
	e.printStackTrace();
}
%>


</body>
</html>