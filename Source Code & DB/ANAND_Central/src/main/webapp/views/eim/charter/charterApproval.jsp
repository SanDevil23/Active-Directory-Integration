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
    <title>APPROVE CHARTER | EIM | AAPL</title>
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
                <h5 class="font-color-anand-one font-weight-bold">APPROVE CHARTER PROJECT</h5>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="dashboard" title="Dashboard">Dashboard</a></li>
                  <li class="breadcrumb-item"><a href="charter-approval-waiting" title="For My Approval">For My Approval</a></li>
                  <li class="breadcrumb-item active">Approve Charter</li>
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
                    <h5 class="card-title">Approve Charter Details</h5>
                  </div>
                  <div class="card-body">
                    <div class="card card-primary card-outline card-outline-tabs">
                      <div class="card-header p-0 border-bottom-0 ">
                        <ul class="nav nav-tabs " id="custom-tabs-four-tab" role="tablist">
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
                        <div class="tab-content" id="custom-tabs-four-tabContent ">
                          <div class="tab-pane fade active show" id="projectInformation" role="tabpanel" aria-labelledby="projectInformation-tab">
                            <div class="row">
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="functionTemp"><span class="mandatory">*</span>Department</label><br>
                                  ${projectCharter.projectFunctionId.projectFunctionName }
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="metheodologyTemp"><span class="mandatory">*</span>Project Methodology</label><br>
                                  ${projectCharter.projectMethodologyId.projectMethodologyName }
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="typeTemp"><span class="mandatory">*</span>Project Type</label><br>
                                  ${projectCharter.projectTypeId.projectTypeName }
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="companyTemp"><span class="mandatory">*</span>Company Name</label><br>
                                  ${projectCharter.mEntityId.entityName }
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="locationTemp"><span class="mandatory">*</span>Location</label><br>
                                  ${projectCharter.mEntityId.locationId.locationName }
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="confidentiality"><span class="mandatory">*</span>Project Confidentiality</label><br>
                                  <c:choose>
                                    <c:when test="${projectCharter.confidentiality eq 1 }">
                                      Non-Confidential 
                                    </c:when>
                                    <c:when test="${projectCharter.confidentiality eq 2 }">
                                      Confidential
                                    </c:when>
                                  </c:choose>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="projectName"><span class="mandatory">*</span>Project Name</label><br>
                                  ${projectCharter.projectName } 
                                </div>
                              </div>
                              <div class="col-md-8">
                                <div class="form-group">
                                  <label for="projectDescription"><span class="mandatory">*</span>Project Description</label><br>
                                  ${projectCharter.projectDescription }
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="sponsorTemp"><span class="mandatory">*</span>Project Sponsor</label><br>
                                  ${projectCharter.sponsor.userFirstName } ${projectCharter.sponsor.userLastName }
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="processOwnerTemp"><span class="mandatory">*</span>Process Owner</label><br>
                                  ${projectCharter.processOwner.userFirstName } ${projectCharter.processOwner.userLastName }
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
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="additionalProjectLeaderTemp">Additional Reader</label><br>
                                  <c:if test="${not empty projectCharter.additionalReader }">
                                     ${projectCharter.additionalReader.userFirstName } ${projectCharter.additionalReader.userLastName }
                                  </c:if>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="additionalSponsorTemp">Additional Sponsor</label><br>
                                  <c:if test="${not empty projectCharter.additionalSponsor }">
                                     ${projectCharter.additionalSponsor.userFirstName } ${projectCharter.additionalSponsor.userLastName }
                                  </c:if>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-check" id="isActiveDiv">
                                  <label><span class="mandatory">*</span>Charter Active/InActive</label><br>
                                  <c:choose>
                                    <c:when test="${projectCharter.charterActive eq 1 }">
                                      <label for="customRadio1" class="text-green">Active</label>
                                    </c:when>
                                    <c:when test="${projectCharter.charterActive eq 0 }">
                                      <label for="customRadio2" class="text-red">Inactive</label>
                                    </c:when>
                                  </c:choose>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-check" id="countForCertificationDiv">
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
                                <div class="form-check" id="alignedForBusinessGoalTreeDiv">
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
                                <div class="form-check" id="fallsUnderSponsorFunctionalAreaDiv">
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
                                  <label for="annualCostSaving"><span class="mandatory">*</span>Annual Project Cost Saving (Rs.)</label><br>
                                  ${projectCharter.annualCostSaving }
                                </div>
                              </div>
                              <div class="col-md-3">
                                <div class="form-group">
                                  <label for="annualTaxSaving">Annual Tax Saving (Rs.)</label><br>
                                  ${projectCharter.annualTaxSaving }
                                </div>
                              </div>
                              <div class="col-md-5">
                                <div class="form-group">
                                  <label for="netAnnualProfitImprovement">Net Annualized Profit Improvement (Rs.)</label><br>
                                  ${projectCharter.netAnnualProfitImprovement }
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="completionYearCostSaving"><span class="mandatory">*</span>Completion Year Cost Saving (Rs.)</label><br>
                                  ${projectCharter.completionYearCostSaving }
                                </div>
                              </div>
                              <div class="col-md-3">
                                <div class="form-group">
                                  <label for="oneTimeCostToImplement">One Time Cost to Implement (Rs.)</label><br>
                                  ${projectCharter.oneTimeCostToImplement }
                                </div>
                              </div>
                              <div class="col-md-5">
                                <div class="form-group">
                                  <label for="netCompletionYearProfitImprovement">Net Completion Year Profit Improvements (Rs.)</label><br>
                                  ${projectCharter.netCompletionYearProfitImprovement }
                                </div>
                              </div>
                              <div class="col-md-3">
                                <div class="form-group">
                                  <label for="annualAvoidanceCostSaving">Annual Avoidance Cost Saving (Rs.)</label><br>
                                  ${projectCharter.annualAvoidanceCostSaving }
                                </div>
                              </div>
                              <div class="col-md-3">
                                <div class="form-group">
                                  <label for="annualInterestSaving">Annual Interest Saving (Rs.)</label><br>
                                  ${projectCharter.annualInterestSaving }
                                </div>
                              </div>
                              <div class="col-md-3">
                                <div class="form-group">
                                  <label for="completionYearAvoidanceCostSaving">Completion Year Avoidance Cost Saving (Rs.)</label><br>
                                  ${projectCharter.completionYearAvoidanceCost }
                                </div>
                              </div>
                              <div class="col-md-3">
                                <div class="form-group">
                                  <label for="externalCustomerSaving">External Customer Savings (Rs.)</label><br>
                                  ${projectCharter.externalCustomerSavings }
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
                              <div class="col-md-6">
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
                              <div class="col-md-6">
                                <div class="form-group">
                                  <label for="projectStatus"><span class="mandatory">*</span>Project Status</label><br>
                                  <c:choose>
                                    <c:when test="${projectCharter.projectStatus eq 1 }">As-Per-Plan</c:when>
                                    <c:when test="${projectCharter.projectStatus eq 2 }">Delayed but within +5%</c:when>
                                    <c:when test="${projectCharter.projectStatus eq 3 }">Delayed > 5%</c:when>
                                  </c:choose>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-check" id="supplyChainImprovementProjectDiv">
                                  <label><span class="mandatory">*</span>Supply Chain Improvement Project</label><br>
                                  <c:choose>
                                    <c:when test="${projectCharter.supplyChainImprovementProject eq 1 }"><label class="text-green">Yes</label></c:when>
                                    <c:when test="${projectCharter.supplyChainImprovementProject eq 0 }"><label class="text-red">No</label></c:when>
                                  </c:choose>
                                </div>
                              </div>
                              <div class="col-md-3">
                                <div class="form-check" id="supplierFocusProjectDiv">
                                  <label><span class="mandatory">*</span>Supplier Focus Project</label><br>
                                  <c:choose>
                                    <c:when test="${projectCharter.supplierFocusProject eq 1 }"><label class="text-green">Yes</label></c:when>
                                    <c:when test="${projectCharter.supplierFocusProject eq 0 }"><label class="text-red">No</label></c:when>
                                  </c:choose>
                                </div>
                              </div>
                              <div class="col-md-3">
                                <div class="form-check" id="projectWarrantyFocusDiv">
                                  <label><span class="mandatory">*</span>Is the project warranty focus?</label><br>
                                  <c:choose>
                                    <c:when test="${projectCharter.projectWarrantyFocus eq 1 }"><label class="text-green">Yes</label></c:when>
                                    <c:when test="${projectCharter.projectWarrantyFocus eq 0 }"><label class="text-red">No</label></c:when>
                                  </c:choose>
                                </div>
                              </div>
                              <div class="col-md-2">
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
                                <div class="form-check" id="externalCustomerFocusProjectDiv">
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
                                <div class="form-check" id="interCompanyCustomerFocusProjectDiv">
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
                              <div class="card card-primary card-outline bg-card-primary-anand">
                                <div class="card-header">
                                  <h5 class="card-title">Objectives</h5>
                                </div>
                                <div class="card-body">
                                  <div class="row">
                                    <div class="col-md-12">
                                      <label for=""><span class="mandatory">*</span>Quality/Productivity Measure the "Y" Variable</label>
                                    </div>
                                    <div class="col-md-3">
                                      <label for="qualityBaseline">Baseline</label><br>
                                      ${projectCharter.qualityBaseline }
                                    </div>
                                    <div class="col-md-3">
                                      <label for="qualityGoal">Goal</label><br>
                                      ${projectCharter.qualityGoal }
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
                                      <label for="costBaseline">Baseline</label><br>
                                      ${projectCharter.costBaseline }
                                    </div>
                                    <div class="col-md-3">
                                      <label for="costGoal">Goal</label><br>
                                      ${projectCharter.costGoal }
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
                                      <label for=""><span class="mandatory">*</span>Savings/Gain</label><br>
                                      ${projectCharter.savingOrGains }
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
                                      <label for="projectScope">Project Scope</label><br>
                                      ${projectCharter.projectScope }
                                    </div>
                                    <div class="col-md-6">
                                      <label for="impactToExternalCustomerOrOtherIntercompanyCustomer">Impact/Benefits to External Customer Or Other Intracompany Customer</label><br>
                                      ${projectCharter.impactToExternalCustomerOrOtherIntercompanyCustomer }
                                    </div>
                                    <div class="col-md-6">
                                      <label for="supportRequired">Support Required</label><br>
                                      ${projectCharter.supportRequired }
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
                                      <label for="cycleCount"><span class="mandatory">*</span>Cycle Count @ Each Approvers</label><br>
                                      ${projectCharter.cycleCount }
                                    </div>
                                    <c:if test="${projectCharter.projectCharterStatus gt 3}">
                                    <div class="col-md-12"><br></div>
                                    <div class="col-md-6">
                                      <div class="form-group">
                                        <label for=""><span class="mandatory">*</span>Final Presentation (Contract)</label>
                                        <br>
                                        <a href="getFinalPresentation?id=${projectCharter.tProjectCharterId }" target="_blank" title="Download Final Presentation (Contract)">
                                          <i class="fas fa-download" style="padding-bottom:15px"></i>&nbsp;${projectCharter.finalPresentationName }
                                        </a>
                                      </div>
                                    </div>
                                    </c:if>
                                  <c:if test="${projectCharter.projectCharterStatus gt 5}">
                                    <div class="col-md-6">
                                      <div class="form-group">
                                        <label for=""><span class="mandatory">*</span>Final Presentation (Closure)</label>
                                          <br>
                                          <a href="getFinalClosurePresentation?id=${projectCharter.tProjectCharterId }" target="_blank" title="Download Final Presentation (Closure)">
                                           <i class="fas fa-download" style="padding-bottom:15px"></i>&nbsp;${projectCharter.finalClosurePresentationName }
                                          </a>
                                        </div>
                                    </div>
                                  </c:if>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  </div>
                  <c:set var="showCharterApproval" value="0" />
                  <c:forEach items="${projectCharter.projectCharterApproval }" var="projectCharterApproval" varStatus="projectCharterApprovalStatus">
                    <c:if test="${projectCharterApproval.active eq 1 }">
                      <c:set var="showCharterApproval" value="${showCharterApproval + 1 }" />
                    </c:if>
                  </c:forEach>
                  <c:forEach items="${projectCharter.projectContractApproval }" var="projectContractApproval" varStatus="projectContractApprovalStatus">
                    <c:if test="${projectContractApproval.active eq 1 }">
                      <c:set var="showContractApproval" value="${showContractApproval + 1 }" />
                    </c:if>
                  </c:forEach>
                  <c:if test="${showCharterApproval ne 0 and projectCharter.projectCharterStatus eq 1}">
                    <div class="card-body content-margin">
                      <div class="card card-primary card-outline bg-card-primary-anand">
                        <div class="card-header">
                          <h5 class="card-title">Charter Approval Information</h5>
                        </div>
                        <div class="card-body">
                          <div class="row">
                            <div class="col-md-12">
                              <table class="table table-bordered dataTable anand-table-font-size">
                                <thead>
                                  <tr class="bg-table-head">
                                    <th>Approver Type</th>
                                    <th>Approver</th>
                                    <th>Approval Status</th>
                                    <th>Approval Comments</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <c:forEach items="${projectCharter.projectCharterApproval }" var="projectCharterApproval" varStatus="projectCharterApprovalStatus">
                                    <c:if test="${projectCharterApproval.active eq 1 }">
                                      <c:set var="rowClassValue" value="${projectCharterApprovalStatus.index % 2 }" />
                                      <tr class="bg-table-row-${rowClassValue }">
                                        <td>
                                          <c:choose>
                                            <c:when test="${projectCharterApproval.approverType eq 1 }">Sponsor</c:when>
                                            <c:when test="${projectCharterApproval.approverType eq 2 }">Process Owner</c:when>
                                            <c:when test="${projectCharterApproval.approverType eq 3 }">Problem Solving Leader Primary</c:when>
                                            <c:when test="${projectCharterApproval.approverType eq 4 }">Finance Controller</c:when>
                                            <c:when test="${projectCharterApproval.approverType eq 5 }">COO/Business Leader</c:when>
                                            <c:when test="${projectCharterApproval.approverType eq 6 }">Corporate Problem Solving Leader</c:when>
                                          </c:choose>
                                        </td>
                                        <td>
                                          ${projectCharterApproval.approverId.userFirstName } ${projectCharterApproval.approverId.userLastName }
                                        </td>
                                        <td>
                                          <c:choose>
                                            <c:when test="${projectCharterApproval.approvalStatus eq 0 }"><label class="text-gray"><strong>Approval Pending</strong></label></c:when>
                                            <c:when test="${projectCharterApproval.approvalStatus eq 1 }"><label class="text-green">Approved</label></c:when>
                                            <c:when test="${projectCharterApproval.approvalStatus eq 2 }"><label class="text-red">Rejected</label></c:when>
                                          </c:choose>
                                        </td>
                                        <td>
                                          ${projectCharterApproval.approvalComments }
                                        </td>
                                      </tr>
                                    </c:if>
                                  </c:forEach>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <c:forEach items="${projectCharter.projectCharterApproval  }" var="projectCharterApproval" varStatus="projectCharterApprovalStatus">
                      <c:if test="${projectCharterApproval.active eq 1 && projectCharterApproval.approverId.mUserId eq sessionUserInfo.mUserId && projectCharterApproval.approvalStatus eq 0 }">
                        <div class="card-footer">
                          <form:form modelAttribute="charterApproval" action="submitApprovalStatus" id="submitApprovalStatus" method="post">
                            <div class="row">
                              <div class="col-md-6">
                                <label class=""><span class="mandatory">*</span>Approval Comments</label>
                            	<form:hidden path="tProjectCharterApprovalId" id="projectCharterApprovalId" value="${projectCharterApproval.tProjectCharterApprovalId }" />
                            	<form:hidden path="projectCharterId" id="projectCharterId" value="${projectCharterApproval.projectCharterApproval.tProjectCharterId }" />
                            	<form:hidden path="approvalStatus" id="approvalStatus" />
                            	<form:input class="form-control" path="approvalComments" id="approvalComments" placeholder="Enter Approval Comments" />
                            	<span class="error invalid-feedback" id="approvalCommentsError"></span>
                          	  </div>
                          	  <div class="col-md-1" style="padding-top : 37px">
                                <button title="Reject Charter" type="button" id="rejectCharter" onclick="submitApprovalForm(2);" class="btn bg-color-anand-danger-one text-white"><b>Reject</b></button>
                              </div>
                              <div class="col-md-1" style="padding-top : 37px">
                                <button title="Approve Charter" type="button" id="approveCharter" onclick="submitApprovalForm(1);" class="btn bg-color-anand-success-one text-white"><b>Approve</b></button>
                              </div>
                              <c:if test="${projectLeader eq 1 || sponser eq 1 || problemSolvingLeader eq 1 || coporateProblemSolvingLeader eq 1 || eim eq 1 }">
                          	    <div class="col-md-2" style="padding-top : 37px">
                                  <button title="Request Terminate" type="button" id="rejectCharter" onclick="submitApprovalForm(3);" class="btn bg-color-anand-danger-two text-white"><b>Request Terminate</b></button>
                          	    </div>
                          	  </c:if>
                          	  <c:if test="${projectLeader eq 1  || eim eq 1 }">
                          	    <div class="col-md-2" style="padding-top : 37px">
                                  <button title="Launch Contract" type="button" id="launchContract" onclick="submitApprovalForm(3);" class="btn bg-color-anand-danger-two text-white"><b>Launch</b></button>
                          	    </div>
                              </c:if>
                            </div>
                          </form:form>
                        </div>
                      </c:if>
                    </c:forEach>
                  </c:if>
                  <c:if test="${showContractApproval ne 0 && projectCharter.projectCharterStatus eq 5}">
                    <%@include file="charterApprovalInformation.jsp"%>
                      <div class="card-body content-margin">
                        <div class="card card-primary card-outline bg-card-primary-anand">
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
						      <table class="table table-bordered anand-table-font-size" id="addReviewTable">
						     	<thead>
							  	  <tr class="bg-table-head">
							    	<th>Review Comments</th>
							        <th>Review Attachment MOM</th>
							  	    <th>Review Done By</th>
							        <th>Review Date</th>
							  	  </tr>
					  	    	</thead>
   						    	<tbody>
   						    	  <c:set var="charterApprovalCount" value="0" />
   						      	  <c:forEach items="${projectCharter.projectCharterReview }" var="projectCharterReview" >
                                	<c:if test="${projectCharterReview.active eq 1 }">
                                  	  <c:set var="charterApprovalCount" value="${charterApprovalCount + 1}" />
                                      <c:set var="rowClassValue" value="${(charterApprovalCount+1) % 2 }" />
                                      <tr class="bg-table-row-${rowClassValue }">  
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
                          </div>
                        </div>
                      </div>
                    <div class="card-body content-margin">
                      <div class="card card-primary card-outline bg-card-primary-anand">
                        <div class="card-header">
                          <h5 class="card-title">Contract Approval Information</h5>
                        </div>
                        <div class="card-body">
                          <div class="row">
                            <div class="col-md-12">
                              <table class="table table-bordered dataTable anand-table-font-size">
                                <thead>
                                  <tr class="bg-table-head">
                                    <th>Approver Type</th>
                                    <th>Approver</th>
                                    <th>Approval Status</th>
                                    <th>Approval Comments</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <c:forEach items="${projectCharter.projectContractApproval }" var="projectContractApproval" varStatus="projectContractApprovalStatus">
                                    <c:if test="${projectContractApproval.active eq 1 }">
                                      <c:set var="rowClassValue" value="${projectContractApprovalStatus.index % 2 }" />
                                      <tr class="bg-table-row-${rowClassValue }">
                                        <td>
                                          <c:choose>
                                            <c:when test="${projectContractApproval.approverType eq 1 }">Sponsor</c:when>
                                            <c:when test="${projectContractApproval.approverType eq 2 }">Process Owner</c:when>
                                            <c:when test="${projectContractApproval.approverType eq 3 }">Problem Solving Leader Primary</c:when>
                                            <c:when test="${projectContractApproval.approverType eq 4 }">Finance Controller</c:when>
                                            <c:when test="${projectContractApproval.approverType eq 5 }">COO/Business Leader</c:when>
                                            <c:when test="${projectContractApproval.approverType eq 6 }">Corporate Problem Solving Leader</c:when>
                                          </c:choose>
                                        </td>
                                        <td>
                                          ${projectContractApproval.approverId.userFirstName } ${projectContractApproval.approverId.userLastName }
                                        </td>
                                        <td>
                                          <c:choose>
                                            <c:when test="${projectContractApproval.approvalStatus eq 0 }"><label class="text-gray"><strong>Approval Pending</strong></label></c:when>
                                            <c:when test="${projectContractApproval.approvalStatus eq 1 }"><label class="text-green">Approved</label></c:when>
                                            <c:when test="${projectContractApproval.approvalStatus eq 2 }"><label class="text-red">Rejected</label></c:when>
                                          </c:choose>
                                        </td>
                                        <td>
                                          ${projectContractApproval.approvalComments }
                                        </td>
                                      </tr>
                                    </c:if>
                                  </c:forEach>
                                </tbody>
                                <tfoot>
                                  
                                </tfoot>
                              </table>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <c:forEach items="${projectCharter.projectContractApproval }" var="projectContractApproval" varStatus="projectContractApprovalStatus">
                      <c:if test="${projectContractApproval.active eq 1 && projectContractApproval.approverId.mUserId eq sessionUserInfo.mUserId && projectContractApproval.approvalStatus eq 0 }">
                        <div class="card-footer">
                          <form:form modelAttribute="contractApproval" action="submitContractApprovalStatus" id="submitApprovalStatus" method="post">
                            <div class="row">
                              <div class="col-md-6">
                                <label class=""><span class="mandatory">*</span>Approval Comments</label>
                            	<form:hidden path="tProjectContractApprovalId" id="projectContractApprovalId" value="${projectContractApproval.tProjectContractApprovalId }" />
                            	<form:hidden path="projectCharterId" id="projectCharterId" value="${projectContractApproval.projectContractApproval.tProjectCharterId }" />
                            	<form:hidden path="approvalStatus" id="approvalStatus" />
                            	<form:input class="form-control" path="approvalComments" id="approvalComments" placeholder="Enter Approval Comments" />
                            	<span class="error invalid-feedback" id="approvalCommentsError"></span>
                          	  </div>
                          	  <div class="col-md-1" style="padding-top : 37px">
                                <button title="Reject Charter" type="button" id="rejectCharter" onclick="submitApprovalForm(2);" class="btn bg-color-anand-danger-one text-white"><b>Reject</b></button>
                              </div>
                              <div class="col-md-1" style="padding-top : 37px">
                                <button title="Approve Charter" type="button" id="approveCharter" onclick="submitApprovalForm(1);" class="btn bg-color-anand-success-one text-white"><b>Approve</b></button>
                              </div>
                              <c:if test="${projectLeader eq 1 || sponser eq 1 || problemSolvingLeader eq 1 || coporateProblemSolvingLeader eq 1 || eim eq 1 }">
                          	    <div class="col-md-2" style="padding-top : 37px">
                                  <button title="Request Terminate" type="button" id="rejectCharter" onclick="submitApprovalForm(3);" class="btn bg-color-anand-danger-two text-white"><b>Request Terminate</b></button>
                          	    </div>
                          	  </c:if>
                          	  <c:if test="${projectLeader eq 1  || eim eq 1 }">
                          	    <div class="col-md-2" style="padding-top : 37px">
                                  <button title="Launch Contract" type="button" id="launchContract" onclick="submitApprovalForm(3);" class="btn bg-color-anand-danger-two text-white"><b>Launch</b></button>
                          	    </div>
                              </c:if>
                            </div>
                          </form:form>
                        </div>
                      </c:if>
                    </c:forEach>
                  </c:if> 
                  <c:if test="${showClosureApproval ne 0 && projectCharter.projectCharterStatus eq 8}">
                    <%@include file="charterApprovalInformation.jsp"%>
                      <div class="card-body content-margin">
                        <div class="card card-primary card-outline bg-card-primary-anand">
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
						      <table class="table table-bordered anand-table-font-size" id="addReviewTable">
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
                          </div>
                        </div>
                      </div>
                    <%@include file="contractApprovalInformation.jsp"%>
                    <div class="card-body content-margin">
                      <div class="card card-primary card-outline bg-card-primary-anand">
                        <div class="card-header">
                          <h5 class="card-title">Closure Approval Information</h5>
                        </div>
                        <div class="card-body">
                          <div class="row">
                            <div class="col-md-12">
                              <table class="table table-bordered dataTable anand-table-font-size">
                                <thead>
                                  <tr class="bg-table-head">
                                    <th>Approver Type</th>
                                    <th>Approver</th>
                                    <th>Approval Status</th>
                                    <th>Approval Comments</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <c:forEach items="${projectCharter.projectClosureApproval }" var="projectClosureApproval" varStatus="projectClosureApprovalStatus">
                                    <c:if test="${projectClosureApproval.active eq 1 }">
                                      <c:set var="rowClassValue" value="${projectClosureApprovalStatus.index % 2 }" />
                                      <tr class="bg-table-row-${rowClassValue }">
                                        <td>
                                          <c:choose>
                                            <c:when test="${projectClosureApproval.approverType eq 1 }">Sponsor</c:when>
                                            <c:when test="${projectClosureApproval.approverType eq 2 }">Process Owner</c:when>
                                            <c:when test="${projectClosureApproval.approverType eq 3 }">Problem Solving Leader Primary</c:when>
                                            <c:when test="${projectClosureApproval.approverType eq 4 }">Finance Controller</c:when>
                                            <c:when test="${projectClosureApproval.approverType eq 5 }">COO/Business Leader</c:when>
                                            <c:when test="${projectClosureApproval.approverType eq 6 }">Corporate Problem Solving Leader</c:when>
                                          </c:choose>
                                        </td>
                                        <td>
                                          ${projectClosureApproval.approverId.userFirstName } ${projectClosureApproval.approverId.userLastName }
                                        </td>
                                        <td>
                                          <c:choose>
                                            <c:when test="${projectClosureApproval.approvalStatus eq 0 }"><label class="text-gray"><strong>Approval Pending</strong></label></c:when>
                                            <c:when test="${projectClosureApproval.approvalStatus eq 1 }"><label class="text-green">Approved</label></c:when>
                                            <c:when test="${projectClosureApproval.approvalStatus eq 2 }"><label class="text-red">Rejected</label></c:when>
                                          </c:choose>
                                        </td>
                                        <td>
                                          ${projectClosureApproval.approvalComments }
                                        </td>
                                      </tr>
                                    </c:if>
                                  </c:forEach>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <form:form modelAttribute="closureApproval" action="submitClosureApprovalStatus" id="submitApprovalStatus" method="post">
                      <c:if test="${sponser eq 1 || problemSolvingLeader eq 1 || coporateProblemSolvingLeader eq 1}">
                        <form:hidden id="check" value="exist" path="" />
                        <div class="card-body content-margin">
                          <div class="card card-primary card-outline bg-card-primary-anand">
                            <div class="card-header">
                              <h5 class="card-title">Best Practice</h5>
                            </div>
                            <div class="card-body">
                              <div class="row">
                                <div class="col-md-12">
                                  <table class="table table-bordered dataTable anand-table-font-size">
								    <thead>
							   		  <tr class="bg-table-head">
							    		<th scope="col">Weight</th>
							    		<th scope="col">Nomination Criteria</th>
							    		<th scope="col">1</th>
							       		<th scope="col">2</th>
							  	    	<th scope="col">3</th>
							        	<th scope="col">4</th>
							        	<th scope="col">5</th>
							  	  	  </tr>
									  <tr>
										<th scope="col"></th>
										<th scope="col"></th>
										<th scope="col">Strongly Disagree</th>
										<th scope="col">Disagree</th>
										<th scope="col">Neutral</th>
										<th scope="col">Agree</th>
										<th scope="col">Strongly Agree</th>
									  </tr>
								    </thead>
								    <tbody>
								      <tr id="firstCriteriaDiv">
								        <td scope="col">5</td>
								        <td scope="col">
								          Horizontal Deployment (New Practices can be easily implemented at other Plant locations)
								          <span class="error invalid-feedback" id="firstCriteriaError"></span>
								        </td>
								        <td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="firstCriteria" class="custom-control-input" value="1" id="firstCriteria1" />
                                   			<label for="firstCriteria1" class="custom-control-label text-green"></label>
                                  	      </div>
										</td>
								        <td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="firstCriteria" class="custom-control-input" value="2" id="firstCriteria2" />
                                  		    <label for="firstCriteria2" class="custom-control-label text-green"></label>
                                  	      </div>
										</td>
								        <td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="firstCriteria" class="custom-control-input" value="3" id="firstCriteria3" />
                                  		    <label for="firstCriteria3" class="custom-control-label text-green"></label>
                                  		  </div>
										</td>
										<td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="firstCriteria" class="custom-control-input" value="4" id="firstCriteria4" />
                                            <label for="firstCriteria4" class="custom-control-label text-green"></label>
                                  		  </div>
										</td>
										<td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="firstCriteria" class="custom-control-input" value="5" id="firstCriteria5" />
                                            <label for="firstCriteria5" class="custom-control-label text-green"></label>
                                  		  </div>
										</td>
								      </tr>
								      <tr id="secondCriteriaDiv">
								        <td scope="col">4</td>
								        <td scope="col">
								          Impact (The new Practice is stable over time and demonstrated a significant improvement over the previous process)
								          <span class="error invalid-feedback" id="secondCriteriaError"></span>
								        </td>
								        <td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="secondCriteria" class="custom-control-input" value="1" id="secondCriteria1" />
                                   			<label for="secondCriteria1" class="custom-control-label text-green"></label>
                                  	      </div>
										</td>
								        <td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="secondCriteria" class="custom-control-input" value="2" id="secondCriteria2" />
                                  		    <label for="secondCriteria2" class="custom-control-label text-green"></label>
                                  	      </div>
										</td>
								        <td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="secondCriteria" class="custom-control-input" value="3" id="secondCriteria3" />
                                  		    <label for="secondCriteria3" class="custom-control-label text-green"></label>
                                  		  </div>
										</td>
										<td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="secondCriteria" class="custom-control-input" value="4" id="secondCriteria4" />
                                            <label for="secondCriteria4" class="custom-control-label text-green"></label>
                                  		  </div>
										</td>
										<td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="secondCriteria" class="custom-control-input" value="5" id="secondCriteria5" />
                                            <label for="secondCriteria5" class="custom-control-label text-green"></label>
                                  		  </div>
										</td>
								      </tr>
								      <tr id="thirdCriteriaDiv">
								        <td scope="col">3</td>
								        <td scope="col">
								          Cost Effective and Efficient (The new practice requires little investment and resulted in significant financial saving over previous process.)
								          <span class="error invalid-feedback" id="thirdCriteriaError"></span>
								        </td>
								        <td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="thirdCriteria" class="custom-control-input" value="1" id="thirdCriteria1" />
                                   			<label for="thirdCriteria1" class="custom-control-label text-green"></label>
                                  	      </div>
										</td>
								        <td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="thirdCriteria" class="custom-control-input" value="2" id="thirdCriteria2" />
                                  		    <label for="thirdCriteria2" class="custom-control-label text-green"></label>
                                  	      </div>
										</td>
								        <td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="thirdCriteria" class="custom-control-input" value="3" id="thirdCriteria3" />
                                  		    <label for="thirdCriteria3" class="custom-control-label text-green"></label>
                                  		  </div>
										</td>
										<td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="thirdCriteria" class="custom-control-input" value="4" id="thirdCriteria4" />
                                            <label for="thirdCriteria4" class="custom-control-label text-green"></label>
                                  		  </div>
										</td>
										<td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="thirdCriteria" class="custom-control-input" value="5" id="thirdCriteria5" />
                                            <label for="thirdCriteria5" class="custom-control-label text-green"></label>
                                  		  </div>
										</td>
								      </tr>
									  <tr id="fourthCriteriaDiv">
								        <td scope="col">1</td>
								        <td scope="col">
								          Overall Effectiveness (The new practice has met or exceeded overall Customer/Business expectations).
								          <span class="error invalid-feedback" id="fourthCriteriaError"></span>
								        </td>
								        <td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="fourthCriteria" class="custom-control-input" value="1" id="fourthCriteria1" />
                                   			<label for="fourthCriteria1" class="custom-control-label text-green"></label>
                                  	      </div>
										</td>
								        <td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="fourthCriteria" class="custom-control-input" value="2" id="fourthCriteria2" />
                                  		    <label for="fourthCriteria2" class="custom-control-label text-green"></label>
                                  	      </div>
										</td>
								        <td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="fourthCriteria" class="custom-control-input" value="3" id="fourthCriteria3" />
                                  		    <label for="fourthCriteria3" class="custom-control-label text-green"></label>
                                  		  </div>
										</td>
										<td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="fourthCriteria" class="custom-control-input" value="4" id="fourthCriteria4" />
                                            <label for="fourthCriteria4" class="custom-control-label text-green"></label>
                                  		  </div>
										</td>
										<td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="fourthCriteria" class="custom-control-input" value="5" id="fourthCriteria5" />
                                            <label for="fourthCriteria5" class="custom-control-label text-green"></label>
                                  		  </div>
										</td>
								      </tr>
								      <tr id="fifthCriteriaDiv">
								        <td scope="col">1</td>
								        <td scope="col">
								          Presentation (The new practice is well presented and has sufficient supporting documentation to be replicated elsewhere. Also it updated relevant FMEA/CP/SOP where applicable).
								          <span class="error invalid-feedback" id="fifthCriteriaError"></span>
								        </td>
								        <td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="fifthCriteria" class="custom-control-input" value="1" id="fifthCriteria1" />
                                   			<label for="fifthCriteria1" class="custom-control-label text-green"></label>
                                  	      </div>
										</td>
								        <td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="fifthCriteria" class="custom-control-input" value="2" id="fifthCriteria2" />
                                  		    <label for="fifthCriteria2" class="custom-control-label text-green"></label>
                                  	      </div>
										</td>
								        <td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="fifthCriteria" class="custom-control-input" value="3" id="fifthCriteria3" />
                                  		    <label for="fifthCriteria3" class="custom-control-label text-green"></label>
                                  		  </div>
										</td>
										<td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="fifthCriteria" class="custom-control-input" value="4" id="fifthCriteria4" />
                                            <label for="fifthCriteria4" class="custom-control-label text-green"></label>
                                  		  </div>
										</td>
										<td scope="col">
										  <div class="custom-control custom-radio">
                                            <form:radiobutton path="fifthCriteria" class="custom-control-input" value="5" id="fifthCriteria5" />
                                            <label for="fifthCriteria5" class="custom-control-label text-green"></label>
                                  		  </div>
										</td>
								      </tr>
								      <tr>
								        <td scope="col"></td>
								        <td scope="col"></td>
								        <td scope="col"></td>
								        <td scope="col"></td>
								        <td scope="col"></td>
								        <td scope="col"><strong>Total Score:-</strong></td>
								        <td scope="col">
                                      	  <form:input readonly="true" path="totalScore" id="totalScore" class="form-control" />
                                    	</td>
								      </tr>
								      <tr>
								        <td scope="col"><strong>Comments:-</strong></td>
								        <td scope="col">
								          <form:input class="form-control" path="surveyComments" id="surveyComments" placeholder="Enter Comments" />
								          <span class="error invalid-feedback" id="surveyCommentsError"></span>
								        </td>
								        <td scope="col"></td>
								        <td scope="col"></td>
								        <td scope="col"></td>
								        <td scope="col"></td>
								        <td scope="col"></td>
								      </tr>
								    </tbody>
                                  </table>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </c:if>
                      <c:forEach items="${projectCharter.projectClosureApproval }" var="projectClosureApproval" varStatus="projectClosureApprovalStatus">
                        <c:if test="${projectClosureApproval.active eq 1 && projectClosureApproval.approverId.mUserId eq sessionUserInfo.mUserId && projectClosureApproval.approvalStatus eq 0 }">
                          <div class="card-footer">
                            <div class="row">
                              <div class="col-md-6">
                                <label class=""><span class="mandatory">*</span>Approval Comments</label>
                            	<form:hidden path="tProjectClosureApprovalId" id="projectClosureApprovalId" value="${projectClosureApproval.tProjectClosureApprovalId }" />
                            	<form:hidden path="projectCharterId" id="projectCharterId" value="${projectClosureApproval.projectClosureApproval.tProjectCharterId }" />
                            	<form:hidden path="approvalStatus" id="approvalStatus" />
                            	<form:input class="form-control" path="approvalComments" id="approvalComments" placeholder="Enter Approval Comments" />
                            	<span class="error invalid-feedback" id="approvalCommentsError"></span>
                          	  </div>
                          	  <div class="col-md-1" style="padding-top : 37px">
                                <button title="Reject Charter" type="button" id="rejectCharter" onclick="submitApprovalForm(2);" class="btn bg-color-anand-danger-one text-white"><b>Reject</b></button>
                              </div>
                              <div class="col-md-1" style="padding-top : 37px">
                                <button title="Approve Charter" type="button" id="approveCharter" onclick="submitApprovalForm(1);" class="btn bg-color-anand-success-one text-white"><b>Approve</b></button>
                              </div>
                              <c:if test="${projectLeader eq 1 || sponser eq 1 || problemSolvingLeader eq 1 || coporateProblemSolvingLeader eq 1 || eim eq 1 }">
                          	    <div class="col-md-2" style="padding-top : 37px">
                                  <button title="Request Terminate" type="button" id="rejectCharter" onclick="submitApprovalForm(3);" class="btn bg-color-anand-danger-two text-white"><b>Request Terminate</b></button>
                          	    </div>
                          	  </c:if>
                            </div>
                          </div>
                        </c:if>
                      </c:forEach>
                    </form:form>
                  </c:if> 
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
    <script>
    var stringCheck = /^[ A-Za-z0-9-Á, ]*$/;
    function submitApprovalForm(approvalStatus) {
    	$("#approvalCommentsError").html("");
    	$("#approvalComments").addClass("is-valid");
    	$("#approvalComments").removeClass("is-invalid");
    	$('#approvalStatus').val(approvalStatus);
    	var submitOrNot=true;
    	var approvalComments = $("#approvalComments").val();
    	if(stringCheck.test(approvalComments) == false) {
    		$("#approvalComments").addClass("is-invalid");
        	$("#approvalCommentsError").html("Approval Comments cannot contain special character");
    		submitOrNot=false;
    	} 
    	if($("#approvalComments").val() == "") {
    		$("#approvalComments").addClass("is-invalid");
    		$("#approvalCommentsError").html("Approval Comments cannot be empty");
    		submitOrNot=false;
    	}
    	
    	if($("#check").val()=="exist"){
    		var surveyComments = $("#surveyComments").val();
        	if(stringCheck.test(surveyComments) == false) {
        		$("#surveyComments").addClass("is-invalid");
            	$("#surveyCommentsError").html("Survey Comments cannot contain special character");
        		submitOrNot=false;
        	} 
    		if($("#surveyComments").val() == "") {
        		$("#surveyComments").addClass("is-invalid");
        		$("#surveyCommentsError").html("Survey Comments cannot be empty");
        		
        		submitOrNot=false;
        	}
        	if(!criteriaCheck("first")){
        		submitOrNot=false;
        		$("#firstCriteriaError").html("<br><strong>This Field cannot be empty</strong>");
        		$("#firstCriteriaError").show();
        		submitOrNot=false;
        	}
        	if(!criteriaCheck("second")){
        		$("#secondCriteriaError").html("<br><strong>This Field cannot be empty</strong>");
        		$("#secondCriteriaError").show();
        		submitOrNot=false;
        	}
        	if(!criteriaCheck("third")){
        		$("#thirdCriteriaError").html("<br><strong>This Field cannot be empty</strong>");
        		$("#thirdCriteriaError").show();
        		submitOrNot=false;
        	}
        	if(!criteriaCheck("fourth")){
        		$("#fourthCriteriaError").html("<br><strong>This Field cannot be empty</strong>");
        		$("#fourthCriteriaError").show();
        		submitOrNot=false;
        	}
        	if(!criteriaCheck("fifth")){
        		$("#fifthCriteriaError").html("<br><strong>This Field cannot be empty</strong>");
        		$("#fifthCriteriaError").show();
        		submitOrNot=false;
        	}
    	}
    	
    	if(submitOrNot) {
			$("#approvalComments").addClass("is-valid");
			$('#submitApprovalStatus').submit();
		}
    }
    function criteriaCheck(criteriaNo)
    {
    	var submitOrNot=true;
    	if($("#"+criteriaNo+"Criteria1").prop("checked") != true && $("#"+criteriaNo+"Criteria2").prop("checked") != true && $("#"+criteriaNo+"Criteria3").prop("checked") != true && $("#"+criteriaNo+"Criteria4").prop("checked") != true && $("#"+criteriaNo+"Criteria5").prop("checked") != true)    		{
    		submitOrNot=false;
    	}
    	return submitOrNot;
    }
    $('#firstCriteriaDiv input[type="radio"]').click(function() {
    	calculateScore();
    	$("#firstCriteriaError").hide();
    });
    $('#secondCriteriaDiv input[type="radio"]').click(function() {
    	calculateScore();
    	$("#secondCriteriaError").hide();
    });
    $('#thirdCriteriaDiv input[type="radio"]').click(function() {
    	calculateScore();
    	$("#thirdCriteriaError").hide();
    });
    $('#fourthCriteriaDiv input[type="radio"]').click(function() {
    	calculateScore();
    	$("#fourthCriteriaError").hide();
    });
    $('#fifthCriteriaDiv input[type="radio"]').click(function() {
    	calculateScore();
    	$("#fifthCriteriaError").hide();
    });
    function calculateScore() {
    	var sum = 0;
    	if($("#firstCriteria1").prop("checked") == true) {
    		sum += (5 * 1);
    	} 
    	else if($("#firstCriteria2").prop("checked") == true) {
    		sum += (5 * 2);
    	} 
    	else if($("#firstCriteria3").prop("checked") == true) {
    		sum += (5 * 3);
    	} 
    	else if($("#firstCriteria4").prop("checked") == true) {
    		sum += (5 * 4);
    	} 
    	else if($("#firstCriteria5").prop("checked") == true) {
    		sum += (5 * 5);
    	}
    	if($("#secondCriteria1").prop("checked") == true) {
    		sum += (4 * 1);
    	} 
    	else if($("#secondCriteria2").prop("checked") == true) {
    		sum += (4 * 2);
    	} 
    	else if($("#secondCriteria3").prop("checked") == true) {
    		sum += (4 * 3);
    	} 
    	else if($("#secondCriteria4").prop("checked") == true) {
    		sum += (4 * 4);
    	} 
    	else if($("#secondCriteria5").prop("checked") == true) {
    		sum += (4 * 5);
    	}
    	if ($("#thirdCriteria1").prop("checked") == true) {
    		sum += (3 * 1);
    	} 
    	else if($("#thirdCriteria2").prop("checked") == true) {
    		sum += (3 * 2);
    	} 
    	else if($("#thirdCriteria3").prop("checked") == true) {
    		sum += (3 * 3);
    	} 
    	else if($("#thirdCriteria4").prop("checked") == true) {
    		sum += (3 * 4);
    	} 
    	else if($("#thirdCriteria5").prop("checked") == true) {
    		sum += (3 * 5);
    	}
    	if($("#fourthCriteria1").prop("checked") == true) {
    		sum += (1 * 1);
    	} 
    	else if($("#fourthCriteria2").prop("checked") == true) {
    		sum += (1 * 2);
    	} 
    	else if($("#fourthCriteria3").prop("checked") == true) {
    		sum += (1 * 3);
    	} 
    	else if($("#fourthCriteria4").prop("checked") == true) {
    		sum += (1 * 4);
    	} 
    	else if($("#fourthCriteria5").prop("checked") == true) {
    		sum += (1 * 5);
    	}
    	if($("#fifthCriteria1").prop("checked") == true) {
    		sum += (1 * 1);
    	} 
    	else if($("#fifthCriteria2").prop("checked") == true) {
    		sum += (1 * 2);
    	} 
    	else if($("#fifthCriteria3").prop("checked") == true) {
    		sum += (1 * 3);
    	} 
    	else if($("#fifthCriteria4").prop("checked") == true) {
    		sum += (1 * 4);
    	} 
    	else if($("#fifthCriteria5").prop("checked") == true) {
    		sum += (1 * 5);
    	}
    	$("#totalScore").val(sum);
    }
    </script>
  </body>
</html>