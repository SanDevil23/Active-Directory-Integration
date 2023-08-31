<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
         <nav class="main-header navbar navbar-expand-md navbar-light bg-color-anand-three">
            <div class="container-fluid">
               <div class="collapse navbar-collapse order-3" id="navbarCollapse">
                  <ul class="navbar-nav">
                     <li class="nav-item">
                        <a href="dashboard-ijp" class="nav-link text-white">
                           <i class="fas fa-home"></i>
                        </a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link text-white font-weight-bold" data-toggle="dropdown" href="#">
                           <%-- <c:choose>
                              <c:when test="${empty sessionUserInfo.userMiddleName }">${sessionUserInfo.userFirstName } ${sessionUserInfo.userLastName }</c:when>
                              <c:when test="${not empty sessionUserInfo.userMiddleName }">${sessionUserInfo.userFirstName } ${sessionUserInfo.userMiddleName } ${sessionUserInfo.userLastName }</c:when>
                           </c:choose> --%>
                           ${sessionUserInfo.userFirstName } ${sessionUserInfo.userLastName }
                           <%-- , ${sessionUserInfo.mDepartmentId.departmentName }, ${sessionUserInfo.mEntityId.entityAcronym }, ${sessionUserInfo.mEntityId.locationId.locationName } --%>
                        </a>
                     </li>
                     <li class="nav-item dropdown">
                        <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" 
                           aria-expanded="false" class="nav-link dropdown-toggle  text-white">
                           <i class="fas fa-briefcase nav-icon"></i>&ensp;Job Feed
                        </a>
                        <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">
                           <li><a tabindex="-1" title="List all job posting" href="job-list" class="dropdown-item">Job List</a></li>
                           <li class="dropdown-divider"></li>
                           <li><a href="#" class="dropdown-item">My Jobs</a></li>
                        </ul>
                     </li>
                     <c:if test="${itAdmin eq 1 || corpHr }">
                     <li class="nav-item dropdown">
                        <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" 
                           aria-expanded="false" class="nav-link dropdown-toggle  text-white">
                           <i class="nav-icon fas fa-user-shield"></i>&ensp;Corporate HR
                        </a>
                        <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow" style="width:190px">
                           <li><a href="#" class="dropdown-item">Approval Pending Jobs</a></li>
                        </ul>
                     </li>
                     </c:if>
                     
                     <c:if test="${compHr eq 1 || admin eq 1 || itAdmin eq 1 || corpHr eq 1 }">
                     <li class="nav-item dropdown">
                        <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" 
                           aria-expanded="false" class="nav-link dropdown-toggle  text-white">
                           <i class="nav-icon fas fa-user-shield"></i>&ensp;Company HR
                        </a>
                        <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow" style="width:190px">
                           <c:if test="${compHr eq 1 || itAdmin eq 1}">
                           <li class="dropdown-submenu dropdown-hover">
                              <a id="dropdownSubMenu2" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" 
                                 aria-expanded="false" class="dropdown-item dropdown-toggle ">Manage Employees</a>
                              <ul aria-labelledby="dropdownSubMenu2" class="dropdown-menu border-0 shadow">
                                 <!-- <li><a tabindex="-1" href="employee" class="dropdown-item">Add/Edit Detail</a></li>
                                 <li><a tabindex="-1" href="#" class="dropdown-item">Bulk Upload</a></li> -->
                                 <li><a tabindex="-1" href="#" class="dropdown-item">NOC Details</a></li>
                              </ul>
                           </li>
                           <li class="dropdown-divider"></li>
                           </c:if>
                           <li class="dropdown-submenu dropdown-hover">
                              <a id="dropdownSubMenu2" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" 
                                 aria-expanded="false" class="dropdown-item dropdown-toggle">Jobs &amp; Responses</a>
                              <ul aria-labelledby="dropdownSubMenu2" class="dropdown-menu border-0 shadow">
                                 <li><a tabindex="-1" title="List all job posting" href="job-list" class="dropdown-item">Manage Jobs</a></li>
                                 <li><a tabindex="-1" title="Post new Job" href="job-posting" class="dropdown-item">Post New IJP</a></li>
                                 <li><a tabindex="-1" href="#" class="dropdown-item">Manage Responses</a></li>
                                 <li><a tabindex="-1" href="#" class="dropdown-item">Shortlisted Candidates</a></li>
                              </ul>
                           </li>
                        </ul>
                     </li>
                     </c:if>
                     <li class="nav-item dropdown">
                        <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" 
                           aria-expanded="false" class="nav-link dropdown-toggle  text-white">
                           <i class="nav-icon fas fa-file-signature"></i>&ensp;IJP Policy
                        </a>
                        <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">
                           <li><a href="#" class="dropdown-item">Download IJP Policy</a></li>
                           <li class="dropdown-divider"></li>
                           <li><a href="#" class="dropdown-item">Download FAQ's</a></li>
                        </ul>
                     </li>
                  </ul>
                  <ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">
                     <li class="nav-item dropdown">
                        <a target="_blank" href="https://www.anandgroupindia.com/" title="Anand Group India" target="_" class="navbar-brand">
                           <img src="usedStaticFiles/images/anand-white-logo.png" style="height:27px;padding-top:2px" alt="AdminLTE Logo" class="brand-image">
                        </a>
                     </li>
                     <li class="nav-item ">
                        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
                           <i class="fas fa-th-large  text-white"></i>
                        </a>
                     </li>
                     <li class="nav-item dropdown">
                        <a class="nav-link  text-white" href="#" title="Logout" data-toggle="dropdown">
                           <i class="fas fa-sign-out-alt"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                           <a href="logout" class="dropdown-item">
                              <i class="fas fa-sign-out-alt"></i>&nbsp;Logout
                           </a>
                        </div>
                     </li>
                  </ul>
               </div>
            </div>
         </nav>
         <div class="anand-loader">
            <img id = "loaderImageNow" src="usedStaticFiles/images/loader.gif" width="64" alt="">
         </div>