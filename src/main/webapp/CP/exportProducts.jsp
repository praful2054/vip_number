<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.techgate.domain.ProductOtherDetail"%>
<%@page import="com.techgate.util.GeneralDAO"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="com.techgate.util.QueryConstants"%>
<%@page import="com.techgate.domain.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
            
            <%
            String eid=(String)session.getAttribute("euserid"); 
            if(eid==null){
            	response.sendRedirect("login");
            }else{
            response.setContentType("application/vnd.ms-excel");
				response.setHeader("Content-Disposition", "attachment; filename=Numbers.xls");
				
            String  CateName="";
			
			ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
			DBAction dbAction = (DBAction) context.getBean("dbaction");
			String status = request.getParameter("status")==null?"Available":request.getParameter("status");
			//System.out.println(QueryConstants.PRODUCT_ADMIN_PANEL_QUERY);
			List<Product> productList = null;
			if(status.equalsIgnoreCase("ALL")){
				productList = dbAction.getDataList(QueryConstants.PRODUCT_ADMIN_PANEL_QUERY, Product.class);
			}else{
				productList = dbAction.getDataList(QueryConstants.PRODUCT_ADMIN_Filter_QUERY, Product.class, status);
			}
			
			GeneralDAO gdao = new  GeneralDAO();
			DateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			DateFormat tformat = new SimpleDateFormat("MM/dd/yyyy");
			DateFormat myformat = new SimpleDateFormat("dd MM yyyy");
			
			
			//DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd MM yyyy");
		    //LocalDate localDate = LocalDate.now();
	        //String d1 = dtf.format(localDate);
	        
	        DateFormat dateFormat = new SimpleDateFormat("dd MM yyyy");
	    	Date date = new Date();
	    	 String d1 = dateFormat.format(date);    
	        Date dd = null;
            %>
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>Category id</th>
                    <th>Vendor ID</th>
					<th>Vanity Number</th>
					<th>Parent Operator</th>
					<th>Current Operator</th>
					<th>Circle</th>
					<th>Number Status</th>
					<th>Dealer Name</th>
					<th>Dealer Contact</th>
					<th>Rate In Ruppes</th>
					<th>Vendor Rate</th>
					<th>Status</th>	
					<th>Sum Total</th>
					<th>Vendor Name</th>
					<th>Updated Date</th>
					
                </tr>
                </thead>
                <tbody>
                <%
				                Date dateBefore = null, dateAfter=null;
				                long difference = 0,daysBetween=0;
				                String updatedby="",actdate="";
				                int sr=0;
                                       for(Product details : productList){
												CateName=""; dateBefore = null; dateAfter=null;difference = 0;daysBetween=0;updatedby="";actdate="";
												CateName =  details.getCate_name(); //gdao.getCateDetails(details.getCate_id());
												//ProductOtherDetail productOtherDetail = dbAction.getSingleData(QueryConstants.PRODUCT_RATE_SINGLE_DATA_QUERY, ProductOtherDetail.class, details.getProduct_id());
												
												
												actdate = details.getSizeheight()==null?"": details.getSizeheight();
												actdate = actdate.trim();
												actdate = actdate.replaceAll(" ", "");
												if(actdate==null || actdate.isEmpty() || actdate.equalsIgnoreCase("") || actdate.equalsIgnoreCase(" ")){}else{
													//System.out.println("d1 >>>>> "+d1);
													//System.out.println("details.getSizeheight() >>>>> "+actdate);
													
													dd = tformat.parse(details.getSizeheight());
													dateAfter  = myformat.parse(d1);
													dateBefore = myformat.parse(myformat.format(dd));
											       
												 difference = dateAfter.getTime() - dateBefore.getTime();
											        daysBetween = (difference / (1000*60*60*24));
												}
												
												
												if(details.getUpdated_by()==null || !details.getUpdated_by().contains("@")){
													updatedby = details.getUpdated_by()==null?"":details.getUpdated_by();
												}else{
													int index = details.getUpdated_by().indexOf('@');
													//e//mail = email.substring(0,index);
													updatedby = details.getUpdated_by().substring(0,index);
												}
												
												if(updatedby==null || updatedby.equals("")){
													updatedby = details.getCreated_by()==null?"":details.getCreated_by();
													if(updatedby.contains("@")){
														int index = updatedby.indexOf('@');
														updatedby = updatedby.substring(0,index);
													}else{
														updatedby = details.getCreated_by()==null?"":details.getCreated_by();
													}
													
													//e//mail = email.substring(0,index);
													
												}
												
												sr++;
										%>

                                        <tr>
                                        		<td><%=details.getCate_id() %></td>
                                        		<td><%=details.getVendor_id()%></td>
												<td><%=details.getNumber() %></td>
												<td><%=details.getProductCode() %></td>
												<td><%=details.getProductBrand() %></td>
												<td><%=details.getPacking() %></td>
												<td><%=details.getVegProduct()%></td>
												<td><%=details.getBuyerName()%></td>
												<td><%=details.getBuyerContact()%></td>
												<td><%=details.getRateInRupee() %></td>
												<td><%=details.getRateblack()%></td>
												<td><%=details.getNumber_status()%></td>
												<td><%=details.getLiters() %>=<%=details.getTrap() %></td>
												<td><%=details.getVendorname()%></td>
												<%if(updatedby==null){ %>
												<td><%= format.format(details.getUpdated_date()) %></td>
												<%} else{%>
												<td><%= format.format(details.getUpdated_date()) %><font size="1"> by <%=updatedby%></font></td>
												<%} %>
												
												
												
                                            </tr>
                                        <%
                                            }
                                       
                                       
            
                                        %>
                </tbody>
               
              </table>

<%} %>
