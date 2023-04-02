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
    
    <title>VIP NUMBER STORE | Invoice</title>
    
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
        border-bottom:1px solid #ff8400;
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
SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");
SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String orderId=request.getParameter("orderId");
String custId=request.getParameter("custId");
double totalPayment=0,shippingCharge=0;
String payment_date="",gstFlag="",companyName="",gstinNo="",invoice_id="",custName="",contactNo="",emailId="",address="",pincode="",state="",orderPlacedDate="",orderTotal="",paymentStatus="",card_name="",tracking_id="",bank_ref_no="",payment_mode="";

DBConnection dbcon = new DBConnection();
Connection con = dbcon.getCon();
Statement stmt =  con.createStatement();
ResultSet res1 = null, res2=null, res3=null;
ResultSet res = stmt.executeQuery("select * from CustomerBillingDetails where cust_id='"+custId+"'");
if(res.next()) {
	custName = res.getString("firstName");
	contactNo = res.getString("contactNo1");
	address = res.getString("address");
	pincode = res.getString("pincode");
	state = res.getString("state").trim();
	companyName = res.getString("companyName");
	gstinNo = res.getString("gstinNO")==null?"":res.getString("gstinNO");
}

res1 = stmt.executeQuery("select * from OrderTransaction where orderId='"+orderId+"'");
if(res1.next()) {
	orderPlacedDate = res1.getString("orderPlacedDate");
	orderTotal = res1.getString("orderTotal");
	paymentStatus = res1.getString("paymentStatus");
	gstFlag = res1.getString("gstin");
	shippingCharge = res1.getDouble("shippingCharge");
}

res1 = stmt.executeQuery("select * from OrderPaymentDetail where orderId='"+orderId+"' and status in ('TXN_SUCCESS','captured')");
if(res1.next()) {
	tracking_id = res1.getString("tracking_id");
	bank_ref_no = res1.getString("bank_ref_no");
	payment_mode = res1.getString("payment_mode");
	card_name = res1.getString("card_name");
	payment_date = res1.getString("payment_date");
	
}

res1 = stmt.executeQuery("select sum(amount) from OrderPaymentDetail where orderId='"+orderId+"' and status='TXN_SUCCESS'");
if(res1.next()) {
	totalPayment = res1.getDouble(1);
	
}


res1 = stmt.executeQuery("select * from myInvoices where orderID='"+orderId+"'");
if(res1.next()) {
	invoice_id = res1.getString("id");
	invoice_id = "INV-000"+invoice_id;
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
                                <img src="assets/img/logo.png" style="width:35%;height:60%; max-width:300px;">
                            </td>
                            
                            <td>
                             <%if(paymentStatus.equalsIgnoreCase("Y")){ %>
                                <strong>Invoice Date:</strong> <%=outputFormat.format(inputFormat.parse(payment_date)) %><br>
                                <%}else{ %>
                                <strong>Invoice Date:</strong> <%=outputFormat.format(inputFormat.parse(orderPlacedDate)) %><br>
                                <%} %>
                                <strong>Invoice No #: <%=invoice_id%></strong><br>
                                <strong>Order ID:</strong> VN000<%=orderId %><br>
                                
                            </td>
                        </tr>
                    </tbody></table>
                </td>
            </tr>
            
            <tr class="information">
                <td colspan="5">
                    <table>
                        <tbody><tr>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                            From<br>
                            <strong>Vip Number Store</strong><br>
                            Old idea point, Main market,<br>
                             Police station Road, Anupgarh<br>
                              Distt. Sri ganganagar<br>
                               Rajasthan 335701<br>
                            
                            
                            </td>
                            
                            <td width="50%">
                            Bill To<br>
                            <strong><%if(companyName!=null && !companyName.equals("") ){%><%=companyName%><%}else{%><%=custName %><%} %></strong><br>
					          <%=address %><br/><%=pincode%><br/><%=state%>
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
                <td><strong>Rate</strong></td>
                <td><strong> Discount</strong></td>
                <td><strong>Subtotal</strong></td>
            </tr>
            <%
     int sr=0;int discount=0,flatDiscount=0,finalDiscount=0, rate=0, percentageDiscount=0, sumtotal=0;
     String icon="";
     res2 = stmt.executeQuery("select op.*, po.rateInRupee from OrderPurchaseDetails op, ProductOtherDetails po where op.product_id = po.product_id and op.orderId ='"+orderId+"'");
     while(res2.next()) {
    	 discount=0;flatDiscount=0;finalDiscount=0; rate=0;percentageDiscount=0;icon="";
    	 discount = res2.getInt("discount");
    	 rate = res2.getInt("rateInRupee");
    	 flatDiscount = res2.getInt("flatDiscount");
    	 
    	 if(discount > 0){
    		 icon = "%";
    		 finalDiscount = discount;
    		 percentageDiscount = rate * discount /100;
    		 rate = rate - percentageDiscount;
    		 
    	 }else{
    		 finalDiscount = flatDiscount;
    		 rate = rate - flatDiscount;
    		 
    	 }
    	 
    	 sumtotal = sumtotal + rate;
    	
     	sr++;
     %>
            <tr class="item">
                <td width="10%"><%=sr %></td>
                <td width="60%" align="left" style="text-align:left;">
                <div style="float:left;">
                For Vanity Number  &nbsp;
				</div>
				<div style="float:left; margin:0px; padding:0px;" class="numberfon">
				<%=res2.getString("productName")%>
                </div>
                </td>
              <td width="10%"><%=res2.getInt("rateInRupee") %></td>
                <td width="10%"><%=finalDiscount %> <%=icon %></td>
                <td width="10%"> Rs. <%=rate %></td>
            </tr>
			
			
            <%} %>
            <tr class="total">
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            
            
            <tr class="information">
                <td colspan="5">
                    <table>
                        <tbody>
                        <tr>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td width="38%">&nbsp;</td>
                            <td width="4%">&nbsp;</td>
                            <td width="26%">&nbsp; </td>
                            <td width="4%">&nbsp; </td>
                            <td width="28%">
                           
                            <table width="80%" border="0" cellspacing="0" cellpadding="0">
 <tbody><tr class="item">
   <td>
     <strong>Subtotal: </strong>
     </td>
   <td>&nbsp;</td>
   <td>
     Rs. <%=sumtotal %>
     </td>
 </tr>
 
 <tr class="item">
   <td>
<strong>Total:</strong> </td>
   <td>&nbsp;</td>
   <td> Rs. <%=sumtotal %> </td>
 </tr>     
                            </tbody></table>

                            </td>
                        </tr>
                        <tr>
                          <td colspan="5" align="center">&nbsp;</td>
                        </tr>
                        <tr>
                          <td colspan="5" align="center">"This is system generated invoice and do not require any stamp or signature"</td>
                      </tr>
                      
                    </tbody></table>
                </td>
            </tr>
        </tbody></table>
    </div>


</body></html>