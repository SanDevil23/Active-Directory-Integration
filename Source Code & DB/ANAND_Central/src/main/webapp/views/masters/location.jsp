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
    <title>LOCATION | ANAND GROUP</title>
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
                <h5 class="font-color-anand-one"><strong>LOCATION LIST</strong></h5>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="dashboard" title="Dashboard"><strong>Dashboard</strong></a></li>
                  <li class="breadcrumb-item"><a href="master" title="Masters Dashboard"><strong>Masters</strong></a></li>
                  <li class="breadcrumb-item active"><strong>Location</strong></li>
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
		        <form:form modelAttribute="location" action="location" id="location" method="post">
		        <div class="card card-primary card-outline collapsed-card bg-card-primary-anand">
		          <div class="card-header" data-card-widget="collapse">
		            <h5 class="card-title">Add Location</h5>
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
		              <div class="col-md-3">
		                <div class="form-group">
		                  <label for="locationName"><span class="mandatory">*</span>Location Name</label>
		                  <form:input type="text" class="form-control" id="locationName" placeholder="Enter Location Name" path="locationName" />
		                  <span class="error invalid-feedback" id="locationNameError"></span>
		                </div>
		              </div>
		              <div class="col-md-3">
		                <div class="form-group">
		                  <label for="locationActive"><span class="mandatory">*</span>Location Zone</label>
		                  <form:select path="zoneIdTemp" id="zoneIdTemp" class="form-control">
		                    <form:option value="-1">Select Zone</form:option>
		                    <c:forEach items="${activeZoneList }" var="zone" varStatus="zoneStatus">
		                      <form:option value="${zone.mZoneId }">${zone.zoneName }</form:option>
		                    </c:forEach>
		                  </form:select>
		                  <span class="error invalid-feedback" id="zoneIdTempError"></span>
		                </div>
		              </div>
		              <div class="col-md-3">
		                <div class="form-check" id="isActiveDiv">
		                  <label><span class="mandatory">*</span>Location Active/InActive</label>
		                  <div class="custom-control custom-radio">
		                    <form:radiobutton path="locationActive" class="custom-control-input" value="1" id="locationActive1" name="locationActive" />
		                    <label for="locationActive1" class="custom-control-label text-green">Active</label>
		                  </div>
		                  <div class="custom-control custom-radio">
		                    <form:radiobutton path="locationActive" class="custom-control-input" value="0" id="locationActive2" name="locationActive" />
		                    <label for="locationActive2" class="custom-control-label text-red">Inactive</label>
		                  </div>
		                  <span class="error invalid-feedback" id="isActiveError" style="display:block" ></span> 
		                </div>
		              </div>
		              <div class="col-md-3">
		                <div class="form-check">
		                  <br>
		                  <button style="float: left;" title="Add Location" type="submit" id="submitLocationButton" class="btn btn-primary bg-color-anand-two text-white">Submit</button>
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
		            <h5 class="card-title">List of Locations</h5>
		          </div>
		          <div class="card-body">
		            <div class="row">
		              <div class="col-md-12 tableDiv" style="overflow-x: auto;">
		                <table class="table table-bordered dataTable anand-table-font-size" id="locationTable">
		                  <thead>
		                    <tr class="bg-table-head">
		                      <th>Action</th>
		                      <th>Location</th>
		                      <th>Zone</th>
		                      <th>Active/In-Active</th>
		                      <th>Created By</th>
		                      <th>Created On</th>
		                      <th>Updated By</th>
		                      <th>Updated On</th>
		                    </tr>
		                  </thead>
		                  <tbody>
		                    <c:forEach items="${locationList }" var="location" varStatus="locationLoop">
		                      <tr class="bg-table-row-${locationLoop.index %2 }">
		                        <td>${location.actionForList }</td>
		                        <td>${location.locationName }</td>
		                        <td>${location.mZoneId.zoneName }</td>
		                        <td>
		                          <c:choose>
		                            <c:when test="${location.locationActive eq 1 }"><span class="badge bg-info-anand-success">Active</span></c:when>
		                            <c:otherwise><span class="badge bg-info-anand-danger">In-Active</span></c:otherwise>
		                          </c:choose>
		                        </td>
		                        <td>${location.mUserId.userFirstName } ${location.mUserId.userLastName }</td>
		                        <td><fmt:formatDate pattern = "dd-MMM-yyyy" value = "${location.createdOn }" /></td>
		                        <td>${location.mUserIdUpdated.userFirstName } ${location.mUserIdUpdated.userLastName }</td>
		                        <td><fmt:formatDate pattern = "dd-MMM-yyyy" value = "${location.updatedOn }" /></td>
		                      </tr>
		                    </c:forEach>
		                  </tbody>
		                  <tfoot>
		                    <tr class="bg-table-foot">
		                      <th>Action</th>
		                      <th>Location</th>
		                      <th>Zone</th>
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

		  </div>
		</section>

		<div class="modal fade" id="editLocationModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <form:form modelAttribute="location" action="location" id="locationEdit" method="post">
		      <form:hidden path="mLocationId" id="mLocationId" />
		      <div class="modal-header bg-secondary">
		        <h4 class="modal-title">Edit Zone Information</h4>
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
		                    <label for="locationNameEdit"><span class="mandatory">*</span>Location Name</label>
		                    <form:input type="text" class="form-control" id="locationNameEdit" placeholder="Enter Location Name" path="locationName" />
		                    <span class="error invalid-feedback" id="locationNameErrorEdit"></span>
		                  </div>
		                </div>
		                <div class="col-md-12">
		                  <div class="form-group">
		                    <label for="locationActive"><span class="mandatory">*</span>Location Zone</label>
		                    <form:select path="zoneIdTemp" id="zoneIdTempEdit" class="form-control">
		                      <form:option value="-1">Select Zone</form:option>
		                      <c:forEach items="${activeZoneList }" var="zone" varStatus="zoneStatus">
		                        <form:option value="${zone.mZoneId }">${zone.zoneName }</form:option>
		                      </c:forEach>
		                    </form:select>
		                    <span class="error invalid-feedback" id="zoneIdTempErrorEdit"></span>
		                  </div>
		                </div>
		                <div class="col-md-12">
		                  <div class="form-check" id="isActiveEditDiv">
		                    <label><span class="mandatory">*</span>Location Active/InActive</label>
		                    <div class="custom-control custom-radio">
		                      <form:radiobutton path="locationActive" class="custom-control-input" value="1" id="locationActiveEdit1" name="locationActive" />
		                      <label for="locationActiveEdit1" class="custom-control-label text-green">Active</label>
		                    </div>
		                    <div class="custom-control custom-radio">
		                      <form:radiobutton path="locationActive" class="custom-control-input" value="0" id="locationActiveEdit2" name="locationActive" />
		                      <label for="locationActive2Edit" class="custom-control-label text-red">Inactive</label>
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
		        <button onclick="" id="closeEditLocationModal" type="button" class="btn bg-info-anand-danger" data-dismiss="modal">Close</button>
		        <button type="submit" id="saveLocationChanges" class="btn bg-color-anand-two text-white" title="Save Company Changes">Save Location Changes</button>
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
    <script src="usedStaticFiles/js/jsp_js_files/masters/location.js"></script>
  </body>
</html>