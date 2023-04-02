<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.techgate.connection.DBConnection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<!-- saved from url=(0067)http://crm.techgate.in/tax-invoice?projId=74&custId=21&invoiceNo=47 -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    
    <title>VIP NUMBER STORE | Statement</title>
    
    <style>
    .invoice-box{
        max-width:800px;
        margin:auto;
        padding:30px;
        border:2px solid #ccc;
        font-size:16px;
        line-height:24px;
        font-family:'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
        color:#555;
    }
    
    .invoice-box table{
        width:100%;
        line-height:inherit;
        text-align:left;
    }
    
    .invoice-box table td{
        padding:5px;
        vertical-align:top;
    }
    
    .invoice-box table tr td:nth-child(2){
        text-align:right;
    }
    
    .invoice-box table tr.top table td{
        padding-bottom:20px;
    }
    
    .invoice-box table tr.top table td.title{
        font-size:45px;
        line-height:45px;
        color:#333;
    }
    
    .invoice-box table tr.information table td{
        padding-bottom:0px;
    }
    
    .invoice-box table tr.heading td{
        background:#ff8400;
        border-bottom:1px solid #ddd;
        font-weight:bold;
		color:#fff;
    }
    
    .invoice-box table tr.details td{
        padding-bottom:20px;
    }
    
	.invoice-box a{
	color:#555;
	text-decoration:none;	
	}
	
	.numberfon p{
		margin:0px;
	}
	
    .invoice-box table tr.item td{
        border-bottom:1px solid #9fcc3b;
    }
    
    .invoice-box table tr.item.last td{
        border-bottom:none;
    }
    
    .invoice-box table tr.total td:nth-child(2){
        border-top:2px solid #eee;
        font-weight:bold;
    }
    
    @media only screen and (max-width: 600px) {
        .invoice-box table tr.top table td{
            width:100%;
            display:block;
            text-align:center;
        }
        
        .invoice-box table tr.information table td{
            width:100%;
            display:block;
            text-align:center;
        }
    }
    </style>
<style type="text/css">.backpack.dropzone {
  font-family: 'SF UI Display', 'Segoe UI';
  font-size: 15px;
  text-align: center;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 250px;
  height: 150px;
  font-weight: lighter;
  color: white;
  will-change: right;
  z-index: 2147483647;
  bottom: 20%;
  background: #333;
  position: fixed;
  user-select: none;
  transition: left .5s, right .5s;
  right: 0px; }
  .backpack.dropzone .animation {
    height: 80px;
    width: 250px;
    background: url("chrome-extension://lifbcibllhkdhoafpjfnlhfpfgnpldfl/assets/backpack/dropzone/hoverstate.png") left center; }
  .backpack.dropzone .title::before {
    content: 'Save to'; }
  .backpack.dropzone.closed {
    right: -250px; }
  .backpack.dropzone.hover .animation {
    animation: sxt-play-anim-hover 0.91s steps(21);
    animation-fill-mode: forwards;
    background: url("chrome-extension://lifbcibllhkdhoafpjfnlhfpfgnpldfl/assets/backpack/dropzone/hoverstate.png") left center; }

@keyframes sxt-play-anim-hover {
  from {
    background-position: 0px; }
  to {
    background-position: -5250px; } }
  .backpack.dropzone.saving .title::before {
    content: 'Saving to'; }
  .backpack.dropzone.saving .animation {
    background: url("chrome-extension://lifbcibllhkdhoafpjfnlhfpfgnpldfl/assets/backpack/dropzone/saving_loop.png") left center;
    animation: sxt-play-anim-saving steps(59) 2.46s infinite; }

@keyframes sxt-play-anim-saving {
  100% {
    background-position: -14750px; } }
  .backpack.dropzone.saved .title::before {
    content: 'Saved to'; }
  .backpack.dropzone.saved .animation {
    background: url("chrome-extension://lifbcibllhkdhoafpjfnlhfpfgnpldfl/assets/backpack/dropzone/saved.png") left center;
    animation: sxt-play-anim-saved steps(20) 0.83s forwards; }

@keyframes sxt-play-anim-saved {
  100% {
    background-position: -5000px; } }
</style></head>

<%
DBConnection dbcon = new DBConnection();
Connection con = dbcon.getCon();
Statement stmt =  con.createStatement();
Statement stmt1 =  con.createStatement();
ResultSet rs =null;

String VendorId = (String)session.getAttribute("vendorId"); 
String firstname="",address="",address2="",contactno1="";
rs = stmt1.executeQuery("select * from vendorDetails where id ='"+VendorId+"' ");
if(rs.next()) {
	firstname = rs.getString("firstname");
	address = rs.getString("address");
	address2 = rs.getString("address2");
	contactno1 = rs.getString("contactno1");
	
}

%>
<body>
    <div class="invoice-box">
        <table cellpadding="0" cellspacing="0">
            <tbody><tr class="top">
                <td colspan="5">
                    <table>
                        <tbody><tr>
                            <td class="title">
                                <img src="assets/img/logo.png" style="width:50%;height:60%; max-width:300px;">
                            </td>
                            
                            <td>
                             
                                <strong>Statement Date #: <%=new Date()%></strong><br>
                                
                                
                            </td>
                        </tr>
                    </tbody></table>
                </td>
            </tr>
            
            <tr class="information">
                <td colspan="6">
                    <table>
                        <tbody><tr>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                            From<br>
                            <strong>VIP NUMBER STORE</strong><br>
                            Office no.6,BLDG no.1,Sagar Complex,<br>
							Jesal Park Bhayander (E)<br>
							Thane 401105.<br>
							9222222007<br>
							www.NumberWale.com<br>
                            
                            
                            </td>
                            
                            <td width="50%">
                            Bill To<br>
                            <strong><%=firstname %></strong><br>
					          <%=address %><br/><%=address2 %><br/><%=contactno1 %>
                            </td>
                        </tr>
                    </tbody></table>
                </td>
            </tr>
            
            <tr class="">
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr class="heading">
                <td><strong>S.No</strong></td>
                <td align="left" style="text-align:left;"><strong>Item &amp; Description</strong></td>
                <td align="left" style="text-align:left;"><strong>Date</strong></td>
                <td><strong> Payment Date</strong></td>
                <td><strong>Payment Status</strong></td>
                <td><strong>Amount</strong></td>
            </tr>
            <%
            SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            
                                    
            String startDate = request.getParameter("startDate");
    	    String endDate = request.getParameter("endDate");
                            		
                            		int sr=0,rateblack=0, totalPaid=0,totaltobepaid=0,totalpending=0;
                            		String Number="",productprice="", PaymentStatus="";
                            		//ResultSet res = stmt.executeQuery("select op.*,po.rateblack from OrderPurchaseDetails op, OrderTransaction ot, ProductDetails pd, ProductOtherDetails po where pd.vendor_id='"+VendorId+"' and op.product_id = pd.product_id and op.orderId = ot.orderId  and pd.product_id = po.product_id and ot.paymentStatus='Y' and ot.orderStatus='Closed Won' and MONTH(ot.orderPlacedDate)=MONTH(CURRENT_DATE)");
                            		ResultSet res = null;//stmt.executeQuery("select * from  vendorAccounts va  where va.vendorId='"+VendorId+"' and MONTH(orderPayDate)=MONTH(CURRENT_DATE) order by orderPayDate desc");
                            		if(startDate !=null && endDate!=null && !startDate.equals("null") && !endDate.equals("null")){
                            			res = stmt.executeQuery("select * from  vendorAccounts va  where va.vendorId='"+VendorId+"' and  DATE(orderPayDate) between '"+startDate+"' and '"+endDate+"' order by orderPayDate desc");
                            		}else{
                            			res = stmt.executeQuery("select * from  vendorAccounts va  where va.vendorId='"+VendorId+"'  order by orderPayDate desc");
                            		}
                            		
                            		
                            		while(res.next()) {
                                    	sr++;
                                    	rateblack=0;
                                    	rs = stmt1.executeQuery("select po.*, pd.number from ProductDetails pd, ProductOtherDetails po where  pd.product_id = po.product_id and pd.product_id='"+res.getString("productId")+"'");
                                        if(rs.next()) {
                                        	Number = rs.getString("number");
                                        	rateblack = rs.getInt("rateblack");
                                        	productprice = rs.getString("rateInRupee");
                                        }
                                        
                                        if(res.getString("paymentStatus").equalsIgnoreCase("Y")){
                                        	PaymentStatus="PAID";
                                        	totalPaid = totalPaid + rateblack;
                                        }else if(res.getString("payment_Elegible").equalsIgnoreCase("Y")){
                                        	PaymentStatus="To Be Paid";
                                        	totaltobepaid = totaltobepaid + rateblack;
                                        }else if(res.getString("payment_Elegible").equalsIgnoreCase("N")){
                                        	PaymentStatus="Pending";
                                        	totalpending = totalpending + rateblack;
                                        }else if(res.getString("payment_Elegible").equalsIgnoreCase("C")){
                                        	PaymentStatus="Cancelled";
                                        }
     %>
            <tr class="item">
                <td width="10%"><%=sr %></td>
                <td width="20%" align="left" style="text-align:left;">
                
				<div style="float:left; margin:0px; padding:0px;" class="numberfon">
				<%=Number%>
                </div>
                </td>
                <td width="20%"><%=outputFormat.format(inputFormat.parse(res.getString("orderPayDate"))) %></td>
              <%if(PaymentStatus.equals("PAID")){ %>
                <td width="10%" ><%=outputFormat.format(inputFormat.parse(res.getString("updatedDate"))) %></td>
                <%}else{ %>
                <td width="10%"> &nbsp;</td>
                <%} %>
                <td width="20%"><%=PaymentStatus %></td>
                <td width="10%">  <%=rateblack %></td>
            </tr>
			
			
            <%} 
            
                            		if(startDate !=null && endDate!=null && !startDate.equals("null") && !endDate.equals("null")){
                            			res = stmt1.executeQuery("select sum(amount) from vendorPaymentDetails  where vendorId='"+VendorId+"' and  DATE(paymentDate) between '"+startDate+"' and '"+endDate+"' ");	
                            		}else{
                            			res = stmt1.executeQuery("select sum(amount) from vendorPaymentDetails  where vendorId='"+VendorId+"'  ");
                            		}
                                    
									   if(res.next()){
										   totalPaid = res.getInt(1);
									   }
									   
									   int totalcredit=0;
									   if(startDate !=null && endDate!=null && !startDate.equals("null") && !endDate.equals("null")){
										   res = stmt1.executeQuery("select sum(rateblack) from ProductOtherDetails po where po.product_id in (select op.productId from vendorAccounts op where op.vendorId='"+VendorId+"' and op.payment_Elegible in ('Y','N') and  DATE(orderPayDate) between '"+startDate+"' and '"+endDate+"')");   
									   }else{
										   res = stmt1.executeQuery("select sum(rateblack) from ProductOtherDetails po where po.product_id in (select op.productId from vendorAccounts op where op.vendorId='"+VendorId+"' and op.payment_Elegible in ('Y','N') )");
									   }
									   
									  
									   if(res.next()){
										   totalcredit = res.getInt(1);
									   }
            
            %>
            <tr class="total">
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            
            
            <tr class="information">
                <td colspan="6">
                    <table>
                        <tbody>
                        <tr>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td width="25%">&nbsp;</td>
                            <td width="5%">&nbsp;</td>
                            <td width="10%">&nbsp;</td>
                            <td width="5%">&nbsp; </td>
                            <td width="5%">&nbsp; </td>
                           
                            <td width="35%">
                           
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tbody>

  <tr class="item">
   <td>
     <strong>Sum Total: </strong>
     </td>
   <td>&nbsp;</td>
   <td>
     Rs. <%=totalcredit %>
     </td>
 </tr>
  <tr class="item">
   <td>
     <strong>Total Paid: </strong>
     </td>
   <td>&nbsp;</td>
   <td>
     Rs. (-) <%=totalPaid %>
     </td>
 </tr>
   <tr class="item">
   <td>
     <strong>Balance: </strong>
     </td>
   <td>&nbsp;</td>
   <td>
     Rs.  <%=totalcredit - totalPaid %>
     </td>
 </tr>
 
 
     
                            </tbody></table>

                            </td>
                        </tr>
                        
                        
                      
                    </tbody></table>
                </td>
            </tr>
        </tbody></table>
    </div>


</body></html>