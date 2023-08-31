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
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>RCM MASTER | ANAND GROUP</title>
    <title>RCM MASTER | ANAND GROUP</title>
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
                <h5 class="font-color-anand-one"><strong>RCM MASTER</strong></h5>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="dashboard" title="Dashboard"><strong>Dashboard</strong></a></li>
                  <li class="breadcrumb-item active"><strong>RCM Master</strong></li>
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
		        <form:form modelAttribute="rcm" action="rcm-master" id="rcmMaster" method="post">
		        <div class="card card-primary card-outline collapsed-card bg-card-primary-anand">
		          <div class="card-header" data-card-widget="collapse">
		            <h5 class="card-title">Add RCM Master</h5>
		            <div class="card-tools">
		              <button type="button" class="btn btn-tool" data-card-widget="collapse">
		                <i class="fas fa-plus"></i>
		              </button>
		              <input type="hidden" value="${openAddModal }" id="openAddModel" />
		              <input type="hidden" value="${openEditModel }" id="openEditModel" />
		            </div>
		          </div>
		          <div class="card-body" style="display: none;">
		            <div class="row">
		              <div class="col-md-3">
		                <div class="form-group">
		                  <label for="controlNo"><span class="mandatory">*</span>Control No</label>
		                  <form:input type="text" class="form-control" id="controlNo" placeholder="Enter Control No" path="controlNo" />
		                   <!-- <input type="text" class="form-control" id="controlNo" placeholder="Enter Control No" />  -->
		                  <span class="error invalid-feedback" id="controlNoError"></span>
		                </div>
		              </div>
		              <div class="col-md-3">
		                <div class="form-group">
		                  <label for="tempProcessId"><span class="mandatory">*</span>Process/Cycle</label>
		                  <%-- <form:input type="text" class="form-control" id="process" placeholder="Enter Department Name" path="controlNo" /> --%>
		                  <form:select class="form-control" id="tempProcessId" path="tempProcessId" >
		                    <form:option value="-1">Select Process</form:option>
		                    <c:forEach items="${activeProcessList }" var="process" varStatus="processLoop">
		                      <form:option value="${process.mProcessId }">${process.processName }</form:option>
		                    </c:forEach>
		                  </form:select>
		                  <span class="error invalid-feedback" id="tempProcessIdError"></span>
		                </div>
		              </div>
		              <div class="col-md-3">
		                <div class="form-group">
		                  <label for="subProcess"><span class="mandatory">*</span>Sub Process</label>
		                  <form:input type="text" class="form-control" id="subProcess" placeholder="Enter Sub Process" path="subProcess" />
		                  <span class="error invalid-feedback" id="subProcessError"></span>
		                </div>
		              </div>
		              <div class="col-md-3">
		                <div class="form-group">
		                  <label for="processOwner"><span class="mandatory">*</span>Process Owner</label>
		                  <form:input type="text" class="form-control" id="processOwner" placeholder="Enter Process Owner" path="processOwner" />
		                  <span class="error invalid-feedback" id="processOwnerError"></span>
		                </div>
		              </div>
		              <div class="col-md-3">
		                <div class="form-group">
		                  <label for="controlObjective"><span class="mandatory">*</span>Control Objective</label>
		                  <form:input type="text" class="form-control" id="controlObjective" placeholder="Enter Control Objective" path="controlObjective" />
		                  <span class="error invalid-feedback" id="controlObjectiveError"></span>
		                </div>
		              </div>
		              <div class="col-md-3">
		                <div class="form-group">
		                  <label for="risk"><span class="mandatory">*</span>Risk</label>
		                  <form:input type="text" class="form-control" id="risk" placeholder="Enter Risk" path="risk" />
		                  <span class="error invalid-feedback" id="riskError"></span>
		                </div>
		              </div>
		              <div class="col-md-3">
		                <div class="form-group">
		                  <label for="entityControl"><span class="mandatory">*</span>Entity Control(Revised)</label>
		                  <form:input type="text" class="form-control" id="entityControl" placeholder="Enter Entity Control Revised" path="entityControl" />
		                  <span class="error invalid-feedback" id="entityControlError"></span>
		                </div>
		              </div>
		              <div class="col-md-3">
		                <div class="form-group">
		                  <label for="documentUpload"><span class="mandatory">*</span>Document For Upload</label>
		                  <form:textarea class="form-control" path="" id="documentUpload" placeholder="Enter Documnets for Upload Details"/>
		                  <span class="error invalid-feedback" id="documentUploadError"></span>
		                </div>
		              </div>
		              <div class="col-md-3">
		                <div class="form-group">
		                  <label for="tempDepartmentId"><span class="mandatory">*</span>Department</label>
		                  <%-- <form:input type="text" class="form-control" id="tempDepartmentId" placeholder="Enter Department Name" path="department" /> --%>
		                  <form:select class="form-control" id="tempDepartmentId" path="tempDepartmentId">
		                    <form:option value="-1">Select Department</form:option>
		                    <c:forEach items="${activeDepartmentList }" var="department" varStatus="departmentLoop">
		                      <form:option value="${department.mDepartmentId }">${department.departmentName }</form:option>
		                    </c:forEach>
		                  </form:select>
		                  <span class="error invalid-feedback" id="tempDepartmentIdError"></span>
		                </div>
		              </div>
		              <div class="col-md-3">
		                <div class="form-group">
		                  <label for="riskRating"><span class="mandatory">*</span>Risk Rating</label>
		                  <%-- <form:input type="text" class="form-control" id="riskRating" placeholder="Enter Department Name" path="riskRating" /> --%>
		                  <form:select class="form-control" id="riskRating" path="riskRating">
		                    <form:option value="-1">Select Risk Rating</form:option>
		                    <form:option value="1">Critical</form:option>
		                    <form:option value="2">Important</form:option>
		                    <form:option value="3">Preventive</form:option>
		                  </form:select>
		                  <span class="error invalid-feedback" id="riskRatingError"></span>
		                </div>
		              </div>
		              <div class="col-md-3">
		                <div class="form-group">
		                  <label for="controlFrequency"><span class="mandatory">*</span>Control Frequency</label>
		                  <%-- <form:input type="text" class="form-control" id="controlFrequency" placeholder="Enter Department Name" path="controlFrequency" /> --%>
		                  <form:select class="form-control" id="controlFrequency" path="controlFrequency">
		                    <form:option value="-1">Select Frequency</form:option>
		                    <form:option value="1">Weekly</form:option>
		                    <form:option value="2">Every Fortnight</form:option>
		                    <form:option value="3">Monthly</form:option>
		                    <form:option value="4">Quaterly</form:option>
		                    <form:option value="5">Yearly</form:option>
		                    <form:option value="6">Once in Two Years</form:option>
		                  </form:select>
		                  <span class="error invalid-feedback" id="controlFrequencyError"></span>
		                </div>
		              </div>
		              <div class="col-md-3">
		                <div class="form-group">
		                  <label for="uploadFrequency"><span class="mandatory">*</span>Upload Frequency</label>
		                  <%-- <form:input type="text" class="form-control" id="uploadFrequency" placeholder="Enter Department Name" path="uploadFrequency" /> --%>
		                  <form:select class="form-control" id="uploadFrequency" path="uploadFrequency">
		                    <form:option value="-1">Select Upload Frequency</form:option>
		                    <form:option value="1">Weekly</form:option>
		                    <form:option value="2">Every Fortnight</form:option>
		                    <form:option value="3">Monthly</form:option>
		                    <form:option value="4">Quaterly</form:option>
		                    <form:option value="5">Yearly</form:option>
		                    <form:option value="6">Once in Two Years</form:option>
		                  </form:select>
		                  <span class="error invalid-feedback" id="uploadFrequencyError"></span>
		                </div>
		              </div>
		              
		             <div class="col-md-3">
		               <label for="controlStartDate"><span class="mandatory">*</span>Control Start Date</label>
		               <div class="input-group">
		                 <div class="input-group-prepend">
		                   <span class="input-group-text">
		                     <i class="far fa-calendar-alt"> </i>
		                   </span>
		                 </div>
		                 <form:input id="controlStartDateTemp" name="controlStartDateTemp" title="Control Start Date" type="text" class="form-control float-right" value="" path="controlStartDateTemp" />
		                 <span class="error invalid-feedback" id="controlStartDateTempError"></span>    
		               </div>
		             </div>

		             <div class="col-md-3">
		               <label for="validityDate"><span class="mandatory">*</span>Validity Date</label>
		               <div class="input-group">
		                 <div class="input-group-prepend">
		                   <span class="input-group-text">
		                     <i class="far fa-calendar-alt"> </i>
		                   </span>
		                 </div>
		                 <form:input id="validityDateTemp" name="validityDateTemp" title="Validity Date" type="text" class="form-control float-right" value="" path="validityDateTemp" />
		                 <span class="error invalid-feedback" id="validityDateTempError"></span>    
		               </div>
		             </div>

		             <div class="col-md-3">
		               <div class="form-group" id="fraudRisk">
		                 <label for="fraudRisk"><span class="mandatory">*</span>Fraud Risk</label>
		                 <div class="custom-control custom-radio">
		                   <form:radiobutton class="custom-control-input" id="fraudRisk1" name="fraudRisk" path="fraudRisk" value="0"/>
		                   <label for="fraudRisk1" class="custom-control-label">Yes</label>
		                 </div>
		                 <div class="custom-control custom-radio">
		                   <form:radiobutton class="custom-control-input" id="fraudRisk2" name="fraudRisk" path="fraudRisk" value="1"/>
		                   <label for="fraudRisk2" class="custom-control-label">No</label>
		                 </div>
		                 <span class="error invalid-feedback" id="fraudRiskError" style="display:block"></span> 
		               </div>
		             </div>

		             <div class="col-md-3">
		               <div class="form-group" id="uniqueReferred">
		                 <label for="uniqueReferred"><span class="mandatory">*</span>Unique/Referred</label>
		                 <div class="custom-control custom-radio">
		                   <form:radiobutton class="custom-control-input" id="uniqueReferred1" name="uniqueReferred" path="uniqueReferred" value="0"/>
		                   <label for="uniqueReferred1" class="custom-control-label">Unique</label>
		                 </div>
		                 <div class="custom-control custom-radio">
		                   <form:radiobutton class="custom-control-input" id="uniqueReferred2" name="uniqueReferred" path="uniqueReferred" value="1"/>
		                   <label for="uniqueReferred2" class="custom-control-label">Referred</label>
		                 </div>
		                 <span class="error invalid-feedback" id="uniqueReferredError" style="display:block"></span> 
		               </div>
		             </div>

		             <div class="col-md-3">
		               <div class="form-group" id="keyNonKeyOthers">
		                 <label for="keyNonKeyOthers"><span class="mandatory">*</span>Key/Non-Key/Others</label>
		                 <div class="custom-control custom-radio">
		                   <form:radiobutton class="custom-control-input" id="keyNonKeyOthers1" name="keyNonKeyOthers" path="keyInfo" value="0"/>
		                   <label for="keyNonKeyOthers1" class="custom-control-label">Key</label>
		                 </div>
		                 <div class="custom-control custom-radio">
		                   <form:radiobutton class="custom-control-input" id="keyNonKeyOthers2" name="keyNonKeyOthers" path="keyInfo" value="1" />
		                   <label for="keyNonKeyOthers2" class="custom-control-label">Non-Key</label>
		                 </div>
		                 <div class="custom-control custom-radio">
		                   <form:radiobutton class="custom-control-input" id="keyNonKeyOthers3" name="keyNonKeyOthers" path="keyInfo" value="2" />
		                   <label for="keyNonKeyOthers3" class="custom-control-label">Others</label>
		                 </div>
		                 <span class="error invalid-feedback" id="keyNonKeyOthersError" style="display:block"></span> 
		               </div>
		             </div>
		             <div class="col-md-3">
		               <div class="form-group" id="preventiveDetective">
		                 <label for="preventiveDetective"><span class="mandatory">*</span>Preventive/Detective</label>
		                 <div class="custom-control custom-radio">
		                   <form:radiobutton class="custom-control-input" id="preventiveDetective1" name="preventiveDetective" path="preventiveDetective" value="0"/>
		                   <label for="preventiveDetective1" class="custom-control-label">Preventive</label>
		                 </div>
		                 <div class="custom-control custom-radio">
		                   <form:radiobutton class="custom-control-input" id="preventiveDetective2" name="preventiveDetective" path="preventiveDetective" value="1"/>
		                   <label for="preventiveDetective2" class="custom-control-label">Detective</label>
		                 </div>
		                 <span class="error invalid-feedback" id="preventiveDetectiveError" style="display:block"></span>
		               </div>
		             </div>
		             <div class="col-md-3">
		               <div class="form-group" id="typeOfControl">
		                 <label for="typeOfControl"><span class="mandatory">*</span>Type of Control</label>
		                 <div class="custom-control custom-radio">
		                   <form:radiobutton class="custom-control-input" id="typeOfControl1" name="typeOfControl" path="controlType" value="0"/>
		                   <label for="typeOfControl1" class="custom-control-label">Automated</label>
		                 </div>
		                 <div class="custom-control custom-radio">
		                   <form:radiobutton class="custom-control-input" id="typeOfControl2" name="typeOfControl" path="controlType" value="1"/>
		                   <label for="typeOfControl2" class="custom-control-label">Manual</label>
		                 </div>
		                 <span class="error invalid-feedback" id="typeOfControlError" style="display:block"></span>
		               </div>
		             </div>
		             <div class="col-md-3">
		               <div class="form-group">
		                 <label for="selfCertificateCheck"><span class="mandatory">*</span>Self Certification Check</label>
		                 <form:input type="text" class="form-control" id="selfCertificateCheck" placeholder="Enter Department Name" path="selfCertificateCheck" />
		                 <span class="error invalid-feedback" id="selfCertificateCheckError"></span>
		               </div>
		             </div>
		             <div class="col-md-3">
		               <div class="form-group">
		                 <label for="remarks">Remarks</label>
		                 <form:input type="text" class="form-control" id="remarks" placeholder="Enter Remarks" path="remarks" />
		                 <span class="error invalid-feedback" id="remarksError"></span>
		               </div>
		             </div>
		             <div class="col-md-3">
		               <div class="form-group" id="rcmStatus">
		                 <label for="rcmStatus"><span class="mandatory">*</span>RCM Active/InActive</label>
		                 <div class="custom-control custom-radio">
		                   <form:radiobutton class="custom-control-input" value="1" id="rcmStatus1" name="rcmStatus" path="rcmStatus"/>
		                   <label for="rcmStatus1" class="custom-control-label text-green">Active</label>
		                 </div>
		                 <div class="custom-control custom-radio">
		                   <form:radiobutton class="custom-control-input" value="0" id="rcmStatus2" name="rcmStatus" path="rcmStatus"/>
		                   <label for="rcmStatus2" class="custom-control-label text-red">Inactive</label>
		                 </div>
		                 <span class="error invalid-feedback" id="rcmStatusError" style="display:block" ></span> 
		               </div>
		             </div>
		             <div class="col-md-12" style="overflow-x: auto;">
		               <table class="table table-bordered anand-table-font-size" id="addPlantTable">
		                 <thead>
		                   <tr class="bg-table-head">
		                     <th>Plant</th>
		                     <th>SOH By</th>
		                     <th>Line Manager</th>
		                     <th>PRAAC</th>
		                     <th>Remove</th>
		                   </tr>
		                 </thead>
		                 <tbody>
		                 </tbody>
		                 <tfoot>
		                   <tr class="bg-table-foot">
		                     <th>Plant</th>
		                     <th>SOH By</th>
		                     <th>Line Manager</th>
		                     <th>PRAAC</th>
		                     <th>Remove</th>
		                   </tr>
		                 </tfoot>
		               </table>
		             </div>
		             <div class="col-md-12">
		               <button style="float: right;" onclick="addDataToTable('');" title="Add Plant" type="button" id="addPlant" class="btn btn-primary bg-color-anand-three text-white"><i class="fas fa-plus"></i>&nbsp;Add Plant</button>
		             </div>
		           </div>
		         </div>
		         <div class="card-footer">
		           <button style="float: right;" title="Submit RCM" type="submit" id="submitRcmButton" class="btn btn-primary bg-color-anand-two text-white">Submit</button>
		         </div>
		       </div>
		       </form:form>
		     </div>
		   </div>

		    <div class="row">
		      <div class="col-md-12">
		                <table class="table table-bordered dataTable anand-table-font-size" id="rcmMasterTable">
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
		                    </tr>
		                  </thead>
		                  <tbody>
		                  <c:forEach items="${rcmList }" var="rcm" varStatus="rcmLoop">
		                      <tr class="bg-table-row-${rcmLoop.index %2 }">
		                        <td>${rcm.actionForList }</td>
		                        <td>
		                          <c:set var="tempIndexValue" value="0" />
		                          <c:forEach items="${rcm.plantForRcm }" var="rcmPlant" varStatus="rcmPlantLoop">
		                            <c:if test="${rcmPlant.plantActive eq 1 }">
		                            <c:if test="${tempIndexValue eq 0 }">
		                              ${rcmPlant.plantId.entityName } - ${rcmPlant.plantId.locationId.locationName }
		                            </c:if>
		                            <c:if test="${tempIndexValue ne 0 }">
		                              <br>${rcmPlant.plantId.entityName } - ${rcmPlant.plantId.locationId.locationName }
		                            </c:if>
		                            <c:set var="tempIndexValue" value="${tempIndexValue + 1 }" />
		                            </c:if>
		                          </c:forEach>
		                        </td>
		                        <td><fmt:formatDate pattern = "dd-MMM-yyyy" value = "${rcm.rcmCreatedOn }" /></td>
		                        <td>${rcm.mDepartmentId.departmentName }</td>
		                        <td>${rcm.controlNo }</td>
		                        <td>${rcm.mProcessId.processName }</td>
		                        <td>${rcm.subProcess }</td>
		                        <td>${rcm.processOwner }</td>
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
		                    </tr>
		                  </tfoot>
		                </table>
		              </div>
		    </div>
		  </div>
		</section>

		<div class="modal fade" id="rcmMasterEditModal">
		  <div class="modal-dialog modal-xl">
		    <div class="modal-content">
		      <form:form modelAttribute="rcm" action="rcm-master" id="rcmMasterEdit" method="post">
		      	<form:hidden path="rcmId" id="rcmId" />
		      	<input type="hidden" id="plantIndexEditForm" value="" />
		      	<div class="modal-header bg-secondary">
		        	<h4 class="modal-title">Edit RCM Master Information</h4>
		      	</div>
		      	<div class="modal-body">
		          <div class="row">
		            <c:if test="${not empty regMsgEdit }">
		              <div class="col-md-12">
		                <div class="alert bg-info-anand-${cssEdit } alert-dismissible">
		                  <button type="button" title="CLose Alert Box" class="close" data-dismiss="alert" aria-hidden="true"><i class="fas fa-times"></i></button>
		                  <c:if test="${css eq 'danger'}">
		                    <h5><i class="icon fas fa-ban"></i>${regMsgEdit }</h5>
		                  </c:if>
		                  <c:if test="${css ne 'danger'}">
		                    <h5><i class="icon fas fa-check"></i>${regMsgEdit }</h5>
		                  </c:if>
		                </div>
		              </div>
		            </c:if>
		            <div class="col-md-12">
		              <div class="card-body">
		                <div class="row">
		                  <div class="col-md-3">
		                    <div class="form-group">
		                      <label for="controlNoEdit"><span class="mandatory">*</span>Control No</label>
		                      <form:input type="text" class="form-control" id="controlNoEdit" placeholder="Enter Control No" path="controlNo" />
		                      <!-- <input type="text" class="form-control" id="controlNo" placeholder="Enter Control No" />  -->
		                      <span class="error invalid-feedback" id="controlNoEditError"></span>
		                    </div>
		                  </div>
		                  <div class="col-md-3">
		                    <div class="form-group">
		                      <label for="tempProcessIdEdit"><span class="mandatory">*</span>Process/Cycle</label>
		                      <form:select class="form-control" id="tempProcessIdEdit" path="tempProcessId" >
		                        <form:option value="-1">Select Process</form:option>
		                        <c:forEach items="${activeProcessList }" var="process" varStatus="processLoop">
		                          <form:option value="${process.mProcessId }">${process.processName }</form:option>
		                        </c:forEach>
		                      </form:select>
		                      <span class="error invalid-feedback" id="tempProcessIdEditError"></span>
		                    </div>
		                  </div>
		                  <div class="col-md-3">
		                	<div class="form-group">
		                  	  <label for="subProcessEdit"><span class="mandatory">*</span>Sub Process</label>
		                  	  <form:input type="text" class="form-control" id="subProcessEdit" placeholder="Enter Sub Process" path="subProcess" />
		                      <span class="error invalid-feedback" id="subProcessEditError"></span>
		                    </div>
		                  </div>
		                  <div class="col-md-3">
		                    <div class="form-group">
		                      <label for="processOwnerEdit"><span class="mandatory">*</span>Process Owner</label>
		                      <form:input type="text" class="form-control" id="processOwnerEdit" placeholder="Enter Process Owner" path="processOwner" />
		                      <span class="error invalid-feedback" id="processOwnerErrorEdit"></span>
		                    </div>
		                  </div>
		                 <div class="col-md-3">
		                   <div class="form-group">
		                     <label for="controlObjectiveEdit"><span class="mandatory">*</span>Control Objective</label>
		                     <form:input type="text" class="form-control" id="controlObjectiveEdit" placeholder="Enter Control Objective" path="controlObjective" />
		                     <span class="error invalid-feedback" id="controlObjectiveEditError"></span>
		                   </div>
		                 </div>
		                 <div class="col-md-3">
		                   <div class="form-group">
		                     <label for="riskEdit"><span class="mandatory">*</span>Risk</label>
		                     <form:input type="text" class="form-control" id="riskEdit" placeholder="Enter Risk" path="risk" />
		                     <span class="error invalid-feedback" id="riskEditError"></span>
		                   </div>
		                 </div>
		                 <div class="col-md-3">
		                   <div class="form-group">
		                     <label for="entityControlEdit"><span class="mandatory">*</span>Entity Control(Revised)</label>
		                     <form:input type="text" class="form-control" id="entityControlEdit" placeholder="Enter Entity Control Revised" path="entityControl" />
		                     <span class="error invalid-feedback" id="entityControlEditError"></span>
		                   </div>
		                 </div>
		                 <div class="col-md-3">
		                   <div class="form-group">
		                     <label for="documentUploadEdit"><span class="mandatory">*</span>Document For Upload</label>
		                     <form:textarea class="form-control" path="" id="documentUploadEdit" placeholder="Enter Documnets for Upload Details"/>
		                     <span class="error invalid-feedback" id="documentUploadEditError"></span>
		                   </div>
		                 </div>
		                 <div class="col-md-3">
		                   <div class="form-group">
		                     <label for="tempDepartmentIdEdit"><span class="mandatory">*</span>Department</label>
		                     <form:select class="form-control" id="tempDepartmentIdEdit" path="tempDepartmentId">
		                       <form:option value="-1">Select Department</form:option>
		                       <c:forEach items="${activeDepartmentList }" var="department" varStatus="departmentLoop">
		                         <form:option value="${department.mDepartmentId }">${department.departmentName }</form:option>
		                       </c:forEach>
		                     </form:select>
		                     <span class="error invalid-feedback" id="tempDepartmentIdEditError"></span>
		                   </div>
		                 </div>
		              	 <div class="col-md-3">
		                  <div class="form-group">
		                    <label for="riskRatingEdit"><span class="mandatory">*</span>Risk Rating</label>
		                    <form:select class="form-control" id="riskRatingEdit" path="riskRating">
		                      <form:option value="-1">Select Risk Rating</form:option>
		                      <form:option value="1">Critical</form:option>
		                      <form:option value="2">Important</form:option>
		                      <form:option value="3">Preventive</form:option>
		                    </form:select>
		                    <span class="error invalid-feedback" id="riskRatingEditError"></span>
		                  </div>
		                </div>
		                <div class="col-md-3">
		                  <div class="form-group">
		                    <label for="controlFrequencyEdit"><span class="mandatory">*</span>Control Frequency</label>
		                    <form:select class="form-control" id="controlFrequencyEdit" path="controlFrequency">
		                      <form:option value="-1">Select Frequency</form:option>
		                      <form:option value="1">Weekly</form:option>
		                      <form:option value="2">Every Fortnight</form:option>
		                      <form:option value="3">Monthly</form:option>
		                      <form:option value="4">Quarterly</form:option>
		                      <form:option value="5">Yearly</form:option>
		                      <form:option value="6">Once in Two Years</form:option>
		                    </form:select>
		                    <span class="error invalid-feedback" id="controlFrequencyEditError"></span>
		                  </div>
		                </div>
		                <div class="col-md-3">
		                  <div class="form-group">
		                    <label for="uploadFrequencyEdit"><span class="mandatory">*</span>Upload Frequency</label>
		                    <form:select class="form-control" id="uploadFrequencyEdit" path="uploadFrequency">
		                      <form:option value="-1">Select Upload Frequency</form:option>
		                      <form:option value="1">Weekly</form:option>
		                      <form:option value="2">Every Fortnight</form:option>
		                      <form:option value="3">Monthly</form:option>
		                      <form:option value="4">Quarterly</form:option>
		                      <form:option value="5">Yearly</form:option>
		                      <form:option value="6">Once in Two Years</form:option>
		                    </form:select>
		                    <span class="error invalid-feedback" id="uploadFrequencyEditError"></span>
		                  </div>
		                </div>
		                <div class="col-md-3">
		                  <label for="controlStartDateTempEdit"><span class="mandatory">*</span>Control Start Date</label>
		             	  <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text">
                                <i class="far fa-calendar-alt"> </i>
                              </span>
                            </div>
                            <form:input id="controlStartDateTempEdit" title="Control Start Date" type="text" class="form-control float-right" value="" path="controlStartDateTemp" />
                            <span class="error invalid-feedback" id="controlStartDateTempEditError"></span>    
		                  </div>
		                </div>
		                <div class="col-md-3">
		                  <label for="validityDate"><span class="mandatory">*</span>Validity Date</label>
		             	  <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text">
                                <i class="far fa-calendar-alt"> </i>
                              </span>
                            </div>
                            <form:input id="validityDateTempEdit" name="validityDateTempEdit" title="Validity Date" type="text" class="form-control float-right" value="" path="validityDateTemp" />
                            <span class="error invalid-feedback" id="validityDateTempEditError"></span>    
		                  </div>
		                </div>
		                <div class="col-md-3">
		                  <div class="form-group" id="fraudRiskEdit">
		                    <label for="fraudRiskEdit"><span class="mandatory">*</span>Fraud Risk</label>
		                    <div class="custom-control custom-radio">
		                      <form:radiobutton class="custom-control-input" id="fraudRiskEdit1" name="fraudRiskEdit" path="fraudRisk" value="0"/>
		                      <label for="fraudRiskEdit1" class="custom-control-label">Yes</label>
		                    </div>
		                    <div class="custom-control custom-radio">
		                      <form:radiobutton class="custom-control-input" id="fraudRiskEdit2" name="fraudRiskEdit" path="fraudRisk" value="1"/>
		                      <label for="fraudRiskEdit2" class="custom-control-label">No</label>
		                    </div>
		                    <span class="error invalid-feedback" id="fraudRiskEditError" style="display:block"></span> 
		                  </div>
		                </div>
		                <div class="col-md-3">
		                  <div class="form-group" id="uniqueReferredEdit">
		                    <label for="uniqueReferredEdit"><span class="mandatory">*</span>Unique/Referred</label>
		                    <div class="custom-control custom-radio">
		                      <form:radiobutton class="custom-control-input" id="uniqueReferredEdit1" name="uniqueReferredEdit" path="uniqueReferred" value="0"/>
		                      <label for="uniqueReferredEdit1" class="custom-control-label">Unique</label>
		                    </div>
		                    <div class="custom-control custom-radio">
		                      <form:radiobutton class="custom-control-input" id="uniqueReferredEdit2" name="uniqueReferredEdit" path="uniqueReferred" value="1"/>
		                      <label for="uniqueReferredEdit2" class="custom-control-label">Referred</label>
		                    </div>
		                    <span class="error invalid-feedback" id="uniqueReferredEditError" style="display:block"></span> 
		                  </div>
		                </div>
		                <div class="col-md-3">
		                  <div class="form-group" id="keyNonKeyOthersEdit">
		                    <label for="keyNonKeyOthersEdit"><span class="mandatory">*</span>Key/Non-Key/Others</label>
		                    <div class="custom-control custom-radio">
		                      <form:radiobutton class="custom-control-input" id="keyNonKeyOthersEdit1" name="keyNonKeyOthersEdit" path="keyInfo" value="0"/>
		                      <label for="keyNonKeyOthersEdit1" class="custom-control-label">Key</label>
		                    </div>
		                    <div class="custom-control custom-radio">
		                      <form:radiobutton class="custom-control-input" id="keyNonKeyOthersEdit2" name="keyNonKeyOthersEdit" path="keyInfo" value="1" />
		                      <label for="keyNonKeyOthersEdit2" class="custom-control-label">Non-Key</label>
		                    </div>
		                    <div class="custom-control custom-radio">
		                      <form:radiobutton class="custom-control-input" id="keyNonKeyOthersEdit3" name="keyNonKeyOthersEdit" path="keyInfo" value="2" />
		                      <label for="keyNonKeyOthersEdit3" class="custom-control-label">Others</label>
		                    </div>
		                    <span class="error invalid-feedback" id="keyNonKeyOthersEditError" style="display:block"></span> 
		                  </div>
		                </div>
		                <div class="col-md-3">
		                  <div class="form-group" id="preventiveDetectiveEdit">
		                    <label for="preventiveDetectiveEdit"><span class="mandatory">*</span>Preventive/Detective</label>
		                    <div class="custom-control custom-radio">
		                      <form:radiobutton class="custom-control-input" id="preventiveDetectiveEdit1" name="preventiveDetectiveEdit" path="preventiveDetective" value="0"/>
		                      <label for="preventiveDetectiveEdit1" class="custom-control-label">Preventive</label>
		                    </div>
		                    <div class="custom-control custom-radio">
		                      <form:radiobutton class="custom-control-input" id="preventiveDetectiveEdit2" name="preventiveDetectiveEdit" path="preventiveDetective" value="1"/>
		                      <label for="preventiveDetectiveEdit2" class="custom-control-label">Detective</label>
		                    </div>
		                    <span class="error invalid-feedback" id="preventiveDetectiveEditError" style="display:block"></span>
		                  </div>
		                </div>
		                <div class="col-md-3">
		                  <div class="form-group" id="typeOfControlEdit">
		                    <label for="typeOfControlEdit"><span class="mandatory">*</span>Type of Control</label>
		                    <div class="custom-control custom-radio">
		                      <form:radiobutton class="custom-control-input" id="typeOfControlEdit1" name="typeOfControlEdit" path="controlType" value="0"/>
		                      <label for="typeOfControlEdit1" class="custom-control-label">Automated</label>
		                    </div>
		                    <div class="custom-control custom-radio">
		                      <form:radiobutton class="custom-control-input" id="typeOfControlEdit2" name="typeOfControlEdit" path="controlType" value="1"/>
		                      <label for="typeOfControlEdit2" class="custom-control-label">Manual</label>
		                    </div>
		                    <span class="error invalid-feedback" id="typeOfControlEditError" style="display:block"></span>
		                  </div>
		                </div>
		                <div class="col-md-3">
		                  <div class="form-group">
		                    <label for="selfCertificateCheckEdit"><span class="mandatory">*</span>Self Certification Check</label>
		                    <form:input type="text" class="form-control" id="selfCertificateCheckEdit" placeholder="Enter Self Certification Check" path="selfCertificateCheck" />
		                    <span class="error invalid-feedback" id="selfCertificateCheckEditError"></span>
		                  </div>
		                </div>
		                <div class="col-md-3">
		                  <div class="form-group">
		                    <label for="remarksEdit">Remarks</label>
		                    <form:input type="text" class="form-control" id="remarksEdit" placeholder="Enter Remarks" path="remarks" />
		                    <span class="error invalid-feedback" id="remarksEditError"></span>
		                  </div>
		                </div>
		                <div class="col-md-3">
		                  <div class="form-group" id="rcmStatusEdit">
		                    <label for="rcmStatusEdit"><span class="mandatory">*</span>RCM Active/InActive</label>
		                    <div class="custom-control custom-radio">
		                      <form:radiobutton class="custom-control-input" value="1" id="rcmStatusEdit1" name="rcmStatusEdit" path="rcmStatus"/>
		                      <label for="rcmStatusEdit1" class="custom-control-label text-green">Active</label>
		                    </div>
		                    <div class="custom-control custom-radio">
		                      <form:radiobutton class="custom-control-input" value="0" id="rcmStatusEdit2" name="rcmStatusEdit" path="rcmStatus"/>
		                      <label for="rcmStatusEdit2" class="custom-control-label text-red">Inactive</label>
		                    </div>
		                    <span class="error invalid-feedback" id="rcmStatusEditError" style="display:block" ></span> 
		                  </div>
		                </div>
		                <div class="col-md-12" style="overflow-x: auto;">
		                  <table class="table table-bordered anand-table-font-size" id="addPlantTableEdit">
		                    <thead>
		                      <tr class="bg-table-head">
		                        <th>Plant</th>
		                        <th>SOH By</th>
		                        <th>Line Manager</th>
		                        <th>PRAAC</th>
		                        <th>Remove</th>
		                      </tr>
		                    </thead>
		                    <tbody>
		                    </tbody>
		                    <tfoot>
		                      <tr class="bg-table-foot">
		                        <th>Plant</th>
		                        <th>SOH By</th>
		                        <th>Line Manager</th>
		                        <th>PRAAC</th>
		                        <th>Remove</th>
		                      </tr>
		                    </tfoot>
		                  </table>
		                </div>
		                <div class="col-md-12">
		                  <button style="float: right;" onclick="addDataToTable('Edit');" title="Add Plant" type="button" id="addPlantEdit" class="btn btn-primary bg-color-anand-three text-white"><i class="fas fa-plus"></i>&nbsp;Add Plant</button>
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		      <div class="modal-footer justify-content-between">
		        <button onclick="" id="closeEditRcmModal" type="button" class="btn bg-info-anand-danger" data-dismiss="modal">Close</button>
		        <button type="submit" id="saveRcmChanges" class="btn bg-color-anand-two text-white" title="Save RCM Changes">Save RCM Master Changes</button>
		      </div>
		      </form:form>
		    </div>
		  </div>
		</div>
		
		<div class="modal fade" id="rcmMasterInformationModal">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		    <input type="hidden" id="plantIndexInfoForm" value="" />
		      <div class="modal-header bg-secondary">
		        <h4 class="modal-title">RCM Master Information</h4>
		      </div>
		      <div class="modal-body">
		        <div class="row">
		          <div class="col-md-12">
		            <div class="card-body">
		              <div class="row">
		                <div class="col-md-3">
		                  <div class="form-group">
		                    <label for="controlNo">Control No</label>
		                    <br><span class="controlNo"></span>
		                  </div>
		                </div>
		                <div class="col-md-3">
		                  <div class="form-group">
		                    <label for="tempProcessId">Process/Cycle</label>
		                    <span class="tempProcessId"></span>
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
                            <label for="tempDepartmentId">Department</label>
                            <br><span class="tempDepartmentId"></span>
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
                            <label for="rcmStatus">RCM Active/In-Active</label>
                            <br><span class="rcmStatus"></span>
                          </div>
                        </div>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		      <div class="col-md-12" style="overflow-x: auto;">
		        <table class="table table-bordered anand-table-font-size" id="addPlantTableInfo">
		          <thead>
		            <tr class="bg-table-head">
		              <th>Plant</th>
		              <th>SOH By</th>
		              <th>Line Manager</th>
		              <th>PRAAC</th>
		            </tr>          
		          </thead>
		          <tbody>
		          </tbody>
		          <tfoot>
		            <tr class="bg-table-foot">
		              <th>Plant</th>
		              <th>SOH By</th>
		              <th>Line Manager</th>
		              <th>PRAAC</th>
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
		
      </div>
      <%@include file="../includeJSP/footer.jsp"%>
    </div>
    <%@include file="../../includeJSP/jsFiles.jsp"%>
    <%@include file="../../includeJSP/dataTablesImport.jsp"%>
    <%@include file="../../includeJSP/datePickerJs.jsp"%>
    <script src="usedStaticFiles/js/jsp_js_files/ifc/rcm/rcm_master.js"></script>
  </body>
</html>