<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.techgate.dbaction.DBAction"%>
<%@page import="java.util.List"%>
<%@page import="com.techgate.domain.OrderTransaction"%>
<%@page import="com.techgate.util.QueryConstants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>
<%
String eid=(String)session.getAttribute("euserid"); 
if(eid==null){
	response.sendRedirect("login");
}else{
%>
<body>
               <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                <th>SR NO</th>
                 <th>Order No</th>
                <th>Order Date</th>
                <th>Order Update Date</th>
                <th>Number</th>
                <th>Name</th>
			    <th>Mobile No</th>
			    <th>Email</th>
			    <th>Number Status</th>
			    <th>Assign TO</th>
			    <th>Number Rate</th>
			    <th>Order Status</th>
			    <th>Payment Status</th>
			    <th>Process Status</th>
                </tr>
                </thead>
                <tbody>
               <%
               try{
               response.setContentType("application/vnd.ms-excel");
				response.setHeader("Content-Disposition", "attachment; filename=Orders Reports.xls");
				String profile = (String) session.getAttribute("profile");
				String id=(String)session.getAttribute("euserid"); 
				
						               SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
						               SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						               String status = request.getParameter("status")==null?"Available":request.getParameter("status");
                                        DBConnection dbcon = new DBConnection();
                                		Connection con = dbcon.getCon();
                                		Statement stmt =  con.createStatement();
                                		Statement stmt2 =  con.createStatement();
                                		ResultSet rs=null, res=null;
                                		int sr=0;
                                        String payment_status="",Full_Name="",empId="",processStatus="",CustEmail="";
                                        int discount=0,flatDiscount=0,finalDiscount=0, rate=0, percentageDiscount=0;
                                        if(status.equalsIgnoreCase("ALL")){
                                        	rs =  stmt.executeQuery("select ot.orderId, ot.orderAcceptedDate, ot.orderPlacedDate,ot.orderTotal,ot.paymentStatus,ot.orderStatus,ot.Emp_id,ot.channel,ot.gstin,ot.cust_id,ot.updatedDate,ot.currency,cb.firstName,cb.contactNo1,cb.companyName,pd.number,pd.vegProduct,pd.packing,"+
                                            		" op.productColor,pd.buyerName,vd.firstname as vendorName, po.rateInRupee, po.rateblack, op.discount, op.flatDiscount"+  
                                            		" from OrderTransaction ot, CustomerBillingDetails cb, ProductDetails pd, vendorDetails vd, ProductOtherDetails po, OrderPurchaseDetails op "+
                                            		" where "+
                                            		" ot.cust_id = cb.cust_id and op.orderId = ot.orderId and op.product_id = pd.product_id and op.product_id = po.product_id and pd.vendor_id = vd.id  order by ot.updatedDate desc,ot.orderId desc");
                                        }else{
                                        	rs =  stmt.executeQuery("select ot.orderId, ot.orderAcceptedDate, ot.orderPlacedDate,ot.orderTotal,ot.paymentStatus,ot.orderStatus,ot.Emp_id,ot.channel,ot.gstin,ot.cust_id,ot.updatedDate,ot.currency,cb.firstName,cb.contactNo1,cb.companyName,pd.number,pd.vegProduct,pd.packing,"+
                                            		" op.productColor,pd.buyerName,vd.firstname as vendorName, po.rateInRupee, po.rateblack, op.discount, op.flatDiscount"+  
                                            		" from OrderTransaction ot, CustomerBillingDetails cb, ProductDetails pd, vendorDetails vd, ProductOtherDetails po, OrderPurchaseDetails op "+
                                            		" where "+
                                            		" ot.cust_id = cb.cust_id and op.orderId = ot.orderId and op.product_id = pd.product_id and op.product_id = po.product_id and pd.vendor_id = vd.id and ot.orderStatus='"+status+"' order by ot.updatedDate desc,ot.orderId desc");
                                        }
                                        while(rs.next()){
                                    		
                                        	Full_Name="";empId="";CustEmail="";
                                        	empId = rs.getString("Emp_id");
                                        	if(empId!=null || !empId.isEmpty()){
                                        	res =  stmt2.executeQuery("select firstname, lastname from employee where loginId='"+empId+"'");
                                        	if(res.next()){
                                        		Full_Name = res.getString("firstname") +" "+res.getString("lastname");
                                        	  }
                                        	}
                                        	
                                        	res =  stmt2.executeQuery("select emailid from CustomerLoginDetails where cust_id='"+rs.getString("cust_id")+"'");
                                        	if(res.next()){
                                        		CustEmail = res.getString("emailid");
                                        	  }
                                        	
                                        	sr++;
                                        	
                                        	if(rs.getString("paymentStatus").equalsIgnoreCase("N")){
                                        		payment_status="Pending";
                                        	}else if(rs.getString("paymentStatus").equalsIgnoreCase("C")){
                                        		payment_status="COD";
                                        	}else if(rs.getString("paymentStatus").equalsIgnoreCase("Y")){
                                        		payment_status="Paid";
                                        	}else{
                                        		payment_status="NA";
                                        	}
                                        	
                                        	discount=0;flatDiscount=0;finalDiscount=0; rate=0;percentageDiscount=0;
                                       	    discount = rs.getInt("discount");
                                       	    rate = rs.getInt("rateInRupee");
                                       	    flatDiscount = rs.getInt("flatDiscount");
                                       	 
                                       	 if(discount > 0){
                                       		 
                                       		 percentageDiscount = rate * discount /100;
                                       		 rate = rate - percentageDiscount;
                                       	 }else{
                                       		
                                       		 rate = rate-flatDiscount;
                                       	 }
                                       	 
                                       	 //processStatus = rs.getString("productColor")==null?"Order Placed":rs.getString("productColor"); 
										%>
                                        <tr>
                                        <td><%=sr %></td>
                                        <td><%=rs.getString("orderId") %></td>
                                        <%if(rs.getString("orderAcceptedDate")==null || rs.getString("orderAcceptedDate").equals("")){ %>
                                        <td><%=outputFormat.format(inputFormat.parse(rs.getString("orderPlacedDate"))) %></td>
                                        <%}else{ %>
                                        <td><%=outputFormat.format(inputFormat.parse(rs.getString("orderAcceptedDate"))) %></td>
                                        <%} %>
                                         <td><%=outputFormat.format(inputFormat.parse(rs.getString("updatedDate"))) %></td>
                                        <td><%=rs.getString("number") %></td>
                                       <td>
                                          <%if(rs.getString("companyName")!=null && !rs.getString("companyName").equalsIgnoreCase("") && !rs.getString("companyName").equalsIgnoreCase("null") && !rs.getString("companyName").equalsIgnoreCase("NA")){ %>
                                          <%=rs.getString("companyName") %>
                                          <%} else{ %>
                                          <%=rs.getString("firstName") %>
                                          <%} %>
                                          </td>
                                        <td><%=rs.getString("contactNo1") %></td>
                                        <td><%=CustEmail %></td>
                                        <td><%=rs.getString("vegProduct") %> | <%=rs.getString("packing") %></td>
                                        <td><%=Full_Name %> </td>
                                        <td><%=rate %></td>
                                        <td><%=rs.getString("orderStatus") %></td>
                                         <td><%=payment_status%></td>
											<% if(rs.getString("productColor")!=null && !rs.getString("productColor").equalsIgnoreCase("")){ %>
											<td><%=rs.getString("productColor") %></td>
											<%}else{ %>
											<td>Order Placed</td>
											<%} %>
											
											
											
											</tr>
                                       <%} DBConnection.close(con, stmt, rs);
                                       
               }catch(Exception e){
            	   e.printStackTrace();
               }
                                       %>
               
               
                </tbody>
              </table>

</body>
<%} %>
</html>
