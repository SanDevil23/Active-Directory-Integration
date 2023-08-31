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
     <title>VIEW CHARTER | EIM | AAPL</title>
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
                <h5 class="font-color-anand-one font-weight-bold">VIEW CHARTER PROJECT</h5>
              </div>
              <div class="col-sm-6 font-weight-bold">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="dashboard" title="Dashboard">Dashboard</a></li>
                  <li class="breadcrumb-item"><a href="list-charter" title="View/List Charter">View/List Charter</a></li>
                  <li class="breadcrumb-item active">View Charter</li>
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
                    <h5 class="card-title">View Charter Details</h5>
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
                                      <label for=""><span class="mandatory">*</span>Savings/Gain</label>
                                      <br>${projectCharter.savingOrGains }
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
                                    ${ projectCharter.projectCharterStatus}
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
                                      <label for="charterAttachment"><span class="mandatory">*</span>Project Charter Attachment</label>
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
                                    <c:if test="${not empty projectCharter.finalPresentation }">
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
                <%@include file="charterApprovalInformation.jsp"%>
                <c:if test="${projectCharter.projectCharterStatus gt 3 }">
                  <div class="card-body content-margin">
                    <div class="card card-primary card-outline  bg-card-primary-anand collapsed-card">
                      <div class="card-header" data-card-widget="collapse">
                        <h5 class="card-title">Project Review Comments</h5>
                   	    <div class="card-tools">
                       	  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                            <i class="fas fa-plus"></i>
                          </button>
                        </div>
                      </div>
                      <div class="card-body">
                        <div class="col-md-12" style="overflow-x: auto;">
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
   						      <c:set var="charterApprovalCount" value="${0}" />
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
                </c:if>
                <c:if test="${projectCharter.projectCharterStatus gt 4 }">
                  <%@include file="contractApprovalInformation.jsp"%>
                </c:if>
                <c:if test="${projectCharter.projectCharterStatus gt 5 }">
                  <div class="card-body content-margin">
                    <div class="card card-primary card-outline  bg-card-primary-anand collapsed-card">
                      <div class="card-header" data-card-widget="collapse">
                        <h5 class="card-title">Project Control</h5>
                   	    <div class="card-tools">
                       	  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                            <i class="fas fa-plus"></i>
                          </button>
                        </div>
                      </div>
                      <div class="card-body">
                        <div class="col-md-12" style="overflow-x: auto;">
                          <table class="table table-bordered dataTable anand-table-font-size" id="addControlTable">
						    <thead>
							  <tr class="bg-table-head">
							    <th>Action</th>
							    <th>Control Established in system</th>
							    <th>Date of Implementation</th>
							    <c:if test="${projectCharter.projectCharterStatus eq 12 }">
                                  <th>Presence Of Control</th> 
                                  <th>Sustenance Audit Comments</th>
                                </c:if> 
							  </tr>
					  	    </thead>
   						    <tbody>
   						      <c:forEach items="${projectCharter.projectCharterControl }" var="projectCharterControl" >
                                <c:if test="${projectCharterControl.active eq 1 }">
                                  <tr class="bg-table-row-1">  
                                    <td>
                                      ${projectCharterControl.controlAction }
                                    </td>
                                    <td>
                                      ${projectCharterControl.controlEstablishedInSystem } 
                                    </td>  
                                    <td>
                                      <fmt:formatDate value="${projectCharterControl.controlEstablishedDate }" pattern="dd-MMM-yyyy"/>
                                    </td>  
                                    <c:if test="${projectCharter.projectCharterStatus eq 12 }">
                                      <td>
                                        <c:choose>
                                          <c:when test="${projectCharterControl.sustenancePresenceOfControl eq 1}">Yes</c:when>
                                          <c:when test="${projectCharterControl.sustenancePresenceOfControl eq 2}">No</c:when>                                          
                                        </c:choose> 
                                      </td>
                                      <td>
                                        ${projectCharterControl.sustenanceAuditComments} 
                                      </td> 
                                    </c:if>                               
                                  </tr>
                                </c:if>
                              </c:forEach>
  		                    </tbody>
	    			      </table>
					    </div>
                        </div>
                      </div>
                    </div>
                  </c:if>
                  <c:if test="${projectCharter.projectCharterStatus gt 7 }">
                  <%@include file="closureApprovalInformation.jsp"%>
                  </c:if>
                  <c:if test="${projectCharter.projectCharterStatus gt 9 }">
                  <div class="card-body content-margin">
                    <div class="card card-primary card-outline  bg-card-primary-anand collapsed-card" >
                      <div class="card-header" data-card-widget="collapse">
                        <h5 class="card-title">Sustenance Audit Target - <fmt:formatDate value="${projectCharter.sustenanceAuditTarget }" pattern="dd-MMM-yyyy"/> </h5>
                        <div class="card-tools">
                       	  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                            <i class="fas fa-plus"></i>
                          </button>
                        </div>
                      </div>
                      
                      <div class="card-body">
                        <div class="col-md-12" style="overflow-x: auto;">
                          <table class="table table-bordered dataTable anand-table-font-size" id="addControlTable">
						    <thead>
							  <tr class="bg-table-head">
							    <th>Sustenance Audit Assigned To</th>
							    <th>Sustenance Audit Target</th>
							    <th>Sustenance Comments</th>
							    <c:if test="${projectCharter.projectCharterStatus eq 12 }">
							      <th>Sustenance Score</th>
							      <th>Sustenance Status</th>
							    </c:if>
							  </tr>
					  	    </thead>
   						    <tbody>
   						      <tr class="bg-table-row-1">  
                                <td>
                                  ${projectCharter.sustenanceProblemSolvingLeader.userFirstName } ${projectCharter.sustenanceProblemSolvingLeader.userLastName }
                                </td>
                                <td>
                                  <fmt:formatDate value="${projectCharter.sustenanceAuditTarget }" pattern="dd-MMM-yyyy"/>
                                </td>
                                <td>
                                  ${projectCharter.sustenanceComments } 
                                </td>  
                                <c:if test="${projectCharter.projectCharterStatus eq 12 }">
							      <td>
							        ${projectCharter.sustenanceScore } 
							      </td>
							      <td>
							        <c:if test="${projectCharter.sustenanceScore eq 100 }">
							          <strong style="color:green; font-size:20px;">Green</strong>
							        </c:if>
							        <c:if test="${projectCharter.sustenanceScore lt 100 }">
							          <strong style="color:red; font-size:18px;">RED</strong>
							        </c:if>
							      </td>
							    </c:if>
                              </tr>
  		                    </tbody>
	    			      </table>
					    </div> 
                      </div>
                    </div>
                  </div>
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
    <%@include file="../../includeJSP/dataTablesImport.jsp"%>
    <script>
    var stringCheck = /^[ A-Za-z0-9-Á, ]*$/;
    function submitApprovalForm(approvalStatus) {
    	$("#approvalCommentsError").html("");
    	$("#approvalComments").addClass("is-valid");
    	$("#approvalComments").removeClass("is-invalid");
    	$('#approvalStatus').val(approvalStatus);
    	if($("#approvalComments").val() != "") {
    		var approvalComments = $("#approvalComments").val();
    		if(stringCheck.test(approvalComments) == false) {
    			$("#approvalComments").addClass("is-invalid");
        		$("#approvalCommentsError").html("Approval Comments cannot contain special character");
    		} else {
    			$("#approvalComments").addClass("is-valid");
    			$('#submitApprovalStatus').submit();
    		}
    	} else {
    		$("#approvalComments").addClass("is-invalid");
    		$("#approvalCommentsError").html("Approval Comments cannot be empty");
    	}
    }
    </script>
  </body>
</html>