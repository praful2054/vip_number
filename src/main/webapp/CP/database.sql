create database numberwale;
use numberwale;

create table employee(
id int NOT NULL AUTO_INCREMENT,
loginId varchar(200),
password varchar(200),
firstname varchar(100),
lastname varchar(100),
address varchar(500),
contactno1 varchar(100),
contactno2 varchar(500),
profile varchar(500),
status varchar(10),
updatedDate datetime,
primary key(id)
);

insert into employee values('0','admin','admin','Admin','','Borivali','','','Admin','Y',curDate());


create table categories(
cate_id int NOT NULL AUTO_INCREMENT,
cate_parent_id int,
cate_name varchar(200),
cate_descript text,
cate_img_loc varchar(100),
cate_UpdatedDate datetime,
status varchar(1),
primary key(cate_id)
);





CREATE TABLE ProductDetails (
  product_id int(11) NOT NULL AUTO_INCREMENT,
  cate_id int(11) DEFAULT NULL,
  productName varchar(200) DEFAULT NULL,
  natureOfProduct varchar(200) DEFAULT NULL,
  indication varchar(300) DEFAULT NULL,
  useDirection text,
  packing varchar(300) DEFAULT NULL,
  descript text,
  vegProduct varchar(200) DEFAULT NULL,
  additinalDescription text,
  type varchar(30) DEFAULT NULL,
  updated_date datetime DEFAULT NULL,
  status varchar(1) DEFAULT NULL,
  productCode varchar(30) DEFAULT NULL,
  productBrand varchar(300) DEFAULT NULL,
  productColor varchar(300) DEFAULT NULL,
  sizeheight varchar(300) DEFAULT NULL,
  sizelength varchar(300) DEFAULT NULL,
  liters varchar(30) DEFAULT NULL,
  trap varchar(30) DEFAULT NULL,
  updated_by varchar(100) DEFAULT NULL,
created_by varchar(100) DEFAULT NULL,
Created_date datetime DEFAULT NULL,
vendor_id int(11) DEFAULT 0,
recharge_validity varchar(100),
number_status varchar(200),
lastcall varchar(200),
primary key(product_id)
);

alter table ProductDetails
add column nextCall varchar(200) after lastcall;

alter table ProductDetails
add column number varchar(200) after nextCall;

alter table ProductDetails
add column buyerName varchar(200) after number;

alter table ProductDetails
add column currentNumber varchar(200) after buyerName;

alter table ProductDetails
add column buyerContact varchar(200) after currentNumber;

alter table ProductDetails
add column fileID varchar(200) after buyerContact;

alter table ProductDetails
add column Comments text after fileID;



create table ProductImageDetails(
product_img_id int NOT NULL AUTO_INCREMENT,
product_id int,
img_loc varchar(100),
img_seq_no varchar(2),
img_comment varchar(200),
updated_date datetime,
primary key(product_img_id)
);

CREATE TABLE ProductOtherDetails (
  id int(11) NOT NULL AUTO_INCREMENT,
  product_id int(11) DEFAULT NULL,
  rateInRupee double DEFAULT NULL,
  rateInDollar double DEFAULT NULL,
  discount int(11) DEFAULT NULL,
  flatdiscountedrate int(11) DEFAULT NULL,
  ratewhite double DEFAULT NULL,
  rateivory double DEFAULT NULL,
  rateblack double DEFAULT NULL,
  updated_by varchar(100) DEFAULT NULL,
updated_date datetime DEFAULT NULL,
created_by varchar(100) DEFAULT NULL,
Created_date datetime DEFAULT NULL,
primary key(id)
);



create table CustomerLoginDetails(
cust_id int NOT NULL AUTO_INCREMENT,
emailid varchar(30),
password varchar(15),
forgetpasswordquestion varchar(100),
answer varchar(100),
createdDate datetime,
updatedDate datetime,
status varchar(1),
primary key(cust_id),
UNIQUE KEY unique_email (emailid)
);


create table vendorDetails(
id int NOT NULL AUTO_INCREMENT,
loginId varchar(200),
password varchar(200),
firstname varchar(100),
address varchar(500),
address2 varchar(500),
contactno1 varchar(100),
Website varchar(500),
status varchar(10),
updatedDate datetime,
primary key(id)
);


create table CustomerShippingDetails(
id int NOT NULL AUTO_INCREMENT,
cust_id int,
firstName varchar(100),
lastName varchar(100),
contactNo1 varchar(15),
contactNo2 varchar(15),
address varchar(500),
country varchar(10),
state varchar(10),
city varchar(10),
pincode varchar(10),
createdDate datetime,
updatedDate datetime,
primary key(id)
);

alter table CustomerShippingDetails
add column companyName varchar(500) after updatedDate;

alter table CustomerShippingDetails
add column gstinNO varchar(200) after companyName;


create table CustomerBillingDetails(
id int NOT NULL AUTO_INCREMENT,
cust_id int,
firstName varchar(100),
lastName varchar(100),
contactNo1 varchar(15),
contactNo2 varchar(15),
address varchar(500),
country varchar(10),
state varchar(10),
city varchar(10),
pincode varchar(10),
createdDate datetime,
updatedDate datetime,
primary key(id)
);

alter table CustomerBillingDetails
add column companyName varchar(500) after updatedDate;

alter table CustomerBillingDetails
add column gstinNO varchar(200) after companyName;

create table OrderTransaction(
orderId int NOT NULL AUTO_INCREMENT,
cust_id int,
orderPlacedDate datetime,
orderAcceptedDate datetime,
OrderDispatched datetime,
DeliveryDate datetime,
updatedDate datetime,
orderTotal double,
shippingCharge double,
currency varchar(10),
paymentStatus varchar(30),
orderStatus varchar(100),
Emp_id varchar(200),
primary key(orderId)
);

alter table OrderTransaction
add column channel varchar(200) after Emp_id;

alter table OrderTransaction
add column gstin varchar(200) after channel;




ALTER TABLE CustomerBillingDetails MODIFY state VARCHAR(200);
ALTER TABLE CustomerBillingDetails MODIFY country VARCHAR(200);

ALTER TABLE CustomerShippingDetails MODIFY state VARCHAR(200);
ALTER TABLE CustomerShippingDetails MODIFY country VARCHAR(200);

ALTER TABLE CustomerLoginDetails MODIFY emailid VARCHAR(200);
ALTER TABLE CustomerLoginDetails MODIFY password VARCHAR(200);


create table OrderPaymentDetail(
id int NOT NULL AUTO_INCREMENT,
orderId int,
txn_id varchar(100),
mc_gross varchar(10),
mc_currency varchar(10),
payer_email varchar(100),
receiver_email varchar(100),
payment_status varchar(100),
updatedDate datetime,
primary key(id)
);

alter table OrderPaymentDetail
add column Approve varchar(200) after payment_date;

create table OrderPurchaseDetails(
id int NOT NULL AUTO_INCREMENT,
orderId int,
product_id int,
productName varchar(100),
img_loc varchar(100),
qty int,
productprice double,
netAmount double,
productColor varchar(100),
productSize varchar(100), 
primary key(id)
);

alter table OrderPurchaseDetails
add column discount varchar(200) after productSize;

alter table OrderPurchaseDetails
add column flatDiscount varchar(200) after discount;

alter table OrderPurchaseDetails
add column gst varchar(200) after flatDiscount;




create table OrderShippingDetails(
id int NOT NULL AUTO_INCREMENT,
orderId int,
courierName text,
trackingNo int,
primary key(id)
);

create table OrderShippingAddressDetails(
id int NOT NULL AUTO_INCREMENT,
orderId int,
firstName varchar(100),
lastName varchar(100),
contactNo1 varchar(15),
contactNo2 varchar(15),
address varchar(500),
country varchar(10),
state varchar(10),
city varchar(10),
pincode varchar(10),
primary key(id)
);

ALTER TABLE OrderShippingAddressDetails MODIFY state VARCHAR(200);
ALTER TABLE OrderShippingAddressDetails MODIFY country VARCHAR(200);
ALTER TABLE OrderShippingAddressDetails MODIFY city VARCHAR(200);

alter table OrderPurchaseDetails
add column productColor varchar(100);

alter table OrderPurchaseDetails
add column productSize varchar(100);


create table Master_Lookup_Value(
LookupCode int NOT NULL AUTO_INCREMENT,##Unique ID
LookupName varchar(200), ##city,country,state,taluka
LookupMeaning varchar(200),##,mumbai,thane
value1 varchar(200),## lookupcode,
value2 varchar(200),
value3 varchar(200),
value4 varchar(200),
primary key(LookupCode)
);

create table Offer(
offerId int NOT NULL AUTO_INCREMENT,
OfferName varchar(100),
OfferType varchar(20),
discountedValue double,
assoicatedProducts text,
creationDate datetime,
expiryDate datetime,
noOfDays int,
is_enabled varchar(1),
primary key(offerId)
);

create table Coupoun(
coupoun_id int NOT NULL AUTO_INCREMENT,
coupoun_code varchar(100),
coupoun_type varchar(100),
user_for varchar(100),
user_id text,
value varchar(100),
created_date datetime,
expiry_date datetime,
no_of_days_to_expire varchar(100),
isEnabled varchar(10),
updatedDate datetime,
primary key(coupoun_id)
);

create table Blog(
id int NOT NULL AUTO_INCREMENT,
blogTitle varchar(200),
blogDescription text,
uploadType varchar(10),
img_loc varchar(100),
status varchar(1),
updatedDate datetime,
primary key(id)
);

create table BlogComment(
id int NOT NULL AUTO_INCREMENT,
blogId int,
bloggerName varchar(100),
emailId varchar(100),
website varchar(100),
replyid int,
comment text,
updatedDate datetime,
primary key(id)
);

create table Review(
id int NOT NULL AUTO_INCREMENT,
pID varchar(100),
revewBy varchar(100),
revew text,
updatedDate datetime,
primary key(id)
);

create table newsletter(
id int NOT NULL AUTO_INCREMENT,
email varchar(200),
status varchar(1),
updatedDate datetime,
primary key(id),
UNIQUE KEY unique_email (email)
);

create table otpRequest(
id int NOT NULL AUTO_INCREMENT,
Mobile_NO varchar(200),
OTP varchar(100),
cate_UpdatedDate datetime,
status varchar(1),
primary key(id)
);

create table scheduleDemo(
id int NOT NULL AUTO_INCREMENT,
Company_Name varchar(500),
Contact_Person varchar(500),
Email_id varchar(300),
Mobile_NO varchar(200),
UpdatedDate datetime,
status varchar(100),
EmployeeId varchar(10),
primary key(id)
);

create table ivrDemofollowup(
id int NOT NULL AUTO_INCREMENT,
enq_id varchar(100),
commenyBy varchar(500),
comment text,
UpdatedDate datetime,
primary key(id)
);

create table enquiry(
id int NOT NULL AUTO_INCREMENT,
request varchar(500),
Full_Name varchar(500),
Email_id varchar(300),
Mobile_NO varchar(200),
type varchar(200),
city varchar(500),
UpdatedDate datetime,
status varchar(100),
EmployeeId varchar(200),
primary key(id)
);

create table enquiryfollowup(
id int NOT NULL AUTO_INCREMENT,
enq_id varchar(100),
commenyBy varchar(500),
comment text,
UpdatedDate datetime,
primary key(id)
);

create table orderfollowup(
id int NOT NULL AUTO_INCREMENT,
order_id varchar(100),
commenyBy varchar(500),
comment text,
UpdatedDate datetime,
primary key(id)
);


create table contactenquiry(
id int NOT NULL AUTO_INCREMENT,
Full_Name varchar(500),
Email_id varchar(300),
Mobile_NO varchar(200),
Company_Name varchar(500),
Message text,
UpdatedDate datetime,
status varchar(100),
EmployeeId varchar(10),
primary key(id)
);


create table offlineenquiry(
id int NOT NULL AUTO_INCREMENT,
requirement varchar(500),
budget varchar(500),
Customer_Name varchar(500),
Customer_Mobile varchar(500),
Customer_Email varchar(500),
Customer_Address text,
Customer_City varchar(500),
Customer_Pincode varchar(500),
Enquiry_Source varchar(500),
UpdatedDate datetime,
status varchar(100),
EmployeeId varchar(200),
type varchar(200),
createdBy varchar(200),
primary key(id)
);

alter table offlineenquiry
add column type varchar(200) after EmployeeId;

alter table offlineenquiry
add column createdBy varchar(200) after type;

create table offlineenquiryfollowup(
id int NOT NULL AUTO_INCREMENT,
enq_id varchar(100),
commenyBy varchar(500),
comment text,
UpdatedDate datetime,
primary key(id)
);


create table requirements(
id int NOT NULL AUTO_INCREMENT,
requirements varchar(500),
budget varchar(500),
Buyer_Name varchar(500),
Buyer_Contact varchar(500),
Buyer_Rate varchar(500),
status varchar(100),
EmployeeId varchar(200),
createdBy varchar(200),
Created_Date datetime,
UpdatedBy varchar(200),
UpdatedDate datetime,
primary key(id)
);

create table requirementsfollowup(
id int NOT NULL AUTO_INCREMENT,
enq_id varchar(100),
commenyBy varchar(500),
comment text,
UpdatedDate datetime,
primary key(id)
);


create table schedular(
UpdatedDate date,
status varchar(10)
);

insert into schedular values(curDate(),'Y');


create table myInvoices(
id int NOT NULL AUTO_INCREMENT,
orderID varchar(100),
UpdatedDate datetime,
primary key(id)
);

ALTER TABLE myInvoices AUTO_INCREMENT=134;

insert into myInvoices values('0','70',curDate());
insert into myInvoices values('0','71',curDate());
insert into myInvoices values('0','77',curDate());

create table numberInvoices(
id int NOT NULL AUTO_INCREMENT,
orderID varchar(100),
UpdatedDate datetime,
primary key(id)
);

ALTER TABLE numberInvoices AUTO_INCREMENT=1346;

CREATE INDEX IDX_NSTTS_PD_DTLS ON ProductDetails (number_status);
CREATE INDEX IDX_STTS_PD_DTLS ON ProductDetails (status);
CREATE INDEX IDX_ID_PD_OTH_DTLS ON ProductOtherDetails (product_id);
CREATE INDEX IDX_TYP_EQ_DTLS ON enquiry (type);
CREATE INDEX IDX_STTS_EQ_DTLS ON enquiry (status);
CREATE INDEX IDX_TRP_STTS_PD_DTLS ON ProductDetails (trap,number_status,status);
CREATE INDEX IDX_LTR_STTS_PD_DTLS ON ProductDetails (liters,number_status,status);
CREATE INDEX IDX_RATE_PD_OTH_DTLS ON ProductOtherDetails (rateInRupee);

CREATE INDEX IDX_STTS_PD_DTLS ON ProductDetails (product_id,cate_id,status);

