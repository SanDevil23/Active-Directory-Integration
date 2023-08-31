<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<aside class="main-sidebar sidebar-dark-primary elevation-4 bg-color-anand-two">
   <a href="dashboard" class="brand-link bg-color-anand-two" title="IFC Portal">
      <img src="usedStaticFiles/images/white-icon.ico" class="brand-image img-circle img-circle elevation-5" alt="Anand Icon">
      <span class="brand-text font-weight-light text-white">IFC Portal</span>
   </a>
   <div class="sidebar">
      <nav class="mt-2">
         <ul class="nav nav-pills nav-sidebar flex-column nav-flat nav-child-indent" data-widget="treeview" role="menu" data-accordion="false">
            <li class="nav-item">
               <a href="dashboard" class="nav-link text-white" title="Dashboard">
                  <i class="nav-icon fas fa-tachometer-alt"></i>
                  <strong><p>Dashboard</p></strong>
               </a>
            </li>
            <li class="nav-item">
               <a href="dashboard-ifc" class="nav-link text-white" title="IFC Dashboard">
                  <i class="nav-icon fas fa-money-check"></i>
                  <strong><p>IFC-Dashboard</p></strong>
               </a>
            </li>
            <c:if test="${ifcAdmin eq 1 || praac eq 1 || itAdmin eq 1 }">
            <li class="nav-item">
              <a href="rcm-master" class="nav-link text-white" title="RCM Master">
                <i class="nav-icon fas fa-list"></i>
                <strong><p>RCM Definition</p></strong>
              </a>
            </li>
            </c:if>
            <li class="nav-item">
              <a href="rcm-tracker" class="nav-link text-white" title="RCM List">
                <i class="nav-icon fas fa-list"></i>
                <strong><p>RCM Tracker</p></strong>
              </a>
            </li>
            <li class="nav-item">
              <a href="reports-ifc" class="nav-link text-white" title="Reports">
                <i class="nav-icon fas fa-list"></i>
                <strong><p>Reports</p></strong>
              </a>
            </li>
            
         </ul>
      </nav>
   </div>
</aside>