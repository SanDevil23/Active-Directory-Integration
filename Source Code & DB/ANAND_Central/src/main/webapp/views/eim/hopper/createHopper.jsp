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
<!DOCTYPE html>
<html lang="en">
   <head>
      <c:if test="${createEditHopper eq 1 }">
         <title>CREATE HOPPER | EIM | ANAND GROUP</title>
      </c:if>
      <c:if test="${createEditHopper eq 2 }">
         <title>EDIT HOPPER | EIM | ANAND GROUP</title>
      </c:if>
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
                        <c:if test="${createEditHopper eq 1 }">
                           <h5 class="font-color-anand-one font-weight-bold">CREATE HOPPER PROJECT</h5>
                        </c:if>
                        <c:if test="${createEditHopper eq 2 }">
                           <h5 class="font-color-anand-one font-weight-bold">EDIT HOPPER PROJECT DETAILS</h5>
                        </c:if>
                     </div>
                     <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                           <li class="breadcrumb-item"><a href="dashboard" title="Dashboard">Dashboard</a></li>
                           <li class="breadcrumb-item"><a href="list-hopper" title="View/List Hopper">View/List Hopper</a></li>
                           <c:if test="${createEditHopper eq 1 }">
                              <li class="breadcrumb-item active">Create Hopper</li>
                           </c:if>
                           <c:if test="${createEditHopper eq 2 }">
                              <li class="breadcrumb-item active">Edit Hopper Details</li>
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
                     <form:form modelAttribute="projectHopper" action="saveProjectHopper" type="POST" id="projectHopperForm">
                     <form:hidden path="tProjectHopperId" />
                     <div class="col-md-12">
                        <div class="card card-primary card-outline">
                           <div class="card-header">
                              <c:if test="${createEditHopper eq 1 }">
                                 <h5 class="card-title">Add Hopper Project</h5>
                              </c:if>
                              <c:if test="${createEditHopper eq 2 }">
                                 <h5 class="card-title">Edit Hopper Project</h5>
                              </c:if>
                           </div>
                           <div class="card-body">
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
                                       <label for="projectLeaderTemp"><!-- <span class="mandatory">*</span> -->Project Leader</label>
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
                                       <label for="hopperPrimaryDriver"><span class="mandatory">*</span>Project Leader</label>
                                       <form:select class="form-control" id="hopperPrimaryDriver" path="hopperPrimaryDriver">
                                          <form:option value="-1">-- Select Primary Driver --</form:option>
                                          <form:option value="1">Productivity</form:option>
                                          <form:option value="2">Quality</form:option>
                                          <form:option value="3">Cost</form:option>
                                          <form:option value="4">Delivery</form:option>
                                          <form:option value="5">Safety</form:option>
                                       </form:select>
                                       <span class="error invalid-feedback" id="hopperPrimaryDriverError"></span>
                                    </div>
                                 </div>
                                 <div class="col-md-4">
                                    <div class="form-group">
                                       <label for="estimatedSaving"><span class="mandatory">*</span>Estimated Saving (in Millon INR)</label>
                                       <form:input path="estimatedSaving" id="estimatedSaving" type="text" class="form-control" placeholder="Enter Estimated Savings" />
                                       <span class="error invalid-feedback" id="estimatedSavingError"></span>
                                    </div>
                                 </div>
                                 <div class="col-md-3">
                                    <div class="form-check" id="isActiveDiv">
                                       <label><span class="mandatory">*</span>Hopper Project Active/InActive</label>
                                       <div class="custom-control custom-radio">
                                          <form:radiobutton path="hopperActive" class="custom-control-input" value="1" id="customRadio1" name="customRadio" />
                                          <label for="customRadio1" class="custom-control-label text-green">Active</label>
                                       </div>
                                       <div class="custom-control custom-radio">
                                          <form:radiobutton path="hopperActive" class="custom-control-input" value="0" id="customRadio2" name="customRadio" />
                                          <label for="customRadio2" class="custom-control-label text-red">Inactive</label>
                                       </div>
                                       <span class="error invalid-feedback" id="isActiveError"></span> 
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="card-footer">
                              <div class="row">
                                 <div class="col-md-11"></div>
                                 <div class="col-md-1" style='text-align:center'>
                                    <!-- <button title="Save Cost Saving Realization" onclick="costSavingSaveSubmit(1);" type="button" id="saveDraftTransactionCostSaving" class="btn bg-color-anand-danger-three text-white">Save</button> -->
                                    <button title="Submit Project Hopper" type="submit" id="projectHopperSubmit" class="btn bg-color-anand-two text-white">Submit</button>
                                 </div>
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
      <script src="usedStaticFiles/js/jsp_js_files/eim/hopper/createHopper.js"></script>
   </body>
</html>