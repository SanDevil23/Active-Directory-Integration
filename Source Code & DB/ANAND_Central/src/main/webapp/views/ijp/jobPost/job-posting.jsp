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
    <title>COACHING BATCH | ACT | ANAND GROUP</title>
    <%@include file="../../includeJSP/cssFiles.jsp"%>
    <%@include file="../../includeJSP/datePickerCss.jsp"%>
  </head>
  <!-- <body class="sidebar-mini layout-navbar-fixed sidebar-collapse pace-primary"> -->
  <body class="hold-transition sidebar-collapse layout-top-nav pace-primary">
    <div class="wrapper">
      <%-- <%@include file="../../includeJSP/header.jsp"%> --%>
      <%@include file="../includeJSP/header_ijp.jsp"%>
      <%-- <%@include file="../includeJSP/leftSideBar.jsp"%> --%>
      <div class="content-wrapper">
        
        <section class="content-header">
          <div class="container-fluid">
            <div class="row mb-2">
              <div class="col-sm-6">
                <h5 class="font-color-anand-one"><strong>Add Job Posting</strong></h5>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="dashboard-ijp" title="IJP Dashboard"><strong>IJP Dashboard</strong></a></li>
                  <li class="breadcrumb-item active"><strong>Add Job Posting</strong></li>
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
		            <h5 class="card-title">Add New Job Posting</h5>
		          </div>
		          <div class="card-body">
		            <form:form modelAttribute="jobPosting" id="jobPosting" action="job-posting" method="post">
		            <form:hidden path="jobPostingId" id="jobPostingId" />
		            <div class="row">
		              <div class="col-md-4">
		                <div class="form-group">
		                  <label for="entityTempId" class="font-color-anand-one"><span class="mandatory">*</span>Organization &amp; Location</label>
		                  <form:select class="form-control select2" id="entityTempId" path="entityTempId">
		                    <form:option value="-1">Select Organization &amp; Location</form:option>
		                    <c:forEach items="${activeChildEntityList }" var="childEntity" varStatus="childEntityLoop">
		                      <c:if test="${corpHr eq 1 || itAdmin eq 1 }">
		                        <form:option value="${childEntity.mEntityId }">${childEntity.entityName } - ${childEntity.locationId.locationName }</form:option>
		                      </c:if>
		                      <c:if test="${compHr eq 1 }">
		                        <c:if test="${sessionUserInfo.mEntityId.entitySource.mEntityId eq childEntity.entitySource.mEntityId }">
		                          <form:option value="${childEntity.mEntityId }">${childEntity.entityName } - ${childEntity.locationId.locationName }</form:option>
		                        </c:if>
		                      </c:if>
		                    </c:forEach>
		                  </form:select>
		                  <span class="error invalid-feedback" id="entityTempIdError"></span>
		                </div>
		              </div>
		              <div class="col-md-4">
		                <div class="form-group">
		                  <label for="departmentIdTempId" class="font-color-anand-two"><span class="mandatory">*</span>Department</label>
		                  <form:select class="form-control select2" id="departmentIdTempId" path="departmentIdTempId">
		                    <form:option value="-1">Select Department</form:option>
		                    <c:forEach items="${activeDepartmentList }" var="department" varStatus="departmentLoop">
		                      <form:option value="${department.mDepartmentId }">${department.departmentName }</form:option>
		                    </c:forEach>
		                  </form:select>
		                  <span class="error invalid-feedback" id="departmentIdTempIdError"></span>
		                </div>
		              </div>
		              <div class="col-md-4">
		                <div class="form-group">
		                  <label for="designationIdTempId" class="font-color-anand-three"><span class="mandatory">*</span>Job Title</label>
		                  <form:select class="form-control select2" id="designationIdTempId" path="designationIdTempId">
		                    <form:option value="-1">Select Designation</form:option>
		                    <c:forEach items="${activeDesignationList }" var="designation" varStatus="designationLoop">
		                      <form:option value="${designation.mDesignationId }">${designation.designationName } </form:option>
		                    </c:forEach>
		                  </form:select>
		                  <span class="error invalid-feedback" id="designationIdTempIdError"></span>
		                </div>
		              </div>
		              <div class="col-md-4">
		                <div class="form-group">
		                  <label for="levelTempId" class="font-color-anand-one"><span class="mandatory">*</span>Job Level</label>
		                  <form:select class="form-control select2" id="levelTempId" path="levelTempId">
		                    <form:option value="-1">Select Job Level</form:option>
		                    <c:forEach items="${activeLevelList }" var="level" varStatus="levelLoop">
		                      <form:option value="${level.mLevelId }">${level.levelName } </form:option>
		                    </c:forEach>
		                  </form:select>
		                  <span class="error invalid-feedback" id="levelTempIdError"></span>
		                </div>
		              </div>
		              <div class="col-md-4">
		                <div class="form-group">
		                  <label for="educationTempIds" class="font-color-anand-two"><span class="mandatory">*</span>Education</label>
		                  <input type="hidden" id="tempEducation" value="${jobPosting.educationTempIds }" />
		                  <form:select class="form-control select2" id="educationTempIds" path="educationTempIds" multiple="multiple">
		                    <form:option value="-1">Select Education</form:option>
		                    <c:forEach items="${activeQualificationList }" var="qualification" varStatus="qualificationLoop">
		                      <form:option value="${qualification.qualificationId }">${qualification.qualificationName } </form:option>
		                    </c:forEach>
		                  </form:select>
		                  <span class="error invalid-feedback" id="educationTempIdsError"></span>
		                </div>
		              </div>
		              <div class="col-md-3">
		                <div class="form-group">
		                  <label for="manpowerRequisitioNo" class="font-color-anand-three"><span class="mandatory">*</span>Manpower Requisition No</label>
		                  <form:input class="form-control" path="manpowerRequisitioNo" id="manpowerRequisitioNo" placeholder="Enter Manpower Requisition Number" />
		                  <span class="error invalid-feedback" id="manpowerRequisitioNoError"></span>
		                </div>
		              </div>
		              <div class="col-md-5">
		                <div class="form-group">
		                  <label for="jobPurpose" class="font-color-anand-one"><span class="mandatory">*</span>Job Purpose</label>
		                  <form:textarea class="form-control" path="jobPurpose" id="jobPurpose" type="text" rows="3"  placeholder="Enter Job Purpose"></form:textarea>
		                  <span class="error invalid-feedback" id="jobPurposeError"></span>
		                </div>
		              </div>
		              <div class="col-md-5">
		                <div class="form-group">
		                  <label for="jobDuties" class="font-color-anand-two"><span class="mandatory">*</span>Job Duties</label>
		                  <form:textarea class="form-control" path="jobDuties" id="jobDuties" type="text" rows="3" placeholder="Enter Job Duties"></form:textarea>
		                  <span class="error invalid-feedback" id="jobDutiesError"></span>
		                </div>
		              </div>
		              <div class="col-md-1">
		                <div class="form-group">
		                  <label for="minExp" class="font-color-anand-three"><span class="mandatory">*</span>Min Exp</label>
		                  <form:input class="form-control" path="minExp" id="minExp" placeholder="Min Exp" />
		                  <span class="error invalid-feedback" id="minExpError"></span>
		                </div>
		              </div>
		              <div class="col-md-1">
		                <div class="form-group">
		                  <label for="maxExp" class="font-color-anand-three"><span class="mandatory">*</span>Max Exp</label>
		                  <form:input class="form-control" path="maxExp" id="maxExp" placeholder="Max Exp" />
		                  <span class="error invalid-feedback" id="maxExpError"></span>
		                </div>
		              </div>
		              <div class="col-md-4">
		                <div class="form-group">
		                  <label for="skillSet" class="font-color-anand-one"><span class="mandatory">*</span>Skill Set</label>
		                  <form:textarea class="form-control" path="skillSet" id="skillSet" rows="3" type="text" placeholder="Enter Skill Set"></form:textarea>
		                  <span class="error invalid-feedback" id="skillSetError"></span>
		                </div>
		              </div>
		              <div class="col-md-4">
		                <div class="form-group">
		                  <label for="otherPreRequisite" class="font-color-anand-two"><span class="mandatory">*</span>Other Pre-Requisite</label>
		                  <form:textarea class="form-control" path="otherPreRequisite" id="otherPreRequisite" rows="3" type="text" placeholder="Enter other pre-requisites"></form:textarea>
		                  <span class="error invalid-feedback" id="otherPreRequisiteError"></span>
		                </div>
		              </div>
		              
		              <div class="col-md-2">
		                <div class="form-group">
		                  <label for="jobStatus" class="font-color-anand-two"><span class="mandatory">*</span>Job Status</label>
		                  <form:select class="form-control" id="jobStatus" path="jobStatus">
		                    <form:option value="1">Save</form:option>
		                    <form:option value="2">Submit</form:option>
		                  </form:select>
		                  <span class="error invalid-feedback" id="jobStatusError"></span>
		                </div>
		              </div>
		              
		              <div class="col-md-2" style="padding-top:50px">
		                <button style="float: right;" title="Submit RCM" type="submit" id="submitRcmButton" class="btn btn-primary bg-color-anand-two text-white">Submit</button>
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
    <script src="usedStaticFiles/js/jsp_js_files/ijp/jobPost/job-posting.js"></script>
  </body>
</html>