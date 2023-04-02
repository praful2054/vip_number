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
  				response.sendRedirect("VIP-login");
  			}else{
  				 String profile = (String) session.getAttribute("profile");
  				String type = request.getParameter("type");
  				response.setContentType("application/vnd.ms-excel");
  				response.setHeader("Content-Disposition", "attachment; filename=Total_Enquires.xls");
		%>
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                     <th>ID</th>
                    <th>Name</th>
                     <th>Mobile No</th>
	    			<th>City</th>
					<th>Status</th>
					<th>Created Date</th>
					<th>Updated Date</th>
					<th>Channel</th>
					<th>Assign TO</th>
                </tr>
                </thead>
                <tbody>
                <%
						                String status = request.getParameter("status");
						                SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
						                SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                        DBConnection dbcon = new DBConnection();
                                		Connection con = dbcon.getCon();
                                		Statement stmt =  con.createStatement();
                                		Statement stmt2 =  con.createStatement();
                                		ResultSet rs=null;
                                		String sql="",empId="",Full_Name="";
                                		String where = "";
                                		if(profile.equalsIgnoreCase("Admin") || profile.equalsIgnoreCase("Lead") || profile.equalsIgnoreCase("SEO")){
                                			
                                				sql = "select * from customerEnquiry order by UpdatedDate desc";
                                			
                                		}else{
                                			
                                				sql = "select * from customerEnquiry where EmployeeId='"+id+"' order by UpdatedDate desc";
                                			
                                		}
                                		
                                		ResultSet res = stmt.executeQuery(sql);
                                        int sr=0;
                                		while(res.next()) {
                                        	
                                        	Full_Name="";empId="";
                                        	empId = res.getString("EmployeeId");
                                        	if(empId!=null || !empId.isEmpty()){
                                        	rs =  stmt2.executeQuery("select firstname, lastname from employee where loginId='"+empId+"'");
                                        	if(rs.next()){
                                        		Full_Name = rs.getString("firstname") +" "+rs.getString("lastname");
                                        	  }
                                        	}
                                        	sr++;
										%>
                                        <tr>
                                        <td class="center"><%=sr %></td>
                                           
                                            <td class="center"><%=res.getString("Full_Name") %></td>
                                            <td class="center"><a onclick="window.open('enquiryHistory?custId=<%=res.getString("id")%>', '_blank', 'height=500, width=550, left=150, top=150,  titlebar=no, toolbar=no, addressbar=no, menubar=no, location=no, resizable=no');" href="#"><%=res.getString("Mobile_NO") %></a></td>
                                            <td class="center"><%=res.getString("city") %></td>
											<td class="center"><%=res.getString("status") %></td>
											<td class="center"><%=outputFormat.format(inputFormat.parse(res.getString("createdDate")))%></td>
											<td class="center"><%=outputFormat.format(inputFormat.parse(res.getString("UpdatedDate")))%></td>
											<td class="center"><%=res.getString("channel")%></td>
											 <td class="center"><%=Full_Name %></td>
													
                                            
                                           
                                            </tr>
                                        <%
                                            }
                                        DBConnection.close(con, stmt, res);
                                        %>
                </tbody>
               
              </table>

 

  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->


<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<%} %>
