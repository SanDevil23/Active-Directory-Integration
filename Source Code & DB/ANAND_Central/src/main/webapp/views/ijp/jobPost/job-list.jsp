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
    <title>COACHING BATCH | ACT | ANAND GROUP</title>
    <%@include file="../../includeJSP/cssFiles.jsp"%>
    <%@include file="../../includeJSP/datePickerCss.jsp"%>
  </head>
  <!-- <body class="sidebar-mini layout-navbar-fixed sidebar-collapse pace-primary"> -->
  <body class="hold-transition sidebar-collapse layout-top-nav pace-primary">
    <div class="wrapper">
      <%-- <%@include file="../../includeJSP/header.jsp"%> --%>
      <%@include file="../includeJSP/header_ijp.jsp"%>
      <%-- <%@include file="../includeJSP/leftSideBar.jsp"%> --%>
      <div class="content-wrapper">
        
        <section class="content-header">
          <div class="container-fluid">
            <div class="row mb-2">
              <div class="col-sm-6">
                <h5 class="font-color-anand-one"><strong>Add Job Posting</strong></h5>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="dashboard-ijp" title="IJP Dashboard"><strong>IJP Dashboard</strong></a></li>
                  <li class="breadcrumb-item active"><strong>Add Job Posting</strong></li>
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
		        <div class="card card-primary card-outline bg-card-primary-anand">
		          <div class="card-header">
		            <h5 class="card-title">Add New Job Posting</h5>
		          </div>
		          <div class="card-body">
                              <div class="row">
                                 <div class="col-md-12 tableDiv" style="overflow-x: auto;">
                                    <table class="table table-bordered dataTable anand-table-font-size" id="openIjp" style="width:100%%">
                                       <thead>
                                          <tr class="bg-table-head">
                                             <th>IJP No</th>
                                             <th>Organization-Location</th>
                                             <th>Department</th>
                                             <th>Designation</th>
                                             <th>Grade-Level</th>
                                             <th>Last Date</th>
                                             <th>Status</th>
                                             <th>Action</th>
                                          </tr>
                                       </thead>
                                       <tbody>
                                          <c:set var="indexNow" value="0" />
                                          <c:forEach items="${openIjpList}" var="openIjp" varStatus="openIjpLoop">
                                             <tr class="bg-table-row-${openIjpLoop.index % 2 }">
                                                <td>${openIjp.ijpNumber }</td>
                                                <td>${openIjp.mEntityId.entitySource.entityName } - ${openIjp.mEntityId.locationId.locationName }</td>
                                                <td>${openIjp.mDepartmentId.departmentName }</td>
                                                <td>${openIjp.mDesignationId.designationName }</td>
                                                <td>${openIjp.mLevelId.levelName }</td>
                                                <td>${openIjp.lastApplicationDate }</td>
                                                <td>${openIjp.statusString }</td>
                                                <td>
                                                  <c:if test="${itAdmin eq 1 || corpHr eq 1 }">
                                                    <a href="job-posting?job-id=${openIjp.jobPostingId }" title="Edit Job"><i class="fas fa-edit"></i></a>
                                                  </c:if>
                                                </td>
                                             </tr>
                                          </c:forEach>
                                       </tbody>
                                       <tfoot>
                                          <tr class="bg-table-foot">
                                             <th>IJP No</th>
                                             <th>Organization-Location</th>
                                             <th>Department</th>
                                             <th>Designation</th>
                                             <th>Grade-Level</th>
                                             <th>Last Date</th>
                                             <th>Status</th>
                                             <th>Action</th>
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
		
      </div>
      <%@include file="../includeJSP/footer.jsp"%>
    </div>
    <%@include file="../../includeJSP/jsFiles.jsp"%>
    <%@include file="../../includeJSP/dataTablesImport.jsp"%>
    <script src="usedStaticFiles/js/jsp_js_files/ijp/jobPost/job-list.js"></script>
  </body>
</html>