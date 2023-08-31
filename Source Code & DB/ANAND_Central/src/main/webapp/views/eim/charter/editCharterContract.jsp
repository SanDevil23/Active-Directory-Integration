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
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>VIEW CONTRACT | EIM | AAPL</title>
     <%@include file="../../includeJSP/cssFiles.jsp"%>
     <%@include file="../../includeJSP/datePickerCss.jsp"%>
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
              	<h5 class="font-color-anand-one font-weight-bold">EDIT CHARTER CONTRACT DETAILS</h5>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="dashboard" title="Dashboard">Dashboard</a></li>
                  <li class="breadcrumb-item"><a href="list-charter" title="View/List Charter">View/List Charter</a></li>
                  <li class="breadcrumb-item active">Edit Contract Details</li>
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
              <form:form modelAttribute="projectCharter" action="saveProjectContractCharter" type="POST" id="projectCharterForm" enctype="multipart/form-data">
              <form:hidden path="tProjectCharterId" />
              <form:hidden path="saveOrSubmit" id="saveOrSubmit" />
              <div class="col-md-12">
                <div class="card card-primary card-outline bg-card-primary-anand col-md-12">
                  <div class="card-header">
                    <h5 class="card-title">View Contract Details</h5>
                    <c:if test="${empty projectCharter.projectCharterCode }">
                    </c:if>
                  </div>
                  <div class="card-body">
                    <div class="card card-primary card-outline card-outline-tabs">
                      <div class="card-header p-0 border-bottom-0">
                        <ul class="nav nav-tabs" id="custom-tabs-four-tab" role="tablist">
                          <li class="nav-item">
                            <a class="nav-link active" id="projectInformation-tab" data-toggle="pill" href="#projectInformation" role="tab" aria-controls="projectInformation" aria-selected="false">Project Information</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" id="projectPlanDates-tab" data-toggle="pill" href="#projectPlanDates" role="tab" aria-controls="projectPlanDates" aria-selected="true">Project Plan Dates</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" id="projectSavings-tab" data-toggle="pill" href="#projectSavings" role="tab" aria-controls="projectSavings" aria-selected="false">Project Savings</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" id="otherDetails-tab" data-toggle="pill" href="#otherDetails" role="tab" aria-controls="otherDetails" aria-selected="false">Other Details</a>
                          </li>
                        </ul>
                      </div>
                      <div class="card-body">
                        <div class="tab-content" id="custom-tabs-four-tabContent">
                          <div class="tab-pane fade active show" id="projectInformation" role="tabpanel" aria-labelledby="projectInformation-tab">
                            <div class="row">
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="functionTemp"><span class="mandatory">*</span>Department</label>
                                  <br>${projectCharter.projectFunctionId.projectFunctionName}
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="metheodologyTemp"><span class="mandatory">*</span>Project Methodology</label>
                                  <br>${  projectCharter.projectMethodologyId.projectMethodologyName}
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="typeTemp"><span class="mandatory">*</span>Project Type</label>
                                  <br>${  projectCharter.projectTypeId.projectTypeName }
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="companyTemp"><span class="mandatory">*</span>Company Name</label>
                                  <br>${  projectCharter.mEntityId.entityName }
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="confidentiality"><span class="mandatory">*</span>Project Confidentiality</label>
                                  <br><c:if test="${projectCharter.confidentiality eq 1 }">
                                      Non-Confidential
                                    </c:if>
                                    <c:if test="${projectCharter.confidentiality eq 2 }">
                                      Confidential
                                    </c:if>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="projectName"><span class="mandatory">*</span>Project Name</label>
                                  <br>${projectCharter.projectName }
                                </div>
                              </div>
                              <div class="col-md-8">
                                <div class="form-group">
                                  <label for="projectDescription"><span class="mandatory">*</span>Project Description</label>
                                  <form:input id="projectDescription" path="projectDescription" type="text" class="form-control" placeholder="Enter Project Description" />
                                  <span class="error invalid-feedback" id="projectDescriptionError"></span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                 <label for="sponsorTemp"><span class="mandatory">*</span>Project Sponsor</label>
                                <br>${projectCharter.sponsor.userFirstName } ${projectCharter.sponsor.userLastName }
                               </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="processOwnerTemp"><span class="mandatory">*</span>Process Owner</label>
                                  <br>${projectCharter.processOwner.userFirstName } ${projectCharter.processOwner.userLastName }
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="problemSolvingLeaderTemp"><span class="mandatory">*</span>Problem Solving Leader</label><br>
                                  ${projectCharter.problemSolvingLeader.userFirstName } ${projectCharter.problemSolvingLeader.userLastName }
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="financeControllerTemp"><span class="mandatory">*</span>Finance Controller</label><br>
                                  ${projectCharter.financeController.userFirstName } ${projectCharter.financeController.userLastName }
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="corporateProblemSolvingLeaderTemp"><span class="mandatory">*</span>Corporate Problem Solving Leader</label><br>
                                  ${projectCharter.corporateProblemSolvingLeader.userFirstName } ${projectCharter.corporateProblemSolvingLeader.userLastName }
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="projectLeaderTemp"><span class="mandatory">*</span>Project Leader</label><br>
                                  ${projectCharter.projectLeader.userFirstName } ${projectCharter.projectLeader.userLastName }
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="estimatedSaving"><span class="mandatory">*</span>Estimated Saving (in Millon INR)</label><br>
                                  ${projectCharter.estimatedSaving }
                                </div>
                              </div>
                              
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="businessHeadTemp"><span class="mandatory">*</span>COO / Business Head</label><br>
                                  ${projectCharter.businessHead.userFirstName } ${projectCharter.businessHead.userLastName }
                                </div>
                              </div>
                              <input type="hidden" id="projectLeaderTemp" value="${projectCharter.projectLeader.mUserId}">
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="additionalProjectLeaderTemp"><span class="mandatory"> </span>Additional Reader</label><br>
                                  <form:select class="form-control" id="additionalProjectLeaderTemp" path="additionalProjectLeaderTemp">
                                  <form:option value="-1">-- Select Additional Reader --</form:option>
                                    <c:forEach items="${projectLeaderList }" var="projectLeader" varStatus="projectLeaderStatus">
                                      <form:option value="${projectLeader.mUserId }">${projectLeader.userFirstName } ${projectLeader.userLastName }</form:option>
                                    </c:forEach>
                                  </form:select>
                                  <span class="error invalid-feedback" id="additionalProjectLeaderTempError"></span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="additionalSponsorTemp"><span class="mandatory"> </span>Additional Sponsor</label><br>
                                  <c:if test="${not empty projectCharter.additionalSponsor }">
                                     ${projectCharter.additionalSponsor.userFirstName } ${projectCharter.additionalSponsor.userLastName }
                                  </c:if>
                                </div>
                              </div>
                              
                              <div class="col-md-4">
                                <div class="form-group" id="countForCertificationDiv">
                                  <label><span class="mandatory">*</span>Count for Certification</label><br>
                                  <c:choose>
                                    <c:when test="${projectCharter.countForCertification eq 1 }">
                                      <label for="customRadio1" class="text-green">Yes</label>
                                    </c:when>
                                    <c:when test="${projectCharter.countForCertification eq 0 }">
                                      <label for="customRadio2" class="text-red">No</label>
                                    </c:when>
                                  </c:choose>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group" id="alignedForBusinessGoalTreeDiv">
                                  <label><span class="mandatory">*</span>Is Project aligned to Business Goal Tree?</label><br>
                                  <c:choose>
                                    <c:when test="${projectCharter.alignedForBusinessGoalTree eq 1 }">
                                      <label for="customRadio1" class="text-green">Yes</label>
                                    </c:when>
                                    <c:when test="${projectCharter.alignedForBusinessGoalTree eq 0 }">
                                      <label for="customRadio2" class="text-red">No</label>
                                    </c:when>
                                  </c:choose>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group" id="fallsUnderSponsorFunctionalAreaDiv">
                                  <label><span class="mandatory">*</span>Is this project with in Sponsor Functional Area?</label><br>
                                  <c:choose>
                                    <c:when test="${projectCharter.fallsUnderSponsorFunctionalArea eq 1 }">
                                      <label for="customRadio1" class="text-green">Yes</label>
                                    </c:when>
                                    <c:when test="${projectCharter.fallsUnderSponsorFunctionalArea eq 0 }">
                                      <label for="customRadio2" class="text-red">No</label>
                                    </c:when>
                                  </c:choose>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="tab-pane fade" id="projectPlanDates" role="tabpanel" aria-labelledby="projectPlanDates-tab">
                            <div class="row">
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label><span class="mandatory">*</span>Estimated Start Date</label><br>
                                  <fmt:formatDate value="${projectCharter.estimatedStartDate}" pattern="dd-MMM-yyyy"/>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label><span class="mandatory">*</span>Estimated End Date</label><br>
                                  <fmt:formatDate value="${projectCharter.estimatedEndDate}" pattern="dd-MMM-yyyy"/>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="estimatedThroughPutDays"><span class="mandatory">*</span>Estimated Throughput Days</label><br>
                                  ${projectCharter.estimatedThroughputDays}
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="projectLaunchDate">Project Launch Date</label><br>
                                  <c:if test="${not empty projectCharter.launchDate }">
                                     <fmt:formatDate value="${projectCharter.launchDate}" pattern="dd-MMM-yyyy"/>
                                  </c:if>
                                </div>
                              </div>
                              <div class="col-md-4"></div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="actualThroughputDays">Actual Throughput Days</label><br>
                                  ${projectCharter.actualThroughputDays}
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label><span class="mandatory">*</span>Define</label><br>
                                  <fmt:formatDate value="${projectCharter.defineDate}" pattern="dd-MMM-yyyy"/>
                                </div>
                              </div>
                              <div class="col-md-2">
                                <div class="form-group">
                                  <label for="measureDate">Measure</label><br>
                                  <c:if test="${not empty projectCharter.measureDate }">
                                     <fmt:formatDate value="${projectCharter.measureDate}" pattern="dd-MMM-yyyy"/>
                                  </c:if>
                                </div>
                              </div>
                              <div class="col-md-2">
                                <div class="form-group">
                                  <label for="analyzeDate">Analyze</label><br>
                                  <c:if test="${not empty projectCharter.analyzeDate }">
                                     <fmt:formatDate value="${projectCharter.analyzeDate}" pattern="dd-MMM-yyyy"/>
                                  </c:if>
                                </div>
                              </div>
                              <div class="col-md-2">
                                <div class="form-group">
                                  <label for="improveDays">Improve Days</label><br>
                                  <c:if test="${not empty projectCharter.improveDays }">
                                     <fmt:formatDate value="${projectCharter.improveDays}" pattern="dd-MMM-yyyy"/>
                                  </c:if>
                                </div>
                              </div>
                              <div class="col-md-2">
                                <div class="form-group">
                                  <label for="closureDate">Closure</label><br>
                                  <c:if test="${not empty projectCharter.closureDate }">
                                     <fmt:formatDate value="${projectCharter.closureDate}" pattern="dd-MMM-yyyy"/>
                                  </c:if>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="tab-pane fade" id="projectSavings" role="tabpanel" aria-labelledby="projectSavings-tab">
                            <div class="row">
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="annualCostSaving"><span class="mandatory">*</span>Annual Project Cost Saving (Rs.)</label>
                                  <form:input path="annualCostSaving" id="annualCostSaving" type="text" class="form-control float-right" title="Annaul Cost Savings" />
                                  <span class="error invalid-feedback" id="annualCostSavingError"></span>
                                </div>
                              </div>
                              <div class="col-md-3">
                                <div class="form-group">
                                  <label for="annualTaxSaving"><span class="mandatory"> </span>Annual Tax Saving (Rs.)</label>
                                  <form:input path="annualTaxSaving" id="annualTaxSaving" type="text" class="form-control float-right" title="Annual Tax Savings" />
                                  <span class="error invalid-feedback" id="annualTaxSavingError"></span>
                                </div>
                              </div>
                              <div class="col-md-5">
                                <div class="form-group">
                                  <label for="netAnnualProfitImprovement"><span class="mandatory"> </span>Net Annualized Profit Improvement (Rs.)</label>
                                  <form:input path="netAnnualProfitImprovement" readonly="true" id="netAnnualProfitImprovement" type="text" class="form-control float-right" />
                                  <span class="error invalid-feedback" style="display:block" id="netAnnualProfitImprovementError">Annual Project Cost Saving - Annual Tax Saving</span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="completionYearCostSaving"><span class="mandatory">*</span>Completion Year Cost Saving (Rs.)</label>
                                  <form:input path="completionYearCostSaving" id="completionYearCostSaving" type="text" class="form-control float-right" title="Completion Year Cost Saving" />
                                  <span class="error invalid-feedback" id="completionYearCostSavingError"></span>
                                </div>
                              </div>
                              <div class="col-md-3">
                                <div class="form-group">
                                  <label for="oneTimeCostToImplement"><span class="mandatory"> </span>One Time Cost to Implement (Rs.)</label>
                                  <form:input path="oneTimeCostToImplement" id="oneTimeCostToImplement" type="text" class="form-control float-right" title="One Time Cost to Implement" />
                                  <span class="error invalid-feedback" id="oneTimeCostToImplementError"></span>
                                </div>
                              </div>
                              <div class="col-md-5">
                                <div class="form-group">
                                  <label for="netCompletionYearProfitImprovement"><span class="mandatory"> </span>Net Completion Year Profit Improvements (Rs.)</label>
                                  <form:input path="netCompletionYearProfitImprovement" readonly="true" id="netCompletionYearProfitImprovement" type="text" class="form-control float-right" title="Net Completion Year Profit Improvements" />
                                  <span class="error invalid-feedback" style="display:block" id="netCompletionYearProfitImprovementError">Completion Year Cost Saving - One Time Cost To Implement</span>
                                </div>
                              </div>
                              <div class="col-md-3">
                                <div class="form-group">
                                  <label for="annualAvoidanceCostSaving"><br>Annual Avoidance Cost Saving (Rs.)</label>
                                  <form:input path="annualAvoidanceCostSaving" id="annualAvoidanceCostSaving" type="text" class="form-control float-right" title="Annual Avoidance Cost Saving" />
                                  <span class="error invalid-feedback" id="annualAvoidanceCostSavingError"></span>
                                </div>
                              </div>
                              <div class="col-md-3">
                                <div class="form-group">
                                  <label for="annualInterestSaving"><br>Annual Interest Saving (Rs.)</label>
                                  <form:input path="annualInterestSaving" id="annualInterestSaving" type="text" class="form-control float-right" title="Annual Interest Saving" />
                                  <span class="error invalid-feedback" id="annualInterestSavingError"></span>
                                </div>
                              </div>
                              <div class="col-md-3">
                                <div class="form-group">
                                  <label for="completionYearAvoidanceCostSaving">Completion Year Avoidance Cost Saving (Rs.)</label>
                                  <form:input path="completionYearAvoidanceCost" id="completionYearAvoidanceCostSaving" type="text" class="form-control float-right" title="Completion Year Avoidance Cost Saving" />
                                  <span class="error invalid-feedback" id="completionYearAvoidanceCostSavingError"></span>
                               </div>
                              </div>
                              <div class="col-md-3">
                                <div class="form-group">
                                  <label for="externalCustomerSaving"><br>External Customer Savings (Rs.)</label>
                                  <form:input path="externalCustomerSavings" id="externalCustomerSaving" type="text" class="form-control float-right" title="Completion Year Avoidance Cost Saving" />
                                  <span class="error invalid-feedback" id="externalCustomerSavingError"></span>
                                </div>
                              </div>
                              <div class="col-md-12"><br></div>
                              <div class="col-md-6">
                                <div class="form-group">
                                  <label for="hopperEstimateComment">Hopper Estimate Comments</label><br>
                                  ${projectCharter.hopperEstimateComment }
                                </div>
                              </div>
                              <div class="col-md-6">
                                <div class="form-group">
                                  <label for="newEstimateCommentDuringProjectContract">New Estimate Comments During Project Contract</label><br>
                                  ${projectCharter.newEstimateCommentDuringContract }
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="tab-pane fade" id="otherDetails" role="tabpanel" aria-labelledby="otherDetails-tab">
                            <div class="row">
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="charterPrimaryDriver"><span class="mandatory">*</span>Project Primary Driver</label><br>
                                  <c:choose>
                                    <c:when test="${projectCharter.charterPrimaryDriver eq 1 }">Productivity</c:when>
                                    <c:when test="${projectCharter.charterPrimaryDriver eq 2 }">Quality</c:when>
                                    <c:when test="${projectCharter.charterPrimaryDriver eq 3 }">Cost</c:when>
                                    <c:when test="${projectCharter.charterPrimaryDriver eq 4 }">Delivery</c:when>
                                    <c:when test="${projectCharter.charterPrimaryDriver eq 5 }">Safety</c:when>
                                  </c:choose>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="projectStatus"><span class="mandatory">*</span>Project Status</label>
                                  <form:select class="form-control" id="projectStatus" path="projectStatus">
                                    <form:option value="-1">-- Select Project Status --</form:option>
                                    <form:option value="1">As-Per-Plan</form:option>
                                    <form:option value="2">Delayed but within +5%</form:option>
                                    <form:option value="3">Delayed > 5%</form:option>
                                  </form:select>
                                  <span class="error invalid-feedback" id="projectStatusError"></span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group" id="supplyChainImprovementProjectDiv">
                                  <label><span class="mandatory">*</span>Supply Chain Improvement Project</label><br>
                                  <c:choose>
                                    <c:when test="${projectCharter.supplyChainImprovementProject eq 1 }"><label class="text-green">Yes</label></c:when>
                                    <c:when test="${projectCharter.supplyChainImprovementProject eq 0 }"><label class="text-red">No</label></c:when>
                                  </c:choose>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group" id="supplierFocusProjectDiv">
                                  <label><span class="mandatory">*</span>Supplier Focus Project</label><br>
                                  <c:choose>
                                    <c:when test="${projectCharter.supplierFocusProject eq 1 }"><label class="text-green">Yes</label></c:when>
                                    <c:when test="${projectCharter.supplierFocusProject eq 0 }"><label class="text-red">No</label></c:when>
                                  </c:choose>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group" id="projectWarrantyFocusDiv">
                                  <label><span class="mandatory">*</span>Is the project warranty focus?</label><br>
                                  <c:choose>
                                    <c:when test="${projectCharter.projectWarrantyFocus eq 1 }"><label class="text-green">Yes</label></c:when>
                                    <c:when test="${projectCharter.projectWarrantyFocus eq 0 }"><label class="text-red">No</label></c:when>
                                  </c:choose>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="warrantyFocusState">Warranty Focused Yes</label><br>
                                  <c:choose>
                                    <c:when test="${projectCharter.warrantyFocusState eq 1 }">3 Months Failure</c:when>
                                    <c:when test="${projectCharter.warrantyFocusState eq 2 }">6 Months Failure</c:when>
                                    <c:when test="${projectCharter.warrantyFocusState eq 3 }">12 Months Failure</c:when>
                                  </c:choose>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group" id="externalCustomerFocusProjectDiv">
                                  <label><span class="mandatory">*</span>External Customer Focus Project</label><br>
                                  <c:choose>
                                    <c:when test="${projectCharter.externalCustomerFocusProject eq 1 }"><label class="text-green">Yes</label></c:when>
                                    <c:when test="${projectCharter.externalCustomerFocusProject eq 0 }"><label class="text-red">No</label></c:when>
                                  </c:choose>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="nameOfCustomer">Name of Customer</label><br>
                                  ${projectCharter.nameOfCustomer }
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="contactPersonName">Contact Person Name</label><br>
                                  ${projectCharter.contactPersonName }
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group" id="interCompanyCustomerFocusProjectDiv">
                                  <label><span class="mandatory">*</span>Intercompany Customer Focus Project</label><br>
                                  <c:choose>
                                    <c:when test="${projectCharter.interCompanyCustomerFocusProject eq 1 }"><label class="text-green">Yes</label></c:when>
                                    <c:when test="${projectCharter.interCompanyCustomerFocusProject eq 0 }"><label class="text-red">No</label></c:when>
                                  </c:choose>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="processOrProductOppterrunityExists">Process/Product where Opportunity Exists</label><br>
                                  ${projectCharter.processOrProductOppterrunityExists }
                                </div>
                              </div>
                            </div>
                            <div class="row">
                              <div class="card card-primary card-outline">
                                <div class="card-header">
                                  <h5 class="card-title">Objectives</h5>
                                </div>
                                <div class="card-body">
                                  <div class="row">
                                    <div class="col-md-12">
                                      <label for=""><span class="mandatory">*</span>Quality/Productivity Measure the "Y" Variable</label>
                                    </div>
                                    <div class="col-md-3">
                                      <label for="qualityBaseline">Baseline</label>
                                      <form:input path="qualityBaseline" id="qualityBaseline" class="form-control" placeholder="Baseline - Quality/Productivity" />
                                      <span class="error invalid-feedback" id="qualityBaselineError"></span>
                                    </div>
                                    <div class="col-md-3">
                                      <label for="qualityGoal">Goal</label>
                                      <form:input path="qualityGoal" readonly="true" id="qualityGoal" class="form-control" placeholder="Goal - Quality/Productivity" />
                                      <span class="error invalid-feedback" id="qualityGoalError"></span>
                                    </div>
                                    <div class="col-md-3">
                                      <label for="qualityEntitlement">Entitlement</label><br>
                                      ${projectCharter.qualityEntitlement }
                                    </div>
                                    <div class="col-md-3">
                                      <label for="qualityUnitOfMeasure">Metrix/Unit of Measure</label><br>
                                      <c:choose>
                                        <c:when test="${projectCharter.qualityUnitOfMeasure eq 1 }">KG</c:when>
                                        <c:when test="${projectCharter.qualityUnitOfMeasure eq 2 }">ML</c:when>
                                        <c:when test="${projectCharter.qualityUnitOfMeasure eq 3 }">KGM</c:when>
                                        <c:when test="${projectCharter.qualityUnitOfMeasure eq 4 }">% Rejection</c:when>
                                        <c:when test="${projectCharter.qualityUnitOfMeasure eq 5 }">% Rejection</c:when>
                                        <c:when test="${projectCharter.qualityUnitOfMeasure eq 0 }">Other</c:when>
                                      </c:choose>
                                    </div>
                                    <div class="col-md-12">
                                      <label for=""><span class="mandatory">*</span>Cost Associated with Project</label>
                                    </div>
                                    <div class="col-md-3">
                                      <label for="costBaseline">Baseline</label>
                                      <form:input path="costBaseline" id="costBaseline" class="form-control" placeholder="Baseline - Cost" />
                                      <span class="error invalid-feedback" id="costBaselineError"></span>
                                    </div>
                                    <div class="col-md-3">
                                      <label for="costGoal">Goal</label>
                                      <form:input path="costGoal" readonly="true" id="costGoal" class="form-control" placeholder="Goal - Cost" />
                                      <span class="error invalid-feedback" id="costGoalError"></span>
                                    </div>
                                    <div class="col-md-3">
                                      <label for="costEntitlement">Entitlement</label><br>
                                      ${projectCharter.costEntitlement }
                                    </div>
                                    <div class="col-md-3">
                                      <label for="costUnitOfMeasure">Metrix/Unit of Measure</label><br>
                                      <c:choose>
                                        <c:when test="${projectCharter.costUnitOfMeasure eq 1 }">MYR</c:when>
                                        <c:when test="${projectCharter.costUnitOfMeasure eq 2 }">KWD</c:when>
                                        <c:when test="${projectCharter.costUnitOfMeasure eq 3 }">JPY</c:when>
                                        <c:when test="${projectCharter.costUnitOfMeasure eq 4 }">HKD</c:when>
                                        <c:when test="${projectCharter.costUnitOfMeasure eq 5 }">EUR</c:when>
                                        <c:when test="${projectCharter.costUnitOfMeasure eq 6 }">USD</c:when>
                                        <c:when test="${projectCharter.costUnitOfMeasure eq 7 }">INR</c:when>
                                        <c:when test="${projectCharter.costUnitOfMeasure eq 8 }">AED</c:when>
                                        <c:when test="${projectCharter.costUnitOfMeasure eq 0 }">Other</c:when>
                                      </c:choose>
                                    </div>
                                    <div class="col-md-3"></div>
                                    <div class="col-md-3">
                                      <label for=""><span class="mandatory">*</span>Savings/Gain</label>
                                      <form:input readonly="true" path="savingOrGains" id="savingOrGains" class="form-control" placeholder="Saving/Gain" />
                                      <span class="error invalid-feedback" id="savingOrGainsError"></span>
                                    </div>
                                  <div class="col-md-6"></div>
                                  <div class="col-md-12"><br></div>
                                  <div class="col-md-6">
                                    <label for="projectTeamMemberInternal">Project Team Member (Internal)</label><br>
                                    <c:if test="${not empty projectCharter.projectTeamMemberInternal }">
                                      <ul>
                                      <c:forEach items="${projectInternalTeam }" var="companyTeam" varStatus="companyTeamStatus">
                                        <c:set var="currUserId" value="${companyTeam.mUserId }" />
                                        <c:if test="${fn:contains(currUserId, projectCharter.projectTeamMemberInternal)}">
                                          <li>${companyTeam.userFirstName } ${companyTeam.userLastName }</li>
                                        </c:if>
                                        <c:set var="currUserId" value="" />
                                      </c:forEach>
                                      </ul>
                                    </c:if>
                                  </div>
                                  <div class="col-md-6">
                                    <label for="">Project Team Member (External)</label><br>
                                    ${projectCharter.projectTeamMemberExternal }
                                  </div>
                                  <div class="col-md-12"><br></div>
                                  <div class="col-md-6">
                                    <label for="projectScope">Project Scope</label>
                                    <textarea name="projectScope" id="projectScope" class="form-control" placeholder="Enter Project Scope">
                                        ${projectCharter.projectScope }
                                    </textarea>
                                    <span class="error invalid-feedback" id="projectScopeError"></span>
                                  </div>
                                  <div class="col-md-6">
                                    <label for="impactToExternalCustomerOrOtherIntercompanyCustomer">Impact/Benefits to External Customer Or Other Intracompany Customer</label><br>
                                    ${projectCharter.impactToExternalCustomerOrOtherIntercompanyCustomer }
                                  </div>
                                  <div class="col-md-6">
                                    <label for="supportRequired">Support Required</label>
                                    <textarea name="supportRequired" id="supportRequired" class="form-control" placeholder="Support Required">
                                      ${projectCharter.supportRequired }
                                    </textarea>
                                    <span class="error invalid-feedback" id="supportRequiredError"></span>
                                  </div>
                                  <div class="col-md-6"></div>
                                  <div class="col-md-12"><br></div>
                                  <div class="col-md-6">
                                    <div class="form-group">
                                      <label for=""><span class="mandatory">*</span>Attach Project Charter</label>
                                        <c:if test="${not empty projectCharter.charterAttachmentName }">
                                        <br>
                                          <a href="getCharterAttachment?id=${projectCharter.tProjectCharterId }" target="_blank" title="Download Charter Attachment">
                                          <i class="fas fa-download" style="padding-bottom:15px"></i>&nbsp;${projectCharter.charterAttachmentName }
                                          </a>
                                        </c:if>
                                      </div>
                                    </div>
                                    <div class="col-md-6">
                                      <label for="cycleCount"><span class="mandatory">*</span>Cycle Count @ Each Approvers</label>
                                      <br>${projectCharter.cycleCount }
                                    </div>
                                    <div class="col-md-12"></div>
                                    <div class="col-md-6">
                                      <div class="form-group">
                                        <label for=""><span class="mandatory">*</span>Final Project Presentation (Contract)</label>
                                        <input type="hidden" id="finalPresentationTemp" value="${projectCharter.finalPresentationName }" />
                                        <c:if test="${not empty projectCharter.finalPresentationName }">
                                          <br>
                                          <a href="getFinalPresentation?id=${projectCharter.tProjectCharterId }" target="_blank" title="Download Charter Attachment">
                                            <i class="fas fa-download" style="padding-bottom:15px"></i>&nbsp;${projectCharter.finalPresentationName }
                                          </a>
                                        </c:if>
                                        <div class="input-group">
                                          <div class="custom-file">
                                            <input type="file" name="attachpresentation" id="attachpresentation" class="form-control-file" accept=".pdf,.csv,application/vnd.ms-excel" />
                                            <label class="custom-file-label" for="attachpresentation">Choose file</label>
                                          </div>
                                        </div>
                                        <span class="error invalid-feedback" id="finalPresentationTempError"></span>
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
                  </div>
                  <c:if test="${projectCharter.projectCharterStatus gt 0 }">
                    <%@include file="charterApprovalInformation.jsp"%>
                  </c:if>
                  <div class="card-body content-margin">
                    <div class="card card-primary card-outline  bg-card-primary-anand">
                      <div class="card-header" data-card-widget="collapse">
                        <h5 class="card-title">Project Review Comments</h5>
                   	    <div class="card-tools">
                       	  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                            <i class="fas fa-minus"></i>
                          </button>
                        </div>
                      </div>
                      <div class="card-body">
                        <div class="col-md-12" style="overflow-x: auto;">
                          <form:hidden path="" id="reviewIndex"/>
                          <table class="table table-bordered dataTable anand-table-font-size" id="addReviewTable">
						    <thead>
							  <tr class="bg-table-head">
							    <th>Review Comments</th>
							    <th>Review Attachment MOM</th>
							    <th>Review Done By</th>
							    <th>Review Date</th>
							  </tr>
					  	    </thead>
   						    <tbody>
   						      <c:forEach items="${projectCharter.projectCharterReview }" var="projectCharterReview" >
                                <c:if test="${projectCharterReview.active eq 1 }">
                                  <tr class="bg-table-row-1">  
                                    <td>
                                      ${projectCharterReview.reviewComments }
                                    </td>
                                    <td>
                                      <a href="getReviewMom?id=${projectCharterReview.tProjectCharterReviewId}" target="_blank" title="Download Review MOM">
                                        <i class="fas fa-download" style="padding-bottom:15px"></i>&nbsp;${projectCharterReview.reviewMomName }
                                      </a>  
                                    </td>  
                                    <td>
                                      ${projectCharterReview.reviewDoneBy.userFirstName } ${projectCharterReview.reviewDoneBy.userLastName  }
                                    </td>
                                    <td>
                                      <fmt:formatDate value="${projectCharterReview.reviewDoneOn }" pattern="dd-MMM-yyyy"/>
                                    </td>                                 
                                  </tr>
                                </c:if>
                              </c:forEach>
  		                    </tbody>
	    			      </table>
					    </div>
					    <div class="card-body">
                           <button style="float:right" title="Add Review" type="button" id="addReview" onclick="addReviewRow()" class="btn bg-color-anand-two text-white btn-tool"><b> + Add New</b></button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <c:if test="${projectCharter.projectCharterStatus gt 4 }">
                    <%@include file="contractApprovalInformation.jsp"%>
                  </c:if>
                  <div class="card-footer" style="overflow-x: auto;">
                    <div class="row">
                      <div class="col-md-1" style='text-align:center'>
                        <button title="Save Project Charter" type="button" id="projectCharterSubmit" onclick="submitCharterForm(0)" class="btn bg-color-anand-one text-white"><b>Save</b></button>
                      </div>
                        <c:if test="${(eim eq 1 || projectLeader eq 1 && sessionUserInfo.mUserId eq projectCharter.projectLeader.mUserId )}">                    
                          <div class="col-md-1" style='text-align:center'>    
                            <button title="Submit Project Contract" type="button" id="projectContractSubmit" onclick="submitCharterForm(1)" class="btn bg-color-anand-two text-white"><b>Submit</b></button>
                          </div>
                        </c:if>
                        <c:if test="${eim eq 1 || projectLeader eq 1 && sessionUserInfo.mUserId eq projectCharter.projectLeader.mUserId }">
                          <div class="col-md-8"></div>
                          <div class="col-md-2" >
                            <button title="Request Terminate" type="button" id="rejectCharter" onclick="submitCharterForm(3);" class="btn bg-color-anand-danger-two text-white"><b>Request Terminate</b></button>
                          </div>
                        </c:if>
                      </div>
                    </div>
                  </div>
                </div>
              </form:form>
            </div>
          </div>
        </section>
      </div>
      <%@include file="../includeJSP/footer.jsp"%>
    </div> 
    <%@include file="../../includeJSP/rightSideBar.jsp"%>
    <%@include file="../../includeJSP/jsFiles.jsp"%>
    <%@include file="../../includeJSP/dataTablesImport.jsp"%>
    <%@include file="../../includeJSP/datePickerJs.jsp"%>
    <script src="usedStaticFiles/js/generalJs/bs-custom-file-input.min.js"></script>
    <script src="usedStaticFiles/js/jsp_js_files/eim/charter/editCharterContract.js"></script>
  </body>
</html>