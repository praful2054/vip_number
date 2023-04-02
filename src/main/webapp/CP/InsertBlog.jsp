
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    <%
    Connection con = null;
    PreparedStatement pstmt = null;
      String strUploadDir=application.getRealPath("/Blog/");
	  DefaultFileRenamePolicy dfrp=new DefaultFileRenamePolicy();
	  MultipartRequest multi = new MultipartRequest(request,strUploadDir,10*1024*1024,dfrp);
     	if (multi!=null) {
    		 DBConnection dbcon = new DBConnection();
    		 con = dbcon.getCon();
    		 pstmt = con.prepareStatement("insert into Blog values(0,?,?,?,?,'Y',now())");
    		pstmt.setString(1, multi.getParameter("blogName"));
    		pstmt.setString(2, multi.getParameter("blogDescript"));
    		pstmt.setString(3, multi.getParameter("uType"));
    		if(multi.getParameter("uType") != null && multi.getParameter("uType").equalsIgnoreCase("Image"))
    			pstmt.setString(4, multi.getFilesystemName("img_upload"));
    		else
    			pstmt.setString(4, "");
    		
    		pstmt.executeUpdate();
    	 
     	}
     	DBConnection.close(con, pstmt, null);
    response.sendRedirect("viewblog");
    %>