<%@page import="com.techgate.util.GeneralConstants"%>
<%@page import="com.techgate.util.QueryConstants"%>
<%@page import="com.techgate.query.ProductImageQueryParameter"%>
<%@page import="com.techgate.query.AbstractQueryParameter"%>
<%@page import="com.techgate.domain.ProductImage"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
DBAction dbAction = (DBAction) context.getBean("dbaction");

final ProductImage productImage = new ProductImage();
productImage.setProduct_img_id(Integer.parseInt(request.getParameter("productImageId")));


productImage.setImg_seq_no(request.getParameter("imgSeqNo"));
productImage.setImg_comment(request.getParameter("imgComment"));

AbstractQueryParameter obj = new ProductImageQueryParameter(productImage);
obj.setSql(QueryConstants.PRODUCT_IMAGE_UPDATE_QUERY);
obj.setAction(GeneralConstants.UPDATE);
dbAction.executeDML(obj);
response.sendRedirect("productImageView?productId="+request.getParameter("productId"));
%>