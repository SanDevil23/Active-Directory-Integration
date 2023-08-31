<!-- ****************************************************************************************
# *******************************************************************************************
# Copyright © 2021 Anand Group India. All rights reserved.									*
# No part of this product may be reproduced in any form by any means without prior			*
# written authorization of Anand Automotive Private Limited and its licensors, if any.		*
# *******************************************************************************************
# Author - Sheshadhri Iyer																	*
# *************************************************************************************** -->
<!DOCTYPE html>
<html lang="en">
  <head>
   <title>DASHBOARD | EIM | ANAND GROUP</title>
   <%@include file="../includeJSP/cssFiles.jsp"%>
  </head>
  <body class="sidebar-mini layout-navbar-fixed sidebar-collapse pace-primary">
    <div class="wrapper">
      <%@include file="../includeJSP/header.jsp"%>
      <%@include file="includeJSP/leftSideBar.jsp"%>
      <div class="content-wrapper">
        <section class="content-header">
               <div class="container-fluid">
                  <div class="row mb-2">
                     <div class="col-sm-6">
                        <h5 class="font-color-anand-one font-weight-bold">DASHBOARD - EIM</h5>
                     </div>
                     <div class="col-sm-6">
                       <ol class="breadcrumb float-sm-right">
                         <li class="breadcrumb-item"><a href="dashboard" title="Dashboard"><strong>Dashboard</strong></a></li>
                         <li class="breadcrumb-item active"><strong>EIM Dashboard</strong></li>
                       </ol>
                     </div>
                  </div>
               </div>
            </section>
        <section class="content content-margin">
               <div class="container-fluid">
                  <div class="row">
                     <div class="col-md-12">
                        <div class="card card-primary card-outline bg-card-primary-anand">
                           <div class="card-header">
                              <h3 class="card-title">
                                 <i class="far fa-chart-bar"></i>&nbsp;Hopper Statistics
                              </h3>
                           </div>
                           <div class="card-body">
                              <div class="row">
                                 <div class="col-md-6">
                                    <div class="card card-primary card-outline bg-card-primary-anand">
                                       <div class="card-header">
                                          <h5 class="card-title">
                                             Hopper Project Count
                                          </h5>
                                       </div>
                                       <div class="card-body">
                                          <div class="hopperProjectCountDiv" align="center">
                                             <img src="usedStaticFiles/images/loader.gif" width="64" alt="" />
                                          </div>
                                          <div class="position-relative mb-4" id="hopperProjectCount" align="center">
                                             <canvas id="hopperProjectCountGraph" height="120"></canvas>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col-md-6">
                                    <div class="card card-primary card-outline bg-card-primary-anand">
                                       <div class="card-header">
                                          <h5 class="card-title">
                                             Savings Potential(Mil INR)
                                          </h5>
                                       </div>
                                       <div class="card-body">
                                          <div class="hopperProjectSavingsDiv" align="center">
                                             <img src="usedStaticFiles/images/loader.gif" width="64" alt="" />
                                          </div>
                                          <div class="position-relative mb-4" id="hopperProjectSavings" align="center">
                                             <canvas id="hopperProjectSavingsGraph" height="120"></canvas>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <div class="card card-widget widget-user-2 shadow">
                           <div class="widget-user-header bg-color-anand-one" title="Cumulative Statistics" style="cursor: pointer;">
                              <h5 class="text-white"><i class="fas fa-chart-area"></i>&emsp;Cumulative Statistics</h5>
                           </div>
                           <div class="card-footer p-0">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link font-color-anand-one" href="#" title="Cumulative Closed Projects">
                                       Closed Projects
                                       <span class="float-right badge bg-info-anand-primary span-info-width">34</span>
                                    </a>
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link font-color-anand-one" href="#" title="Cumulative Saving">
                                       Projects Savings (Mil INR)
                                       <span class="float-right badge bg-info-anand-primary span-info-width">25.7</span>
                                    </a>
                                 </li>
                              </ul>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <div class="card card-widget widget-user-2 shadow">
                           <div class="widget-user-header bg-color-anand-two" title="User Management" style="cursor: pointer;">
                              <h5 class="text-white"><i class="fas fa-ribbon"></i>&emsp;Belt Inventory</h5>
                           </div>
                           <div class="card-footer p-0">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link font-color-anand-two" href="#" title="Cumulative Closed Projects">
                                       Trained Master Black Belt
                                       <span class="float-right badge bg-color-anand-two span-info-width">34</span>
                                    </a>
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link font-color-anand-two" href="#" title="Cumulative Closed Projects">
                                       Trained Black Belt
                                       <span class="float-right badge bg-color-anand-two span-info-width">34</span>
                                    </a>
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link font-color-anand-two" href="#" title="Cumulative Closed Projects">
                                       Trained Green Belt
                                       <span class="float-right badge bg-color-anand-two span-info-width">34</span>
                                    </a>
                                 </li>
                              </ul>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <div class="card card-widget widget-user-2 shadow">
                           <div class="widget-user-header bg-color-anand-three" title="User Management" style="cursor: pointer;">
                              <h5 class="text-white"><i class="fas fa-award"></i>&emsp;Certification Status</h5>
                           </div>
                           <div class="card-footer p-0">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link font-color-anand-three" href="#" title="Cumulative Closed Projects">
                                       Certified Master Black Belt
                                       <span class="float-right badge bg-color-anand-three span-info-width">34</span>
                                    </a>
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link font-color-anand-three" href="#" title="Cumulative Closed Projects">
                                       Certified Black Belt
                                       <span class="float-right badge bg-color-anand-three span-info-width">34</span>
                                    </a>
                                 </li>
                                 <li class="nav-item">
                                    <a class="nav-link font-color-anand-three" href="#" title="Cumulative Closed Projects">
                                       Certified Green Belt
                                       <span class="float-right badge bg-color-anand-three span-info-width">34</span>
                                    </a>
                                 </li>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-12">
                        <div class="card card-primary card-outline bg-card-primary-anand">
                           <div class="card-header">
                              <h3 class="card-title">
                                 <i class="far fa-chart-bar"></i>&nbsp;Status - Active Projects
                              </h3>
                           </div>
                           <div class="card-body">
                              <div class="row">
                                 <div class="col-md-6">
                                    <div class="card card-primary card-outline bg-card-primary-anand">
                                       <div class="card-header">
                                          <h5 class="card-title">
                                             Average Days for Action
                                          </h5>
                                       </div>
                                       <div class="card-body">
                                          <div class="card card-widget widget-user-2 shadow">
                                             <div class="card-footer p-0">
                                                <ul class="nav flex-column">
                                                   <li class="nav-item">
                                                      <a class="nav-link" href="#" title="Cumulative Closed Projects">
                                                         Average Days to Close
                                                         <span class="float-right badge bg-info-anand-primary span-info-width">34</span>
                                                      </a>
                                                   </li>
                                                   <li class="nav-item">
                                                      <a class="nav-link" href="#" title="Cumulative Closed Projects">
                                                         Average Days to Contract
                                                         <span class="float-right badge bg-info-anand-primary span-info-width">34</span>
                                                      </a>
                                                   </li>
                                                </ul>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col-md-6">
                                    <div class="card card-primary card-outline bg-card-primary-anand">
                                       <div class="card-header">
                                          <h5 class="card-title">
                                             Approval Status

                                          </h5>
                                       </div>
                                       <div class="card-body">
                                          <div class="card card-widget widget-user-2 shadow">
                                             <div class="card-footer p-0">
                                                <ul class="nav flex-column">
                                                   <li class="nav-item">
                                                      <a class="nav-link" href="#" title="Cumulative Closed Projects">
                                                         Charter Approved
                                                         <span class="float-right badge bg-info-anand-primary span-info-width">34</span>
                                                      </a>
                                                   </li>
                                                   <li class="nav-item">
                                                      <a class="nav-link" href="#" title="Cumulative Closed Projects">
                                                         Contract Approved
                                                         <span class="float-right badge bg-info-anand-primary span-info-width">34</span>
                                                      </a>
                                                   </li>
                                                   <li class="nav-item">
                                                      <a class="nav-link" href="#" title="Cumulative Closed Projects">
                                                         Closure Approved
                                                         <span class="float-right badge bg-info-anand-primary span-info-width">34</span>
                                                      </a>
                                                   </li>
                                                </ul>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col-md-6">
                                    <div class="card card-primary card-outline bg-card-primary-anand">
                                       <div class="card-header">
                                          <h5 class="card-title">
                                             No of Active Projects
                                          </h5>
                                       </div>
                                       <div class="card-body">
                                          <div class="position-relative mb-4" id="activeProjectCount" align="center">
                                             <canvas id="activeProjectCountGraph" height="120"></canvas>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col-md-6">
                                    <div class="card card-primary card-outline bg-card-primary-anand">
                                       <div class="card-header">
                                          <h5 class="card-title">
                                             Savings in (Mil INR)
                                          </h5>
                                       </div>
                                       <div class="card-body">
                                          <div class="position-relative mb-4" id="activeProjectSavings" align="center">
                                             <canvas id="activeProjectSavingsGraph" height="120"></canvas>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </section>
      </div>
      <%@include file="includeJSP/footer.jsp"%>
    </div>
    <%@include file="../includeJSP/jsFiles.jsp"%>
    <script src="usedStaticFiles/js/generalJs/charts/Chart.js"></script>
    <script src="usedStaticFiles/js/generalJs/charts/chart.datalabels.js"></script>
    <script src="usedStaticFiles/js/jsp_js_files/eim/dashboard.js"></script>
  </body>
</html>