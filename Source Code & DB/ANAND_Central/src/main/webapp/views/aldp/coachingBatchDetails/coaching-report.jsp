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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>COACHING REPORT | ACT | ANAND GROUP</title>
    <%@include file="../../includeJSP/cssFiles.jsp"%>
    <%@include file="../../includeJSP/datePickerCss.jsp"%>
  </head>
  <body class="sidebar-mini layout-navbar-fixed sidebar-collapse pace-primary">
    <div class="wrapper">
      <%@include file="../../includeJSP/header.jsp"%>
      <%@include file="../includeJSP/leftSideBar.jsp"%>
      <div class="content-wrapper">
        <c:set var="goalIndex" value="0" />
        <c:forEach items="${coacheeGoalsList }" var="coachingGoal" varStatus="coachingGoalLoop">
          <c:if test="${coachingGoal.coachingGoalActive eq 1 }">
            <input type="hidden" id="goalName${goalIndex }" value="${coachingGoal.coachingGoal }" />
            <input type="hidden" id="goalId${goalIndex }" value="${coachingGoal.actCoacheeGoalsId }" />
            <c:set var="goalIndex" value="${goalIndex + 1 }" />
          </c:if>
        </c:forEach>
        <input type="hidden" id="jsGoalIndex" value="${goalIndex }" />
        <input type="hidden" id="jsBatchName" value="${coachCoacheeMapDetails.coachCoacheeMappingSet.batchName }" />
        <input type="hidden" id="jsCoacheeName" value="${coachCoacheeMapDetails.coacheeUserId.userFirstName } ${coachCoacheeMapDetails.coacheeUserId.userLastName }" />
        <input type="hidden" id="jsCoachName" value="${coachCoacheeMapDetails.coachUserId.userFirstName } ${coachCoacheeMapDetails.coachUserId.userLastName }" />
        <input type="hidden" id="jsSupervisorName" value="${coachCoacheeMapDetails.supervisorUserId.userFirstName } ${coachCoacheeMapDetails.supervisorUserId.userLastName }" />
        <section class="content-header">
          <div class="container-fluid">
            <div class="row mb-2">
              <div class="col-sm-6">
                <h5 class="font-color-anand-one font-weight-bold">Coaching Report - ${coachCoacheeMapDetails.coacheeUserId.userFirstName } ${coachCoacheeMapDetails.coacheeUserId.userLastName } - ${coachCoacheeMapDetails.coachCoacheeMappingSet.batchName } </h5>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right font-weight-bold">
                  <li class="breadcrumb-item"><a href="dashboard-act" title="Dashboard">Dashboard</a></li>
                  <li class="breadcrumb-item"><a href="coaching-batch-details" title="Coaching Batch Details">Coaching Batch</a></li>
                  <c:if test="${ctCoach eq 1 || ctAdmin eq 1 || itAdmin eq 1 }">
                    <li class="breadcrumb-item"><a href="coachee-list?batch-id=${coachCoacheeMapDetails.coachCoacheeMappingSet.actCoachingBatchId }" title="Coachee List">Coachee List</a></li>
                  </c:if>
                  <li class="breadcrumb-item active">Coaching Report</li>
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
		            <div class="row">
		              <div class="col-md-4">
		                <h5 class="font-color-anand-two font-weight-bold">Batch: ${coachCoacheeMapDetails.coachCoacheeMappingSet.batchName } </h5>
		              </div>
		              <div class="col-md-6">
		                <h5 class="font-color-anand-two font-weight-bold">Description: ${coachCoacheeMapDetails.coachCoacheeMappingSet.batchDescription } </h5>
		              </div>
		              <div class="col-md-2">
		                <a title="Add/Edit Coaching Goals" class="breadcrumb-item font-weight-bold font-color-anand-warning" href="coaching-goals?batch-id=${coachCoacheeMapDetails.coachCoacheeMappingSet.actCoachingBatchId }&coachee-id=${coachCoacheeMapDetails.coacheeUserId.mUserId }">Add/Edit Goals</a>
		              </div>
		              <div class="col-md-4">
		                <h5 class="font-color-anand-three font-weight-bold">Coachee: ${coachCoacheeMapDetails.coacheeUserId.userFirstName } ${coachCoacheeMapDetails.coacheeUserId.userLastName } </h5>
		              </div>
		              <div class="col-md-4">
		                <h5 class="font-color-anand-three font-weight-bold">Coach: ${coachCoacheeMapDetails.coachUserId.userFirstName } ${coachCoacheeMapDetails.coachUserId.userLastName } </h5>
		              </div>
		              <div class="col-md-4">
		                <h5 class="font-color-anand-three font-weight-bold">Supervisor: ${coachCoacheeMapDetails.supervisorUserId.userFirstName } ${coachCoacheeMapDetails.supervisorUserId.userLastName } </h5>
		              </div>
		            </div>
		          </div>
		          <c:set var="coachCoacheeAdminFlag" value="0" />
		          <c:if test="${ctAdmin eq 1 || itAdmin eq 1 }">
		            <c:set var="coachCoacheeAdminFlag" value="3" />
		          </c:if>
		          <c:if test="${coachCoacheeMapDetails.coacheeUserId.mUserId eq sessionUserInfo.mUserId }">
		            <c:set var="coachCoacheeAdminFlag" value="2" />
		          </c:if>
		          <c:if test="${coachCoacheeMapDetails.coachUserId.mUserId eq sessionUserInfo.mUserId }">
		            <c:set var="coachCoacheeAdminFlag" value="1" />
		          </c:if>
		          <input id="coachCoacheeAdminFlag" type="hidden" value="${coachCoacheeAdminFlag }" />
		          <div class="card-body">
		            <div class="row">
		              <div class="col-md-12">
		                <table class="table table-bordered dataTable anand-table-font-size" id="coachingGoalTableActive">
		                  <thead>
		                    <tr class="bg-table-head">
		                      <th>Action</th>
		                      <th>Session Date</th>
		                      <th>Report Status</th>
		                      <th>Meeting Conducted</th>
		                      <th>Coachee Reason for Not Conducting</th>
		                      <th>Topics Discussed &amp; Input Given</th>
		                    </tr>
		                  </thead>
		                  <tbody>
		                    <c:forEach items="${coacheeReportList }" var="coachingReport" varStatus="coachingReportLoop">
		                      <c:set var="showReportInfoFlag" value="1" />
		                      <c:if test="${ctCoach eq 1 && coachingReport.reportStatus eq 2 && coachingReport.coacheeReportSet.coacheeUserId.mUserId ne sessionUserInfo.mUserId }">
		                        <c:set var="showReportInfoFlag" value="0" />
		                      </c:if>
		                      <c:if test="${coachingReport.reportActive eq 1 && showReportInfoFlag eq 1}">
		                        <tr class="bg-table-row-${coachingReportLoop.index %2 }">
		                          <td>${coachingReport.actionForCoachingReport }</td>
		                          <td><fmt:formatDate pattern = "dd-MMM-yyyy" value = "${coachingReport.sessionDate }" /></td>
		                          <td>
		                            <c:choose>
		                              <c:when test="${coachingReport.reportStatus eq 1 }">
		                                <span class="badge bg-primary">Submitted</span>
		                              </c:when>
		                              <c:when test="${coachingReport.reportStatus eq 2 }">
		                                <span class="badge bg-secondary">Draft</span>
		                              </c:when>
		                              <c:when test="${coachingReport.reportStatus eq 3 }">
		                                <span class="badge bg-success">Complete</span>
		                              </c:when>
		                            </c:choose>
		                          </td>
		                          <td>
		                            <c:choose>
		                              <c:when test="${coachingReport.meetingConductedStatus eq 1 }">
		                                <span class="badge bg-primary">Conducted</span>
		                              </c:when>
		                              <c:when test="${coachingReport.meetingConductedStatus eq 2 }">
		                                <span class="badge bg-danger">Not-Conducted</span>
		                              </c:when>
		                            </c:choose>
		                          </td>
		                          <td style="white-space: pre-line">${coachingReport.reasonForNotConducting }</td>
		                          <td style="white-space: pre-line">${coachingReport.discussionAndInputsFromCoach }</td>
		                        </tr>
		                      </c:if>
		                    </c:forEach>
		                  </tbody>
		                  <tfoot>
		                    <tr class="bg-table-foot">
		                      <th>Action</th>
		                      <th>Session Date</th>
		                      <th>Report Status</th>
		                      <th>Meeting Conducted</th>
		                      <th>Coachee Reason for Not Conducting</th>
		                      <th>Topics Discussed &amp; Input Given</th>
		                    </tr>
		                  </tfoot>
		                </table>
		              </div>
		            </div>
		          </div>
		          <c:set var="coacheeActionIndex" value="0" />
		          <div class="card-footer coacheeReportFooter">
		            <form:form method="post" action="coaching-report" modelAttribute="actCoachCoacheeMap" id="actCoacheeReport">
		            <form:hidden path="coacheeReportTemp.actCoacheeReportId" id="actCoacheeReportId" />
		            <form:hidden path="coacheeReportTemp.actCoachCoacheeMapId" id="actCoachCoacheeMapId" value="${coachCoacheeMapDetails.actCoachCoacheeMapId }" />
		            <input type="hidden" name="batch-id" id="batch-id" value="${coachCoacheeMapDetails.coachCoacheeMappingSet.actCoachingBatchId }" />
		            <input type="hidden" name="coacheeIdForPage" id="coacheeIdForPage" value="${coacheeIdForPage }" />
		            <div class="row">
		              <div class="col-md-12">
		                <c:if test="${ctAdmin eq 1 || itAdmin eq 1 }">
		                  <h5 class="font-color-anand-one font-weight-bold">Coachee Report - Coachee Submission</h5>
		                </c:if>
		                <c:if test="${ctCoach eq 1 }">
		                  <h5 class="font-color-anand-one font-weight-bold">Coaching Report</h5>
		                </c:if>
		              </div>
		              <div class="col-md-2 sessionDateString">
		                <div class="form-group">
		                  <label><span class="mandatory">*</span>Session Date</label>
		                  <div class="input-group">
		                    <div class="input-group-prepend">
		                      <span class="input-group-text">
		                        <i class="far fa-calendar-alt"></i>
		                      </span>
		                    </div>
		                    <form:input id="sessionDateString" path="coacheeReportTemp.sessionDateString" type="text" class="form-control float-right" placeholder="Session Date" />
		                    <span class="error invalid-feedback" id="sessionDateStringError"></span>
		                  </div>
		                </div>
		              </div>
		              <div class="col-md-2 meetingConductedStatus">
		                <div class="form-group">
		                  <label for="meetingConductedStatus"><span class="mandatory">*</span>Meeting Conducted</label>
		                  <form:select class="form-control" id="meetingConductedStatus" path="coacheeReportTemp.meetingConductedStatus"> 
		                    <form:option value="-1">Select Status</form:option>
		                    <form:option value="1">Conducted</form:option>
		                    <form:option value="2">Not Conducted</form:option>
		                  </form:select>
		                  <span class="error invalid-feedback" id="meetingConductedStatusError"></span>
		                </div>
		              </div>
		              <div class="col-md-8 not-conducted reasonForNotConducting">
		                <div class="form-group">
		                  <label for="batchName"><span class="mandatory">*</span>Reason for Not Conducting</label>
		                  <form:textarea class="form-control" type="text" id="reasonForNotConducting" path="coacheeReportTemp.reasonForNotConducting" placeholder="Enter the reason for not conductiong the session" />
		                  <span class="error invalid-feedback" id="reasonForNotConductingError"></span>
		                </div>
		              </div>
		              
		              <div class="col-md-12 conducted goalActionDiv">
		                <div class="row ">
		                  <div class="col-md-12">
		                    <div class="card card-primary card-outline bg-card-primary-anand">
		                      <div class="card-header">
		                        <h5 class="font-color-anand-three font-weight-bold">What did coachee agree to do before the next meeting (Action Items)</h5>
		                      </div>
		                      <div class="card-body goalActionBody">
		                      <c:if test="${empty coacheeGoalActionList }">
		                        <div class="row goalAction${coacheeActionIndex }">
		                          <div class="col-md-1">
		                            <div class="form-group">
		                              <a href="#" onclick="removeGoalAction(${coacheeActionIndex });"><i class="fas fa-times"></i></a>
		                              <form:input id="actCoacheeReportActionId${coacheeActionIndex }" class="form-control" value="" path="coacheeReportTemp.coacheeReportActionTempList[${coacheeActionIndex }].actCoacheeReportActionId" />
		                              <form:input id="actionGoalActive${coacheeActionIndex }" class="form-control" value="1" path="coacheeReportTemp.coacheeReportActionTempList[${coacheeActionIndex }].reportActionActive" />
		                            </div>
		                          </div>
		                          <div class="col-md-4">
		                            <div class="form-group">
		                              <label for="actionGoal${coacheeActionIndex }"><span class="mandatory">*</span>Select Goal</label>
		                              <form:select id="actionGoal${coacheeActionIndex }" class="form-control" path="coacheeReportTemp.coacheeReportActionTempList[${coacheeActionIndex }].actCoacheeGoalId.actCoacheeGoalsId"> 
		                                <form:option value="-1">Select Goal</form:option>
		                                <c:forEach items="${coacheeGoalsList }" var="coachingGoal" varStatus="coachingGoalLoop">
		                                  <c:if test="${coachingGoal.coachingGoalActive eq 1 }">
		                                    <form:option value="${coachingGoal.actCoacheeGoalsId }">${coachingGoal.coachingGoal }</form:option>
		                                  </c:if>
		                                </c:forEach>
		                              </form:select>
		                              <span class="error invalid-feedback" id="actionGoal${coacheeActionIndex }Error"></span>
		                            </div>
		                          </div>
		                          <div class="col-md-7">
		                            <div class="form-group">
		                              <label for="goalAction${coacheeActionIndex }"><span class="mandatory">*</span>Goal Action</label>
		                              <form:textarea rows="3" class="form-control" type="text" id="goalAction${coacheeActionIndex }" path="coacheeReportTemp.coacheeReportActionTempList[${coacheeActionIndex }].goalAction" placeholder="Enter Goal Action" />
		                              <span class="error invalid-feedback" id="goalAction${coacheeActionIndex }Error"></span>
		                            </div>
		                          </div>
		                        </div>
		                        <c:set var="coacheeActionIndex" value="${coacheeActionIndex + 1 }" />
		                      </c:if>
		                      <c:if test="${not empty coacheeGoalActionList }">
		                        <c:forEach items="${coacheeGoalActionList }" var="reportActionNow" varStatus="reportActionNowStatus">
		                        <form:input id="actCoacheeReportActionId${coacheeActionIndex }" class="form-control" value="${reportActionNow.actCoacheeReportActionId }" path="coacheeReportTemp.coacheeReportActionTempList[${coacheeActionIndex }].actCoacheeReportActionId" />
		                        <form:input id="actionGoalActive${coacheeActionIndex }" class="form-control" value="${reportActionNow.reportActionActive }" path="coacheeReportTemp.coacheeReportActionTempList[${coacheeActionIndex }].reportActionActive" />
		                        <div class="row goalAction${coacheeActionIndex }">
		                        <c:if test="${reportActionNow.coacheeReportActionList.reportStatus eq 1 || reportActionNow.coacheeReportActionList.reportStatus eq 2 }">
		                          <div class="col-md-3">
		                            <div class="form-group">
		                              <label for="actionGoal${coacheeActionIndex }">Goal</label>
		                              <c:forEach items="${coacheeGoalsList }" var="coachingGoal" varStatus="coachingGoalLoop">
		                                <c:if test="${coachingGoal.coachingGoalActive eq 1 && reportActionNow.actCoacheeGoalId.actCoacheeGoalsId eq coachingGoal.actCoacheeGoalsId }">
		                                  <br>${coachingGoal.coachingGoal }
		                                </c:if>
		                              </c:forEach>
		                            </div>
		                          </div>
		                          <div class="col-md-4">
		                            <div class="form-group">
		                              <label for="goalAction${coacheeActionIndex }">Goal Action</label>
		                              <p style="white-space: pre-line">${reportActionNow.goalAction }</p>
		                            </div>
		                          </div>
		                          <div class="col-md-3">
		                            <div class="form-group">
		                              <label for="goalAction${coacheeActionIndex }">Coachee Comments</label>
		                              <p style="white-space: pre-line">${reportActionNow.goalAction }</p>
		                            </div>
		                          </div>
		                          <div class="col-md-2">
		                            <div class="form-check" id="isActiveDiv">
		                              <input type="text" id="reportActionStatusTemp${coacheeActionIndex }" value="${reportActionNow.reportActionStatus }" />
		                              <label><span class="mandatory">*</span>Batch Active/InActive</label>
		                              <div class="custom-control custom-radio">
		                                <form:radiobutton path="coacheeReportTemp.coacheeReportActionTempList[${coacheeActionIndex }].reportActionStatus" class="custom-control-input" value="1" id="reportActionStatus1${coacheeActionIndex }" name="coacheeReportTemp.coacheeReportActionTempList[${coacheeActionIndex }].reportActionStatus" />
		                                <label for="reportActionStatus1" class="custom-control-label text-red">Yet to start</label>
		                              </div>
		                              <div class="custom-control custom-radio">
		                                <form:radiobutton path="coacheeReportTemp.coacheeReportActionTempList[${coacheeActionIndex }].reportActionStatus" class="custom-control-input" value="0" id="reportActionStatus2${coacheeActionIndex }" name="coacheeReportTemp.coacheeReportActionTempList[${coacheeActionIndex }].reportActionStatus" />
		                                <label for="reportActionStatus2" class="custom-control-label text-warning">In Progress</label>
		                              </div>
		                              <div class="custom-control custom-radio">
		                                <form:radiobutton path="coacheeReportTemp.coacheeReportActionTempList[${coacheeActionIndex }].reportActionStatus" class="custom-control-input" value="0" id="reportActionStatus2${coacheeActionIndex }" name="coacheeReportTemp.coacheeReportActionTempList[${coacheeActionIndex }].reportActionStatus" />
		                                <label for="reportActionStatus2" class="custom-control-label text-green">Completed</label>
		                              </div>
		                              <span class="error invalid-feedback" id="isActiveError" style="display:block" ></span> 
		                            </div>
		                          </div>
		                        </c:if>
		                        </div>
		                        <c:set var="coacheeActionIndex" value="${coacheeActionIndex + 1 }" />
		                        </c:forEach>
		                      </c:if>
		                      </div>
		                      <div class="card-footer">
		                        <button title="Add More Goal Action Item" style="float: right;" type="button" id="addMoreGoalActionItem" class="btn bg-color-anand-three text-white">
		                          <i class="fas fa-plus"></i>&emsp;Add Action Item
		                        </button>
		                      </div>
		                    </div>
		                  </div>
		                </div>
		              </div>
		              <div class="col-md-6 conducted coacheeAdditionalComments">
		                <div class="form-group">
		                  <label for="batchName"><span class="mandatory">*</span>Additional Comments by Coachee</label>
		                  <form:textarea rows="3" class="form-control" type="text" id="coacheeAdditionalComments" path="coacheeReportTemp.coacheeAdditionalComments" placeholder="Enter breif of topics discussed and inputs given by coach in the session" />
		                  <span class="error invalid-feedback" id="coacheeAdditionalCommentsError"></span>
		                </div>
		              </div>
		              <div class="col-md-6 conducted discussionAndInputsFromCoach">
		                <div class="form-group">
		                  <label for="discussionAndInputsFromCoach"><span class="mandatory">*</span>Topics discussed and inputs from coach in the current session</label>
		                  <form:textarea rows="3" class="form-control" type="text" id="discussionAndInputsFromCoach" path="coacheeReportTemp.discussionAndInputsFromCoach" placeholder="Enter topics discussed with coach and inputs given by coach" />
		                  <span class="error invalid-feedback" id="discussionAndInputsFromCoachError"></span>
		                </div>
		              </div>
		              <div class="col-md-3 reportStatus">
		                <div class="form-check" id="reportStatusDiv">
		                  <label><span class="mandatory">*</span>Report Status</label>
		                  <div class="custom-control custom-radio">
		                    <form:radiobutton path="coacheeReportTemp.reportStatus" class="custom-control-input" value="1" id="reportStatus2" name="coacheeReportTemp.reportStatus" />
		                    <label for="reportStatus2" class="custom-control-label text-blue">Submit Report to Coach</label>
		                  </div>
		                  <div class="custom-control custom-radio">
		                    <form:radiobutton path="coacheeReportTemp.reportStatus" class="custom-control-input" value="2" id="reportStatus1" name="coacheeReportTemp.reportStatus" />
		                    <label for="reportStatus1" class="custom-control-label text-green">Keep in Draft</label>
		                  </div>
		                  <span class="error invalid-feedback" id="reportStatusError" style="display:block" ></span> 
		                </div>
		              </div>
		              <div class="col-md-10"><input type="text" value="${coacheeActionIndex }" id="coacheeActionIndex" /></div>
		              <div class="col-md-2">
		                <button title="Save Report" type="submit" id="submitCoachingReportButton" class="btn bg-color-anand-two float-right">Submit</button>
		              </div>
		            </div>
		            </form:form>
		          </div>
		          
		          
		          <div class="card-footer coachReportFooter">
		            <form:form method="post" action="coaching-report-coach" modelAttribute="actCoachCoacheeMap" id="actCoachReport">
		            <form:hidden path="coacheeReportTemp.actCoacheeReportId" id="actCoacheeReportIdCoach" />
		            <form:hidden path="coacheeReportTemp.actCoachCoacheeMapId" id="actCoachCoacheeMapId" value="${coachCoacheeMapDetails.actCoachCoacheeMapId }" />
		            <input type="hidden" name="batch-id" id="batch-id" value="${coachCoacheeMapDetails.coachCoacheeMappingSet.actCoachingBatchId }" />
		            <input type="hidden" name="coacheeIdForPage" id="coacheeIdForPage" value="${coacheeIdForPage }" />
		            <div class="row">
		              <div class="col-md-12">
		                <c:if test="${ctAdmin eq 1 || itAdmin eq 1 }">
		                  <h5 class="font-color-anand-one font-weight-bold">Coachee Report - Coach Submission</h5>
		                </c:if>
		                <c:if test="${ctCoach eq 1 }">
		                  <h5 class="font-color-anand-one font-weight-bold">Coaching Report</h5>
		                </c:if>
		              </div>
		              <div class="col-md-2 sessionDateStringShow">
		                <div class="form-group">
		                  <label>Session Date</label>
		                  <p id="sessionDateStringShow"></p>
		                </div>
		              </div>
		              <div class="col-md-2 meetingConductedStatusShow">
		                <div class="form-group">
		                  <label>Meeting Conducted</label>
		                  <p id="meetingConductedStatusShow"></p>
		                  <input type="hidden" id="meetingConductedStatusCoach" value="" />
		                </div>
		              </div>
		              <div class="col-md-4 reasonForNotConductingShow">
		                <div class="form-group">
		                  <label>Coachee Reason</label>
		                  <p style="white-space: pre-line" id="reasonForNotConductingShow"></p>
		                </div>
		              </div>
		              <div class="col-md-4 not-conducted coachReasonForNotConducting">
		                <div class="form-group">
		                  <label for="coachReasonForNotConducting"><span class="mandatory">*</span>Coach Reason</label>
		                  <form:textarea class="form-control" type="text" id="coachReasonForNotConducting" path="coacheeReportTemp.coachReasonForNotConducting" placeholder="Enter the coach reason for not conductiong the session" />
		                  <span class="error invalid-feedback" id="coachReasonForNotConductingError"></span>
		                </div>
		              </div>
		              
		              <div class="col-md-12 conducted">
		                <div class="row">
		                  <div class="col-md-12">
		                    <div class="card card-primary card-outline bg-card-primary-anand">
		                      <div class="card-header">
		                        <h5 class="font-color-anand-three font-weight-bold">What did coachee agree to do before the next meeting (Action Items)</h5>
		                      </div>
		                      <div class="card-body">
		                        <div class="row">
		                          <div class="col-md-4">
		                            <div class="form-group">
		                              <label for="coachingGoal"><span class="mandatory">*</span>Select Goal</label>
		                              <select class="form-control"> 
		                                <option value="-1">Select Goal</option>
		                                <c:forEach items="${coacheeGoalsList }" var="coachingGoal" varStatus="coachingGoalLoop">
		                                  <c:if test="${coachingGoal.coachingGoalActive eq 1 }">
		                                    <option value="${coachingGoal.actCoacheeGoalsId }">${coachingGoal.coachingGoal }</option>
		                                  </c:if>
		                                </c:forEach>
		                              </select>
		                              <span class="error invalid-feedback" id="coachingGoalError"></span>
		                            </div>
		                          </div>
		                          <div class="col-md-8">
		                            <div class="form-group">
		                              <label for="batchName"><span class="mandatory">*</span>Goal Action</label>
		                              <%-- <form:textarea class="form-control" type="text" id="reasonForNotConductingCoachee" path="coachingGoalDescription" placeholder="Enter Coaching Goal Description" /> --%>
		                              <textarea class="form-control" type="text" id="coacheeGoalAction" placeholder="Enter goal action">
		                              </textarea>
		                              <span class="error invalid-feedback" id="coachingGoalDescriptionError"></span>
		                            </div>
		                          </div>
		                        </div>
		                      </div>
		                      <div class="card-footer">
		                        <button title="Add More Goal Action Item" style="float: right;" type="button" id="addMoreGoalActionItem" class="btn bg-color-anand-three text-white">
		                          <i class="fas fa-plus"></i>&emsp;Add Action Item
		                        </button>
		                      </div>
		                    </div>
		                  </div>
		                </div>
		              </div>
		              
		              <div class="col-md-8 discussionAndInputsFromCoachShow">
		                <div class="form-group">
		                  <label>Topics discussed and inputs from coach in the current session</label>
		                  <p style="white-space: pre-line" id="discussionAndInputsFromCoachShow"></p>
		                </div>
		              </div>
		              <div class="col-md-6 coachAdditionalComments">
		                <div class="form-group">
		                  <label for="coachAdditionalComments"><span class="mandatory">*</span>Additional Comments by Coach</label>
		                  <form:textarea rows="3" class="form-control" type="text" id="coachAdditionalComments" path="coacheeReportTemp.coachAdditionalComments" placeholder="Additional Comments by coach." />
		                  <span class="error invalid-feedback" id="coachAdditionalCommentsError"></span>
		                </div>
		              </div>
		              <div class="col-md-6 anyConcernOrObservation">
		                <div class="form-group">
		                  <label for="anyConcernOrObservation"><span class="mandatory">*</span>Any Concern/Observation</label>
		                  <form:textarea rows="3" class="form-control" type="text" id="anyConcernOrObservation" path="coacheeReportTemp.anyConcernOrObservation" placeholder="Any concern or observation?" />
		                  <span class="error invalid-feedback" id="anyConcernOrObservationError"></span>
		                </div>
		              </div>
		              
		              <div class="col-md-10"></div>
		              <div class="col-md-2">
		                <button title="Save Report" type="submit" id="submitCoachingReportButton" class="btn bg-color-anand-two float-right">Submit</button>
		              </div>
		            </div>
		            </form:form>
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
    <%@include file="../../includeJSP/datePickerJs.jsp"%>
    <script src="usedStaticFiles/js/jsp_js_files/aldp/coachingBatchDetails/coaching-report.js"></script>
  </body>
</html>