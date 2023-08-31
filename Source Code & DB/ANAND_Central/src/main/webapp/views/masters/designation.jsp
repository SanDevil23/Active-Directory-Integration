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
    <title>DESIGNATION | ANAND GROUP</title>
    <%@include file="../includeJSP/cssFiles.jsp"%>
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
                <h5 class="font-color-anand-one"><strong>DESIGNATION LIST</strong></h5>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="dashboard" title="Dashboard"><strong>Dashboard</strong></a></li>
                  <li class="breadcrumb-item"><a href="master" title="Masters Dashboard"><strong>Masters</strong></a></li>
                  <li class="breadcrumb-item active"><strong>Designation</strong></li>
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
		        <form:form modelAttribute="designation" action="designation" id="designation" method="post">
		        <div class="card card-primary card-outline collapsed-card bg-card-primary-anand">
		          <div class="card-header" data-card-widget="collapse">
		            <h5 class="card-title">Add Designation</h5>
		            <div class="card-tools">
		              <button type="button" class="btn btn-tool" data-card-widget="collapse">
		                <i class="fas fa-plus"></i>
		              </button>
		              <input type="hidden" value="${openAddModal }" id="openAddModel" />
		              <input type="hidden" value="${openEditModel }" id="openEditModel" />
		            </div>
		          </div>
		          <div class="card-body" style="display: none;">
		            <div class="row">
		              <div class="col-md-4">
		                <div class="form-group">
		                  <label for="designationName"><span class="mandatory">*</span>Designation Name</label>
		                  <form:input type="text" class="form-control" id="designationName" placeholder="Enter Designation Name" path="designationName" />
		                  <span class="error invalid-feedback" id="designationNameError"></span>
		                </div>
		              </div>
		              <div class="col-md-4">
		                <div class="form-check" id="isActiveDiv">
		                  <label><span class="mandatory">*</span>Designation Active/InActive</label>
		                  <div class="custom-control custom-radio">
		                    <form:radiobutton path="designationActive" class="custom-control-input" value="1" id="designationActive1" name="designationActive" />
		                    <label for="designationActive1" class="custom-control-label text-green">Active</label>
		                  </div>
		                  <div class="custom-control custom-radio">
		                    <form:radiobutton path="designationActive" class="custom-control-input" value="0" id="designationActive2" name="designationActive" />
		                    <label for="designationActive2" class="custom-control-label text-red">Inactive</label>
		                  </div>
		                  <span class="error invalid-feedback" id="isActiveError" style="display:block" ></span> 
		                </div>
		              </div>
		              <div class="col-md-4">
		                <div class="form-check">
		                  <br>
		                  <button style="float: left;" title="Add Designation" type="submit" id="submitDesignationButton" class="btn btn-primary bg-color-anand-two text-white">Submit</button>
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
		        </form:form>
		      </div>
		    </div>
		    
		    <div class="row">
		      <div class="col-md-12">
		        <div class="card card-primary card-outline bg-card-primary-anand">
		          <div class="card-header">
		            <h5 class="card-title">List of Designations</h5>
		          </div>
		          <div class="card-body">
		            <div class="col-md-12">
		                <table class="table table-bordered dataTable anand-table-font-size" id="designationTable">
		                  <thead>
		                    <tr class="bg-table-head">
		                      <th>Action</th>
		                      <th>Designation</th>
		                      <th>Active/In-Active</th>
		                      <th>Created By</th>
		                      <th>Created On</th>
		                      <th>Updated By</th>
		                      <th>Updated On</th>
		                    </tr>
		                  </thead>
		                  <tbody>
		                    <c:forEach items="${designationList }" var="designation" varStatus="designationLoop">
		                      <tr class="bg-table-row-${designationLoop.index %2 }">
		                        <td>
		                          <c:choose>
		                            <c:when test="${itAdmin eq 1 }">
		                              <a href="#" title="Edit Designation" onclick="editDesignation('${designation.mDesignationId }');">
		                                <i class="fas fa-edit"></i>
		                              </a>
		                            </c:when>
		                            <c:otherwise>N-A</c:otherwise>
		                          </c:choose>
		                        </td>
		                        <td>${designation.designationName }</td>
		                        <td>
		                          <c:choose>
		                            <c:when test="${designation.designationActive eq 1 }"><span class="badge bg-info-anand-success">Active</span></c:when>
		                            <c:otherwise><span class="badge bg-info-anand-danger">In-Active</span></c:otherwise>
		                          </c:choose>
		                        </td>
		                        <td>${designation.mUserId.userFirstName } ${designation.mUserId.userLastName }</td>
		                        <td><fmt:formatDate pattern = "dd-MMM-yyyy" value = "${designation.createdOn }" /></td>
		                        <td>${designation.mUserIdUpdate.userFirstName } ${designation.mUserIdUpdate.userLastName }</td>
		                        <td><fmt:formatDate pattern = "dd-MMM-yyyy" value = "${designation.updatedOn }" /></td>
		                      </tr>
		                    </c:forEach>
		                  </tbody>
		                  <tfoot>
		                    <tr class="bg-table-foot">
		                      <th>Action</th>
		                      <th>Designation</th>
		                      <th>Active/In-Active</th>
		                      <th>Created By</th>
		                      <th>Created On</th>
		                      <th>Updated By</th>
		                      <th>Updated On</th>
		                    </tr>
		                  </tfoot>
		                </table>
		              </div>
		          </div>
		        </div>
		      </div>
		    </div>

		  </div>
		</section>

		<div class="modal fade" id="editDesignationModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <form:form modelAttribute="designation" action="designation" id="designationEdit" method="post">
		      <form:hidden path="mDesignationId" id="mDesignationId" />
		      <div class="modal-header bg-secondary">
		        <h4 class="modal-title">Edit Designation Information</h4>
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
		                    <label for="designationNameEdit"><span class="mandatory">*</span>Designation Name</label>
		                    <form:input type="text" class="form-control" id="designationNameEdit" placeholder="Enter Designation Name" path="designationName" />
		                    <span class="error invalid-feedback" id="designationNameErrorEdit"></span>
		                  </div>
		                </div>
		                <div class="col-md-12">
		                  <div class="form-check" id="isActiveEditDiv">
		                    <label><span class="mandatory">*</span>Designation Active/InActive</label>
		                    <div class="custom-control custom-radio">
		                      <form:radiobutton path="designationActive" class="custom-control-input" value="1" id="designationActiveEdit1" name="designationActive" />
		                      <label for="designationActiveEdit1" class="custom-control-label text-green">Active</label>
		                    </div>
		                    <div class="custom-control custom-radio">
		                      <form:radiobutton path="designationActive" class="custom-control-input" value="0" id="designationActiveEdit2" name="designationActive" />
		                      <label for="designationActiveEdit2" class="custom-control-label text-red">Inactive</label>
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
		        <button onclick="" id="closeEditDesignationModal" type="button" class="btn bg-info-anand-danger" data-dismiss="modal">Close</button>
		        <button type="submit" id="saveDesignationChanges" class="btn bg-color-anand-two text-white" title="Save Designation Changes">Save Designation Changes</button>
		      </div>
		      </form:form>
		    </div>
		  </div>
		</div>

      </div>
      <%@include file="/views/includeJSP/footer.jsp"%>
    </div>
    <%@include file="/views/includeJSP/jsFiles.jsp"%>
    <%@include file="/views/includeJSP/dataTablesImport.jsp"%>
    <script src="usedStaticFiles/js/jsp_js_files/masters/designation.js"></script>
  </body>
</html>