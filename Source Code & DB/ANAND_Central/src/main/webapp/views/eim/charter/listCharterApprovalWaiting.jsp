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
    <title>CHARTER APPROVAL LIST | EIM | AAPL</title>
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
                <h5 class="font-color-anand-one font-weight-bold">CHARTER APPROVAL LIST</h5>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="dashboard" title="Dashboard">Dashboard</a></li>
                  <li class="breadcrumb-item active">Charter Approval List</li>
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
                <div class="card card-primary card-outline">
                  <div class="card-header">
                    <h5 class="card-title">List of Charter Projects Awaiting Approval</h5>
                  </div>
                  <div class="card-body">
                    <div class="row">
                      <div class="col-md-12 tableDiv">
                        <table class="table table-bordered dataTable anand-table-font-size" id="charterApprovalListTable">
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
                            <c:forEach items="${charterApprovalList }" var="charter" varStatus="charterApprovalLoop">
                              <tr class="bg-table-row-${charterApprovalLoop.index }">
                              	<td>
                              	  <c:if test="${sessionUserInfo.mUserId eq charter.approverId.mUserId }">
                                    <a href="approve-charter?id=${charter.projectCharterApproval.tProjectCharterId }" title="Approve/Reject Charter">
                                      <i class="fas fa-clipboard-list"></i>
                                    </a>
                                  </c:if>
                                  <c:if test="${sessionUserInfo.mUserId ne charter.approverId.mUserId }">
                                    <c:choose>
                                      <c:when test="${charter.approverType eq 1 }">
                                        Sponsor Approval Pending
                                      </c:when>
                                      <c:when test="${charter.approverType eq 2 }">
                                        Process Owner Approval Pending
                                      </c:when>
                                      <c:when test="${charter.approverType eq 3 }">
                                        Problem Solving Approval Pending
                                      </c:when>
                                      <c:when test="${charter.approverType eq 4 }">
                                        Finance Controller Pending
                                      </c:when>
                                      <c:when test="${charter.approverType eq 5 }">
                                        COO/Business Leader Approval Pending
                                      </c:when>
                                      <c:when test="${charter.approverType eq 6 }">
                                        Corporate problem Solving Leader Approval Pending
                                      </c:when>
                                    </c:choose>
                                  </c:if>
                              	</td>
                                <td>${charter.projectCharterApproval.projectName }</td>
                                <td><fmt:formatDate value="${charter.projectCharterApproval.charterCreatedOn}" pattern="yyyy-MM-dd"/></td>
                                <td>${charter.projectCharterApproval.charterCreatedBy.userFirstName } ${charter.projectCharterApproval.charterCreatedBy.userLastName }</td>
                                <td>${charter.projectCharterApproval.mEntityId.entityAcronym }</td>
                                <td>${charter.projectCharterApproval.mEntityId.locationId.locationName }</td>
                                <td>${charter.projectCharterApproval.projectLeader.userFirstName } ${charter.projectCharterApproval.projectLeader.userLastName }</td>
                                <td>${charter.projectCharterApproval.projectMethodologyId.projectMethodologyName }</td>
                                <td>${charter.projectCharterApproval.projectFunctionId.projectFunctionName }</td>
                                <td>${charter.projectCharterApproval.projectTypeId.projectTypeName }</td>
                                <td>
                                  <c:if test="${charter.projectCharterApproval.confidentiality eq 1 }">
                                    Non-Confidential
                                  </c:if>
                                  <c:if test="${charter.projectCharterApproval.confidentiality eq 2 }">
                                    Confidential
                                  </c:if>
                                </td>
                                <td>${charter.projectCharterApproval.sponsor.userFirstName } ${charter.projectCharterApproval.sponsor.userLastName }</td>
                                <td>${charter.projectCharterApproval.problemSolvingLeader.userFirstName } ${charter.projectCharterApproval.problemSolvingLeader.userLastName }</td>
                                <td>${charter.projectCharterApproval.corporateProblemSolvingLeader.userFirstName } ${charter.projectCharterApproval.corporateProblemSolvingLeader.userLastName }</td>
                                <td>
                                  <c:if test="${charter.projectCharterApproval.charterPrimaryDriver eq 1 }">
                                    Productivity
                                  </c:if>
                                  <c:if test="${charter.projectCharterApproval.charterPrimaryDriver eq 2 }">
                                    Quality
                                  </c:if>
                                  <c:if test="${charter.projectCharterApproval.charterPrimaryDriver eq 3 }">
                                    Cost
                                  </c:if>
                                  <c:if test="${charter.projectCharterApproval.charterPrimaryDriver eq 4 }">
                                    Delivery
                                  </c:if>
                                  <c:if test="${charter.projectCharterApproval.charterPrimaryDriver eq 5 }">
                                    Safety
                                  </c:if>
                                </td>
                              </tr>
                            </c:forEach>
                            <c:forEach items="${contractApprovalList }" var="charter" varStatus="charterApprovalLoop">
                              <tr class="bg-table-row-${charterApprovalLoop.index }">
                              	<td>
                              	  <c:if test="${sessionUserInfo.mUserId eq charter.approverId.mUserId }">
                                    <a href="approve-contract?id=${charter.projectContractApproval.tProjectCharterId }" title="Approve/Reject Charter">
                                      <i class="fas fa-clipboard-list"></i>
                                    </a>
                                  </c:if>
                                  <c:if test="${sessionUserInfo.mUserId ne charter.approverId.mUserId }">
                                    <c:choose>
                                      <c:when test="${charter.approverType eq 1 }">
                                        Sponsor Approval Pending
                                      </c:when>
                                      <c:when test="${charter.approverType eq 2 }">
                                        Process Owner Approval Pending
                                      </c:when>
                                      <c:when test="${charter.approverType eq 3 }">
                                        Problem Solving Approval Pending
                                      </c:when>
                                      <c:when test="${charter.approverType eq 4 }">
                                        Finance Controller Pending
                                      </c:when>
                                      <c:when test="${charter.approverType eq 5 }">
                                        COO/Business Leader Approval Pending
                                      </c:when>
                                      <c:when test="${charter.approverType eq 6 }">
                                        Corporate problem Solving Leader Approval Pending
                                      </c:when>
                                    </c:choose>
                                  </c:if>
                              	</td>
                                <td>${charter.projectContractApproval.projectName }</td>
                                <td><fmt:formatDate value="${charter.projectContractApproval.charterCreatedOn}" pattern="yyyy-MM-dd"/></td>
                                <td>${charter.projectContractApproval.charterCreatedBy.userFirstName } ${charter.projectContractApproval.charterCreatedBy.userLastName }</td>
                                <td>${charter.projectContractApproval.mEntityId.entityAcronym }</td>
                                <td>${charter.projectContractApproval.mEntityId.locationId.locationName }</td>
                                <td>${charter.projectContractApproval.projectLeader.userFirstName } ${charter.projectContractApproval.projectLeader.userLastName }</td>
                                <td>${charter.projectContractApproval.projectMethodologyId.projectMethodologyName }</td>
                                <td>${charter.projectContractApproval.projectFunctionId.projectFunctionName }</td>
                                <td>${charter.projectContractApproval.projectTypeId.projectTypeName }</td>
                                <td>
                                  <c:if test="${charter.projectContractApproval.confidentiality eq 1 }">
                                    Non-Confidential
                                  </c:if>
                                  <c:if test="${charter.projectContractApproval.confidentiality eq 2 }">
                                    Confidential
                                  </c:if>
                                </td>
                                <td>${charter.projectContractApproval.sponsor.userFirstName } ${charter.projectContractApproval.sponsor.userLastName }</td>
                                <td>${charter.projectContractApproval.problemSolvingLeader.userFirstName } ${charter.projectContractApproval.problemSolvingLeader.userLastName }</td>
                                <td>${charter.projectContractApproval.corporateProblemSolvingLeader.userFirstName } ${charter.projectContractApproval.corporateProblemSolvingLeader.userLastName }</td>
                                <td>
                                  <c:if test="${charter.projectContractApproval.charterPrimaryDriver eq 1 }">
                                    Productivity
                                  </c:if>
                                  <c:if test="${charter.projectContractApproval.charterPrimaryDriver eq 2 }">
                                    Quality
                                  </c:if>
                                  <c:if test="${charter.projectContractApproval.charterPrimaryDriver eq 3 }">
                                    Cost
                                  </c:if>
                                  <c:if test="${charter.projectContractApproval.charterPrimaryDriver eq 4 }">
                                    Delivery
                                  </c:if>
                                  <c:if test="${charter.projectContractApproval.charterPrimaryDriver eq 5 }">
                                    Safety
                                  </c:if>
                                </td>
                              </tr>
                            </c:forEach>
                            <c:forEach items="${closureApprovalList }" var="charter" varStatus="charterApprovalLoop">
                              <tr class="bg-table-row-${charterApprovalLoop.index }">
                              	<td>
                              	  <c:if test="${sessionUserInfo.mUserId eq charter.approverId.mUserId }">
                                    <a href="approve-closure?id=${charter.projectClosureApproval.tProjectCharterId }" title="Approve/Reject Closure">
                                      <i class="fas fa-clipboard-list"></i>
                                    </a>
                                  </c:if>
                                  <c:if test="${sessionUserInfo.mUserId ne charter.approverId.mUserId }">
                                    <c:choose>
                                      <c:when test="${charter.approverType eq 1 }">
                                        Sponsor Approval Pending
                                      </c:when>
                                      <c:when test="${charter.approverType eq 2 }">
                                        Process Owner Approval Pending
                                      </c:when>
                                      <c:when test="${charter.approverType eq 3 }">
                                        Problem Solving Approval Pending
                                      </c:when>
                                      <c:when test="${charter.approverType eq 4 }">
                                        Finance Controller Pending
                                      </c:when>
                                      <c:when test="${charter.approverType eq 5 }">
                                        COO/Business Leader Approval Pending
                                      </c:when>
                                      <c:when test="${charter.approverType eq 6 }">
                                        Corporate problem Solving Leader Approval Pending
                                      </c:when>
                                    </c:choose>
                                  </c:if>
                              	</td>
                                <td>${charter.projectClosureApproval.projectName }</td>
                                <td><fmt:formatDate value="${charter.projectClosureApproval.charterCreatedOn}" pattern="yyyy-MM-dd"/></td>
                                <td>${charter.projectClosureApproval.charterCreatedBy.userFirstName } ${charter.projectClosureApproval.charterCreatedBy.userLastName }</td>
                                <td>${charter.projectClosureApproval.mEntityId.entityAcronym }</td>
                                <td>${charter.projectClosureApproval.mEntityId.locationId.locationName }</td>
                                <td>${charter.projectClosureApproval.projectLeader.userFirstName } ${charter.projectClosureApproval.projectLeader.userLastName }</td>
                                <td>${charter.projectClosureApproval.projectMethodologyId.projectMethodologyName }</td>
                                <td>${charter.projectClosureApproval.projectFunctionId.projectFunctionName }</td>
                                <td>${charter.projectClosureApproval.projectTypeId.projectTypeName }</td>
                                <td>
                                  <c:if test="${charter.projectClosureApproval.confidentiality eq 1 }">
                                    Non-Confidential
                                  </c:if>
                                  <c:if test="${charter.projectClosureApproval.confidentiality eq 2 }">
                                    Confidential
                                  </c:if>
                                </td>
                                <td>${charter.projectClosureApproval.sponsor.userFirstName } ${charter.projectClosureApproval.sponsor.userLastName }</td>
                                <td>${charter.projectClosureApproval.problemSolvingLeader.userFirstName } ${charter.projectClosureApproval.problemSolvingLeader.userLastName }</td>
                                <td>${charter.projectClosureApproval.corporateProblemSolvingLeader.userFirstName } ${charter.projectClosureApproval.corporateProblemSolvingLeader.userLastName }</td>
                                <td>
                                  <c:if test="${charter.projectClosureApproval.charterPrimaryDriver eq 1 }">
                                    Productivity
                                  </c:if>
                                  <c:if test="${charter.projectClosureApproval.charterPrimaryDriver eq 2 }">
                                    Quality
                                  </c:if>
                                  <c:if test="${charter.projectClosureApproval.charterPrimaryDriver eq 3 }">
                                    Cost
                                  </c:if>
                                  <c:if test="${charter.projectClosureApproval.charterPrimaryDriver eq 4 }">
                                    Delivery
                                  </c:if>
                                  <c:if test="${charter.projectClosureApproval.charterPrimaryDriver eq 5 }">
                                    Safety
                                  </c:if>
                                </td>
                              </tr>
                            </c:forEach>
                          </tbody>
                          <tr id="charterApprovalListLoader" style="display:none">
                            <th colspan="11">
                              <img class="loaderClass" id="charterApprovalLoaderImage" src="usedStaticFiles/images/loader.gif" width="64" alt="">
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
    <%@include file="../../includeJSP/rightSideBar.jsp"%>
    <%@include file="../../includeJSP/jsFiles.jsp"%>
    <%@include file="../../includeJSP/dataTablesImport.jsp"%>
    <script src="usedStaticFiles/js/jsp_js_files/eim/charter/listCharterApprovalWaiting.js"></script>
  </body>
</html>