<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="charterApprovalCount" value="0" />
<c:set var="showCharterApproval" value="0" />
                <c:forEach items="${projectCharter.projectClosureApproval }" var="projectClosureApproval" varStatus="projectClosureApprovalStatus">
                  <c:if test="${projectClosureApproval.active eq 1 }">
                    <c:set var="showCharterApproval" value="${showCharterApproval + 1 }" />
                  </c:if>
                </c:forEach>
                <c:if test="${showCharterApproval ne 0 }">
                  <c:if test="${projectLeader eq 1 || sponser eq 1 || problemSolvingLeader eq 1 ||  coporateProblemSolvingLeader eq 1 || eim eq 1 }">
                  <div class="card-body content-margin">
                    <div class="card card-primary card-outline collapsed-card bg-card-primary-anand">
                      <div class="card-header" data-card-widget="collapse">
                        <h5 class="card-title">Best Practice Information</h5>
                        <div class="card-tools">
                          <button type="button" class="btn btn-tool" data-card-widget="collapse">
                          <i class="fas fa-plus"></i>
                          </button>
                        </div>
                      </div>
                      <div class="card-body">
                        <div class="row">
                          <div class="col-md-12">
                            <table class="table table-bordered dataTable anand-table-font-size">
                              <thead>
                                <tr class="bg-table-head">
                                  <th>Approver Name</th>
                                  <th>Submission Date</th>
                                  <th>Horizontal Deployment</th>
                                  <th>Impact</th>
                                  <th>Cost Effective and Efficient</th>
                                  <th>Overall Effectiveness </th>
                                  <th>Presentation</th>
                                  <th>Total Score</th>
                                  <th>Best Practice Comments</th>
                                </tr>
                              </thead>
                              <tbody>
                                <c:forEach items="${projectCharter.projectClosureApproval }" var="projectClosureApproval" varStatus="projectClosureApprovalStatus">
                                  <c:if test="${projectClosureApproval.active eq 1 &&(projectClosureApproval.approverType eq 1 || projectClosureApproval.approverType eq 3 || projectClosureApproval.approverType eq 6 )}">
                                    <c:set var="charterApprovalCount" value="${charterApprovalCount + 1}" />
                                    <c:set var="rowClassValue" value="${(charterApprovalCount+1) % 2 }" />
                                    <tr class="bg-table-row-${rowClassValue }">
                                      <td>
                                      ${projectClosureApproval.approverId.userFirstName } ${projectClosureApproval.approverId.userLastName }
                                      </td>
                                      <td><fmt:formatDate value="${projectClosureApproval.approvalDate }" pattern="dd-MMM-yyyy"/></td>
                                      <td>
                                        <c:choose>
                                          <c:when test="${projectClosureApproval.firstCriteria eq 1 }">Strongly Disagree</c:when>
                                          <c:when test="${projectClosureApproval.firstCriteria eq 2 }">Disagree</c:when>
                                          <c:when test="${projectClosureApproval.firstCriteria eq 3 }">Neutral</c:when>
                                          <c:when test="${projectClosureApproval.firstCriteria eq 4 }">Agree</c:when>
                                          <c:when test="${projectClosureApproval.firstCriteria eq 5 }">Strongly Agree</c:when>
                                        </c:choose>
                                      </td>
                                      <td>
                                        <c:choose>
                                          <c:when test="${projectClosureApproval.secondCriteria eq 1 }">Strongly Disagree</c:when>
                                          <c:when test="${projectClosureApproval.secondCriteria eq 2 }">Disagree</c:when>
                                          <c:when test="${projectClosureApproval.secondCriteria eq 3 }">Neutral</c:when>
                                          <c:when test="${projectClosureApproval.secondCriteria eq 4 }">Agree</c:when>
                                          <c:when test="${projectClosureApproval.secondCriteria eq 5 }">Strongly Agree</c:when>
                                        </c:choose>
                                      </td>
                                      <td>
                                        <c:choose>
                                          <c:when test="${projectClosureApproval.thirdCriteria eq 1 }">Strongly Disagree</c:when>
                                          <c:when test="${projectClosureApproval.thirdCriteria eq 2 }">Disagree</c:when>
                                          <c:when test="${projectClosureApproval.thirdCriteria eq 3 }">Neutral</c:when>
                                          <c:when test="${projectClosureApproval.thirdCriteria eq 4 }">Agree</c:when>
                                          <c:when test="${projectClosureApproval.thirdCriteria eq 5 }">Strongly Agree</c:when>
                                        </c:choose>
                                      </td>
                                      <td>
                                        <c:choose>
                                          <c:when test="${projectClosureApproval.fourthCriteria eq 1 }">Strongly Disagree</c:when>
                                          <c:when test="${projectClosureApproval.fourthCriteria eq 2 }">Disagree</c:when>
                                          <c:when test="${projectClosureApproval.fourthCriteria eq 3 }">Neutral</c:when>
                                          <c:when test="${projectClosureApproval.fourthCriteria eq 4 }">Agree</c:when>
                                          <c:when test="${projectClosureApproval.fourthCriteria eq 5 }">Strongly Agree</c:when>
                                        </c:choose>
                                      </td>
                                      <td>
                                        <c:choose>
                                          <c:when test="${projectClosureApproval.fifthCriteria eq 1 }">Strongly Disagree</c:when>
                                          <c:when test="${projectClosureApproval.fifthCriteria eq 2 }">Disagree</c:when>
                                          <c:when test="${projectClosureApproval.fifthCriteria eq 3 }">Neutral</c:when>
                                          <c:when test="${projectClosureApproval.fifthCriteria eq 4 }">Agree</c:when>
                                          <c:when test="${projectClosureApproval.fifthCriteria eq 5 }">Strongly Agree</c:when>
                                        </c:choose>
                                      </td>
                                      <td>
                                      ${projectClosureApproval.totalScore }
                                      </td>
                                      <td>${projectClosureApproval.surveyComments }</td>
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
                  </c:if>
                  <div class="card-body content-margin">
                    <div class="card card-primary card-outline collapsed-card bg-card-primary-anand">
                      <div class="card-header" data-card-widget="collapse">
                        <h5 class="card-title">Closure Approval Information</h5>
                        <div class="card-tools">
                          <button type="button" class="btn btn-tool" data-card-widget="collapse">
                          <i class="fas fa-plus"></i>
                          </button>
                        </div>
                      </div>
                      <div class="card-body">
                        <div class="row">
                          <div class="col-md-12">
                            <table class="table table-bordered dataTable anand-table-font-size">
                              <thead>
                                <tr class="bg-table-head">
                                  <th>Approver</th>
                                  <th>Approver Type</th>
                                  <th>Approval Submitted On</th>
                                  <th>Approval Status</th>
                                  <th>Approved On</th>
                                  <th>Approval Comments</th>
                                </tr>
                              </thead>
                              <tbody>
                                <c:forEach items="${projectCharter.projectClosureApproval }" var="projectClosureApproval" varStatus="projectClosureApprovalStatus">
                                  <c:if test="${projectClosureApproval.active eq 1 }">
                                    <c:set var="charterApprovalCount" value="${charterApprovalCount + 1}" />
                                    <c:set var="rowClassValue" value="${projectClosureApprovalStatus.index % 2 }" />
                                    <tr class="bg-table-row-${rowClassValue }">
                                      <td>
                                      ${projectClosureApproval.approverId.userFirstName } ${projectClosureApproval.approverId.userLastName }
                                      </td>
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
                                      <td><fmt:formatDate value="${projectClosureApproval.approvalSubmissionDate }" pattern="dd-MMM-yyyy"/></td>
                                      <td>
                                        <c:choose>
                                          <c:when test="${projectClosureApproval.approvalStatus eq 0 }"><label class="text-gray"><strong>Approval Pending</strong></label></c:when>
                                          <c:when test="${projectClosureApproval.approvalStatus eq 1 }"><label class="text-green">Approved</label></c:when>
                                          <c:when test="${projectClosureApproval.approvalStatus eq 2 }"><label class="text-red">Rejected</label></c:when>
                                          <c:when test="${projectClosureApproval.approvalStatus eq 3 }"><label class="text-red">Terminated</label></c:when>
                                        </c:choose>
                                      </td>
                                      <td><fmt:formatDate value="${projectClosureApproval.approvalDate }" pattern="dd-MMM-yyyy"/></td>
                                      <td>${projectClosureApproval.approvalComments }</td>
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
                </c:if>