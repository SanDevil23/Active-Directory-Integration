<!-- ****************************************************************************************
# *******************************************************************************************
# Copyright © 2021 Anand Group India. All rights reserved.									*
# No part of this product may be reproduced in any form by any means without prior			*
# written authorization of Anand Automotive Private Limited and its licensors, if any.		*
# *******************************************************************************************
# Author - Sheshadhri R Iyer																*
# *************************************************************************************** -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>CHARTER LIST | EMC | ANAND U</title>
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
                <h5 class="font-color-anand-one font-weight-bold">CHARTER LIST</h5>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="dashboard" title="Dashboard">Dashboard</a></li>
                  <li class="breadcrumb-item active">View/List Charter</li>
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
            <div class="card card-primary card-outline  bg-card-primary-anand collapsed-card">
              <div class="card-header" data-card-widget="collapse">
                <h5 class="card-title">Filters</h5>
                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-plus"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <form action="list-charter" id="postCharterValue" method="post" >
		          <div class="row">
		            <div class="col-md-2">
                      <h6>Year</h6>
                      <input type="hidden" id="tempYearId" value="${tempYearId }" />
                      <select name="yearId" class="form-control yearId" id='date-dropdown'></select>
                  	</div> 	
                  	<div class="col-md-4">
                  	  <h6>Company</h6>
                  	  <input type="hidden" id="tempEntityId" value="${tempEntityId }" />
                  	  <select class="form-control" id="entityId" name="entityId">
                        <option value="-1">-- Select Company --</option>
                        <c:forEach items="${parentEntityList }" var="company" varStatus="companyStatus">
                        <option value="${company.mEntityId }">${company.entityAcronym } - ${company.entityShortName}</option>
                        </c:forEach>
                      </select>
                  	</div>
                  	<div class="col-md-4">
                  	  <h6>Location</h6>
                  	  <c:set var="updatedParentEntityId" value="-1"/>
                  	  <input type="hidden" id="tempChildId" value="${tempChildId }" />
                  	  <span id="update"></span>
                  	  <select class="form-control" id="childId" name="childId">
                        <option value="-1">-- Select Location --</option>
                        <c:forEach items="${childEntityList }" var="company" varStatus="companyStatus">
                          <c:choose>
                            <c:when test="${not empty tempEntityId && tempEntityId ne -1}">
                        	  <c:if test="${tempEntityId eq company.entitySource.mEntityId }">
                          		<option value="${company.mEntityId }">${company.entityAcronym } - ${company.entityName} - ${company.locationId.locationName}</option>
                        	  </c:if>
                        	</c:when>
                        	<c:otherwise>
                          	  <option value="${company.mEntityId }">${company.entityAcronym } - ${company.entityName} - ${company.locationId.locationName}</option>
                        	</c:otherwise>
                          </c:choose>                 
                        </c:forEach>
                      </select>
                  	</div>
		     		<div class="col-md-10"></div>
                  	<div class="col-md-1">
                      <button type="submit" id="saveCharterFilterValue" onclick="saveValue()" title="Submit Filter Information" class="btn bg-color-anand-one text-white">Search</button>
                  	</div>
                    <div class="col-md-1">
                      <button type="button" id="clearCharterFilterValue" onclick="clearValue()" title="Clear Cycle Information" class="btn bg-color-anand-one text-white clearRcmTrackerFilter">Clear</button>
                    </div>
		          </div>
		        </form>
              </div>
            </div>  
          </div>
        </section>
        <br>
        <section class="content content-margin">
          <div class="container-fluid">             
            <div class="row">
              <div class="col-md-12">
                <div class="card card-primary bg-card-primary-anand card-outline">
                  <div class="card-header">
                    <h5 class="card-title">List of Charter Projects
                      <c:if test="${projectLeader eq 1 || sponser eq 1 || problemSolvingLeader eq 1 || coporateProblemSolvingLeader eq 1 }">
                        - <button title="Create New Charter" type="button" onclick="location.href='create-charter';" class="btn bg-color-anand-one text-white">Create New Charter</button>
                      </c:if>
                    </h5>
                  </div>
                  <div class="card-body">
                    <div class="col-md-12">
                    <div class="row">
                      <div class="card-header">
                        <h5 class="font-color-anand-one font-weight-bold">DRAFT CHARTER LIST</h5>
                      </div>
                      <c:set var="loopIndex" value="0" />
                      <div class="col-md-12 tableDiv" style="">
                        <table class="table table-bordered dataTable anand-table-font-size" id="charterListTable">
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
                              <th>Project Status</th>
                            </tr>
                          </thead>
                          <tbody>
                            <c:forEach items="${charterProjectList }" var="charter" varStatus="charterLoop">
                              <c:if test="${empty charter.projectCharterStatus || charter.projectCharterStatus eq 1 }">
                              <c:set var="loopIndex" value="${(loopIndex+1)%2 }" />
                              <tr class="bg-table-row-${loopIndex}">
                                <td>
                                  <c:choose>
                                    <c:when test="${empty charter.projectCharterStatus }">
                                      <c:if test="${eim eq 1 || projectLeader eq 1 }">
                                        <a href="edit-charter?id=${charter.tProjectCharterId }" title="Edit Charter Details">
                                          <i class="fas fa-edit"></i>
                                        </a>
                                      </c:if>
                                    </c:when>
                                    <c:when test="${charter.projectCharterStatus eq 1 }">
                                      ${charter.approvalPendingWith }
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                  </c:choose><br>
                                  <a href="view-charter?id=${charter.tProjectCharterId }" title="Show Details">
                                    <i class="fas fa-eye"></i>
                                  </a><br>
                                  <a href="list-charter-history?id=${charter.tProjectCharterId }" title="Show Charter History Details">
                                    <i class="fas fa-history"></i>
                                  </a>
                                </td>
                                <td>${charter.projectName }</td>
                                <td><fmt:formatDate value="${charter.charterCreatedOn}" pattern="yyyy-MM-dd"/></td>
                                <td>${charter.charterCreatedBy.userFirstName } ${charter.charterCreatedBy.userLastName }</td>
                                <td>${charter.mEntityId.entityAcronym }</td>
                                <td>${charter.mEntityId.entityName }, ${charter.mEntityId.locationId.locationName}</td>
                                <td>${charter.projectLeader.userFirstName } ${charter.projectLeader.userLastName }</td>
                                <td>${charter.projectMethodologyId.projectMethodologyName }</td>
                                <td>${charter.projectFunctionId.projectFunctionName }</td>
                                <td>${charter.projectTypeId.projectTypeName }</td>
                                <td>
                                  <c:if test="${charter.confidentiality eq 1 }">Non-Confidential</c:if>
                                  <c:if test="${charter.confidentiality eq 2 }">Confidential</c:if>
                                </td>
                                <td>${charter.sponsor.userFirstName } ${charter.sponsor.userLastName }</td>
                                <td>${charter.problemSolvingLeader.userFirstName } ${charter.problemSolvingLeader.userLastName }</td>
                                <td>${charter.corporateProblemSolvingLeader.userFirstName } ${charter.corporateProblemSolvingLeader.userLastName }</td>
                                <td>
                                  <c:if test="${charter.charterPrimaryDriver eq 1 }">Productivity</c:if>
                                  <c:if test="${charter.charterPrimaryDriver eq 2 }">Quality</c:if>
                                  <c:if test="${charter.charterPrimaryDriver eq 3 }">Cost</c:if>
                                  <c:if test="${charter.charterPrimaryDriver eq 4 }">Delivery</c:if>
                                  <c:if test="${charter.charterPrimaryDriver eq 5 }">Safety</c:if>
                                </td>
                                <td>
                                  <c:choose>
                                    <c:when test="${charter.projectCharterStatus eq 0 }">Saved</c:when>
                                    <c:when test="${empty charter.projectCharterStatus }">Saved</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 1 }">Charter Submitted</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 2 }">Charter Approved</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 3 }">Charter Rejected</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 4 }">Charter Launched</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 5 }">Contract Submitted</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 6 }">Contract Approved</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 7 }">Contract Rejected</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 8 }">Closure Submitted</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 9 }">Closure Approved</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 10 }">Closure Rejected</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 11 }">Sustenance Audit Ongoing</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 12 }">Sustenance Audit Submitted</c:when>
                                  </c:choose>
                                </td>
                              </tr>
                              </c:if>
                            </c:forEach>
                          </tbody>
                          <tr id="hopperListLoader" style="display:none">
                            <th colspan="11">
                              <img class="loaderClass" id="hopperLoaderImage" src="usedStaticFiles/images/loader.gif" width="64" alt="">
                              <p id="nothingMore" style="display:none;float:right">All companies are loaded.</p>
                            </th>
                          </tr>
                        </table>
                      </div>
                    </div>
                    </div>
                  </div>
                  <div class="card-body">
                    <div class="col-md-12">
                    <div class="row">
                      <div class="card-header">
                        <h5 class="font-color-anand-two font-weight-bold">ACTIVE PROJECTS</h5>
                      </div>
                      <c:set var="loopIndex" value="0" />
                      <div class="col-md-12 tableDiv" style=""> 
                        <table class="table table-bordered dataTable anand-table-font-size" id="charterActiveList">
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
                              <th>Project Status</th>
                            </tr>
                          </thead>
                          <tbody>
                            <c:forEach items="${charterProjectList }" var="charter" varStatus="charterLoop">
                              <c:if test="${(charter.projectCharterStatus gt 1 && charter.projectCharterStatus lt 9)||charter.projectCharterStatus eq 10}">
                              <c:set var="loopIndex" value="${(loopIndex+1)%2 }" />
                              <tr class="bg-table-row-${loopIndex}">
                                <td>
                                  <c:choose>
                                    <c:when test="${charter.projectCharterStatus eq 2 }">
                                      <c:if test="${eim eq 1 || projectLeader eq 1  }">
                                        <a href="edit-charter?id=${charter.tProjectCharterId }" title="Launch Charter">
                                          <i class="fas fa-rocket"></i>
                                        </a>
                                      </c:if>
                                    </c:when>
                                    <c:when test="${charter.projectCharterStatus eq 0 || charter.projectCharterStatus eq 3 }">
                                      <c:if test="${eim eq 1 || projectLeader eq 1 }">
                                        <a href="edit-charter?id=${charter.tProjectCharterId }" title="Edit Charter Details">
                                          <i class="fas fa-edit"></i>
                                        </a>
                                      </c:if>
                                    </c:when>
                                    <c:when test="${charter.projectCharterStatus eq 4 || charter.projectCharterStatus eq 7}">
                                      <c:if test="${eim eq 1 || projectLeader eq 1  }">
                                        <a href="edit-charter-contract?id=${charter.tProjectCharterId }" title="Edit Contract Details">
                                          <i class="fas fa-edit"></i>
                                        </a>
                                      </c:if>
                                    </c:when>
                                    <c:when test="${charter.projectCharterStatus eq 5 }">
                                      ${charter.contractApprovalPendingWith }
                                    </c:when>
                                    <c:when test="${charter.projectCharterStatus eq 6 || charter.projectCharterStatus eq 10}">
                                      <c:if test="${eim eq 1 || projectLeader eq 1 }">
                                        <a href="edit-charter-closure?id=${charter.tProjectCharterId }" title="Edit Closure Details">
                                          <i class="fas fa-edit"></i>
                                        </a>
                                      </c:if>
                                    </c:when>
                                    <c:when test="${charter.projectCharterStatus eq 8 }">
                                      ${charter.closureApprovalPendingWith }
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                  </c:choose><br>
                                  <a href="view-charter?id=${charter.tProjectCharterId }" title="Show Details">
                                    <i class="fas fa-eye"></i>
                                  </a><br>
                                  <a href="list-charter-history?id=${charter.tProjectCharterId }" title="Show Charter History Details">
                                    <i class="fas fa-history"></i>
                                  </a>
                                </td>
                                <td>${charter.projectName }</td>
                                <td><fmt:formatDate value="${charter.charterCreatedOn}" pattern="yyyy-MM-dd"/></td>
                                <td>${charter.charterCreatedBy.userFirstName } ${charter.charterCreatedBy.userLastName }</td>
                                <td>${charter.mEntityId.entityAcronym }</td>
                                <td>${charter.mEntityId.entityName }, ${charter.mEntityId.locationId.locationName}</td>
                                <td>${charter.projectLeader.userFirstName } ${charter.projectLeader.userLastName }</td>
                                <td>${charter.projectMethodologyId.projectMethodologyName }</td>
                                <td>${charter.projectFunctionId.projectFunctionName }</td>
                                <td>${charter.projectTypeId.projectTypeName }</td>
                                <td>
                                  <c:if test="${charter.confidentiality eq 1 }">Non-Confidential</c:if>
                                  <c:if test="${charter.confidentiality eq 2 }">Confidential</c:if>
                                </td>
                                <td>${charter.sponsor.userFirstName } ${charter.sponsor.userLastName }</td>
                                <td>${charter.problemSolvingLeader.userFirstName } ${charter.problemSolvingLeader.userLastName }</td>
                                <td>${charter.corporateProblemSolvingLeader.userFirstName } ${charter.corporateProblemSolvingLeader.userLastName }</td>
                                <td>
                                  <c:if test="${charter.charterPrimaryDriver eq 1 }">Productivity</c:if>
                                  <c:if test="${charter.charterPrimaryDriver eq 2 }">Quality</c:if>
                                  <c:if test="${charter.charterPrimaryDriver eq 3 }">Cost</c:if>
                                  <c:if test="${charter.charterPrimaryDriver eq 4 }">Delivery</c:if>
                                  <c:if test="${charter.charterPrimaryDriver eq 5 }">Safety</c:if>
                                </td>
                                <td>
                                  <c:choose>
                                    <c:when test="${charter.projectCharterStatus eq 0 }">Saved</c:when>
                                    <c:when test="${empty charter.projectCharterStatus }">Saved</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 1 }">Charter Submitted</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 2 }">Charter Approved</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 3 }">Charter Rejected</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 4 }">Charter Launched</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 5 }">Contract Submitted</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 6 }">Contract Approved</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 7 }">Contract Rejected</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 8 }">Closure Submitted</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 9 }">Closure Approved</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 10 }">Closure Rejected</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 11 }">Sustenance Audit Ongoing</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 12 }">Sustenance Audit Submitted</c:when>
                                  </c:choose>
                                </td>
                              </tr>
                              </c:if>
                            </c:forEach>
                          </tbody>
                          <tr id="hopperListLoader" style="display:none">
                            <th colspan="11">
                              <img class="loaderClass" id="hopperLoaderImage" src="usedStaticFiles/images/loader.gif" width="64" alt="">
                              <p id="nothingMore" style="display:none;float:right">All companies are loaded.</p>
                            </th>
                          </tr>
                        </table>
                      </div>
                    </div>
                    </div>
                  </div>
                  <div class="card-body">
                    <div class="col-md-12">
                    <div class="row">
                      <div class="card-header">
                        <h5 class="font-color-anand-three font-weight-bold">HISTORY DATABASES</h5>
                      </div>
                      <c:set var="loopIndex" value="0" />
                      <div class="col-md-12 tableDiv" style="">
                        <table class="table table-bordered dataTable anand-table-font-size" id="charterHistoryList">
                          <thead>
                            <tr class="bg-table-head">
                              <th>Action</th>
                              <th>Project Name</th>
                              <th>Created Date</th>
                              <th>CreatedBy</th>
                              <th>Company</th>
                              <th>Location</th>
                              <th>Sustenance Target Date</th>
                              <th>Sustenance Score</th>
                              <th>Project Leader</th>
                              <th>Methodology</th>
                              <th>Department</th>
                              <th>Type</th>
                              <th>Confidentiality</th>
                              <th>Primary Driver</th>
                              <th>Project Status</th>
                            </tr>
                          </thead>
                          <tbody>
                            <c:forEach items="${charterProjectList }" var="charter" varStatus="charterLoop">
                              <c:if test="${charter.projectCharterStatus gt 8 && charter.projectCharterStatus ne 10}">
                              <c:set var="loopIndex" value="${(loopIndex+1)%2 }" />
                              <tr class="bg-table-row-${loopIndex}">
                                <td>
                                  <a href="view-charter?id=${charter.tProjectCharterId }" title="Show Details">
                                    <i class="fas fa-eye"></i>
                                  </a><br>
                                  <a href="list-charter-history?id=${charter.tProjectCharterId }" title="Show Charter History Details">
                                    <i class="fas fa-history"></i>
                                  </a>
                                </td>
                                <td>${charter.projectName }</td>
                                <td><fmt:formatDate value="${charter.charterCreatedOn}" pattern="yyyy-MM-dd"/></td>
                                <td>${charter.charterCreatedBy.userFirstName } ${charter.charterCreatedBy.userLastName }</td>
                                <td>${charter.mEntityId.entityAcronym }</td>
                                <td>${charter.mEntityId.entityName }, ${charter.mEntityId.locationId.locationName}</td>
                                <td>
                                  <c:choose>
                                    <c:when test="${charter.projectCharterStatus eq 9 }">
                                      <c:choose>
                                        <c:when test="${eim eq 1 || projectLeader eq 1  }">
                                          <a href="edit-sustenance-audit?id=${charter.tProjectCharterId }" title="Sustenance Audit">
                                            <i class="fas fa-calendar-alt"></i>&nbsp;Sustenance Target Set-Up
                                          </a>
                                        </c:when>
                                        <c:otherwise>
                                          Sustenance Target Set-Up pending with ${charter.projectLeader.userFirstName } ${charter.projectLeader.userLastName }
                                        </c:otherwise>
                                      </c:choose>
                                    </c:when>
                                    <c:when test="${charter.projectCharterStatus gt 9 }">
                                      <fmt:formatDate value="${charter.sustenanceAuditTarget}" pattern="yyyy-MM-dd"/>
                                    </c:when>
                                    <c:otherwise>
                                        
                                    </c:otherwise>
                                  </c:choose>
                                </td>
                                <td>
                                  <c:choose>                          
                                    <c:when test="${charter.projectCharterStatus eq 11 && charter.sustenanceProblemSolvingLeader.mUserId ne sessionUserInfo.mUserId}">
                                      ${charter.sustenanceAuditPendingWith}
                                    </c:when>
                                    <c:when test="${charter.projectCharterStatus eq 11 && charter.sustenanceProblemSolvingLeader.mUserId eq sessionUserInfo.mUserId}">
                                      <a href="edit-sustenance-audit?id=${charter.tProjectCharterId }" title="Sustenance Audit">
                                          <i class="fas fa-clipboard"></i>&nbsp;Sustenance Audit
                                      </a>
                                    </c:when>
                                    <c:when test="${charter.projectCharterStatus eq 12 }">
                                      ${charter.sustenanceScore }<br>
                                      <c:if test="${charter.sustenanceScore eq 100 }">
							            <strong style="color:green; font-size:15px;">Green</strong>
							          </c:if>
							          <c:if test="${charter.sustenanceScore lt 100 }">
							            <strong style="color:red; font-size:15px;">Red</strong>
							          </c:if>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                  </c:choose>
                                </td>
                                <td>${charter.projectLeader.userFirstName } ${charter.projectLeader.userLastName }</td>
                                <td>${charter.projectMethodologyId.projectMethodologyName }</td>
                                <td>${charter.projectFunctionId.projectFunctionName }</td>
                                <td>${charter.projectTypeId.projectTypeName }</td>
                                <td>
                                  <c:if test="${charter.confidentiality eq 1 }">Non-Confidential</c:if>
                                  <c:if test="${charter.confidentiality eq 2 }">Confidential</c:if>
                                </td>
                                <td>
                                  <c:if test="${charter.charterPrimaryDriver eq 1 }">Productivity</c:if>
                                  <c:if test="${charter.charterPrimaryDriver eq 2 }">Quality</c:if>
                                  <c:if test="${charter.charterPrimaryDriver eq 3 }">Cost</c:if>
                                  <c:if test="${charter.charterPrimaryDriver eq 4 }">Delivery</c:if>
                                  <c:if test="${charter.charterPrimaryDriver eq 5 }">Safety</c:if>
                                </td>
                                <td>
                                  <c:choose>
                                    <c:when test="${charter.projectCharterStatus eq 0 }">Saved</c:when>
                                    <c:when test="${empty charter.projectCharterStatus }">Saved</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 1 }">Charter Submitted</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 2 }">Charter Approved</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 3 }">Charter Rejected</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 4 }">Charter Launched</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 5 }">Contract Submitted</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 6 }">Contract Approved</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 7 }">Contract Rejected</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 8 }">Closure Submitted</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 9 }">Closure Approved</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 10 }">Closure Rejected</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 11 }">Sustenance Audit Ongoing</c:when>
                                    <c:when test="${charter.projectCharterStatus eq 12 }">Sustenance Audit Submitted</c:when>
                                  </c:choose>
                                </td>
                              </tr>
                              </c:if>
                            </c:forEach>
                          </tbody>
                          <tr id="hopperListLoader" style="display:none">
                            <th colspan="11">
                              <img class="loaderClass" id="hopperLoaderImage" src="usedStaticFiles/images/loader.gif" width="64" alt="">
                              <p id="nothingMore" style="display:none;float:right">All companies are loaded.</p>
                            </th>
                          </tr>
                        </table>
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
      <%@include file="../includeJSP/footer.jsp"%>
    </div>
    <%@include file="../../includeJSP/rightSideBar.jsp"%>
    <%@include file="../../includeJSP/jsFiles.jsp"%>
    <%@include file="../../includeJSP/dataTablesImport.jsp"%>
    <script src="usedStaticFiles/js/jsp_js_files/eim/charter/listCharter.js"></script>
  </body>
</html>