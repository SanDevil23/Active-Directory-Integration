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
    <title>VIEW CHARTER | EIM | AAPL</title>
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
                <c:if test="${createEditCharter eq 1 }">
                  <h5 class="font-color-anand-one font-weight-bold">CREATE CHARTER PROJECT</h5>
                </c:if>
                <c:if test="${createEditCharter eq 2 }">
                  <h5 class="font-color-anand-one font-weight-bold">EDIT HOPPER CHARTER DETAILS</h5>
                </c:if>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="dashboard" title="Dashboard">Dashboard</a></li>
                  <li class="breadcrumb-item"><a href="list-charter" title="View/List Charter">View/List Charter</a></li>
                  <c:if test="${createEditCharter eq 1 }">
                    <li class="breadcrumb-item active">Create Charter</li>
                  </c:if>
                  <c:if test="${createEditCharter eq 2 }">
                    <li class="breadcrumb-item active">Edit Charter Details</li>
                  </c:if>
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
              <form:form modelAttribute="projectCharter" action="saveProjectCharter" type="POST" id="projectCharterForm" enctype="multipart/form-data">
              <form:hidden path="tProjectCharterId" />
              <form:hidden path="saveOrSubmit" id="saveOrSubmit" />
              <div class="col-md-12">
                <div class="card card-primary card-outline">
                  <div class="card-header">
                    <h5 class="card-title">View Charter Details</h5>
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
                                  <form:select class="form-control" id="functionTemp" path="functionTemp">
                                    <form:option value="-1">-- Select Department --</form:option>
                                    <c:forEach items="${projectFunctionList }" var="projectFunction" varStatus="projectFunctionStatus">
                                      <form:option value="${projectFunction.projectFunctionId }">${projectFunction.projectFunctionName }</form:option>
                                    </c:forEach>
                                  </form:select>
                                  <span class="error invalid-feedback" id="functionTempError"></span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="metheodologyTemp"><span class="mandatory">*</span>Project Methodology</label>
                                  <form:select class="form-control" id="metheodologyTemp" path="metheodologyTemp">
                                    <form:option value="-1">-- Select Methodology --</form:option>
                                    <c:forEach items="${projectMethodList }" var="projectMethod" varStatus="projectMethodStatus">
                                      <form:option value="${projectMethod.projectMethodologyId }">${projectMethod.projectMethodologyName }</form:option>
                                    </c:forEach>
                                  </form:select>
                                  <span class="error invalid-feedback" id="metheodologyTempError"></span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="typeTemp"><span class="mandatory">*</span>Project Type</label>
                                  <form:select class="form-control" id="typeTemp" path="typeTemp">
                                    <form:option value="-1">-- Select Type --</form:option>
                                    <c:forEach items="${projectTypeList }" var="projectType" varStatus="projectMethodStatus">
                                      <form:option value="${projectType.projectTypeId }">${projectType.projectTypeName }</form:option>
                                    </c:forEach>
                                  </form:select>
                                  <span class="error invalid-feedback" id="typeTempError"></span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="companyTemp"><span class="mandatory">*</span>Company Name</label>
                                  <form:select class="form-control" id="companyTemp" path="companyTemp">
                                    <form:option value="-1">-- Select Company --</form:option>
                                    <c:forEach items="${companyList }" var="company" varStatus="companyStatus">
                                      <form:option value="${company.mEntityId }">${company.entityName } - ${company.locationId.locationName }</form:option>
                                    </c:forEach>
                                  </form:select>
                                  <span class="error invalid-feedback" id="companyTempError"></span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="confidentiality"><span class="mandatory">*</span>Project Confidentiality</label>
                                  <form:select class="form-control" id="confidentiality" path="confidentiality">
                                    <form:option value="-1">-- Select Confidentiality --</form:option>
                                    <form:option value="1">Non-Confidential</form:option>
                                    <form:option value="2">Confidential</form:option>
                                  </form:select>
                                  <span class="error invalid-feedback" id="confidentialityError"></span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="projectName"><span class="mandatory">*</span>Project Name</label>
                                  <form:input id="projectName" path="projectName" type="text" class="form-control" placeholder="Enter Project Name" />
                                  <span class="error invalid-feedback" id="projectNameError"></span>
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
                                  <form:select class="form-control" id="sponsorTemp" path="sponsorTemp">
                                    <form:option value="-1">-- Select Sponsor --</form:option>
                                    <c:forEach items="${sponsorList }" var="sponsor" varStatus="companyStatus">
                                      <form:option value="${sponsor.mUserId }">${sponsor.userFirstName } ${sponsor.userLastName }</form:option>
                                    </c:forEach>
                                  </form:select>
                                  <span class="error invalid-feedback" id="sponsorTempError"></span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="processOwnerTemp"><span class="mandatory">*</span>Process Owner</label>
                                  <form:select class="form-control" id="processOwnerTemp" path="processOwnerTemp">
                                    <form:option value="-1">-- Select Process Owner --</form:option>
                                    <c:forEach items="${processOwnerList }" var="processOwner" varStatus="processOwnerStatus">
                                      <form:option value="${processOwner.mUserId }">${processOwner.userFirstName } ${processOwner.userLastName }</form:option>
                                    </c:forEach>
                                  </form:select>
                                  <span class="error invalid-feedback" id="processOwnerTempError"></span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="problemSolvingLeaderTemp"><span class="mandatory">*</span>Problem Solving Leader</label>
                                  <form:select class="form-control" id="problemSolvingLeaderTemp" path="problemSolvingLeaderTemp">
                                    <form:option value="-1">-- Select Problem Solving Leader --</form:option>
                                    <c:forEach items="${problemSolvingLeaderList }" var="problemSolvingLeader" varStatus="problemSolvingLeaderStatus">
                                      <form:option value="${problemSolvingLeader.mUserId }">${problemSolvingLeader.userFirstName } ${problemSolvingLeader.userLastName }</form:option>
                                    </c:forEach>
                                  </form:select>
                                  <span class="error invalid-feedback" id="problemSolvingLeaderTempError"></span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="financeControllerTemp"><span class="mandatory">*</span>Finance Controller</label>
                                  <form:select class="form-control" id="financeControllerTemp" path="financeControllerTemp">
                                    <form:option value="-1">-- Select Finance Controller --</form:option>
                                    <c:forEach items="${financeControllerList }" var="financeController" varStatus="financeControllerStatus">
                                      <form:option value="${financeController.mUserId }">${financeController.userFirstName } ${financeController.userLastName }</form:option>
                                    </c:forEach>
                                  </form:select>
                                  <span class="error invalid-feedback" id="financeControllerTempError"></span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="corporateProblemSolvingLeaderTemp"><span class="mandatory">*</span>Corporate Problem Solving Leader</label>
                                  <form:select class="form-control" id="corporateProblemSolvingLeaderTemp" path="corporateProblemSolvingLeaderTemp">
                                    <form:option value="-1">-- Select Corporate Problem Solving Leader --</form:option>
                                    <c:forEach items="${corporateProblemSolvingLeaderList }" var="corporateProblemSolvingLeader" varStatus="corporateProblemSolvingLeaderStatus">
                                      <form:option value="${corporateProblemSolvingLeader.mUserId }">${corporateProblemSolvingLeader.userFirstName } ${corporateProblemSolvingLeader.userLastName }</form:option>
                                    </c:forEach>
                                  </form:select>
                                  <span class="error invalid-feedback" id="corporateProblemSolvingLeaderTempError"></span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="projectLeaderTemp"><span class="mandatory">*</span>Project Leader</label>
                                  <form:select class="form-control" id="projectLeaderTemp" path="projectLeaderTemp">
                                    <form:option value="-1">-- Select Project Leader --</form:option>
                                    <c:forEach items="${projectLeaderList }" var="projectLeader" varStatus="projectLeaderStatus">
                                      <form:option value="${projectLeader.mUserId }">${projectLeader.userFirstName } ${projectLeader.userLastName }</form:option>
                                    </c:forEach>
                                  </form:select>
                                  <span class="error invalid-feedback" id="projectLeaderTempError"></span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="estimatedSaving"><span class="mandatory">*</span>Estimated Saving (in Millon INR)</label>
                                  <form:input path="estimatedSaving" id="estimatedSaving" type="text" class="form-control" placeholder="Enter Estimated Savings" />
                                  <span class="error invalid-feedback" id="estimatedSavingError"></span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="businessHeadTemp"><span class="mandatory">*</span>COO / Business Head</label>
                                  <form:select class="form-control" id="businessHeadTemp" path="businessHeadTemp">
                                    <form:option value="-1">-- Select COO / Business Head --</form:option>
                                    <c:forEach items="${cooOrBusinessLeaderList }" var="cooOrBusinessLeader" varStatus="cooOrBusinessLeaderStatus">
                                      <form:option value="${cooOrBusinessLeader.mUserId }">${cooOrBusinessLeader.userFirstName } ${cooOrBusinessLeader.userLastName }</form:option>
                                    </c:forEach>
                                  </form:select>
                                  <span class="error invalid-feedback" id="businessHeadTempError"></span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="additionalProjectLeaderTemp"><span class="mandatory"> </span>Additional Reader</label>
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
                                  <label for="additionalSponsorTemp"><span class="mandatory"> </span>Additional Sponsor</label>
                                  <form:select class="form-control" id="additionalSponsorTemp" path="additionalSponsorTemp">
                                    <form:option value="-1">-- Select Sponsor --</form:option>
                                    <c:forEach items="${sponsorList }" var="sponsor" varStatus="companyStatus">
                                      <form:option value="${sponsor.mUserId }">${sponsor.userFirstName } ${sponsor.userLastName }</form:option>
                                    </c:forEach>
                                  </form:select>
                                  <span class="error invalid-feedback" id="additionalSponsorTempError"></span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-check" id="isActiveDiv">
                                  <label><span class="mandatory">*</span>Charter Active/InActive</label>
                                  <div class="custom-control custom-radio">
                                    <form:radiobutton path="charterActive" class="custom-control-input" value="1" id="customRadio1" name="customRadio" />
                                    <label for="customRadio1" class="custom-control-label text-green">Active</label>
                                  </div>
                                  <div class="custom-control custom-radio">
                                    <form:radiobutton path="charterActive" class="custom-control-input" value="0" id="customRadio2" name="customRadio" />
                                    <label for="customRadio2" class="custom-control-label text-red">Inactive</label>
                                  </div>
                                  <span class="error invalid-feedback" id="isActiveError"></span> 
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-check" id="countForCertificationDiv">
                                  <label><span class="mandatory">*</span>Count for Certification</label>
                                  <div class="custom-control custom-radio">
                                    <form:radiobutton path="countForCertification" class="custom-control-input" value="1" id="customRadio3" name="customRadio1" />
                                    <label for="customRadio3" class="custom-control-label text-green">Yes</label>
                                  </div>
                                  <div class="custom-control custom-radio">
                                    <form:radiobutton path="countForCertification" class="custom-control-input" value="0" id="customRadio4" name="customRadio1" />
                                    <label for="customRadio4" class="custom-control-label text-red">No</label>
                                  </div>
                                  <span class="error invalid-feedback" id="countForCertificationError"></span> 
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-check" id="alignedForBusinessGoalTreeDiv">
                                  <label><span class="mandatory">*</span>Is Project aligned to Business Goal Tree?</label>
                                  <div class="custom-control custom-radio">
                                    <form:radiobutton path="alignedForBusinessGoalTree" class="custom-control-input" value="1" id="customRadio5" name="customRadio2" />
                                    <label for="customRadio5" class="custom-control-label text-green">Yes</label>
                                  </div>
                                  <div class="custom-control custom-radio">
                                    <form:radiobutton path="alignedForBusinessGoalTree" class="custom-control-input" value="0" id="customRadio6" name="customRadio2" />
                                    <label for="customRadio6" class="custom-control-label text-red">No</label>
                                  </div>
                                  <span class="error invalid-feedback" id="alignedForBusinessGoalTreeError"></span> 
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-check" id="fallsUnderSponsorFunctionalAreaDiv">
                                  <label><span class="mandatory">*</span>Is this project with in Sponsor Functional Area?</label>
                                  <div class="custom-control custom-radio">
                                    <form:radiobutton path="fallsUnderSponsorFunctionalArea" class="custom-control-input" value="1" id="customRadio7" name="customRadio3" />
                                    <label for="customRadio7" class="custom-control-label text-green">Yes</label>
                                  </div>
                                  <div class="custom-control custom-radio">
                                    <form:radiobutton path="fallsUnderSponsorFunctionalArea" class="custom-control-input" value="0" id="customRadio8" name="customRadio3" />
                                    <label for="customRadio8" class="custom-control-label text-red">No</label>
                                  </div>
                                  <span class="error invalid-feedback" id="fallsUnderSponsorFunctionalAreaError"></span> 
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="tab-pane fade" id="projectPlanDates" role="tabpanel" aria-labelledby="projectPlanDates-tab">
                            <div class="row">
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label><span class="mandatory">*</span>Estimated Start Date</label>
                                  <div class="input-group">
                                    <div class="input-group-prepend">
                                      <span class="input-group-text">
                                        <i class="far fa-calendar-alt"></i>
                                      </span>
                                    </div>
                                    <form:input path="estimatedStartDateTemp" id="estimatedStartDate" type="text" class="form-control float-right" title="Estimated Start Date" />
                                    <span class="error invalid-feedback" id="estimatedStartDateError"></span>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label><span class="mandatory">*</span>Estimated End Date</label>
                                  <div class="input-group">
                                    <div class="input-group-prepend">
                                      <span class="input-group-text">
                                        <i class="far fa-calendar-alt"></i>
                                      </span>
                                    </div>
                                    <form:input path="estimatedEndDateTemp" id="estimatedEndDate" type="text" class="form-control float-right" title="Estimated Start Date" />
                                    <span class="error invalid-feedback" id="estimatedEndDateError"></span>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="estimatedThroughPutDays"><span class="mandatory">*</span>Estimated Throughput Days</label>
                                  <form:input path="estimatedThroughPutDaysTemp" disabled="disabled" id="estimatedThroughPutDays" type="text" class="form-control float-right" title="Estimated Start Date" />
                                  <span class="error invalid-feedback" id="estimatedThroughPutDaysError"></span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="projectLaunchDate">Project Launch Date</label>
                                  <form:input path="launchDateTemp" disabled="disabled" id="projectLaunchDate" type="text" class="form-control float-right" title="Estimated Start Date" />
                                  <span class="error invalid-feedback" id="projectLaunchDateError"></span>
                                </div>
                              </div>
                              <div class="col-md-4"></div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="actualThroughputDays">Actual Throughput Days</label>
                                  <form:input path="actualThroughputDaysTemp" disabled="disabled" id="actualThroughputDays" type="text" class="form-control float-right" title="Estimated Start Date" />
                                  <span class="error invalid-feedback" id="actualThroughputDaysError"></span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label><span class="mandatory">*</span>Define</label>
                                  <div class="input-group">
                                    <div class="input-group-prepend">
                                      <span class="input-group-text">
                                        <i class="far fa-calendar-alt"></i>
                                      </span>
                                    </div>
                                    <form:input path="defineDateTemp" id="defineDate" type="text" class="form-control float-right" title="Estimated Start Date" />
                                    <span class="error invalid-feedback" id="defineDateError"></span>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-2">
                                <div class="form-group">
                                  <label for="measureDate">Measure</label>
                                  <form:input path="measureDateTemp" readonly="true" id="measureDate" type="text" class="form-control float-right" title="Estimated Start Date" />
                                  <span class="error invalid-feedback" id="measureDateError"></span>
                                </div>
                              </div>
                              <div class="col-md-2">
                                <div class="form-group">
                                  <label for="analyzeDate">Analyze</label>
                                  <form:input path="analyzeDateTemp" readonly="true" id="analyzeDate" type="text" class="form-control float-right" title="Estimated Start Date" />
                                  <span class="error invalid-feedback" id="analyzeDateError"></span>
                                </div>
                              </div>
                              <div class="col-md-2">
                                <div class="form-group">
                                  <label for="improveDays">Improve Days</label>
                                  <form:input path="improveDaysTemp" readonly="true" id="improveDays" type="text" class="form-control float-right" title="Estimated Start Date" />
                                  <span class="error invalid-feedback" id="improveDaysError"></span>
                                </div>
                              </div>
                              <div class="col-md-2">
                                <div class="form-group">
                                  <label for="closureDate">Closure</label>
                                  <form:input path="closureDateTemp" readonly="true" id="closureDate" type="text" class="form-control float-right" title="Estimated Start Date" />
                                  <span class="error invalid-feedback" id="closureDateError"></span>
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
                                  <label for="hopperEstimateComment">Hopper Estimate Comments</label>
                                  <textarea name="hopperEstimateComment" id="hopperEstimateComment" class="form-control" placeholder="Hopper Estimate Comments">
                                    ${projectCharter.hopperEstimateComment }
                                  </textarea>
                                  <span class="error invalid-feedback" id="hopperEstimateCommentError"></span>
                                </div>
                              </div>
                              <div class="col-md-6">
                                <div class="form-group">
                                  <label for="newEstimateCommentDuringProjectContract">New Estimate Comments During Project Contract</label>
                                  <textarea name="newEstimateCommentDuringContract" id="newEstimateCommentDuringProjectContract" class="form-control" placeholder="New Estimate Comments During Project Contract">
                                    ${projectCharter.newEstimateCommentDuringContract }
                                  </textarea>
                                  <span class="error invalid-feedback" id="newEstimateCommentDuringProjectContractError"></span>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="tab-pane fade" id="otherDetails" role="tabpanel" aria-labelledby="otherDetails-tab">
                            <div class="row">
                              <div class="col-md-6">
                                <div class="form-group">
                                  <label for="charterPrimaryDriver"><span class="mandatory">*</span>Project Primary Driver</label>
                                  <form:select class="form-control" id="charterPrimaryDriver" path="charterPrimaryDriver">
                                    <form:option value="-1">-- Select Primary Driver --</form:option>
                                    <form:option value="1">Productivity</form:option>
                                    <form:option value="2">Quality</form:option>
                                    <form:option value="3">Cost</form:option>
                                    <form:option value="4">Delivery</form:option>
                                    <form:option value="5">Safety</form:option>
                                  </form:select>
                                  <span class="error invalid-feedback" id="charterPrimaryDriverError"></span>
                                </div>
                              </div>
                              <div class="col-md-6">
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
                                <div class="form-check" id="supplyChainImprovementProjectDiv">
                                  <label><span class="mandatory">*</span>Supply Chain Improvement Project</label>
                                  <div class="custom-control custom-radio">
                                    <form:radiobutton path="supplyChainImprovementProject" class="custom-control-input" value="1" id="customRadioSupplyChainImprovementProject1" name="customRadio" />
                                    <label for="customRadioSupplyChainImprovementProject1" class="custom-control-label text-green">Yes</label>
                                  </div>
                                  <div class="custom-control custom-radio">
                                    <form:radiobutton path="supplyChainImprovementProject" class="custom-control-input" value="0" id="customRadioSupplyChainImprovementProject2" name="customRadio" />
                                    <label for="customRadioSupplyChainImprovementProject2" class="custom-control-label text-red">No</label>
                                  </div>
                                  <span class="error invalid-feedback" id="supplyChainImprovementProjectError"></span> 
                                </div>
                              </div>
                              <div class="col-md-3">
                                <div class="form-check" id="supplierFocusProjectDiv">
                                  <label><span class="mandatory">*</span>Supplier Focus Project</label>
                                  <div class="custom-control custom-radio">
                                    <form:radiobutton path="supplierFocusProject" class="custom-control-input" value="1" id="supplierFocusProject1" name="supplierFocusProject1" />
                                    <label for="supplierFocusProject1" class="custom-control-label text-green">Yes</label>
                                  </div>
                                  <div class="custom-control custom-radio">
                                    <form:radiobutton path="supplierFocusProject" class="custom-control-input" value="0" id="supplierFocusProject2" name="supplierFocusProject2" />
                                    <label for="supplierFocusProject2" class="custom-control-label text-red">No</label>
                                  </div>
                                  <span class="error invalid-feedback" id="supplierFocusProjectError"></span> 
                                </div>
                              </div>
                              <div class="col-md-3">
                                <div class="form-check" id="projectWarrantyFocusDiv">
                                  <label><span class="mandatory">*</span>Is the project warranty focus?</label>
                                  <div class="custom-control custom-radio">
                                    <form:radiobutton path="projectWarrantyFocus" class="custom-control-input" value="1" id="projectWarrantyFocus1" name="projectWarrantyFocus1" />
                                    <label for="projectWarrantyFocus1" class="custom-control-label text-green">Yes</label>
                                  </div>
                                  <div class="custom-control custom-radio">
                                    <form:radiobutton path="projectWarrantyFocus" class="custom-control-input" value="0" id="projectWarrantyFocus2" name="projectWarrantyFocus2" />
                                    <label for="projectWarrantyFocus2" class="custom-control-label text-red">No</label>
                                  </div>
                                  <span class="error invalid-feedback" id="projectWarrantyFocusError"></span> 
                                </div>
                              </div>
                              <div class="col-md-2">
                                <div class="form-group">
                                  <label for="warrantyFocusState">Warranty Focused Yes</label>
                                  <form:select disabled="true" class="form-control" id="warrantyFocusState" path="warrantyFocusState">
                                    <form:option value="-1">-- Select Warranty --</form:option>
                                    <form:option value="1">3 Months Failure</form:option>
                                    <form:option value="2">6 Months Failure</form:option>
                                    <form:option value="3">12 Months Failure</form:option>
                                  </form:select>
                                  <span class="error invalid-feedback" id="warrantyFocusStateError"></span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-check" id="externalCustomerFocusProjectDiv">
                                  <label><span class="mandatory">*</span>External Customer Focus Project</label>
                                  <div class="custom-control custom-radio">
                                    <form:radiobutton path="externalCustomerFocusProject" class="custom-control-input" value="1" id="externalCustomerFocusProject1" name="externalCustomerFocusProject1" />
                                    <label for="externalCustomerFocusProject1" class="custom-control-label text-green">Yes</label>
                                  </div>
                                  <div class="custom-control custom-radio">
                                    <form:radiobutton path="externalCustomerFocusProject" class="custom-control-input" value="0" id="externalCustomerFocusProject2" name="externalCustomerFocusProject2" />
                                    <label for="externalCustomerFocusProject2" class="custom-control-label text-red">No</label>
                                  </div>
                                  <span class="error invalid-feedback" id="externalCustomerFocusProjectError"></span> 
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="nameOfCustomer">Name of Customer</label>
                                  <form:input path="nameOfCustomer" id="nameOfCustomer" class="form-control" placeholder="Name of Customer" />
                                  <span class="error invalid-feedback" id="nameOfCustomerError"></span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="contactPersonName">Contact Person Name</label>
                                  <form:input path="contactPersonName" id="contactPersonName" class="form-control" placeholder="Contact Person Name" />
                                  <span class="error invalid-feedback" id="contactPersonNameError"></span>
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-check" id="interCompanyCustomerFocusProjectDiv">
                                  <label><span class="mandatory">*</span>Intercompany Customer Focus Project</label>
                                  <div class="custom-control custom-radio">
                                    <form:radiobutton path="interCompanyCustomerFocusProject" class="custom-control-input" value="1" id="interCompanyCustomerFocusProject1" name="interCompanyCustomerFocusProject1" />
                                    <label for="interCompanyCustomerFocusProject1" class="custom-control-label text-green">Yes</label>
                                  </div>
                                  <div class="custom-control custom-radio">
                                    <form:radiobutton path="interCompanyCustomerFocusProject" class="custom-control-input" value="0" id="interCompanyCustomerFocusProject2" name="interCompanyCustomerFocusProject2" />
                                    <label for="interCompanyCustomerFocusProject2" class="custom-control-label text-red">No</label>
                                  </div>
                                  <span class="error invalid-feedback" id="interCompanyCustomerFocusProjectError"></span> 
                                </div>
                              </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                  <label for="processOrProductOppterrunityExists">Process/Product where Opportunity Exists</label>
                                  <textarea name="processOrProductOppterrunityExists" id="processOrProductOppterrunityExists" class="form-control" placeholder="Product/Process Oppertunity Exists">
                                    ${projectCharter.processOrProductOppterrunityExists }
                                  </textarea>
                                  <span class="error invalid-feedback" id="processOrProductOppterrunityExistsError"></span>
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
                                      <form:input path="qualityGoal" id="qualityGoal" class="form-control" placeholder="Goal - Quality/Productivity" />
                                      <span class="error invalid-feedback" id="qualityGoalError"></span>
                                    </div>
                                    <div class="col-md-3">
                                      <label for="qualityEntitlement">Entitlement</label>
                                      <form:input path="qualityEntitlement" id="qualityEntitlement" class="form-control" placeholder="Entitlement - Quality/Productivity" />
                                      <span class="error invalid-feedback" id="qualityEntitlementError"></span>
                                    </div>
                                    <div class="col-md-3">
                                      <label for="qualityUnitOfMeasure">Metrix/Unit of Measure</label>
                                      <form:select id="qualityUnitOfMeasure" path="qualityUnitOfMeasure" class="form-control">
                                        <form:option value="-1">Select Unit</form:option>
                                        <form:option value="1">KG</form:option>
                                        <form:option value="2">ML</form:option>
                                        <form:option value="3">KGM</form:option>
                                        <form:option value="4">% Rejection</form:option>
                                        <form:option value="5">% Rejection</form:option>
                                        <form:option value="0">Other</form:option>
                                      </form:select>
                                      <span class="error invalid-feedback" id="qualityUnitOfMeasureError"></span>
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
                                      <form:input path="costGoal" id="costGoal" class="form-control" placeholder="Goal - Cost" />
                                      <span class="error invalid-feedback" id="costGoalError"></span>
                                    </div>
                                    <div class="col-md-3">
                                      <label for="costEntitlement">Entitlement</label>
                                      <form:input path="costEntitlement" id="costEntitlement" class="form-control" placeholder="Entitlement - Cost" />
                                      <span class="error invalid-feedback" id="costEntitlementError"></span>
                                    </div>
                                    <div class="col-md-3">
                                      <label for="costUnitOfMeasure">Metrix/Unit of Measure</label>
                                      <form:select id="costUnitOfMeasure" path="costUnitOfMeasure" class="form-control">
                                        <form:option value="-1">Select Unit</form:option>
                                        <form:option value="1">MYR</form:option>
                                        <form:option value="2">KWD</form:option>
                                        <form:option value="3">JPY</form:option>
                                        <form:option value="4">HKD</form:option>
                                        <form:option value="5">EUR</form:option>
                                        <form:option value="6">USD</form:option>
                                        <form:option value="7">INR</form:option>
                                        <form:option value="8">AED</form:option>
                                        <form:option value="0">Other</form:option>
                                      </form:select>
                                      <span class="error invalid-feedback" id="costUnitOfMeasureError"></span>
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
                                      <label for="projectTeamMemberInternal">Project Team Member (Internal)</label>
                                      <input type="hidden" value="${projectCharter.projectTeamMemberInternal }" id="projectTeamMemberInternalTemp" />
                                      <form:select id="projectTeamMemberInternal" path="projectTeamMemberInternal" class="form-control select2bs4" multiple="multiple" >
                                      <c:forEach items="${projectInternalTeam }" var="companyTeam" varStatus="companyTeamStatus">
                                        <form:option value="${companyTeam.mUserId }">${companyTeam.userFirstName } ${companyTeam.userLastName }</form:option>
                                        </c:forEach>
                                      </form:select>
                                    </div>
                                    <div class="col-md-6">
                                    <label for="">Project Team Member (External)</label>
                                    <textarea name="projectTeamMemberExternal" id="projectTeamMemberExternal" class="form-control" placeholder="Enter Project Team External">
                                      ${projectCharter.projectTeamMemberExternal }
                                    </textarea>
                                    <span class="error invalid-feedback" id="projectTeamMemberExternalError"></span>
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
                                      <label for="impactToExternalCustomerOrOtherIntercompanyCustomer">Impact/Benefits to External Customer Or Other Intracompany Customer</label>
                                      <textarea name="impactToExternalCustomerOrOtherIntercompanyCustomer" id="impactToExternalCustomerOrOtherIntercompanyCustomer" class="form-control" placeholder="Impact/Benefits to External Customer Or Other Intracompany Customer">
                                        ${projectCharter.impactToExternalCustomerOrOtherIntercompanyCustomer }
                                      </textarea>
                                      <span class="error invalid-feedback" id="impactToExternalCustomerOrOtherIntercompanyCustomerError"></span>
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
                                        <input type="hidden" id="charterAttachmentTemp" value="${projectCharter.charterAttachmentName }" />
                                        <c:if test="${not empty projectCharter.charterAttachmentName }">
                                          <br>
                                          <a href="getCharterAttachment?id=${projectCharter.tProjectCharterId }" target="_blank" title="Download Charter Attachment">
                                            <i class="fas fa-download" style="padding-bottom:15px"></i>&nbsp;${projectCharter.charterAttachmentName }
                                          </a>
                                        </c:if>
                                        <div class="input-group">
                                          <div class="custom-file">
                                            <input type="file" name="attachcharter" id="attachcharter" class="form-control-file" accept=".txt,.pdf,.csv,application/vnd.ms-excel" />
                                            <label class="custom-file-label" for="attachcharter">Choose file</label>
                                          </div>
                                        </div>
                                        <span class="error invalid-feedback" id="charterAttachmentTempError"></span>
                                      </div>
                                    </div>
                                    <div class="col-md-6">
                                      <label for="cycleCount"><span class="mandatory">*</span>Cycle Count @ Each Approvers</label>
                                      <form:input path="cycleCount" id="cycleCount" class="form-control" placeholder="Saving/Gain" />
                                      <span class="error invalid-feedback" id="cycleCountError"></span>
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
                  <div class="card-footer">
                    <div class="row">
                      <c:choose>
                        <c:when test="${empty projectCharter.projectCharterStatus || projectCharter.projectCharterStatus eq 0 || projectCharter.projectCharterStatus eq 3 }">
                          <div class="col-md-2" style='text-align:center'>
                            <button title="Save Charter" type="button" id="saveDraftCharter" onclick="submitCharterForm(0)" class="btn bg-color-anand-one text-white"><b>Save as Draft</b></button>
                          </div>
                          <div class="col-md-9"></div>
                          <div class="col-md-1" style='text-align:center'>
                            <button title="Submit Project Charter" type="button" id="projectHopperSubmit" onclick="submitCharterForm(1)" class="btn bg-color-anand-two text-white"><b>Submit</b></button>
                          </div>
                        </c:when>
                        <c:when test="${projectCharter.projectCharterStatus eq 1 }">
                          <div class="col-md-10"></div>
                          <div class="col-md-2">
                            <c:if test="${eim eq 1 || projectLeader eq 1 && sessionUserInfo.mUserId ne projectCharter.projectLeader.mUserId }">
                              <button disabled="disabled" title="Launch Project Charter" type="button" id="projectHopperSubmit" class="btn bg-color-anand-two text-white"><b>Launch Charter</b></button>
                            </c:if>
                          </div>
                        </c:when>
                        <c:when test="${projectCharter.projectCharterStatus eq 2 }">
                          <div class="col-md-10"></div>
                          <div class="col-md-2" style='text-align:center'>
                            <c:if test="${eim eq 1 || projectLeader eq 1 && sessionUserInfo.mUserId eq projectCharter.projectLeader.mUserId }">
                              <button title="Launch Project Charter" type="button" id="projectHopperSubmit" onclick="submitCharterForm(4)" class="btn bg-color-anand-two text-white"><b>Launch Charter</b></button>
                            </c:if>
                          </div>
                        </c:when>
                        <c:when test="${projectCharter.projectCharterStatus eq 4 }">
                          Project Launched - <fmt:formatDate value="${projectCharter.launchDate }" pattern="dd-MMM-yyyy"/>
                        </c:when>
                      </c:choose>
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
    <script src="usedStaticFiles/js/jsp_js_files/eim/charter/createCharter.js"></script>
  </body>
</html>