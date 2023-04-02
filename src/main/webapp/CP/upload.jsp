<%@page import="com.techgate.util.GeneralConstants"%>
<%@page import="com.techgate.util.QueryConstants"%>
<%@page import="com.techgate.query.ProductImageQueryParameter"%>
<%@page import="com.techgate.query.AbstractQueryParameter"%>
<%@page import="com.techgate.domain.ProductImage"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%
    String strUploadDir = "";
    String strUploadDir1 = "";
    String strFilePath = "";
    String strDocFileExtN = null;
    String FolderName = request.getParameter("product_id");


    String sTask = null;
    try {
    		strUploadDir = application.getRealPath("/ProductImg/" + FolderName + "/");
    		File f = new File(strUploadDir);

    		f.mkdirs();
            
            DefaultFileRenamePolicy dfrp = new DefaultFileRenamePolicy();
            MultipartRequest multi = new MultipartRequest(request, strUploadDir, 10 * 1024 * 1024, dfrp);
/*
            Enumeration obj1 =  multi.getParameterNames();
            
            while(obj1.hasMoreElements())
            	System.out.println(multi.getParameter((String)obj1.nextElement()));
  */          
            if (multi != null) {
            	
                ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
                DBAction dbAction = (DBAction) context.getBean("dbaction");

                final ProductImage productImage = new ProductImage();
                productImage.setProduct_id(Integer.parseInt(FolderName));
                
                productImage.setImg_loc(multi.getFilesystemName("file"));
                productImage.setImg_seq_no("");
                productImage.setImg_comment("");
                
                AbstractQueryParameter obj = new ProductImageQueryParameter(productImage);
                obj.setSql(QueryConstants.PRODUCT_IMAGE_INSERT_QUERY);
                obj.setAction(GeneralConstants.INSERT);
                dbAction.executeDML(obj);
            }
         

    } catch (Exception e) {
        out.print("error"+e.getMessage());
        e.printStackTrace();
    }

%>

