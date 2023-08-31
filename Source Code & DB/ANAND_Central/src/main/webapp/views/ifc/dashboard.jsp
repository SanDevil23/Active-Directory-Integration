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
                <h5 class="font-color-anand-one"><strong>DASHBOARD</strong></h5>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="dashboard" title="Dashboard"><strong>Dashboard</strong></a></li>
                  <li class="breadcrumb-item active"><strong>IFC Dashboard</strong></li>
                </ol>
              </div>
            </div>
          </div>
        </section>
        <section class="content content-margin">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-12">
                <div class="card card-primary card-outline collapsed-card bg-card-primary-anand">
                  <div class="card-header" data-card-widget="collapse">
                    <h5 class="card-title"><i class="fas fa-filter font-color-anand-one"></i>&emsp;Filters</h5>
                    <div class="card-tools">
                      <button type="button" class="btn btn-tool" data-card-widget="collapse">
                        <i class="fas fa-plus font-color-anand-one"></i>
                      </button>
                    </div>
                  </div>
                  <div class="card-body" style="display: none;">
                    <div class="row">
                      <div class="col-md-12">
                        <form action="dashboard_v2" id="dashboard_v2" method="post">
                          <div class="row">
		      <div class="col-md-3">
                              <h6>Parent Entity</h6>
                              <input type="hidden" id="tempParentId" value="${tempParentId }" />
                              <select class="custom-select mb-3 text-light border-0 bg-white" name="parentEntityId" id="parentEntityId">
                                <option value="-1">Select Parent Entity</option>
                                <c:choose>
                                  <c:when test="${approver eq 1 || recommendaitonOwner eq 1 || reviewer eq 1 }">
                                    <c:forEach items="${activeParentEntityList}" var="parentEntity">
                                      <c:if test="${parentEntity.mEntityId eq sessionUserInfo.userEntity.entitySource.mEntityId }">
                                        <option value="${parentEntity.mEntityId }">${parentEntity.entityAcronym } - ${parentEntity.entityName}</option>
                                      </c:if>
                                    </c:forEach>
                                  </c:when>
                                  <c:otherwise>
                                    <c:forEach items="${activeParentEntityList}" var="parentEntity">
                                      <option value="${parentEntity.mEntityId}">${parentEntity.entityAcronym } - ${parentEntity.entityName}</option>
                                    </c:forEach>
                                  </c:otherwise>
                                </c:choose>
                              </select>
                            </div>
                            <div class="col-md-3">
                              <h6>Child Entity</h6>
                              <input type="hidden" id="tempParentId" value="${tempParentId }" />
                              <select class="custom-select mb-3 text-light border-0 bg-white" name="parentEntityId" id="parentEntityId">
                                <option value="-1">Select Child Entity</option>
                                <c:choose>
                                  <c:when test="${approver eq 1 || recommendaitonOwner eq 1 || reviewer eq 1 }">
                                    <c:forEach items="${parentEntityList}" var="parentEntity">
                                      <c:if test="${parentEntity.mEntityId eq sessionUserInfo.userEntity.entitySource.mEntityId }">
                                        <option value="${parentEntity.mEntityId }">${parentEntity.entityAcronym } - ${parentEntity.entityName}</option>
                                      </c:if>
                                    </c:forEach>
                                  </c:when>
                                  <c:otherwise>
                                    <c:forEach items="${parentEntityList}" var="parentEntity">
                                      <option value="${parentEntity.mEntityId}">${parentEntity.entityAcronym } - ${parentEntity.entityName}</option>
                                    </c:forEach>
                                  </c:otherwise>
                                </c:choose>
                              </select>
                            </div>
                            <div class="col-md-3">
                              <h6>Process/Cycle</h6>
                              <input type="hidden" id="tempParentId" value="${tempParentId }" />
                              <select class="custom-select mb-3 text-light border-0 bg-white" name="parentEntityId" id="parentEntityId">
                                <option value="-1">Select Process/Cycle</option>
                                <c:choose>
                                  <c:when test="${approver eq 1 || recommendaitonOwner eq 1 || reviewer eq 1 }">
                                    <c:forEach items="${parentEntityList}" var="parentEntity">
                                      <c:if test="${parentEntity.mEntityId eq sessionUserInfo.userEntity.entitySource.mEntityId }">
                                        <option value="${parentEntity.mEntityId }">${parentEntity.entityAcronym } - ${parentEntity.entityName}</option>
                                      </c:if>
                                    </c:forEach>
                                  </c:when>
                                  <c:otherwise>
                                    <c:forEach items="${parentEntityList}" var="parentEntity">
                                      <option value="${parentEntity.mEntityId}">${parentEntity.entityAcronym } - ${parentEntity.entityName}</option>
                                    </c:forEach>
                                  </c:otherwise>
                                </c:choose>
                              </select>
                            </div>
                            <div class="col-md-3">
                              <h6>Frequency</h6>
                              <input type="hidden" id="tempParentId" value="${tempParentId }" />
                              <select class="custom-select mb-3 text-light border-0 bg-white" name="parentEntityId" id="parentEntityId">
                                <option value="-1">Select Frequency</option>
                                <c:choose>
                                  <c:when test="${approver eq 1 || recommendaitonOwner eq 1 || reviewer eq 1 }">
                                    <c:forEach items="${parentEntityList}" var="parentEntity">
                                      <c:if test="${parentEntity.mEntityId eq sessionUserInfo.userEntity.entitySource.mEntityId }">
                                        <option value="${parentEntity.mEntityId }">${parentEntity.entityAcronym } - ${parentEntity.entityName}</option>
                                      </c:if>
                                    </c:forEach>
                                  </c:when>
                                  <c:otherwise>
                                    <c:forEach items="${parentEntityList}" var="parentEntity">
                                      <option value="${parentEntity.mEntityId}">${parentEntity.entityAcronym } - ${parentEntity.entityName}</option>
                                    </c:forEach>
                                  </c:otherwise>
                                </c:choose>
                              </select>
                            </div>
                            <div class="col-md-3">
                              <h6>Responsible Person</h6>
                              <input type="hidden" id="tempParentId" value="${tempParentId }" />
                              <select class="custom-select mb-3 text-light border-0 bg-white" name="parentEntityId" id="parentEntityId">
                                <option value="-1">Select Responsible Persion</option>
                                <c:choose>
                                  <c:when test="${approver eq 1 || recommendaitonOwner eq 1 || reviewer eq 1 }">
                                    <c:forEach items="${parentEntityList}" var="parentEntity">
                                      <c:if test="${parentEntity.mEntityId eq sessionUserInfo.userEntity.entitySource.mEntityId }">
                                        <option value="${parentEntity.mEntityId }">${parentEntity.entityAcronym } - ${parentEntity.entityName}</option>
                                      </c:if>
                                    </c:forEach>
                                  </c:when>
                                  <c:otherwise>
                                    <c:forEach items="${parentEntityList}" var="parentEntity">
                                      <option value="${parentEntity.mEntityId}">${parentEntity.entityAcronym } - ${parentEntity.entityName}</option>
                                    </c:forEach>
                                  </c:otherwise>
                                </c:choose>
                              </select>
                            </div>
                            <div class="col-md-3">
                              <h6>Manager</h6>
                              <input type="hidden" id="tempParentId" value="${tempParentId }" />
                              <select class="custom-select mb-3 text-light border-0 bg-white" name="parentEntityId" id="parentEntityId">
                                <option value="-1">Select Manager</option>
                                <c:choose>
                                  <c:when test="${approver eq 1 || recommendaitonOwner eq 1 || reviewer eq 1 }">
                                    <c:forEach items="${parentEntityList}" var="parentEntity">
                                      <c:if test="${parentEntity.mEntityId eq sessionUserInfo.userEntity.entitySource.mEntityId }">
                                        <option value="${parentEntity.mEntityId }">${parentEntity.entityAcronym } - ${parentEntity.entityName}</option>
                                      </c:if>
                                    </c:forEach>
                                  </c:when>
                                  <c:otherwise>
                                    <c:forEach items="${parentEntityList}" var="parentEntity">
                                      <option value="${parentEntity.mEntityId}">${parentEntity.entityAcronym } - ${parentEntity.entityName}</option>
                                    </c:forEach>
                                  </c:otherwise>
                                </c:choose>
                              </select>
                            </div>
                            <div class="col-md-3">
                              <h6>PRAAC</h6>
                              <input type="hidden" id="tempParentId" value="${tempParentId }" />
                              <select class="custom-select mb-3 text-light border-0 bg-white" name="parentEntityId" id="parentEntityId">
                                <option value="-1">Select PRAAC</option>
                                <c:choose>
                                  <c:when test="${approver eq 1 || recommendaitonOwner eq 1 || reviewer eq 1 }">
                                    <c:forEach items="${parentEntityList}" var="parentEntity">
                                      <c:if test="${parentEntity.mEntityId eq sessionUserInfo.userEntity.entitySource.mEntityId }">
                                        <option value="${parentEntity.mEntityId }">${parentEntity.entityAcronym } - ${parentEntity.entityName}</option>
                                      </c:if>
                                    </c:forEach>
                                  </c:when>
                                  <c:otherwise>
                                    <c:forEach items="${parentEntityList}" var="parentEntity">
                                      <option value="${parentEntity.mEntityId}">${parentEntity.entityAcronym } - ${parentEntity.entityName}</option>
                                    </c:forEach>
                                  </c:otherwise>
                                </c:choose>
                              </select>
                            </div>
		    </div>
                          <div class="card-tools" align="right">
                            <button type="submit" title="Filter Cycle Information" class="btn btn-default">Search</button>
                            &emsp;<button onclick='$("#auditYearlyPlanId").val(-1);$("#parentEntityId").val(-1);$("#childEntityId").val(-1);$("#cycleId").val(-1);$("#ownerId").val(-1);$("#approver1").val(-1);$("#approver2").val(-1);$("#teamLead").val(-1);$("#recoStatus").val(-1);location.href="recommendation-tracker"' 
                              title="Clear Cycle Information" class="btn btn-default">Clear</button>
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="row">
              <div class="col-md-12">
                <div class="card card-primary card-tabs">
                  <div class="card-header p-0 pt-1 bg-color-anand-one">
                    <ul class="nav nav-tabs" id="custom-tabs-three-tab" role="tablist">
                      <li class="nav-item">
                        <a class="nav-link active" id="auditPlanExec" data-toggle="pill" href="#auditPlanExecHref" 
                          role="tab" aria-controls="auditPlanExecProfile" aria-selected="true"><strong>Total</strong></a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link " id="auditPlanExec" data-toggle="pill" href="#auditPlanExecHref" 
                          role="tab" aria-controls="auditPlanExecProfile" aria-selected="true"><strong>Monthly</strong></a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link " id="auditPlanExec" data-toggle="pill" href="#auditPlanExecHref" 
                          role="tab" aria-controls="auditPlanExecProfile" aria-selected="true"><strong>Quaterly</strong></a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link " id="auditPlanExec" data-toggle="pill" href="#auditPlanExecHref" 
                          role="tab" aria-controls="auditPlanExecProfile" aria-selected="true"><strong>Half-Yearly</strong></a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link " id="auditPlanExec" data-toggle="pill" href="#auditPlanExecHref" 
                          role="tab" aria-controls="auditPlanExecProfile" aria-selected="true"><strong>Yearly</strong></a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link " id="auditPlanExec" data-toggle="pill" href="#auditPlanExecHref" 
                          role="tab" aria-controls="auditPlanExecProfile" aria-selected="true"><strong>Once-In Two Years</strong></a>
                      </li>
                    </ul>
                  </div>
                  <div class="tab-content active show" id="custom-tabs-three-tabContent">
                    <div class="tab-pane fade active show" id="auditPlanExecHref" role="tabpanel" aria-labelledby="auditPlanExec">
                      <div class="row">
                        <div class="card-body">
                          <div class="row">
                            <div class="col-md-8">
                              <div class="row">
                                <div class="col-md-6">
                                  <div class="info-box mb-3 bg-color-anand-danger-one">
                                    <span class="info-box-icon"><i class="fas fa-list-ol"></i></span>
                                    <div class="info-box-content">
                                      <span class="info-box-text"><strong>Pending</strong></span>
                                      <span class="info-box-number"><strong>20</strong></span>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-md-6">
                                  <div class="info-box mb-3 bg-info-anand-warning">
                                    <span class="info-box-icon"><i class="fas fa-spinner"></i></span>
                                    <div class="info-box-content">
                                      <span class="info-box-text"><strong>Waiting At Manager</strong></span>
                                      <span class="info-box-number"><strong>20</strong></span>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-md-6">
                                  <div class="info-box mb-3 bg-info-anand-warning2">
                                    <span class="info-box-icon"><i class="fas fa-spinner"></i></span>
                                    <div class="info-box-content">
                                      <span class="info-box-text"><strong>Waiting At PRAAC</strong></span>
                                      <span class="info-box-number"><strong>20</strong></span>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-md-6">
                                  <div class="info-box mb-3 bg-color-anand-one">
                                    <span class="info-box-icon"><i class="fas fa-window-close"></i></span>
                                    <div class="info-box-content">
                                      <span class="info-box-text"><strong>Rejected By Manager</strong></span>
                                      <span class="info-box-number"><strong>20</strong></span>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-md-6">
                                  <div class="info-box mb-3 bg-color-anand-two">
                                    <span class="info-box-icon"><i class="fas fa-window-close"></i></span>
                                    <div class="info-box-content">
                                      <span class="info-box-text"><strong>Rejected by PRAAC</strong></span>
                                      <span class="info-box-number"><strong>20</strong></span>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-md-6">
                                  <div class="info-box mb-3 bg-color-anand-success-one">
                                    <span class="info-box-icon fas fa-check-square"></span>
                                    <div class="info-box-content">
                                      <span class="info-box-text"><strong>Completed</strong></span>
                                      <span class="info-box-number"><strong>20</strong></span>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-4" >
                              <div class="row">
                                <div class="col-md-12">
                                  <!-- <div class="chart-responsive" >
                                    <div class="chartjs-size-monitor">
                                      <div class="chartjs-size-monitor-expand">
                                        <div class="">
                                        </div>
                                      </div>
                                      <div class="chartjs-size-monitor-shrink">
                                        <div class=""></div>
                                      </div>
                                    </div>
                                    <canvas id="pieChart" style="display: block;" class="chartjs-render-monitor" style='height:20px'></canvas>
                                  </div> -->
                                  <canvas id="pieChart" height="100px"></canvas>
                                </div>
                              </div>
                            </div>
                            
                            <div class="col-md-12" style="overflow-x: auto;">
		                <table class="table table-bordered dataTable anand-table-font-size" id="departmentTable" style="width:100%%">
		                  <thead>
		                    <tr class="bg-table-head">
		                      <th>Action</th>
		                      <th>Plant</th>
		                      <th>Upload Date</th>
		                      <th>Department</th>
		                      <th>Control No</th>
		                      <th>Process</th>
		                      <th>Sub Process</th>
		                      <th>Process Owner</th>
		                      <th>Responsibility</th>
		                      <th>Line Manager</th>
		                    </tr>
		                  </thead>
		                  <tbody>
		                  </tbody>
		                  <tfoot>
		                    <tr class="bg-table-foot">
		                      <th>Action</th>
		                      <th>Plant</th>
		                      <th>Upload Date</th>
		                      <th>Department</th>
		                      <th>Control No</th>
		                      <th>Process</th>
		                      <th>Sub Process</th>
		                      <th>Process Owner</th>
		                      <th>Responsibility</th>
		                      <th>Line Manager</th>
		                    </tr>
		                  </tfoot>
		                </table>
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
    <script src="usedStaticFiles/js/jsp_js_files/ifc/dashboard.js"></script>
  </body>
</html>