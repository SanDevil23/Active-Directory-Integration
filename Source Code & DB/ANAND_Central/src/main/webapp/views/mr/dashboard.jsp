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
   <title>DASHBOARD | MR Portal | ANAND GROUP</title>
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
                <h5 class="font-color-anand-one font-weight-bold">DASHBOARD - Manpower Requisition</h5>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="dashboard" title="Dashboard"><strong>Dashboard</strong></a></li>
                  <li class="breadcrumb-item active"><strong>Manpower Requisition</strong></li>
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
                    <h5 class="card-title font-color-anand-two font-weight-bold"><i class="fas fa-filter"></i>&emsp;Filters</h5>
                    <div class="card-tools">
                      <button type="button" class="btn btn-tool" data-card-widget="collapse">
                        <i class="fas fa-plus font-color-anand-two"></i>
                      </button>
                    </div>
                  </div>
                  <div class="card-body" style="display: none;">
                    <div class="row">
                      <div class="col-md-12">
                        <form action="postTrackerValue" id="postTrackerValue" method="post" >
		                  <div class="row">
		                    <div class="col-md-2">
                              <h6>Year</h6>
                              <select name="yearId" class="custom-select mb-3 text-light border-0 bg-white yearId" id='yearId'>
                                <option value="2023">2023</option>
                                <option value="2022">2022</option>
                                <option value="2021">2021</option>
                                <option value="2020">2020</option>
                              </select>
                            </div>
		                    <div class="col-md-5">
                              <h6>Parent Entity</h6>
                              <input type="hidden" id="tempParentId" value="${tempParentId }" />
                              <select class="custom-select mb-3 text-light border-0 bg-white parentEntityId" name="parentEntityId" id="parentEntityId">
                                <option value="-1">Select Parent Entity</option>
                                <option value="-2">North</option>
                                <option value="-3">South</option>
                                <option value="-4">West</option>
                                <c:forEach items="${activeParentEntityList}" var="parentEntity">
                                  <option value="${parentEntity.mEntityId }">${parentEntity.entityAcronym } - ${parentEntity.entityName}</option>
                                </c:forEach>
                              </select>
                            </div>
                            <div class="col-md-5 childEntityList">
                              <h6>Child Entity</h6>
                              <input type="hidden" id="tempPlantId" value="${tempPlantId }" />
                              <select class="custom-select mb-3 text-light border-0 bg-white plantId" name="childEntityId" id="childEntityId">
                                <option value="-1">Select Child Entity</option>
                                <c:forEach items="${activeChildEntityList}" var="parentEntity">
                                  <c:choose>
                                    <c:when test="${not empty tempParentId }">
                                      <c:if test="${tempParentId eq parentEntity.entitySource.mEntityId }">
                                        <option value="${parentEntity.mEntityId }">${parentEntity.entityName} - ${parentEntity.locationId.locationName}</option>
                                      </c:if>
                                    </c:when>
                                    <c:otherwise>
                                      <option value="${parentEntity.mEntityId }">${parentEntity.entityName} - ${parentEntity.locationId.locationName}</option>
                                    </c:otherwise>
                                  </c:choose>
                                </c:forEach>
                              </select>
                            </div>
                            <div class="col-sm-2"><br>
                              <h6>Status</h6>
                              <div class="form-group">
                                <div class="custom-control custom-checkbox">
                                  <input class="custom-control-input custom-control-input-anand-one" type="checkbox" id="customCheckbox1" value="option1">
                                  <label for="customCheckbox1" class="custom-control-label font-color-anand-three font-weight-bold">Open</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                  <input class="custom-control-input custom-control-input-anand-one" type="checkbox" id="customCheckbox2">
                                  <label for="customCheckbox2" class="custom-control-label font-color-anand-warning font-weight-bold">Approval Pending</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                  <input class="custom-control-input custom-control-input-anand-one" type="checkbox" id="customCheckbox3">
                                  <label for="customCheckbox3" class="custom-control-label font-color-anand-danger font-weight-bold">Rejected</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                  <input class="custom-control-input custom-control-input-anand-one" type="checkbox" id="customCheckbox4">
                                  <label for="customCheckbox4" class="custom-control-label font-color-anand-success font-weight-bold">Closed</label>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-4"><br>
                              <h6>Initiator</h6>
                              <input type="hidden" id="tempProcessId" value="${tempProcessId }" />
                              <select class="custom-select mb-3 text-light border-0 bg-white processId" name="processId" id="processId">
                                <option value="-1">Select Initiator</option>
                                <c:forEach items="${activeCategoryList }" var="category">
                                  <option value="${category.mAemsCategoryId }">${category.aemsCategoryName }</option>
                                </c:forEach>
                              </select>
                            </div>
                            <div class="col-md-4"><br>
                              <h6>Approver</h6>
                              <input type="hidden" id="tempProcessId" value="${tempProcessId }" />
                              <select class="custom-select mb-3 text-light border-0 bg-white processId" name="processId" id="processId">
                                <option value="-1">Select Approver</option>
                                <c:forEach items="${activeSubCategoryList }" var="subCategory">
                                  <option value="${subCategory.mAemsSubCategoryId }">${subCategory.aemsSubCategoryName }</option>
                                </c:forEach>
                              </select>
                            </div>
                            <div class="col-md-1"><br><br>
                              <button type="submit" id="savePostTrackerValue" onclick="savePostTrackerValue();" title="Submit Cycle Information" class="btn bg-color-anand-one">Filter</button>
                            </div>
                            <div class="col-md-1"><br><br>
                              <button type="button" id="clearPostTrackerValue" title="Clear Cycle Information" class="btn bg-color-anand-two clearRcmTrackerFilter">Clear</button>
                            </div>
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
                
                <div class="card card-primary card-outline bg-card-secondary-anand">
                  <div class="card-header">
                    <h5 class="card-title font-color-anand-three font-weight-bold">Dashboard</h5>
                  </div>
                  <div class="card-body">
                    <div class="row">
                      <div class="card-body">
                        <div class="row">
                          <div class="col-md-8">
                            <div class="row">
                              <div class="col-md-6">
                                <div class="info-box mb-3 bg-color-anand-three">
                                  <span class="info-box-icon"><i class="fas fa-list-ol"></i></span>
                                  <div class="info-box-content">
                                    <span class="info-box-text"><strong>Open</strong></span>
                                    <span class="info-box-number"><strong>60</strong></span>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-6">
                                <div class="info-box mb-3 bg-info-anand-warning">
                                  <span class="info-box-icon"><i class="fas fa-spinner"></i></span>
                                  <div class="info-box-content">
                                    <span class="info-box-text"><strong>Approval Pending</strong></span>
                                    <span class="info-box-number"><strong>60</strong></span>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-6">
                                <div class="info-box mb-3 bg-color-anand-danger-one">
                                  <span class="info-box-icon"><i class="fas fa-window-close"></i></span>
                                  <div class="info-box-content">
                                    <span class="info-box-text"><strong>Rejected</strong></span>
                                    <span class="info-box-number"><strong>60</strong></span>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-6">
                                <div class="info-box mb-3 bg-color-anand-success-one">
                                  <span class="info-box-icon fas fa-check-square"></span>
                                  <div class="info-box-content">
                                    <span class="info-box-text"><strong>Closed</strong></span>
                                    <span class="info-box-number"><strong>60</strong></span>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-12" style="overflow-x: auto;">
                                <table class="table table-bordered anand-table-font-size" id="departmentTable" style="width:100%%">
                                  <thead>
                                    <tr class="bg-table-head">
                                      <th>Company</th>
                                      <th>Location</th>
                                      <th class="bg-color-anand-three">Open</th>
                                      <th class="bg-info-anand-warning">Approval Pending</th>
                                      <th class="bg-color-anand-danger-one">Rejected</th>
                                      <th class="bg-color-anand-success-one">Closed</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr class="bg-table-row-0">
                                      <th>AAPL</th>
                                      <th>New Delhi</th>
                                      <th>20</th>
                                      <th>20</th>
                                      <th>20</th>
                                      <th>20</th>
                                    </tr>
                                    <tr class="bg-table-row-1">
                                      <th>AAPL</th>
                                      <th>Pune</th>
                                      <th>20</th>
                                      <th>20</th>
                                      <th>20</th>
                                      <th>20</th>
                                    </tr>
                                    <tr class="bg-table-row-0">
                                      <th>AAPL</th>
                                      <th>Chennai</th>
                                      <th>20</th>
                                      <th>20</th>
                                      <th>20</th>
                                      <th>20</th>
                                    </tr>
                                    <tr class="bg-table-row-1">
                                      <th>Total</th>
                                      <th>-</th>
                                      <th>60</th>
                                      <th>60</th>
                                      <th>60</th>
                                      <th>60</th>
                                    </tr>
                                  </tbody>
                                  <tfoot>
                                    <tr class="bg-table-foot">
                                      <th>Company</th>
                                      <th>Location</th>
                                      <th class="bg-color-anand-three">Open</th>
                                      <th class="bg-info-anand-warning">Approval Pending</th>
                                      <th class="bg-color-anand-danger-one">Rejected</th>
                                      <th class="bg-color-anand-success-one">Closed</th>
                                    </tr>
                                  </tfoot>
                                </table>
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
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                
                <!-- <div class="card card-primary card-tabs">
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
                                  <div class="info-box mb-3 bg-color-anand-three">
                                    <span class="info-box-icon"><i class="fas fa-list-ol"></i></span>
                                    <div class="info-box-content">
                                      <span class="info-box-text"><strong>Open</strong></span>
                                      <span class="info-box-number"><strong>20</strong></span>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-md-6">
                                  <div class="info-box mb-3 bg-info-anand-warning">
                                    <span class="info-box-icon"><i class="fas fa-spinner"></i></span>
                                    <div class="info-box-content">
                                      <span class="info-box-text"><strong>Approval Pending</strong></span>
                                      <span class="info-box-number"><strong>20</strong></span>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-md-6">
                                  <div class="info-box mb-3 bg-color-anand-danger-one">
                                    <span class="info-box-icon"><i class="fas fa-window-close"></i></span>
                                    <div class="info-box-content">
                                      <span class="info-box-text"><strong>Rejected</strong></span>
                                      <span class="info-box-number"><strong>20</strong></span>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-md-6">
                                  <div class="info-box mb-3 bg-color-anand-success-one">
                                    <span class="info-box-icon fas fa-check-square"></span>
                                    <div class="info-box-content">
                                      <span class="info-box-text"><strong>Closed</strong></span>
                                      <span class="info-box-number"><strong>20</strong></span>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-md-12" style="overflow-x: auto;">
                                  <table class="table table-bordered dataTable anand-table-font-size" id="departmentTable" style="width:100%%">
                                    <thead>
                                      <tr class="bg-table-head">
                                        <th>Company</th>
                                        <th>Location</th>
                                        <th class="bg-color-anand-three">Open</th>
                                        <th class="bg-info-anand-warning">Approval Pending</th>
                                        <th class="bg-color-anand-danger-one">Rejected</th>
                                        <th class="bg-color-anand-success-one">Closed</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                      <tr class="bg-table-row-0">
                                        <th>AAPL</th>
                                        <th>New Delhi</th>
                                        <th>20</th>
                                        <th>20</th>
                                        <th>20</th>
                                        <th>20</th>
                                      </tr>
                                      <tr class="bg-table-row-1">
                                        <th>AAPL</th>
                                        <th>Pune</th>
                                        <th>20</th>
                                        <th>20</th>
                                        <th>20</th>
                                        <th>20</th>
                                      </tr>
                                      <tr class="bg-table-row-0">
                                        <th>AAPL</th>
                                        <th>Chennai</th>
                                        <th>20</th>
                                        <th>20</th>
                                        <th>20</th>
                                        <th>20</th>
                                      </tr>
                                    </tbody>
                                    <tfoot>
                                      <tr class="bg-table-foot">
                                        <th>Company</th>
                                        <th>Location</th>
                                        <th class="bg-color-anand-three">Open</th>
                                        <th class="bg-info-anand-warning">Approval Pending</th>
                                        <th class="bg-color-anand-danger-one">Rejected</th>
                                        <th class="bg-color-anand-success-one">Closed</th>
                                      </tr>
                                    </tfoot>
                                  </table>
                                </div>
                              </div>
                            </div>
                            <div class="col-md-4" >
                              <div class="row">
                                <div class="col-md-12">
                                  <div class="chart-responsive" >
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
                                  </div>
                                  <canvas id="pieChart" height="100px"></canvas>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>      
                  </div>
                </div> -->
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
    <script src="usedStaticFiles/js/jsp_js_files/mr/dashboard.js"></script>
  </body>
</html>