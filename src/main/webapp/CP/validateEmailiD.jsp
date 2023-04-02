<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Arrays"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.techgate.query.ProductOtherdDetailQueryParameter"%>
<%@page import="com.techgate.domain.ProductOtherDetail"%>
<%@page import="com.techgate.util.GeneralConstants"%>
<%@page import="com.techgate.util.QueryConstants"%>
<%@page import="com.techgate.query.AbstractQueryParameter"%>
<%@page import="com.techgate.query.ProductQueryParameter"%>
<%@page import="com.techgate.domain.Product"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.techgate.util.GeneralFunction"%>
<%@page import="com.techgate.dbaction.DBAction"%>
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
		try {
			ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application
					.getAttribute("context");
			DBAction dbAction = (DBAction) context.getBean("dbaction");
			GeneralFunction generfunc = (GeneralFunction) context.getBean("generalFunction");
			String strUploadDir = application.getRealPath("/BulkProductFile/");
			String str = "";
			
				File file = new File(strUploadDir+"/"+"deleteFile.csv");
				
				BufferedReader br = new BufferedReader(new FileReader(file));
				br.readLine();
				String productName="";
				Random rand = new Random();
				int fileId = rand.nextInt();
				 DBConnection dbcon = new DBConnection();
				 Connection con = dbcon.getCon();
				 PreparedStatement pst = null, pst1=null;
				 
				while((str = br.readLine()) != null) {
					//out.println(str);
					try{
					String[] values = str.split(",");
					//System.out.println(Arrays.toString(values));
						 pst = con.prepareStatement("delete from  ProductDetails where  number_status='Available' and number='"+values[1].replaceAll("\\s+","").trim()+"'");
						 pst.executeUpdate();

					}catch(Exception e){
						e.printStackTrace();
					}
				}
				br.close();
				DBConnection.close(con, pst, null);
				
			
			
		
	}
		
		catch(Exception e){
			e.printStackTrace();
        } %>
</body>
</html>