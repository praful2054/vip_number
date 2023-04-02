<%@page import="com.techgate.util.GeneralFunction"%>
<%@page import="java.util.List"%>
<%@page import="com.techgate.domain.Category"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
	<%
		String vParentCategoryId = request.getParameter("vParentCategoryId");
		ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext)application.getAttribute("context");
		GeneralFunction generfunc = (GeneralFunction) context.getBean("generalFunction");
		List<Category> subCategoryList = generfunc.getSubCategoriesList(vParentCategoryId);
		
	%>
	
<select style="width:250px" name="sub_cate_id" id="sub_cate_id" >
				<option value="select">select</option>
				<%
					for(Category subCategory : subCategoryList){
				%>
				<option value="<%= subCategory.getCate_id() %>"><%=subCategory.getCate_name() %></option>
				<%} %>
			</select>