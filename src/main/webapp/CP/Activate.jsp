
<%@page import="com.techgate.util.QueryConstants"%>
<%@page import="com.techgate.dbaction.DBAction"%><%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%
    ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");

	DBAction dbAction = (DBAction) context.getBean("dbaction");
	String activate = request.getParameter("activate");
	String id = request.getParameter("id");
	if (request.getParameter("type").equals("product")) {
		dbAction.update(QueryConstants.PRODUCT_UPDATE_STATUS_QUERY, new Object[]{activate, id});
		response.sendRedirect("pendingApproval");
	} else if (request.getParameter("type").equals("categories")) {
		dbAction.update(QueryConstants.CATEGORY_UPDATE_STATUS_QUERY, new Object[]{activate, id});
		response.sendRedirect("categoryView");
	} else if (request.getParameter("type").equals("customer")) {
		dbAction.update(QueryConstants.CUSTOMER_LOGIN_UPDATE_STATUS_QUERY, new Object[]{activate, id});
	    response.sendRedirect("customerDetails");
	}else if (request.getParameter("type").equals("employee")) {
		dbAction.update(QueryConstants.employee_status_update, new Object[]{activate, id});
	    response.sendRedirect("employeeDetails");
	}else if (request.getParameter("type").equals("vendor")) {
		dbAction.update(QueryConstants.vendor_status_update, new Object[]{activate, id});
		if(activate.equalsIgnoreCase("N")){
			dbAction.update(QueryConstants.vendor_Product_DEActivate_update, new Object[]{"Vendor Deactivated", id});
		}else{
			dbAction.update(QueryConstants.vendor_Product_Activate_update, new Object[]{"Available", id});
		}
		
	    response.sendRedirect("VendorDetails");
	}

%>