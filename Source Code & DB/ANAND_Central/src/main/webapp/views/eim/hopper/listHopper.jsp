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
    <title>HOPPER LIST | ANAND GROUP</title>
    <%@include file="../../includeJSP/cssFiles.jsp"%>
  </head>
  <body class="sidebar-mini layout-navbar-fixed sidebar-collapse pace-primary">
    <div class="wrapper">
      <%@include file="../../includeJSP/header.jsp"%>
      <%@include file="../includeJSP/leftSideBar.jsp"%>
      <div class="content-wrapper">
        <section class="content-header">
          <div class="container-fluid">
            <div class="row mb-2">
              <div class="col-sm-6">
                <h5 class="font-color-anand-one font-weight-bold">HOPPER LIST</h5>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="dashboard" title="Dashboard">Dashboard</a></li>
                  <li class="breadcrumb-item active">Hopper List</li>
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
		            <h5 class="card-title">List of Hopper Projects
		              <c:if test="${projectLeader eq 1 || sponser eq 1 || problemSolvingLeader eq 1 || coporateProblemSolvingLeader eq 1 || eim eq 1 }">
		                - 
		                <button title="Create New Hopper" type="button" onclick="location.href='create-hopper';" class="btn bg-color-anand-one text-white">Create New Hopper</button>
		              </c:if>
		            </h5>
		          </div>
		          <div class="card-body">
		            <div class="row">
		              <div class="col-md-12 tableDiv" style="">
		                <table class="table table-bordered table-hover dataTable anand-table-font-size" id="hopperListTable">
		                  <thead>
		                    <tr class="bg-table-head">
		                      <th>Action</th>
		                      <th>Project Name</th>
		                      <th>Created Date</th>
		                      <th>CreatedBy</th>
		                      <th>Company</th>
		                      <th>Location</th>
		                      <th>Project Leader</th>
		                      <th>Methodology</th>
		                      <th>Department</th>
		                      <th>Type</th>
		                      <th>Confidentiality</th>
		                      <th>Sponsor</th>
		                      <th>Problem Solving Leader</th>
		                      <th>Corporate Problem Solving Leader</th>
		                      <th>Primary Driver</th>
		                    </tr>
		                  </thead>
		                  <tbody>
		                    <c:forEach items="${hopperProjectList }" var="hopper" varStatus="hopperLoop">
		                      <tr class="bg-table-row-${hopperLoop.index }">
		                        <td>
		                          <c:if test="${eim eq 1|| projectLeader eq 1 || sponser eq 1 || problemSolvingLeader eq 1 || coporateProblemSolvingLeader eq 1 }">
		                            <a href="edit-hopper?id=${hopper.tProjectHopperId }" title="Edit Hopper Details">
		                              <i class="fas fa-edit"></i>
		                            </a>&nbsp;
		                          </c:if>
		                          <a href="list-hopper-history?id=${hopper.tProjectHopperId }" title="Show Hopper History Details">
		                            <i class="fas fa-history"></i>
		                          </a>
		                        </td>
		                        <td>${hopper.projectName }</td>
		                        <td><fmt:formatDate value="${hopper.hopperCreatedOn}" pattern="yyyy-MM-dd"/></td>
		                        <td>${hopper.hopperCreatedBy.userFirstName } ${hopper.hopperCreatedBy.userLastName }</td>
		                        <td>${hopper.mEntityId.entityAcronym }</td>
		                        <td>${hopper.mEntityId.locationId.locationName }</td>
		                        <td>${hopper.projectLeader.userFirstName } ${hopper.projectLeader.userLastName }</td>
		                        <td>${hopper.projectMethodologyId.projectMethodologyName }</td>
		                        <td>${hopper.projectFunctionId.projectFunctionName }</td>
		                        <td>${hopper.projectTypeId.projectTypeName }</td>
		                        <td>
		                          <c:if test="${hopper.confidentiality eq 1 }">Non-Confidential</c:if>
		                          <c:if test="${hopper.confidentiality eq 2 }">Confidential</c:if>
		                        </td>
		                        <td>${hopper.sponsor.userFirstName } ${hopper.sponsor.userLastName }</td>
		                        <td>${hopper.problemSolvingLeader.userFirstName } ${hopper.problemSolvingLeader.userLastName }</td>
		                        <td>${hopper.corporateProblemSolvingLeader.userFirstName } ${hopper.corporateProblemSolvingLeader.userLastName }</td>
		                        <td>
		                          <c:if test="${hopper.hopperPrimaryDriver eq 1 }">Productivity</c:if>
		                          <c:if test="${hopper.hopperPrimaryDriver eq 2 }">Quality</c:if>
		                          <c:if test="${hopper.hopperPrimaryDriver eq 3 }">Cost</c:if>
		                          <c:if test="${hopper.hopperPrimaryDriver eq 4 }">Delivery</c:if>
		                          <c:if test="${hopper.hopperPrimaryDriver eq 5 }">Safety</c:if>
		                        </td>
		                      </tr>
		                    </c:forEach>
		                  </tbody>
		                  <tr id="hopperListLoader" style="display:none">
		                    <th colspan="11">
		                      <img class="loaderClass" id="hopperLoaderImage" src="usedStaticFiles/images/loader.gif" width="64" alt="">
		                      <p id="nothingMore" style="display:none;float:right">All companies are loaded.</p>
		                    </th>
		                  </tr>
		                <tfoot>
		                  <tr class="bg-table-foot">
		                    <th>Action</th>
		                    <th>Project Name</th>
		                    <th>Created Date</th>
		                    <th>CreatedBy</th>
		                    <th>Company</th>
		                    <th>Location</th>
		                    <th>Project Leader</th>
		                    <th>Methodology</th>
		                    <th>Department</th>
		                    <th>Type</th>
		                    <th>Confidentiality</th>
		                    <th>Sponsor</th>
		                    <th>Problem Solving Leader</th>
		                    <th>Corporate Problem Solving Leader</th>
		                    <th>Primary Driver</th>
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
    <script src="usedStaticFiles/js/jsp_js_files/eim/hopper/listHopper.js"></script>
  </body>
</html>