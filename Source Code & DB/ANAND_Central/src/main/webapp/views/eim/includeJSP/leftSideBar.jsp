<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<aside class="main-sidebar sidebar-dark-primary elevation-4" style="background:#002E6D">
   <a href="dashboard" class="brand-link" title="Executive Mentoring & Coaching" style="background:#002E6D">
      <img src="usedStaticFiles/images/white-icon.ico" class="brand-image img-circle img-circle elevation-5" alt="Anand Icon">
      <span class="brand-text font-weight-light text-white">EIM Portal</span>
   </a>
   <div class="sidebar">
      <nav class="mt-2">
         <ul class="nav nav-pills nav-sidebar flex-column nav-flat nav-child-indent" data-widget="treeview" role="menu" data-accordion="false">
            <li class="nav-item">
               <a href="dashboard" class="nav-link text-white" title="Dashboard">
                  <i class="nav-icon fas fa-tachometer-alt"></i>
                  <p class="font-weight-bold">Dashboard</p>             
               </a>
            </li>
            <li class="nav-item">
               <a href="dashboard-eim" class="nav-link text-white" title="EIM Dashboard">
                  <i class="nav-icon fas fas fa-industry"></i>
                  <p class="font-weight-bold">EIM-Dashboard</p>
               </a>
            </li>
            <c:if test="${projectLeader eq 1 || sponser eq 1 || problemSolvingLeader eq 1 || financeController eq 1 ||
            businessLeaderCoo eq 1 || coporateProblemSolvingLeader eq 1 || processOwner eq 1 || eim eq 1 }">
               <li class="nav-item has-treeview">
                  <a href="#" class="nav-link text-white">
                     <i class="nav-icon fas fa-list"></i>
                     <p class="font-weight-bold">Hopper Database<i class="right fas fa-angle-left"></i></p>
                  </a>
                  <ul class="nav nav-treeview" style="display: none;">
                     <li class="nav-item">
                        <a href="list-hopper" class="nav-link text-white">
                           <i class="fas fa-eye nav-icon"></i>
                           <p class="font-weight-bold">View/Assign Hopper</p>
                        </a>
                     </li>
                     <c:if test="${eim eq 1 ||projectLeader eq 1 || sponser eq 1 || problemSolvingLeader eq 1 || coporateProblemSolvingLeader eq 1 }">
                        <li class="nav-item">
                           <a href="create-hopper" class="nav-link text-white">
                              <i class="fas fa-user nav-icon"></i>
                              <p class="font-weight-bold">Create Hopper</p>
                           </a>
                        </li>
                     </c:if>
                  </ul>
               </li>
            </c:if>
            
            
            <c:if test="${projectLeader eq 1 || sponser eq 1 || problemSolvingLeader eq 1 || financeController eq 1 ||
            businessLeaderCoo eq 1 || coporateProblemSolvingLeader eq 1 || processOwner eq 1 || eim eq 1 }">
               <li class="nav-item has-treeview">
                  <a href="#" class="nav-link text-white">
                     <i class="nav-icon fas fa-list"></i>
                     <p class="font-weight-bold">Charter Database<i class="right fas fa-angle-left"></i></p>
                  </a>
                  <ul class="nav nav-treeview" style="display: none;">
                     <li class="nav-item">
                        <a href="list-charter" class="nav-link text-white">
                           <i class="fas fa-eye nav-icon"></i>
                           <p class="font-weight-bold">View/List Charters</p>
                        </a>
                     </li>
                     <c:if test="${eim eq 1 || projectLeader eq 1 || sponser eq 1 || problemSolvingLeader eq 1 || coporateProblemSolvingLeader eq 1 }">
                        <li class="nav-item">
                           <a href="create-charter" class="nav-link text-white">
                              <i class="fas fa-user nav-icon"></i>
                              <p class="font-weight-bold">Create Charter</p>
                           </a>
                        </li>
                     </c:if>
                     <li class="nav-item">
                        <a href="charter-approval-waiting" class="nav-link text-white">
                           <i class="fas fa-user nav-icon"></i>
                           <p class="font-weight-bold">For My Approval</p>
                        </a>
                     </li>
                  </ul>
               </li>
            </c:if>
         </ul>
      </nav>
   </div>
</aside>