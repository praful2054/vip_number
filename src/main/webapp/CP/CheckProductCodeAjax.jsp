<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.util.StringUtils"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="com.techgate.util.QueryConstants"%>
<%@page import="com.techgate.domain.Product"%>
<%
	ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
	DBAction dbAction = (DBAction) context.getBean("dbaction");
    String productCode = request.getParameter("vProdCode");
	Product product = dbAction.getSingleData(QueryConstants.PRODUCT_CODE_SINGLE_DATE_QUERY,Product.class,productCode);
	
	if(product == null) {
		%>
			<input type="hidden" name="hdnProductCode" id="hdnProductCode" value="Y">
		<%
	} else {
		%>
		Product Code Already Exist
		<input type="hidden" name="hdnProductCode" id="hdnProductCode" value="N">
		<%
	}
%>
