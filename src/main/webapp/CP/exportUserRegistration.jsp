<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="java.text.Format"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
			String id=(String)session.getAttribute("euserid"); 
    		  if(id==null){
  				response.sendRedirect("login");
  			}else{
  			  String status = request.getParameter("status");
  				 String profile = (String) session.getAttribute("profile");
  				String type = request.getParameter("type");
  				response.setContentType("application/vnd.ms-excel");
  				response.setHeader("Content-Disposition", "attachment; filename=Customers.xls");
		%>
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>SR NO</th>
					<th>Name</th>
					<th>Company Name</th>
					<th>GST NO</th>
					<th>Contact NO</th>
					<th>Email ID</th>
					<th>Address</th>
					<th>State</th>
					<th>Pincode</th>											
					<th>Created Date</th>
                </tr>
                </thead>
                <tbody>
                <%
                SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                        int sr=0;
						                DBConnection dbcon = new DBConnection();
						                Connection con = dbcon.getCon();
						                Statement stmt = con.createStatement();
						                ResultSet res = stmt.executeQuery("select cl.cust_id,cl.emailid,cl.createdDate, cb.firstName,cb.contactNo1,cb.state,cb.city,cb.address,cb.companyName,cb.gstinNO,cb.pincode,cl.status from CustomerLoginDetails cl, CustomerBillingDetails cb where cl.cust_id= cb.cust_id order by cl.createdDate desc ");
                                        while (res.next()){
                
                                       sr++;
										
										
										%>
                                        <tr>
                                            <td class="center"><%=sr %></td>
                                            <td class="center"><%=res.getString("firstName") %></td>
                                            <td class="center"><%=res.getString("companyName") %></td>
                                            <td class="center"><%=res.getString("gstinNO") %></td>
                                            <td class="center"><%=res.getString("contactNo1") %></td>
                                            <td class="center"><%=res.getString("emailid") %></td>
                                            <td class="center"><%=res.getString("address") %></td>
                                            <td class="center"><%=res.getString("state") %></td>
                                            <td class="center"><%=res.getString("pincode") %></td>
                                              <td class="center"><%=outputFormat.format(inputFormat.parse(res.getString("createdDate"))) %></td>
                                           
                                           
                                            </tr>
                                       <%}DBConnection.close(con, stmt, res); %>
                </tbody>
              </table>

 

  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->


<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<%} %>
