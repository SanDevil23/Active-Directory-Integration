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
    <title>ENTITY | ANAND GROUP</title>
    <%@include file="../includeJSP/cssFiles.jsp"%>
    <style>
      div.dataTables_scroll {
        width: 130%;
        margin: 0 auto;
      }
    </style>
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
                <h5 class="font-color-anand-one"><strong>ENTITY LIST</strong></h5>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="dashboard" title="Dashboard"><strong>Dashboard</strong></a></li>
                  <li class="breadcrumb-item"><a href="master" title="master"><strong>Masters</strong></a></li>
                  <li class="breadcrumb-item active"><strong>Entity</strong></li>
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
		        <form:form modelAttribute="entity" action="entity" id="entity" method="post">
		        <div class="card card-primary card-outline collapsed-card bg-card-primary-anand">
		          <div class="card-header" data-card-widget="collapse">
		            <h5 class="card-title">Add Entity</h5>
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
		              <div class="col-md-12">
		                <div class="row">
		                  <div class="col-md-4">
		                    <div class="form-group">
		                      <label for="entityName"><span class="mandatory">*</span>Name</label>
		                      <form:input type="text" class="form-control" id="entityName" placeholder="Enter Company Name" path="entityName" />
		                      <span class="error invalid-feedback" id="entityNameError"></span>
		                    </div>
		                  </div>
		                  <div class="col-md-4">
		                    <div class="form-group">
		                      <label for="entityName"><span class="mandatory">*</span>Entity Source</label>
		                      <form:select path="parentEntityId" id="parentEntityId" class="form-control">
		                        <form:option value="-1">Select Entity Source</form:option>
		                        <form:option value="0">Parent Entity</form:option>
		                        <c:forEach items="${activeParentEntityList }" var="activeEntity" varStatus="activeEntityLoop">
		                          <form:option value="${activeEntity.mEntityId }">${activeEntity.entityShortName } - ${activeEntity.entityAcronym }</form:option>
		                        </c:forEach>
		                      </form:select>
		                      <span class="error invalid-feedback" id="parentEntityIdError"></span>
		                    </div>
		                  </div>
		                  <div class="col-md-4">
		                    <div class="form-check" id="isActiveDiv">
		                      <label><span class="mandatory">*</span>Entity Active/InActive</label>
		                      <div class="custom-control custom-radio">
		                        <form:radiobutton path="entityActive" class="custom-control-input" value="1" id="entityActive1" name="entityActive" />
		                        <label for="entityActive1" class="custom-control-label text-green">Active</label>
		                      </div>
		                      <div class="custom-control custom-radio">
		                        <form:radiobutton path="entityActive" class="custom-control-input" value="0" id="entityActive2" name="entityActive" />
		                        <label for="entityActive2" class="custom-control-label text-red">Inactive</label>
		                      </div>
		                      <span class="error invalid-feedback" id="isActiveError" style="display:block" ></span> 
		                    </div>
		                  </div>
		                  <div class="col-md-4 shortName" style="display: block;">
		                    <div class="form-group">
		                      <label for="entityShortName"><span class="mandatory">*</span>Short Name</label>
		                      <form:input type="text" class="form-control" id="entityShortName" placeholder="Enter Entity Short Name" path="entityShortName" />
		                      <span class="error invalid-feedback" id="entityShortNameError"></span>
		                    </div>
		                  </div>
		                  <div class="col-md-4 acronym" style="display: block;">
		                    <div class="form-group">
		                      <label for="entityAcronym"><span class="mandatory">*</span>Acronym</label>
		                      <form:input type="text" class="form-control" id="entityAcronym" placeholder="Enter Entity Acronym" path="entityAcronym" />
		                      <span class="error invalid-feedback" id="entityAcronymError"></span>
		                    </div>
		                  </div>
		                  <div class="col-md-4 location" style="display: block;">
		                    <div class="form-group">
		                      <label for="zoneName"><span class="mandatory">*</span>Location</label>
		                      <form:select path="loationIdTemp" id="loationIdTemp" class="form-control">
		                        <form:option value="-1">Select Location</form:option>
		                        <c:forEach items="${activeLocationList }" var="location" varStatus="locationLoop">
		                          <form:option value="${location.mLocationId }">${location.locationName } - ${location.mZoneId.zoneName }</form:option>
		                        </c:forEach>
		                      </form:select>
		                      <span class="error invalid-feedback" id="loationIdTempError"></span>
		                    </div>
		                  </div>
		                  <div class="col-md-4">
		                    <div class="form-check">
		                      <br>
		                      <button style="float: left;" title="Add Entity" type="submit" id="submitEntityButton" class="btn btn-primary bg-color-anand-two text-white">Submit</button>
		                    </div>
		                  </div>
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
		            <h5 class="card-title">List of Entities</h5>
		          </div>
		          <div class="card-body">
		            <div class="row">
		              <div class="col-md-12 tableDiv" style="overflow-x: auto;">
		                <table class="table table-bordered dataTable anand-table-font-size" id="entityTable">
		                  <thead>
		                    <tr class="bg-table-head">
		                      <th>Action</th>
		                      <th>Name</th>
		                      <th>Short Name</th>
		                      <th>Source</th>
		                      <th>Location</th>
		                      <th>Zone</th>
		                      <th>Acronym</th>
		                      <th>Active/In-Active</th>
		                      <th>Created By</th>
		                      <th>Created On</th>
		                      <th>Updated By</th>
		                      <th>Updated On</th>
		                    </tr>
		                  </thead>
		                  <tbody>
		                    <c:forEach items="${entityList }" var="entity" varStatus="entityLoop">
		                      <tr class="bg-table-row-${entityLoop.index %2 }">
		                        <td>${entity.actionForList }</td>
		                        <td>${entity.entityName }</td>
		                        <td>${entity.entityShortName }</td>
		                        <td>
		                          <c:choose>
		                            <c:when test="${empty entity.entitySource }">Parent Entity</c:when>
		                            <c:when test="${not empty entity.entitySource }">${entity.entitySource.entityAcronym }</c:when>
		                          </c:choose>
		                        </td>
		                        <td>${entity.locationId.locationName }</td>
		                        <td>${entity.locationId.mZoneId.zoneName }</td>
		                        <td>${entity.entityAcronym }</td>
		                        <td>
		                          <c:choose>
		                            <c:when test="${entity.entityActive eq 1 }"><span class="badge bg-info-anand-success">Active</span></c:when>
		                            <c:otherwise><span class="badge bg-info-anand-danger">In-Active</span></c:otherwise>
		                          </c:choose>
		                        </td>
		                        <td>${entity.mUserId.userFirstName } ${entity.mUserId.userLastName }</td>
		                        <td><fmt:formatDate pattern = "dd-MMM-yyyy" value = "${entity.createdOn }" /></td>
		                        <td>${entity.mUserIdUpdated.userFirstName } ${entity.mUserIdUpdated.userLastName }</td>
		                        <td><fmt:formatDate pattern = "dd-MMM-yyyy" value = "${entity.updatedOn }" /></td>
		                      </tr>
		                    </c:forEach>
		                  </tbody>
		                  <tfoot>
		                    <tr class="bg-table-foot">
		                      <th>Action</th>
		                      <th>Name</th>
		                      <th>Short Name</th>
		                      <th>Source</th>
		                      <th>Location</th>
		                      <th>Zone</th>
		                      <th>Acronym</th>
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

		<div class="modal fade" id="editEntityModal">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <form:form modelAttribute="entity" action="entity" id="entityEdit" method="post">
		      <form:hidden path="mEntityId" id="mEntityId" />
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
		                
		                <div class="col-md-6">
		                  <div class="form-group">
		                    <label for="entityNameEdit"><span class="mandatory">*</span>Name</label>
		                    <form:input type="text" class="form-control" id="entityNameEdit" placeholder="Enter Company Name" path="entityName" />
		                    <span class="error invalid-feedback" id="entityNameErrorEdit"></span>
		                  </div>
		                </div>
		                <div class="col-md-6">
		                  <div class="form-group">
		                    <label for="parentEntityIdEdit"><span class="mandatory">*</span>Entity Source</label>
		                    <form:select path="parentEntityId" id="parentEntityIdEdit" class="form-control">
		                      <form:option value="-1">Select Entity Source</form:option>
		                      <form:option value="0">Parent Entity</form:option>
		                      <c:forEach items="${activeParentEntityList }" var="activeEntity" varStatus="activeEntityLoop">
		                        <form:option value="${activeEntity.mEntityId }">${activeEntity.entityShortName } - ${activeEntity.entityAcronym }</form:option>
		                      </c:forEach>
		                    </form:select>
		                    <span class="error invalid-feedback" id="parentEntityIdErrorEdit"></span>
		                  </div>
		                </div>
		                <div class="col-md-6">
		                  <div class="form-check" id="isActiveEditDiv">
		                    <label><span class="mandatory">*</span>Zone Active/InActive</label>
		                    <div class="custom-control custom-radio">
		                      <form:radiobutton path="entityActive" class="custom-control-input" value="1" id="entityActiveEdit1" name="entityActive" />
		                      <label for="entityActiveEdit1" class="custom-control-label text-green">Active</label>
		                    </div>
		                    <div class="custom-control custom-radio">
		                      <form:radiobutton path="entityActive" class="custom-control-input" value="0" id="entityActiveEdit2" name="entityActive" />
		                      <label for="entityActiveEdit2" class="custom-control-label text-red">Inactive</label>
		                    </div>
		                    <span class="error invalid-feedback" id="isActiveEditError" style="display:block" ></span> 
		                  </div>
		                </div>
		                <div class="col-md-6 shortNameEdit" style="display: block;">
		                  <div class="form-group">
		                    <label for="entityShortNameEdit"><span class="mandatory">*</span>Short Name</label>
		                    <form:input type="text" class="form-control" id="entityShortNameEdit" placeholder="Enter Entity Short Name" path="entityShortName" />
		                    <span class="error invalid-feedback" id="entityShortNameErrorEdit"></span>
		                  </div>
		                </div>
		                <div class="col-md-6 acronymEdit" style="display: block;">
		                  <div class="form-group">
		                    <label for="entityAcronymEdit"><span class="mandatory">*</span>Acronym</label>
		                    <form:input type="text" class="form-control" id="entityAcronymEdit" placeholder="Enter Entity Acronym" path="entityAcronym" />
		                    <span class="error invalid-feedback" id="entityAcronymErrorEdit"></span>
		                  </div>
		                </div>
		                <div class="col-md-6 locationEdit" style="display: block;">
		                  <div class="form-group">
		                    <label for="loationIdTempEdit"><span class="mandatory">*</span>Location</label>
		                    <form:select path="loationIdTemp" id="loationIdTempEdit" class="form-control">
		                      <form:option value="-1">Select Location</form:option>
		                      <c:forEach items="${activeLocationList }" var="location" varStatus="locationLoop">
		                        <form:option value="${location.mLocationId }">${location.locationName } - ${location.mZoneId.zoneName }</form:option>
		                      </c:forEach>
		                    </form:select>
		                    <span class="error invalid-feedback" id="loationIdTempErrorEdit"></span>
		                  </div>
		                </div>
		                
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		      <div class="modal-footer justify-content-between">
		        <button onclick="" id="closeEditZoneModal" type="button" class="btn bg-info-anand-danger" data-dismiss="modal">Close</button>
		        <button type="submit" id="saveZoneChanges" class="btn bg-color-anand-two text-white" title="Save Company Changes">Save Zone Changes</button>
		      </div>
		      </form:form>
		    </div>
		  </div>
		</div>

      </div>
      <%@include file="/views/includeJSP/footer.jsp"%>
      
      <aside class="control-sidebar control-sidebar-dark" style="background:#002E6D">
        <form action="entity-filter" id="entity-filter" method="post">
          <input type="hidden" id="zoneIdNow" value="${zoneIdNow }" />
          <div class="p-3 control-sidebar-content">
            <h5>Filter</h5>
            <hr class="mb-2">
            <div class="mb-1">
              <h6>Parent Entity</h6>
              <div class="d-flex">
                <input type="hidden" name="all" value="1" />
                <input type="hidden" id="parentEntityFilterValue" value="${parentEntityFilterValue }" />
                <select id="parentEntityFilter" name="parentEntityFilter" class="custom-select mb-3 text-light border-0 bg-white">
                  <option value="-1">Select Parent Entity</option>
                  <c:forEach items="${activeParentEntityList }" var="activeEntity" varStatus="activeEntityLoop">
                    <option value="${activeEntity.mEntityId }">${activeEntity.entityShortName } - ${activeEntity.entityAcronym }</option>
                  </c:forEach>
                </select>
              </div>
            </div>
            <div class="mb-1">
              <h6>Location</h6>
              <div class="d-flex">
                <input type="hidden" id="locationFilterValue" value="${locationFilterValue }" /><br>
                <select id="locationFilter" name="locationFilter" class="custom-select mb-3 text-light border-0 bg-white">
                  <option value="-1">Select Entity Location</option>
                  <c:forEach items="${activeLocationList }" var="location" varStatus="locationLoop">
                    <option value="${location.mLocationId }">${location.locationName } - ${location.mZoneId.zoneName }</option>
                  </c:forEach>
                </select>
              </div>
            </div>
            <hr class="mb-2">
            <div class="d-flex">
              <button type="submit" title="Filter Entity Information" class="btn btn-default">Search</button>
              &emsp;<button onclick='$("#parentEntityFilter").val(-1);$("#locationFilter").val(-1);$("#entity-filter").submit();' title="Clear Filter" class="btn btn-default">Clear</button>
            </div>
          </div>
        </form>
      </aside>
    </div>
    <%@include file="/views/includeJSP/jsFiles.jsp"%>
    <%@include file="/views/includeJSP/dataTablesImport.jsp"%>
    <script src="usedStaticFiles/js/jsp_js_files/masters/entity.js"></script>
  </body>
</html>