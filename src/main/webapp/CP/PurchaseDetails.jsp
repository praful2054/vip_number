<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.techgate.util.QueryConstants"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="java.util.List"%>
<%@page import="com.techgate.domain.OrderTransaction"%>
<%@page import="com.techgate.domain.PurchaseDetails"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String orderId = request.getParameter("orderId");
String contact = request.getParameter("contact");
	String sql = QueryConstants.ORDER_TRANSACTION_PRDOUCT_DATA_QUERY;
	Object parameter[] = {orderId};
	ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
	DBAction dbAction = (DBAction) context.getBean("dbaction");
	List<PurchaseDetails> purchaseDetails = dbAction.getDataList(sql,PurchaseDetails.class, parameter);
%>
<table border="0"  cellspacing="0" width="100%">
	<tr>
		<td>Order No</td>
		<td>Product ID</td>
		<td>Product Name</td>
		<td>Qty</td>
		<td>Rate</td>
		<td>Total</td>
		<td>UPC NO</td>
		
	</tr>
	<%
		for(PurchaseDetails detail : purchaseDetails) {
	%>
		<tr>
			<td><%=detail.getOrderId()%></td>
			<td><%=detail.getProduct_id()%></td>
			<td><a onclick="window.open('viewNumberDetails?Number=<%=detail.getProductName()%>&address=ordershipping', '_blank', 'height=500, width=550, left=150, top=150,  titlebar=no, toolbar=no, addressbar=no, menubar=no, location=no, resizable=no');" href="#"><%=detail.getProductName() %></a></td>
			<td><%=detail.getQty() %></td>
			<td><%=detail.getProductprice()%></td>
			<td><%=detail.getNetAmount() %></td>
			<td><a onclick="window.open('shippingDetails?orderId=<%=detail.getId()%>&contact=<%=contact%>&productName=<%=detail.getProductName()%>', '_blank', 'height=400, width=700, left=50, top=150,  titlebar=no, toolbar=no, addressbar=no, menubar=no, location=no, resizable=no');" href="#">UPC NO</a></td>			
		</tr>
	<%}%>
</table>
</body>
</html>