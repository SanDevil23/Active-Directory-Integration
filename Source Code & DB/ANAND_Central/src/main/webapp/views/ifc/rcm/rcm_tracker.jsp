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
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>RCM TRACKER | ANAND GROUP</title>
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
                <h5 class="font-color-anand-one"><strong>RCM TRACKER</strong></h5>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="dashboard" title="Dashboard"><strong>Dashboard</strong></a></li>
                  <li class="breadcrumb-item"><a href="dashboard-ifc" title="Dashboard"><strong>IFC-Dashboard</strong></a></li>
                  <li class="breadcrumb-item active"><strong>RCM Tracker</strong></li>
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
		  <form action="postTrackerValue" id="postTrackerValue" method="post" >
		    <div class="row">
		      <div class="col-md-3">
                <h6>Year</h6>
                <input type="hidden" id="tempYearId" value="${tempYearId }" />
                <select name="yearId" class="custom-select mb-3 text-light border-0 bg-white yearId" id='date-dropdown'></select>
              </div>
		      <div class="col-md-3">
                <h6>Parent Entity</h6>
                <input type="hidden" id="tempParentId" value="${tempParentId }" />
                <select class="custom-select mb-3 text-light border-0 bg-white parentEntityId" name="parentEntityId" id="parentEntityId">
                  <option value="-1">Select Parent Entity</option>
                  <c:forEach items="${activeParentEntityList}" var="parentEntity">
                    <option value="${parentEntity.mEntityId }">${parentEntity.entityAcronym } - ${parentEntity.entityName}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="col-md-3 childEntityList">
                <h6>Child Entity</h6>
                <input type="hidden" id="tempPlantId" value="${tempPlantId }" />
                <select class="custom-select mb-3 text-light border-0 bg-white plantId" name="plantId" id="plantId">
                  <option value="-1">Select Child Entity</option>
                  <c:forEach items="${activeChildEntityList}" var="parentEntity">
                    <c:choose>
                      <c:when test="${not empty tempParentId }">
                        <c:if test="${tempParentId eq parentEntity.entitySource.mEntityId }">
                          <option value="${parentEntity.mEntityId }">${parentEntity.entityAcronym } - ${parentEntity.entityName} - ${parentEntity.locationId.locationName}</option>
                        </c:if>
                      </c:when>
                      <c:otherwise>
                        <option value="${parentEntity.mEntityId }">${parentEntity.entityAcronym } - ${parentEntity.entityName} - ${parentEntity.locationId.locationName}</option>
                      </c:otherwise>
                    </c:choose>
                  </c:forEach>
                </select>
              </div>
              <div class="col-md-3">
                <h6>Process/Cycle</h6>
                <input type="hidden" id="tempProcessId" value="${tempProcessId }" />
                <select class="custom-select mb-3 text-light border-0 bg-white processId" name="processId" id="processId">
                  <option value="-1">Select Process/Cycle</option>
                  <c:forEach items="${activeProcessList}" var="process">
                    <option value="${process.mProcessId }">${process.processName }</option>
                  </c:forEach>
                </select>
              </div>
              <div class="col-md-3">
                <h6>Frequency</h6>
                <input type="hidden" id="tempFrequency" value="${tempFrequency }" />
                <select class="custom-select mb-3 text-light border-0 bg-white frequency" name="frequency" id="frequency">
                  <option value="-1">Select Frequency</option>
                  <option value="1">Weekly</option>
		          <option value="2">Every Fortnight</option>
		          <option value="3">Monthly</option>
		          <option value="4">Quarterly</option>
		          <option value="5">Yearly</option>
		          <option value="6">Once in Two Years</option>
                </select>
              </div>
              <div class="col-md-3">
                <h6>Responsible Person</h6>
                <input type="hidden" id="tempResponsiblePersonId" value="${tempResponsiblePersonId }" />
                <select class="custom-select mb-3 text-light border-0 bg-white responsiblePersonId" name="responsiblePersonId" id="responsiblePersonId">
                  <option value="-1">Select Responsible Person</option>
                  <c:forEach items="${responsiblePersonList}" var="responsiblePerson">
                    <option value="${responsiblePerson.mUserId }">${responsiblePerson.userFirstName } ${responsiblePerson.userLastName }</option>
                  </c:forEach>
                </select>
              </div>
              <div class="col-md-3">
                <h6>Manager</h6>
                <input type="hidden" id="tempLineManagerId" value="${tempLineManagerId }" />
                <select class="custom-select mb-3 text-light border-0 bg-white lineManagerId" name="lineManagerId" id="lineManagerId">
                  <option value="-1">Select Manager</option>
                  <c:forEach items="${lineManagerList}" var="lineManager">
                    <option value="${lineManager.mUserId }">${lineManager.userFirstName } ${lineManager.userLastName }</option>
                  </c:forEach>
                </select>
              </div>
              <div class="col-md-3">
                <h6>PRAAC</h6>
                <input type="hidden" id="tempPraacId" value="${tempPraacId }" />
                <select class="custom-select mb-3 text-light border-0 bg-white praacId" name="praacId" id="praacId">
                  <option value="-1">Select PRAAC</option>
                  <c:forEach items="${praacList}" var="praac">
                    <option value="${praac.mUserId }">${praac.userFirstName } ${praac.userLastName }</option>
                  </c:forEach>
                </select>
              </div>
              <div class="col-md-10"></div>
              <div class="col-md-1">
                <button type="submit" id="savePostTrackerValue" onclick="savePostTrackerValue();" title="Submit Cycle Information" class="btn btn-default">Search</button>
              </div>
              <div class="col-md-1">
                <button type="button" id="clearPostTrackerValue" title="Clear Cycle Information" class="btn btn-default clearRcmTrackerFilter">Clear</button>
              </div>
		    </div>
		    </form>
		    <br>
		    <div class="row">
		      <div class="col-md-12" style="overflow-x: auto;">
		        <table class="table table-bordered dataTable anand-table-font-size" id="departmentTable" style="width:100%%">
		          <thead>
		            <tr class="bg-table-head">
		              <th>Action</th>
		              <th>Plant</th>
		              <th>Upload Date</th>
		              <th>Department</th>
		              <th>Control No</th>
		              <th>Process</th>
		              <th>Sub Process</th>
		              <th>Process Owner</th>
		              <th>SOH</th>
		              <th>Line Manager</th>
		              <th>PRAAC</th>
		              <th>Score</th>
		            </tr>
		          </thead>
		          <tbody>
		            <c:forEach items="${txnList }" var="txn" varStatus="txnLoop">
		              <tr class="bg-table-row-${txnLoop.index %2 }">
		                <td>${txn.actionForList }</td>
		                <td>${txn.plantReference.plantId.entityName } - ${txn.plantReference.plantId.locationId.locationName }</td>
		                <td><fmt:formatDate pattern = "dd-MMM-yyyy" value = "${txn.controlReference.rcmCreatedOn }" /></td>
		                <td>${txn.controlReference.mDepartmentId.departmentName  }</td>
		                <td>${txn.controlReference.controlNo }</td>
		                <td>${txn.controlReference.mProcessId.processName }</td>
		                <td>${txn.controlReference.subProcess }</td>
		                <td>${txn.controlReference.processOwner }</td>
		                <td>${txn.sohBy.userFirstName } ${txn.sohBy.userMiddleName } ${txn.sohBy.userLastName }</td>
		                <td>${txn.lineManager.userFirstName } ${txn.lineManager.userMiddleName } ${txn.lineManager.userLastName }</td>
		                <td>${txn.praac.userFirstName } ${txn.praac.userMiddleName } ${txn.praac.userLastName }</td>
		                <td>${txn.score }</td> 
		              </tr>
		            </c:forEach>
		          </tbody>
		          <tfoot>
		            <tr class="bg-table-foot">
		              <th>Action</th>
		              <th>Plant</th>
		              <th>Upload Date</th>
		              <th>Department</th>
		              <th>Control No</th>
		              <th>Process</th>
		              <th>Sub Process</th>
		              <th>Process Owner</th>
		              <th>SOH</th>
		              <th>Line Manager</th>
		              <th>PRAAC</th>
		              <th>Score</th>
		            </tr>
		          </tfoot>
		        </table>
		      </div>
		    </div>
		  </div>
		</section>
		
		<div class="modal fade" id="rcmSOHTransactionApprovalModal">
		  <div class="modal-dialog modal-xl">
		    <div class="modal-content">
		      <form:form modelAttribute="transaction" action="rcm-tracker" id="rcmSOHTransactionApproval" method="post" enctype="multipart/form-data">
		        <form:input type="hidden" path="rcmTransactionId" id="rcmTransactionId" />
		        <div class="modal-header bg-secondary">
		          <h4 class="modal-title">RCM Transaction SOH Approval Information</h4>
		        </div>
		        <div class="modal-body">
		          <div class="row">
		            <div class="col-md-12">
		              <div class="card-body">
		                <div class="row">
		                  <div class="col-md-3">
		                    <div class="form-group">
		                      <label for="plant">Plant Name</label>
		                      <br><span class="plant"></span>
		                    </div>
		                  </div>
		                  <div class="col-md-3">
		                    <div class="form-group">
		                      <label for="uploadDate">Upload Date</label>
		                      <br><span class="uploadDate"></span>
		                    </div>
		                  </div>
		                  <div class="col-md-3">
                            <div class="form-group">
                              <label for="tempDepartmentId">Department</label>
                              <br><span class="tempDepartmentId"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
		                    <div class="form-group">
		                      <label for="controlNo">Control No</label>
		                      <br><span class="controlNo"></span>
		                    </div>
		                  </div>
		                  <div class="col-md-3">
		                    <div class="form-group">
		                      <label for="tempProcessId">Process/Cycle</label>
		                      <br><span class="tempProcessId"></span>
		                    </div>
		                  </div>  
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="subProcess">Sub Process</label>
                              <br><span class="subProcess"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="processOwner">Process Owner</label>
                              <br><span class="processOwner"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="controlObjective">Control Objective</label>
                              <br><span class="controlObjective"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="risk">Risk</label>
                              <br><span class="risk"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="entityControl">Entity Control</label>
                              <br><span class="entityControl"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="document">Document Upload</label>
                              <br><span class="document"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="riskRating">Risk Rating</label>
                              <br><span class="riskRating"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="controlStartDate">Control Start Date</label>
                              <br><span class="controlStartDate"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="validityDate">Validity Date</label>
                              <br><span class="validityDate"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="controlFrequency">Control Frequency</label>
                              <br><span class="controlFrequency"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="uploadFrequency">uploadFrequency</label>
                              <br><span class="uploadFrequency"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="fraudRisk">Fraud Risk</label>
                              <br><span class="fraudRisk"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="uniqueReferred">Unique/Referred</label>
                              <br><span class="uniqueReferred"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="keyInfo">Key/Non-Key/Others</label>
                              <br><span class="keyInfo"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="preventiveDetective">Preventive/Detective</label>
                              <br><span class="preventiveDetective"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="controlType">Type Of Control</label>
                              <br><span class="controlType"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="selfCertificateCheck">Self Certification Check</label>
                              <br><span class="selfCertificateCheck"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="remarks">Remarks</label>
                              <br><span class="remarks"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="soh">SOH</label>
                              <br><span class="soh"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="lineManager">Line Manager</label>
                              <br><span class="lineManager"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="praac">PRAAC</label>
                              <br><span class="praac"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="compliantDate">Date of Compliance Initiation</label>
                              <br><span class="compliantDate"></span>
                            </div>
                          </div>
                          <div class="col-md-3">
                            <div class="form-group">
                              <label for="score">Score</label>
                              <br><span class="score"></span>
                            </div>
                          </div>
		                </div>
		                <div class="row sohInfoDiv">
		                  <div class="col-md-12" align="center">
		                    <h5 class="font-color-anand-one font-weight-bold">Control Compliance Information</h5>
		                  </div>
		                  <div class="col-md-4">
                            <div class="form-group">
                              <label for="complianceFlag">Compliance Flag</label>
                              <br><span class="complianceFlag"></span>
                            </div>
                          </div>
                          <div class="col-md-4">
                            <div class="form-group">
                              <label for="">Download Proof</label><br>
                              <a id="fileDownload" href="" target="_blank" title="Download Proof Attachment"></a>
                            </div>
                          </div>
                          <div class="col-md-4">
                            <div class="form-group">
                              <label for="comments">Comments</label>
                              <br><span class="comments"></span>
                            </div>
                          </div>
		                </div>
		                <hr style="height: 5px; background: #6c757d; border:none;"/>
		                <div class="row submitControlComplianceInformation">
		                  <div class="col-md-6">
		                    <div class="form-group" id="complianceFlag">
		                      <label for="complianceFlag"><span class="mandatory">*</span>Compliance Status</label>
		                      <div class="custom-control custom-radio">
		                        <form:radiobutton class="custom-control-input" value="1" id="complianceFlag1" name="complianceFlag" path="complianceFlag"/>
		                        <label for="complianceFlag1" class="custom-control-label text-green">Compliant</label>
		                      </div>
		                      <div class="custom-control custom-radio">
		                        <form:radiobutton class="custom-control-input" value="0" id="complianceFlag2" name="complianceFlag" path="complianceFlag"/>
		                        <label for="complianceFlag2" class="custom-control-label text-red">Non-Compliant</label>
		                      </div>
		                      <span class="error invalid-feedback" id="complianceFlagError" style="display:block" ></span> 
		                    </div>
		                  </div>
		                  <div class="col-md-6">
		                    <div class="input-group">
                              <div class="custom-file">
                                <form:input type="file" name="tempProofAttachment" id="tempProofAttachment" path="tempProofAttachment" class="form-control-file" accept=".txt,,.csv,application/vnd.ms-excel" />
                              </div>
                            </div>
                          </div>
                          <div class="col-md-6">
	   	                    <div class="form-group">
		                      <label for="comments"><span class="mandatory">*</span>Comments</label>
		                      <form:textarea class="form-control" id="comments" placeholder="Enter Remarks" path="comments" />
		                      <span class="error invalid-feedback" id="commentsError"></span>
		                    </div>
		                  </div>
		              </div>
		            </div>
		          </div>
		        </div>
		        <div class="col-md-12 sohInfoDiv" style="overflow-x: auto;">
		          <h5 class="font-color-anand-two font-weight-bold">Approval History</h5>
		          <table class="table table-bordered anand-table-font-size" id="showAllTransactionInfo">
		            <thead>
		              <tr class="bg-table-head">
		                <th>Approver Type</th>
		                <th>Approved/Rejected</th>
		                <th>Approval Comments</th>
		                <th>Approval TimeStamp</th>
		              </tr>          
		            </thead>
		            <tbody>
		            </tbody>
		            <tfoot>
		              <tr class="bg-table-foot">
		                <th>Approver Type</th>
		                <th>Approved/Rejected</th>
	  	                <th>Approval Comments</th>
		                <th>Approval TimeStamp</th>
		              </tr>
		            </tfoot>
		          </table>
		        </div>
		      
		        <div class="modal-footer justify-content-between">
		          <button id="userInfoCloase" type="button" class="btn bg-info-anand-danger" data-dismiss="modal">Close</button>
		          <button type="submit" id="saveRcmSOHTransactionApproval" class="btn bg-color-anand-two text-white" title="Save SOH Approval Changes">Submit</button>
   		        </div>
		      </div>
		    </form:form>
		  </div>
	    </div>
	  </div>
	  <div class="modal fade" id="rcmTransactionInformationModal">
	    <div class="modal-dialog modal-xl">
	      <div class="modal-content">
	        <div class="modal-header bg-secondary">
	          <h4 class="modal-title">RCM Transaction Information</h4>
	        </div>
	        <div class="modal-body">
	          <div class="row">
	            <div class="col-md-12">
	              <div class="card-body">
	                <div class="row">
                      <div class="col-md-3">
	                    <div class="form-group">
	                      <label for="plant">Plant Name</label>
	                      <br><span class="plant"></span>
	                    </div>
	                  </div>
	                  <div class="col-md-3">
	                    <div class="form-group">
	                      <label for="uploadDate">Upload Date</label>
	                      <br><span class="uploadDate"></span>
	                    </div>
	                  </div>
	                  <div class="col-md-3">
                        <div class="form-group">
                          <label for="tempDepartmentId">Department</label>
                          <br><span class="tempDepartmentId"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
		                <div class="form-group">
		                  <label for="controlNo">Control No</label>
		                  <br><span class="controlNo"></span>
		                </div>
		              </div>
		              <div class="col-md-3">
                        <div class="form-group">
	                      <label for="tempProcessId">Process/Cycle</label>
	                      <br><span class="tempProcessId"></span>
	                    </div>
	                  </div>  
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="subProcess">Sub Process</label>
                          <br><span class="subProcess"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="processOwner">Process Owner</label>
                          <br><span class="processOwner"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="controlObjective">Control Objective</label>
                          <br><span class="controlObjective"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="risk">Risk</label>
                          <br><span class="risk"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="entityControl">Entity Control</label>
                          <br><span class="entityControl"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="document">Document Upload</label>
                          <br><span class="document"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="riskRating">Risk Rating</label>
                          <br><span class="riskRating"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="controlStartDate">Control Start Date</label>
                          <br><span class="controlStartDate"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="validityDate">Validity Date</label>
                          <br><span class="validityDate"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="controlFrequency">Control Frequency</label>
                          <br><span class="controlFrequency"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="uploadFrequency">uploadFrequency</label>
                          <br><span class="uploadFrequency"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="fraudRisk">Fraud Risk</label>
                          <br><span class="fraudRisk"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="uniqueReferred">Unique/Referred</label>
                          <br><span class="uniqueReferred"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="keyInfo">Key/Non-Key/Others</label>
                          <br><span class="keyInfo"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="preventiveDetective">Preventive/Detective</label>
                          <br><span class="preventiveDetective"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="controlType">Type Of Control</label>
                          <br><span class="controlType"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="selfCertificateCheck">Self Certification Check</label>
                          <br><span class="selfCertificateCheck"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="remarks">Remarks</label>
                          <br><span class="remarks"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="soh">SOH</label>
                          <br><span class="soh"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="lineManager">Line Manager</label>
                          <br><span class="lineManager"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="praac">PRAAC</label>
                          <br><span class="praac"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="compliantDate">Date of Compliance Initiation</label>
                          <br><span class="compliantDate"></span>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <label for="score">Score</label>
                          <br><span class="score"></span>
                        </div>
                      </div>
	                </div>
	                <br>
		            <div class="row moreInfoDiv">
		              <div class="col-md-12">
		                <h5 class="font-color-anand-one font-weight-bold">Control Compliance Information</h5>
		              </div>
		              <div class="col-md-4">
                        <div class="form-group">
                          <label for="complianceFlag">Compliance Flag</label>
                          <br><span class="complianceFlag"></span>
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="">Download Proof</label><br>
                          <a id="fileDownload1" href="" target="_blank" title="Download Proof Attachment"></a>
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="comments">Comments</label>
                          <br><span class="comments"></span>
                        </div>
                      </div>
   	                </div>      
		          </div>
		        </div>
		      </div>
		    </div>      
		            
		    <div class="col-md-12 moreInfoDiv" style="overflow-x: auto;">
              <h5 class="font-color-anand-two font-weight-bold">Approval History</h5>
	          <table class="table table-bordered anand-table-font-size" id="showTransactionInfo">
  	            <thead>
	              <tr class="bg-table-head">
		            <th>Approver Type</th>
		            <th>Approved/Rejected</th>
		            <th>Approval Comments</th>
                    <th>Approval TimeStamp</th>
	              </tr>          
	            </thead>
	            <tbody></tbody>
	            <tfoot>
	              <tr class="bg-table-foot">
	                <th>Approver Type</th>
	                <th>Approved/Rejected</th>
	                <th>Approval Comments</th>
	                <th>Approval TimeStamp</th>
	              </tr>
	            </tfoot>
	          </table>
	        </div>
		    <div class="modal-footer justify-content-between">
		      <button id="userInfoCloase" type="button" class="btn bg-info-anand-danger" data-dismiss="modal">Close</button>
            </div>
		  </div>
		</div>
	  </div>
	  
	  <div class="modal fade" id="rcmTransactionApprovalModal">
        <div class="modal-dialog modal-xl">
	      <div class="modal-content">
	        <form:form modelAttribute="tracker" action="rcm-tracker1" id="rcmTransactionApproval" method="post" enctype="multipart/form-data">
	          <form:input type="text" id="transaction" path="transaction" />
		      <form:input type="text" id="approverType" path="approverType" />
		      <div class="modal-header bg-secondary">
		        <h4 class="modal-title" id="headingInfo">RCM Transaction Line Manager/PRAAC Approval Information</h4>
		      </div>
		      <div class="modal-body">
		        <div class="row">
		          <div class="col-md-12">
		            <div class="card-body">
		              <div class="row">
		                <div class="col-md-3">
		                  <div class="form-group">
		                    <label for="plant">Plant Name</label>
		                    <br><span class="plant"></span>
		                  </div>
		                </div>
		                
		                <div class="col-md-3">
		                  <div class="form-group">
		                    <label for="uploadDate">Upload Date</label>
		                    <br><span class="uploadDate"></span>
		                  </div>
		                </div>
		                <div class="col-md-3">
                          <div class="form-group">
                            <label for="tempDepartmentId">Department</label>
                            <br><span class="tempDepartmentId"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
		                  <div class="form-group">
		                    <label for="controlNo">Control No</label>
		                    <br><span class="controlNo"></span>
		                  </div>
		                </div>
		                <div class="col-md-3">
		                  <div class="form-group">
		                    <label for="tempProcessId">Process/Cycle</label>
		                    <br><span class="tempProcessId"></span>
		                  </div>
		                </div>  
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="subProcess">Sub Process</label>
                            <br><span class="subProcess"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="processOwner">Process Owner</label>
                            <br><span class="processOwner"></span>
                          </div>
                        </div>
                         <div class="col-md-3">
                          <div class="form-group">
                            <label for="controlObjective">Control Objective</label>
                            <br><span class="controlObjective"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="risk">Risk</label>
                            <br><span class="risk"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="entityControl">Entity Control</label>
                            <br><span class="entityControl"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="document">Document Upload</label>
                            <br><span class="document"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="riskRating">Risk Rating</label>
                            <br><span class="riskRating"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="controlStartDate">Control Start Date</label>
                            <br><span class="controlStartDate"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="validityDate">Validity Date</label>
                            <br><span class="validityDate"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="controlFrequency">Control Frequency</label>
                            <br><span class="controlFrequency"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="uploadFrequency">uploadFrequency</label>
                            <br><span class="uploadFrequency"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="fraudRisk">Fraud Risk</label>
                            <br><span class="fraudRisk"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="uniqueReferred">Unique/Referred</label>
                            <br><span class="uniqueReferred"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="keyInfo">Key/Non-Key/Others</label>
                            <br><span class="keyInfo"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="preventiveDetective">Preventive/Detective</label>
                            <br><span class="preventiveDetective"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="controlType">Type Of Control</label>
                            <br><span class="controlType"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="selfCertificateCheck">Self Certification Check</label>
                            <br><span class="selfCertificateCheck"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="remarks">Remarks</label>
                            <br><span class="remarks"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="soh">SOH</label>
                            <br><span class="soh"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="lineManager">Line Manager</label>
                            <br><span class="lineManager"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="praac">PRAAC</label>
                            <br><span class="praac"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="compliantDate">Date of Compliance Initiation</label>
                            <br><span class="compliantDate"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="score">Score</label>
                            <br><span class="score"></span>
                          </div>
                        </div>
		              </div>
		              <div class="row">
		                <div class="col-md-12" align="center">
		                  <h5 class="font-color-anand-one font-weight-bold">Control Compliance Information</h5>
		                </div>
		                <div class="col-md-4">
                          <div class="form-group">
                            <label for="complianceFlag">Compliance Flag</label>
                            <br><span class="complianceFlag"></span>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="form-group">
                            <label for="">Download Proof</label><br>
                            <a id="fileDownload" href="" target="_blank" title="Download Proof Attachment"></a>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="form-group">
                            <label for="comments">Comments</label>
                            <br><span class="comments"></span>
                          </div>
                        </div>
		              </div>
		              <div class="row">
		                <div class="col-md-12">
		                  <h5 class="font-color-anand-two font-weight-bold">Approval Action</h5>
		                </div>
		                <div class="col-md-6">
		                  <div class="form-group" id="approvedRejected">
		                    <label for="approvedRejected"><span class="mandatory">*</span>Approval Status</label>
		                    <div class="custom-control custom-radio">
		                      <form:radiobutton class="custom-control-input" value="1" id="approvedRejected1" name="approvedRejected" path="approvedRejected"/>
		                      <label for="approvedRejected1" class="custom-control-label text-green">Approved</label>
		                    </div>
		                    <div class="custom-control custom-radio">
		                      <form:radiobutton class="custom-control-input" value="0" id="approvedRejected2" name="approvedRejected" path="approvedRejected"/>
		                      <label for="approvedRejected2" class="custom-control-label text-red">Rejected</label>
		                    </div>
		                    <span class="error invalid-feedback" id="approvedRejectedError" style="display:block" ></span> 
		                  </div>
		                </div>
                        <div class="col-md-6">
		                  <div class="form-group">
		                    <label for="comments"><span class="mandatory">*</span>Comments</label>
		                    <form:textarea class="form-control" id="comments1" placeholder="Enter Remarks" path="comments" />
		                    <span class="error invalid-feedback" id="commentsError1"></span>
		                  </div>
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		      <div class="col-md-12" style="overflow-x: auto;">
		        <table class="table table-bordered anand-table-font-size" id="addTransactionInfo">
		          <thead>
		            <tr class="bg-table-head">
		              <th>Approver Type</th>
		              <th>Approved/Rejected</th>
		              <th>Approval Comments</th>
		              <th>Approval TimeStamp</th>
		            </tr>          
		          </thead>
		          <tbody>
		          </tbody>
		          <tfoot>
		            <tr class="bg-table-foot">
		              <th>Approver Type</th>
		              <th>Approved/Rejected</th>
		              <th>Approval Comments</th>
		              <th>Approval TimeStamp</th>
		            </tr>
		          </tfoot>
		        </table>
		      </div>
		      <div class="modal-footer justify-content-between">
		        <button id="userInfoCloase" type="button" class="btn bg-info-anand-danger" data-dismiss="modal">Close</button>
		        <button type="submit" id="saveRcmTransactionApproval" class="btn bg-color-anand-two text-white" title="Save Tracker Approval Changes">Submit</button>
		      </div>
		    </form:form>	
		  </div>
		</div>
	  </div>
	  
    </div>
      <%@include file="../includeJSP/footer.jsp"%>
    </div>
    <%@include file="../../includeJSP/jsFiles.jsp"%>
    <%@include file="../../includeJSP/dataTablesImport.jsp"%>
    <script src="usedStaticFiles/js/jsp_js_files/ifc/rcm/rcm_tracker.js"></script>
  </body>
</html>