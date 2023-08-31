<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="charterApprovalCount" value="0" />
<c:set var="showCharterApproval" value="0" />
                <c:forEach items="${projectCharter.projectCharterApproval }" var="projectCharterApproval" varStatus="projectCharterApprovalStatus">
                  <c:if test="${projectCharterApproval.active eq 1 }">
                    <c:set var="showCharterApproval" value="${showCharterApproval + 1 }" />
                  </c:if>
                </c:forEach>
                <c:if test="${showCharterApproval ne 0 }">
                <div class="card-body content-margin">
                  <div class="card card-primary card-outline collapsed-card bg-card-primary-anand">
                    <div class="card-header" data-card-widget="collapse">
                      <h5 class="card-title">Charter Approval Information</h5>
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
                              <c:forEach items="${projectCharter.projectCharterApproval }" var="projectCharterApproval" varStatus="projectCharterApprovalStatus">
                                <c:if test="${projectCharterApproval.active eq 1 }">
                                  <c:set var="charterApprovalCount" value="${charterApprovalCount + 1}" />
                                  <c:set var="rowClassValue" value="${projectCharterApprovalStatus.index % 2 }" />
                                  <tr class="bg-table-row-${rowClassValue }">
                                    <td>
                                      ${projectCharterApproval.approverId.userFirstName } ${projectCharterApproval.approverId.userLastName }
                                    </td>
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
                                    <td><fmt:formatDate value="${projectCharterApproval.approvalSubmissionDate }" pattern="dd-MMM-yyyy"/></td>
                                    <td>
                                      <c:choose>
                                        <c:when test="${projectCharterApproval.approvalStatus eq 0 }"><label class="text-gray"><strong>Approval Pending</strong></label></c:when>
                                        <c:when test="${projectCharterApproval.approvalStatus eq 1 }"><label class="text-green">Approved</label></c:when>
                                        <c:when test="${projectCharterApproval.approvalStatus eq 2 }"><label class="text-red">Rejected</label></c:when>
                                        <c:when test="${projectCharterApproval.approvalStatus eq 3 }"><label class="text-red">Terminated</label></c:when>
                                      </c:choose>
                                    </td>
                                    <td><fmt:formatDate value="${projectCharterApproval.approvalDate }" pattern="dd-MMM-yyyy"/></td>
                                    <td>${projectCharterApproval.approvalComments }</td>
                                  </tr>
                                </c:if>
                              </c:forEach>
                            </tbody>
                            <c:if test="${not empty projectCharter.launchDate }">
                            <tfoot>
                              <tr class="bg-table-foot">
                                <td colspan='6'>
                                  Project Launched - <strong><fmt:formatDate value="${projectCharter.launchDate }" pattern="dd-MMM-yyyy"/></strong>
                                </td>
                              </tr>
                            </tfoot>
                            </c:if>
                          </table>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card-body content-margin">
                  <div class="card card-primary card-outline  bg-card-primary-anand card-header">
                    <h5 class="card-title">Project Launched - <fmt:formatDate value="${projectCharter.launchDate }" pattern="dd-MMM-yyyy"/> </h5>
                  </div>
                </div>
                </c:if>