package com.techgate.util;

public class QueryConstants {

	//Category Queries
	public static final String CATEGORY_INSERT_QUERY = "insert into categories values(0,?,?,?,?,now(),'Y')";
	public static final String CATEGORY_UPDATE_QUERY = "update categories set cate_parent_id=?,cate_name=?,cate_descript=?,cate_img_loc=?,cate_UpdatedDate=now()  where cate_id=? and status='Y'";
	public static final String CATEGORY_DELETE_QUERY = "delete from categories where cate_id=?";
	public static final String CATEGORY_SINGLE_DATE_QUERY = "select * from categories where cate_id = ?";
	public static final String CATEGORY_PARAENT_ID_QUERY = "select cate_parent_id from categories where cate_id = ?";
	public static final String CATEGORY_ALL_DATE_QUERY = "select * from categories";
	public static final String CATEGORY_CUSTOM_ALL_DATE_QUERY = "select cate1.cate_name parent_cate_name,cate2.* from categories cate1 right join categories cate2 on cate1.cate_id = cate2.cate_parent_id order by parent_cate_name";
	public static final String PARENT_CATEGORY_ALL_DATE_QUERY = "select cate_id,cate_name,cate_img_loc from categories where cate_parent_id=0 and status='Y' order by cate_id asc";
	public static final String PARENT_CATEGORY_DATE_QUERY = "select cate_id,cate_name,cate_img_loc from categories where cate_parent_id=? and status='Y'";
	public static final String SUB_CATEGORY_ALL_DATE_QUERY = "select cate_id,cate_name,cate_img_loc,cate_parent_id from categories where cate_parent_id!=0 and status='Y'";
	public static final String CATEGORY_UPDATE_STATUS_QUERY = "update categories set cate_UpdatedDate=now(),status=?  where cate_id=?";
	
	//Product Queries
	public static final String PRODUCT_INSERT_QUERY = "insert into ProductDetails values(0,?,?,?,?,?,?,?,?,?,?,now(),?,?,?,?,?,?,?,?,?,?,now(),?,?,?,?,?,?,?,?,?,?,?)";
	public static final String PRODUCT_UPDATE_QUERY = "update ProductDetails set cate_id=?,productName=?,natureOfProduct=?,indication=?,useDirection=?,packing=?,descript=?,vegProduct=?,additinalDescription=?,type=?,productCode=?,productBrand=?,productColor=?,sizeheight=?,sizelength=?,liters=?,trap=?,updated_date=now(),updated_by=?,recharge_validity=?,lastcall=?,nextCall=?,number=?,buyerName=?,currentNumber=?,status=?,buyerContact=?,Comments=?,vendor_id=? where product_id=?";
	public static final String PRODUCT_DELETE_QUERY = "delete from ProductDetails where product_id=?";
	public static final String PRODUCT_coupoun_DELETE_QUERY = "delete from Coupoun where coupoun_id=?";
	public static final String PRODUCT_SINGLE_DATE_QUERY = "select * from ProductDetails where product_id=? and status='Y'";
	public static final String PRODUCT_Edit_SINGLE_DATE_QUERY = "select * from ProductDetails where product_id=?";
	public static final String PRODUCT_Number_SINGLE_DATE_QUERY = "select * from ProductDetails where number=?";
	public static final String PRODUCT_CODE_SINGLE_DATE_QUERY = "select productCode from ProductDetails where productCode=? and status='Y'";
	public static final String PRODUCT_ALL_DATE_QUERY = "select * from ProductDetails";
	public static final String PRODUCT_ADMIN_DATE_QUERY = "select * from ProductDetails where status='Y' order by product_id desc";
	public static final String PRODUCT_ADMIN_PANEL_QUERY = "select pd.*, pod.rateInRupee, pod.rateblack, cd.cate_name from ProductDetails pd, ProductOtherDetails pod, categories cd where  pd.product_id = pod.product_id and pd.cate_id=cd.cate_id  and pd.status='Y' order by pd.product_id desc";
	public static final String PRODUCT_ADMIN_Filter_QUERY = "select pd.*, pod.rateInRupee, pod.rateblack,pod.discount,pod.flatdiscountedrate, cd.cate_name, vd.firstname as vendorname from ProductDetails pd, ProductOtherDetails pod, categories cd, vendorDetails vd where  pd.product_id = pod.product_id and pd.cate_id=cd.cate_id and pd.vendor_id=vd.id and pd.status='Y' and pd.number_status=? order by pd.product_id desc";
	public static final String PRODUCT_Pending_EDITING_PANEL_QUERY = "select pd.*, pod.rateInRupee, pod.rateblack, cd.cate_name, vd.firstname as vendorname from ProductDetails pd, ProductOtherDetails pod, categories cd, vendorDetails vd where  pd.product_id = pod.product_id and pd.cate_id=cd.cate_id and pd.vendor_id=vd.id and pd.status='Y' and pd.number_status='Available' and length(pd.productName) < 25 order by pd.product_id desc";
	public static final String PRODUCT_APPROVAL_DATE_QUERY = "select * from ProductDetails where status='N'";
	public static final String PRODUCT_ALL_Vendor_QUERY = "select * from ProductDetails where vendor_id=?";
	public static final String PRODUCT_UPDATE_STATUS_QUERY = "update ProductDetails set status=?,updated_date=now() where product_id=?";
	public static final String PRODUCT_SINGLE_DETAILS_QUERY = "select pd.product_id product_id,pd.productName,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount from ProductDetails pd, ProductOtherDetails pod where pd.product_id = pod.product_id and pd.product_id = ?  ";
	
	//Product Image Queries
	public static final String PRODUCT_IMAGE_INSERT_QUERY = "insert into ProductImageDetails values(0,?,?,?,?,now())";
	public static final String PRODUCT_IMAGE_UPDATE_QUERY = "update ProductImageDetails set img_seq_no=?,img_comment=?,updated_date=now() where product_img_id=?";
	public static final String PRODUCT_IMAGE_DELETE_QUERY = "delete from ProductImageDetails where product_img_id=?";
	public static final String PRODUCT_IMAGE_DELETE_QUERY_WITH_PRODUCTID = "delete from ProductImageDetails where product_id=?";	
	public static final String PRODUCT_IMAGE_SINGLE_DATE_QUERY = "select * from ProductImageDetails where product_img_id=?";
	public static final String PRODUCT_IMAGE_ALL_DATE_QUERY = "select * from ProductImageDetails where product_id=?";
	public static final String PRODUCT_IMAGE_DISPLAY_DATA_QUERY = "select * from ProductImageDetails where product_img_id=? and img_seq_no='1'";
	
	//Product Rate Queries
	public static final String PRODUCT_RATE_INSERT_QUERY = "insert into ProductOtherDetails values(0,?,?,?,?,?,?,?,?,?,now(),?,now())";
	public static final String PRODUCT_RATE_UPDATE_QUERY = "update ProductOtherDetails set rateInRupee=?,rateInDollar=?,discount=?,flatdiscountedrate=?,ratewhite=?,rateivory=?,rateblack=?,updated_by=?,updated_date=now() where product_id=?";
	public static final String PRODUCT_RATE_DELETE_QUERY = "delete from ProductOtherDetails where product_id=?";
	public static final String PRODUCT_RATE_SINGLE_DATA_QUERY = "select * from ProductOtherDetails where product_id=?";
	
	
	//Customer Login Details Queries
	public static final String CUSTOMER_LOGIN_DETAILS_INSERT_QUERY = "insert into CustomerLoginDetails values(0,?,?,?,?,now(),now(),'Y')";
	public static final String CUSTOMER_LOGIN_DETAILS_UPDATE_QUERY = "update CustomerLoginDetails set emailid=?,password=?,forgetpasswordquestion=?,answer=?,updatedDate=now() where cust_id=?";
	public static final String CUSTOMER_LOGIN_DETAILS_DELETE_QUERY = "delete from CustomerLoginDetails where cust_id=?";
	public static final String CUSTOMER_LOGIN_DETAILS_SINGLE_DATE_QUERY_USING_ID = "select * from CustomerLoginDetails where cust_id=?";
	public static final String CUSTOMER_LOGIN_DETAILS_SINGLE_DATE_QUERY = "select * from CustomerLoginDetails where emailid=?";
	public static final String CUSTOMER_LOGIN_QUERY = "select * from CustomerLoginDetails where emailid=? and password=? and status='Y'";
	public static final String CUSTOMER_LOGIN_QUERY_MObile = "select * from CustomerLoginDetails where answer=? and password=? and status='Y'";
	public static final String CUSTOMER_LOGIN_DETAILS_ALL_DATA_QUERY = "select * from CustomerLoginDetails order by cust_id desc";
	public static final String CUSTOMER_LOGIN_UPDATE_STATUS_QUERY = "update CustomerLoginDetails set status=?,updatedDate=now() where cust_id=?";
	public static final String CUSTOMER_LOGIN_QUERY_OTP = "select * from CustomerLoginDetails where emailid=? and status='Y'";
	public static final String CUSTOMER_LOGIN_QUERY_MObile_OTP = "select * from CustomerLoginDetails where answer=? and status='Y'";
	
	//Customer Shipping Address Queries
	public static final String CUSTOMER_SHIPPING_ADDRESS_INSERT_QUERY = "insert into CustomerShippingDetails values(0,?,?,?,?,?,?,?,?,?,?,now(),now(),?,?)";
	public static final String CUSTOMER_SHIPPING_ADDRESS_UPDATE_QUERY = "update CustomerShippingDetails set firstName=?,lastName=?,contactNo1=?,contactNo2=?,address=?,country=?,state=?,city=?,pincode=?,updatedDate=now(),companyName=?,gstinNO=? where cust_id=?";
	public static final String CUSTOMER_SHIPPING_ADDRESS_DELETE_QUERY = "delete from CustomerShippingDetails where id=?";
	public static final String CUSTOMER_SHIPPING_ADDRESS_DELETE_QUERY_WITH_CUSTOMERID = "delete from CustomerShippingDetails where cust_id=?";	
	public static final String CUSTOMER_SHIPPING_ADDRESS_SINGLE_DATE_QUERY = "select * from CustomerShippingDetails where cust_id=?";
	public static final String OrderShippingDetails_INSERT_QUERY = "insert into OrderShippingDetails values(0,?,?,?)";
	public static final String OrderShippingDetails_UPDATE_QUERY = "update OrderShippingDetails set courierName=?,trackingNo=? where orderId=?";
	
	//Customer Billing Address Queries
	public static final String CUSTOMER_BILLING_ADDRESS_INSERT_QUERY = "insert into CustomerBillingDetails values(0,?,?,?,?,?,?,?,?,?,?,now(),now(),?,?)";
	public static final String CUSTOMER_BILLING_ADDRESS_UPDATE_QUERY = "update CustomerBillingDetails set firstName=?,lastName=?,contactNo1=?,contactNo2=?,address=?,country=?,state=?,city=?,pincode=?,updatedDate=now(),companyName=?,gstinNO=? where cust_id=?";
	public static final String CUSTOMER_BILLING_ADDRESS_DELETE_QUERY = "delete from CustomerBillingDetails where id=?";
	public static final String CUSTOMER_BILLING_ADDRESS_DELETE_QUERY_WITH_CUSTOMERID = "delete from CustomerBillingDetails where cust_id=?";	
	public static final String CUSTOMER_BILLING_ADDRESS_SINGLE_DATE_QUERY = "select * from CustomerBillingDetails where cust_id=?";
	
	//Order Transaction Queries
	public static final String ORDER_TRANSACTION_INSERT_QUERY = "insert into OrderTransaction values (0,?,?,null,null,null,now(),?,?,?,?,'New',?,?,?)";
	
	public static final String ORDER_TRANSACTION_UPDATE_ACCEPTED_DATE_QUERY = "update OrderTransaction set orderAcceptedDate=now(),updatedDate=now() where orderId=?";
	public static final String ORDER_TRANSACTION_UPDATE_DISPATCH_DELIVERY_DATE_QUERY = "update OrderTransaction set OrderDispatched=?,DeliveryDate=?,updatedDate=now() where orderId=?";
	public static final String ORDER_TRANSACTION_SINGLE_QUERY = "select * from OrderTransaction where orderId=?";
	public static final String ORDER_TRANSACTION_CUSTOMER_QUERY = "select * from OrderTransaction where cust_id=?";
	public static final String ORDER_TRANSACTION_ALL_QUERY = "select ot.*,cld.firstName,cld.contactNo1 from OrderTransaction ot,CustomerBillingDetails cld where ot.cust_id=cld.cust_id order by orderId desc";
	public static final String ORDER_TRANSACTION_ALL_Pending_QUERY = "select ot.*,cld.firstName,cld.contactNo1 from OrderTransaction ot,CustomerBillingDetails cld where ot.cust_id=cld.cust_id and paymentStatus<>'Y' order by orderId desc";
	public static final String ORDER_TRANSACTION_ALL_Confirm_QUERY = "select ot.*,cld.firstName,cld.contactNo1 from OrderTransaction ot,CustomerBillingDetails cld where ot.cust_id=cld.cust_id and paymentStatus='Y' order by updatedDate desc";
	public static final String ORDER_TRANSACTION_Sales_QUERY = "select ot.*,cld.firstName,cld.contactNo1 from OrderTransaction ot,CustomerBillingDetails cld where ot.cust_id=cld.cust_id and Emp_id=? order by orderId desc";
	public static final String ORDER_TRANSACTION_READY_FOR_ACCEPTANCE_QUERY = "select ot.*,cld.emailid from OrderTransaction ot,CustomerLoginDetails cld where ot.cust_id=cld.cust_id and ot.orderAcceptedDate IS NULL";
	public static final String ORDER_TRANSACTION_READY_FOR_DIPATCH_DEVIVERY_QUERY = "select ot.*,cld.emailid from OrderTransaction ot,CustomerLoginDetails cld where ot.cust_id=cld.cust_id and ot.orderAcceptedDate IS NOT NULL and ot.OrderDispatched IS NULL and ot.DeliveryDate IS NULL";
	public static final String ORDER_TRANSACTION_CIUSTOMER_ALL_QUERY = "select ot.*,cld.emailid from OrderTransaction ot,CustomerLoginDetails cld where ot.cust_id=cld.cust_id and ot.cust_id=?";
	//Order Transaction Shipping Queries
	public static final String ORDER_TRANSACTION_SHIPPING_ADDRESS_INSERT_QUERY = "insert into OrderShippingAddressDetails values(0,?,?,?,?,?,?,?,?,?,?)";
	public static final String ORDER_TRANSACTION_SHIPPING_ADDRESS_UPDATE_QUERY = "update OrderShippingAddressDetails set firstName=?,lastName=?,contactNo1=?,contactNo2=?,address=?,country=?,state=?,city=?,pincode=? where orderId=?";
	public static final String ORDER_TRANSACTION_SHIPPING_ADDRESS_SINGLE_DATE_QUERY = "select * from OrderShippingAddressDetails where orderId=?";
	public static final String ORDER_TRANSACTION_SHIPPING_DATA_QUERY = "select * from OrderShippingDetails where orderId=?";
	
	//Order Transaction Product Queries
	public static final String ORDER_TRANSACTION_PRDOUCT_INSERT_QUERY = "insert into OrderPurchaseDetails values (0,?,?,?,?,?,?,?,?,?,?,?,?)";
	public static final String ORDER_TRANSACTION_PRDOUCT_DATA_QUERY = "select * from OrderPurchaseDetails where orderId=?";
	
	//Order Transaction Payment Queries
	public static final String ORDER_TRANSACTION_PAYMENT_INSERT_QUERY = "insert into OrderPaymentDetail values (0,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	public static final String ORDER_TRANSACTION_PAYMENT_DATA_QUERY = "select * from OrderPaymentDetail where orderId=?";
	public static final String ORDER_TRANSACTION_ALL_PAYMENT_DATA_QUERY = "select * from OrderPaymentDetail order by payment_date desc";
	public static final String ORDER_TRANSACTION_Pending_PAYMENT_DATA_QUERY = "select * from OrderPaymentDetail where Approve='N' order by payment_date desc";
	
	public static final String MASTER_LOOK_UP_INSERT = "insert into Master_Lookup_Value values (0,?,?,?,?,?,?)";
	public static final String MASTER_LOOK_UP_UPDATE = "update Master_Lookup_Value set LookupName=?,LookupMeaning=?,value1=?,value2=?,value3=?,value4=? where LookupCode=?";
	public static final String MASTER_LOOK_UP_DELETE = "delete from Master_Lookup_Value where LookupCode=?";
	public static final String MASTER_LOOK_UP_DELETE_DISTRICT_TALUKA = "delete from Master_Lookup_Value where value1=?";
	public static final String MASTER_LOOK_UP_DELETE_TALUKA = "delete from Master_Lookup_Value where value1=? and value2=?";
	public static final String MASTER_LOOK_UP_SINGLE_DATE = "select * from Master_Lookup_Value where LookupCode=?";
	public static final String MASTER_LOOK_UP_ALL_DATA = "select * from Master_Lookup_Value";
	
public static final String newsletter_DELETE_QUERY = "delete from newsletter where id=?";
	
	public static final String employee_DELETE_QUERY = "delete from employee where id=?";
	
	public static final String employee_status_update = "update employee set status=?,updatedDate=now() where id=?";
	
	public static final String vendor_status_update = "update vendorDetails set status=?,updatedDate=now() where id=?";
	
	public static final String vendor_delete_Query = "delete from vendorDetails where id=?";
	
    public static final String vendor_Product_DEActivate_update = "update ProductDetails set number_status=? where number_status='Available' and vendor_id=?";
	
	public static final String vendor_Product_Activate_update = "update ProductDetails set number_status=? where number_status='Vendor Deactivated' and vendor_id=?";
	
	public static final String payment_delete_Query = "delete from OrderPaymentDetail where id=?";
	
	public static final String vendor_payment_delete_Query = "delete from vendorPaymentDetails where id=?";
	
	public static final String vendor_product_delete_Query = "delete from ProductDetails where vendor_id=? and number_status <> 'Sold'";
	public static final String vendor_product_delete_Query_Clean = "delete from ProductOtherDetails where product_id not in (select product_id from ProductDetails)";
	
	public static final String vendor_Product_Sold_update = "update ProductDetails set number_status='Sold By Vendor' where number_status <> 'Sold' and vendor_id=?";
	
	public static final String blog_DELETE_QUERY = "delete from Blog where id=?";
	public static final String testimonials_DELETE_QUERY = "delete from testimonials where id=?";
	
	public static final String ClientsLogo_DELETE_QUERY = "delete from ClientsLogo where id=?";
	public static final String GalleryImages_DELETE_QUERY = "delete from galleryImages where id=?";
	
}
