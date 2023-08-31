<!-- ****************************************************************************************
# *******************************************************************************************
# Copyright © 2021 Anand Group India. All rights reserved.									*
# No part of this product may be reproduced in any form by any means without prior			*
# written authorization of Anand Automotive Private Limited and its licensors, if any.		*
# *******************************************************************************************
# Author - Sheshadhri Iyer																	*
# *************************************************************************************** -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>REPORTS | ANAND GROUP</title>
    <%@include file="/views/includeJSP/cssFiles.jsp"%>
  </head>
  <body class="sidebar-mini layout-navbar-fixed sidebar-collapse pace-primary">
    <div class="wrapper">
      <%@include file="/views/includeJSP/header.jsp"%>
      <%@include file="/views/includeJSP/leftSideBar.jsp"%>
      <div class="content-wrapper">
        <section class="content-header">
          <div class="container-fluid">
            <div class="row mb-2">
              <div class="col-sm-6">
                <h5 class="font-color-anand-one"><strong>MIS REPORTS</strong></h5>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="dashboard" title="Dashboard"><strong>Dashboard</strong></a></li>
                  <li class="breadcrumb-item active"><strong>REPORTS</strong></li>
                </ol>
              </div>
            </div>
          </div>
        </section>

        <c:if test="${not empty regMsg }">
          <section class="content content-margin">
            <div class="container-fluid">
              <div class="alert bg-info-anand-${css } alert-dismissible">
                <button type="button" title="CLose Alert Box" class="close" data-dismiss="alert" aria-hidden="true"><i class="fas fa-times"></i></button>
                <c:if test="${css eq 'danger'}">
                  <h5><i class="icon fas fa-ban"></i>${regMsg }</h5>
                </c:if>
                <c:if test="${css ne 'danger'}">
                  <h5><i class="icon fas fa-check"></i>${regMsg }</h5>
                </c:if>
              </div>
            </div>
          </section>
        </c:if>

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
		      <div class="col-md-12" style="overflow-x: auto;">
		                <table class="table table-bordered dataTable anand-table-font-size" id="departmentTable">
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
		</section>

		<div class="modal fade" id="editDepartmentModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header bg-secondary">
		        <h4 class="modal-title">Edit Department Information</h4>
		      </div>
		      <div class="modal-body">
		        <div class="row">
		          <c:if test="${not empty regMsgEdit }">
		            <div class="col-md-12">
		              <div class="alert bg-info-anand-${cssEdit } alert-dismissible">
		                <button type="button" title="CLose Alert Box" class="close" data-dismiss="alert" aria-hidden="true"><i class="fas fa-times"></i></button>
		                <c:if test="${css eq 'danger'}">
		                  <h5><i class="icon fas fa-ban"></i>${regMsgEdit }</h5>
		                </c:if>
		                <c:if test="${css ne 'danger'}">
		                  <h5><i class="icon fas fa-check"></i>${regMsgEdit }</h5>
		                </c:if>
		              </div>
		            </div>
		          </c:if>
		          <div class="col-md-12">
		            <div class="card-body">
		              <div class="row">
		                <div class="col-md-12">
		                  <div class="form-group">
		                    <label for="departmentNameEdit"><span class="mandatory">*</span>Department Name</label>
		                    <input type="text" class="form-control" id="departmentNameEdit" placeholder="Enter Department Name" path="departmentName" />
		                    <span class="error invalid-feedback" id="departmentNameErrorEdit"></span>
		                  </div>
		                </div>
		                <div class="col-md-12">
		                  <div class="form-group">
		                    <label for="departmentDescriptionEdit"><span class="mandatory">*</span>Department Description</label>
		                    <input type="text" class="form-control" id="departmentDescriptionEdit" placeholder="Enter Department Description" path="departmentDescription" />
		                    <span class="error invalid-feedback" id="departmentDescriptionErrorEdit"></span>
		                  </div>
		                </div>
		                <div class="col-md-12">
		                  <div class="form-check" id="isActiveEditDiv">
		                    <label><span class="mandatory">*</span>Department Active/InActive</label>
		                    <div class="custom-control custom-radio">
		                      <label for="departmentActiveEdit1" class="custom-control-label text-green">Active</label>
		                    </div>
		                    <div class="custom-control custom-radio">
		                      <label for="departmentActiveEdit2" class="custom-control-label text-red">Inactive</label>
		                    </div>
		                    <span class="error invalid-feedback" id="isActiveEditError" style="display:block" ></span> 
		                  </div>
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		      <div class="modal-footer justify-content-between">
		        <button onclick="" id="closeEditDepartmentModal" type="button" class="btn bg-info-anand-danger" data-dismiss="modal">Close</button>
		        <button type="button" id="saveDepartmentChanges" class="btn bg-color-anand-two text-white" title="Save Department Changes">Save Department Changes</button>
		      </div>
		    </div>
		  </div>
		</div>

      </div>
      <%@include file="/views/includeJSP/footer.jsp"%>
    </div>
    <%@include file="/views/includeJSP/jsFiles.jsp"%>
    <%@include file="/views/includeJSP/dataTablesImport.jsp"%>
    <script src="usedStaticFiles/js/jsp_js_files/reports/reports.js"></script>
  </body>
</html>