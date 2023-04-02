
<%@page import="com.techgate.util.QueryConstants"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
    ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
	DBAction dbAction = (DBAction) context.getBean("dbaction");
	String id = request.getParameter("id");
    if (request.getParameter("type").equals("product")) {
    	dbAction.delete(QueryConstants.PRODUCT_DELETE_QUERY, new Object[]{id});
    	dbAction.delete(QueryConstants.PRODUCT_IMAGE_DELETE_QUERY_WITH_PRODUCTID, new Object[]{id});
    	dbAction.delete(QueryConstants.PRODUCT_RATE_DELETE_QUERY, new Object[]{id});
        response.sendRedirect("productView");
    } else if (request.getParameter("type").equals("productimage")) {
		dbAction.delete(QueryConstants.PRODUCT_IMAGE_DELETE_QUERY, new Object[]{id});
        response.sendRedirect("productImageView?productId="+request.getParameter("productId"));
    } else if (request.getParameter("type").equals("categories")) {
		dbAction.delete(QueryConstants.CATEGORY_DELETE_QUERY, new Object[]{id});
        response.sendRedirect("categoryView");
    } else if (request.getParameter("type").equals("customer")) {
		dbAction.delete(QueryConstants.CUSTOMER_LOGIN_DETAILS_DELETE_QUERY, new Object[]{id});
		dbAction.delete(QueryConstants.CUSTOMER_SHIPPING_ADDRESS_DELETE_QUERY_WITH_CUSTOMERID, new Object[]{id});
		dbAction.delete(QueryConstants.CUSTOMER_BILLING_ADDRESS_DELETE_QUERY_WITH_CUSTOMERID, new Object[]{id});
        response.sendRedirect("customerDetails");
    }else if (request.getParameter("type").equals("coupoun")) {
    	dbAction.delete(QueryConstants.PRODUCT_coupoun_DELETE_QUERY, new Object[]{id});
        response.sendRedirect("coupounsView");
    }else if (request.getParameter("type").equals("Subscription")) {
    	dbAction.delete(QueryConstants.newsletter_DELETE_QUERY, new Object[]{id});
        response.sendRedirect("newsletters");
    }else if (request.getParameter("type").equals("employee")) {
    	dbAction.delete(QueryConstants.employee_DELETE_QUERY, new Object[]{id});
        response.sendRedirect("employeeDetails");
    }else if (request.getParameter("type").equals("vendor")) {
    	dbAction.delete(QueryConstants.vendor_delete_Query, new Object[]{id});
    	dbAction.delete(QueryConstants.vendor_product_delete_Query, new Object[]{id});
    	dbAction.delete(QueryConstants.vendor_product_delete_Query_Clean);
    	
        response.sendRedirect("VendorDetails?status="+request.getParameter("status"));
    }else if (request.getParameter("type").equals("vendorpayment")) {
    	dbAction.delete(QueryConstants.vendor_payment_delete_Query, new Object[]{id});
        response.sendRedirect("vendorTotalDebit?vendorId="+request.getParameter("vendorId"));
    }else if (request.getParameter("type").equals("vendorProductDelete")) {
    	dbAction.delete(QueryConstants.vendor_Product_Sold_update, new Object[]{id});
        response.sendRedirect("deleteVendorProduct?status=Sucess");
    }
%>