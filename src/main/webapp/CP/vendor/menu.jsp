<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="./CP/img/avatar5.png" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><%=session.getAttribute("VendorName") %></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>
        <li class="active">
          <a href="vendordashboard">
            <i class="fa fa-dashboard text-aqua"></i> <span>Dashboard</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
        </li>
       
       <li class="active">
          <a href="vendorProfile">
            <i class="fa fa-dashboard text-aqua"></i> <span>My Profile</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
        </li>
        
         <li class="active">
          <a href="vendorTotalStatement">
            <i class="fa fa-dashboard text-aqua"></i> <span>My Statement</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
        </li>
        
        <li class="active">
          <a href="vendorCategories">
            <i class="fa fa-dashboard text-aqua"></i> <span>Category Details</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-fw fa-gift text-aqua"></i>
            <span>Product Details</span>
            <span class="pull-right-container">
             <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="vendorproductForm"><i class="fa fa-circle-o"></i>Add / New</a></li>
            <li><a href="vendorproductView"><i class="fa fa-circle-o"></i>View / Update</a></li>
            <li><a href="vendorbulkUpload"><i class="fa fa-circle-o"></i>Bulk Upload</a></li>
          </ul>
        </li>
          
       
         <li class="active">
          <a href="vendorRechargeReminder">
            <i class="fa fa-dashboard text-aqua"></i> <span>Recharge</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
        </li>
        
        <li class="active">
          <a href="vendorCallReminder">
            <i class="fa fa-dashboard text-aqua"></i> <span>Last Call</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
        </li>
        
        
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>