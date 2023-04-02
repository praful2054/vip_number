<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="./CP/img/avatar5.png" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><%=session.getAttribute("employeeName") %></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>
        <li class="active">
          <a href="dashboard">
            <i class="fa fa-dashboard text-aqua"></i> <span>Dashboard</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
        </li>
        <% 
             String profile = (String) session.getAttribute("profile");
        	
        %>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-fw fa-gift text-aqua"></i>
            <span>Product Details</span>
            <span class="pull-right-container">
             <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="productForm"><i class="fa fa-circle-o"></i>Add / New</a></li>
             <li><a href="productView?status=Available"><i class="fa fa-circle-o"></i>Available</a></li> 
            <li><a href="productView?status=Hold"><i class="fa fa-circle-o"></i>Hold</a></li>
            <li><a href="productView?status=Sold"><i class="fa fa-circle-o"></i>Sold</a></li>
            <li><a href="productView?status=Sold By Vendor"><i class="fa fa-circle-o"></i>Sold By Vendor</a></li>
            <li><a href="productView?status=Not Available"><i class="fa fa-circle-o"></i>Not Available</a></li>
            <li><a href="productView?status=Vendor Deactivated"><i class="fa fa-circle-o"></i>Vendor Deactivated</a></li>
            <li><a href="productView?status=ALL"><i class="fa fa-circle-o"></i>ALL</a></li>
             <li><a href="pendingProductEditing"><i class="fa fa-circle-o"></i>Pending Editing</a></li>
            <li><a href="bulkUpload"><i class="fa fa-circle-o"></i>Bulk Upload</a></li>
            <li><a href="bulkRateUpdate"><i class="fa fa-circle-o"></i>Bulk Update</a></li>
             <li><a href="pendingApproval"><i class="fa fa-circle-o"></i>Pending Approval</a></li>
             <li><a href="bulkNumberUpdate"><i class="fa fa-circle-o"></i>Update Number Status</a></li>
          </ul>
        </li>
          
        <li>
          <a href="salesReport">
            <i class="fa fa-dashboard text-aqua"></i> <span>Sales Report</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
        </li>  
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-fw fa-credit-card text-green"></i>
            <span>Order Details</span>
            <span class="pull-right-container">
             <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
           
          
             <li><a href="orderDetails"><i class="fa fa-circle-o"></i>Pending Order Details</a></li>
             <li><a href="confirmOrder"><i class="fa fa-circle-o"></i>Confirm Order Details</a></li>
              
              
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-fw fa-credit-card text-green"></i>
            <span>Payment Details</span>
            <span class="pull-right-container">
             <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
           
          
            
              <li><a href="paymentEntry?type=New"><i class="fa fa-circle-o"></i>New Payment Entry</a></li>
              <li><a href="paymentEntry?type=Refund"><i class="fa fa-circle-o"></i>Refund Payment Entry</a></li>
              
             <li><a href="paymentView"><i class="fa fa-circle-o"></i>Payments Details</a></li>
               <li><a href="pendingPaymentApproval"><i class="fa fa-circle-o"></i>Payment Approval</a></li>
              
          </ul>
        </li>
        
         <li class="treeview">
          <a href="#">
            <i class="fa fa-fw fa-credit-card text-green"></i>
            <span>Offline Order</span>
            <span class="pull-right-container">
             <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
           <li><a href="addCustomer"><i class="fa fa-circle-o"></i>Add Customer</a></li>
           <li><a href="offlineOrder"><i class="fa fa-circle-o"></i>Add Order</a></li>
          </ul>
        </li>
        
       
        <li class="treeview">
          <a href="#">
            <i class="fa fa-gears text-aqua"></i>
            <span>Vendor Details</span>
            <span class="pull-right-container">
             <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
          
           <li><a href="addVendor"><i class="fa fa-circle-o"></i>Add Vendor Details</a></li>
           
            <li><a href="VendorDetails?status=Y"><i class="fa fa-circle-o"></i>Active Vendor Details</a></li>
            <li><a href="VendorDetails?status=N"><i class="fa fa-circle-o"></i>DeActive Vendor Details</a></li>
            <%if(profile.equalsIgnoreCase("Admin")){ %>
            <li><a href="vendorPayments"><i class="fa fa-circle-o"></i> Vendor Payment Details</a></li>
             
           <%} %>
            
            
          </ul>
        </li>
        
       
       
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-gears text-aqua"></i>
            <span>Registration</span>
            <span class="pull-right-container">
             <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
           
            <li><a href="customerDetails"><i class="fa fa-circle-o"></i> Customer Details</a></li>
            <li><a href="newsletters"><i class="fa fa-circle-o"></i> Subscription Details</a></li>
            
            
          </ul>
        </li>
         <%if(profile.equalsIgnoreCase("Admin")){ %>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-gears text-aqua"></i>
            <span>Employee Details</span>
            <span class="pull-right-container">
             <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="employeeForm"><i class="fa fa-circle-o"></i>Add / New</a></li>
            <li><a href="employeeDetails"><i class="fa fa-circle-o"></i> View / Update</a></li>
             <li><a href="employeeHistory"><i class="fa fa-circle-o"></i> History</a></li>
          </ul>
        </li>
        
        
        
        <%} %>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-gears text-aqua"></i>
            <span>Location Details</span>
            <span class="pull-right-container">
             <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
          
            <li><a href="masterForm?type=country"><i class="fa fa-circle-o"></i>Add Country</a></li>
            <li><a href="masterForm?type=state"><i class="fa fa-circle-o"></i>Add State</a></li>
            
            <li><a href="masterView"><i class="fa fa-circle-o"></i> View / Update</a></li>
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-gears text-aqua"></i>
            <span>Category Details</span>
            <span class="pull-right-container">
             <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            
            <li><a href="categoryForm"><i class="fa fa-circle-o"></i>Add / New</a></li>
            
            <li><a href="categoryView"><i class="fa fa-circle-o"></i> View / Update</a></li>
          </ul>
        </li>
        
        <li class="treeview">
          <a href="">
            <i class="fa fa-gears text-aqua"></i>
            <span>Coupouns Code</span>
            <span class="pull-right-container">
             <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            
            <li><a href="coupouns"><i class="fa fa-circle-o"></i>Add / New</a></li>
            
            <li><a href="coupounsView"><i class="fa fa-circle-o"></i> View / Update</a></li>
          </ul>
        </li>
        
        <li>
          <a href="exports">
            <i class="fa fa-dashboard text-aqua"></i> <span>Exports</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
        </li>  
        
        
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>