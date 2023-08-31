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
    <title>USER | ANAND GROUP</title>
    <%@include file="../includeJSP/cssFiles.jsp"%>
    <style>
      div.dataTables_scroll {
        width: 110%;
        margin: 0 auto;
      }
    </style>
  </head>
  <body class="sidebar-mini layout-navbar-fixed sidebar-collapse pace-primary">
    <div class="wrapper">
      <%@include file="/views/includeJSP/header.jsp"%>
      <%@include file="/views/includeJSP/leftSideBar.jsp"%>
      <div class="content-wrapper">
        
        <section class="content-header">
          <div class="container-fluid">
            <div class="row mb-2">
              <div class="col-sm-6">
                <h5 class="font-color-anand-one"><strong>USER LIST</strong></h5>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="dashboard" title="Dashboard"><strong>Dashboard</strong></a></li>
                  <li class="breadcrumb-item"><a href="master" title="Masters Dashboard"><strong>Masters</strong></a></li>
                  <li class="breadcrumb-item active"><strong>User</strong>
                  <input type="hidden" value="${openAddModal }" id="openAddModel" />
		              <input type="hidden" value="${openEditModel }" id="openEditModel" />
                  </li>
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
		            <h5 class="card-title">List of Users</h5>
		          </div>
		          <div class="card-body">
		            <div class="row">
		              <div class="col-md-12" style="overflow-x: auto;">
		                <table class="table table-bordered dataTable anand-table-font-size" id="userTable">
		                  <thead>
		                    <tr class="bg-table-head">
		                      <th>Action</th>
		                      <th>First Name</th>
		                      <th>Middle Name</th>
		                      <th>Last Name</th>
		                      <th>Email Id</th>
		                      <th>Entity</th>
		                      <th>Location</th>
		                      <th>Zone</th>
		                      <th>Roles</th>
		                      <th>Active/In-Active</th>
		                    </tr>
		                  </thead>
		                  <tbody>
		                    <c:forEach items="${userList }" var="user" varStatus="userLoop">
		                      <tr class="bg-table-row-${roleLoop.index %2 }">
		                        <td>${user.action }</td>
		                        <td>${user.userFirstName }</td>
		                        <td>${user.userMiddleName }</td>
		                        <td>${user.userLastName }</td>
		                        <td>${user.userLoginId }</td>
		                        <td>${user.mEntityId.entityName }</td>
		                        <td>${user.mEntityId.locationId.locationName }</td>
		                        <td>${user.mEntityId.locationId.mZoneId.zoneName }</td>
		                        <td>${user.rolesAvailable }</td>
		                        <td>
		                          <c:choose>
		                            <c:when test="${user.userActive eq 1 }"><span class="badge bg-info-anand-success">Active</span></c:when>
		                            <c:otherwise><span class="badge bg-info-anand-danger">In-Active</span></c:otherwise>
		                          </c:choose>
		                        </td>
		                      </tr>
		                    </c:forEach>
		                  </tbody>
		                  <tfoot>
		                    <tr class="bg-table-foot">
		                      <th>Action</th>
		                      <th>First Name</th>
		                      <th>Middle Name</th>
		                      <th>Last Name</th>
		                      <th>Email Id</th>
		                      <th>Entity</th>
		                      <th>Location</th>
		                      <th>Zone</th>
		                      <th>Roles</th>
		                      <th>Active/In-Active</th>
		                    </tr>
		                  </tfoot>
		                </table>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>

		  </div>
		</section>
		
		<div class="modal fade" id="userInfomationEditModal">
		  <div class="modal-dialog modal-xl">
		    <div class="modal-content">
		      <form:form modelAttribute="user" action="user" id="userEditForm" method="post">
		        <form:hidden path="mUserId" id="mUserId" />
		      <div class="modal-header bg-secondary">
		        <h4 class="modal-title">Edit User Information</h4>
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
		                 <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="userFirstName"><span class="mandatory">*</span>First Name</label>
                                          <form:input id="userFirstNameEdit" path="userFirstName" type="text" class="form-control" placeholder="First Name" />
                                          <span class="error invalid-feedback" id="userFirstNameErrorEdit"></span>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="userMiddleName"><span class="mandatory">*</span>Middle Name</label>
                                          <form:input id="userMiddleNameEdit" path="userMiddleName" type="text" class="form-control" placeholder="Middle Name" />
                                          <span class="error invalid-feedback" id="userMiddleNameErrorEdit"></span>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="userLastName"><span class="mandatory">*</span>Last Name</label>
                                          <form:input id="userLastNameEdit" path="userLastName" type="text" class="form-control" placeholder="Last Name" />
                                          <span class="error invalid-feedback" id="userLastNameErrorEdit"></span>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="userLoginId">Email ID</label>
                                          <form:input id="userLoginIdEdit" path="userLoginId" type="text" class="form-control" placeholder="Email ID" />
                                          <span class="error invalid-feedback" id="userLoginIdErrorEdit"></span>
                                          <span class="error invalid-feedback formError" id="emailCheckLoader" style="display:none;color:black;">
                                             Checking for email uniqueness&nbsp;<img src="usedStaticFiles/images/dotted_loader.gif" height="10px" />
                                          </span>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="userPhoneNumber"><span class="mandatory">*</span>Phone No</label>
                                          <form:input id="userPhoneNumberEdit" path="userPhoneNumber" type="text" class="form-control" placeholder="Phone No" />
                                          <span class="error invalid-feedback" id="userPhoneNumberErrorEdit"></span>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="tempEntityIdEdit"><span class="mandatory">*</span>Entity</label>
                                          <form:select id="tempEntityIdEdit" class="form-control" path="tempEntityId">
                                             <form:option value="-1">-- Select Entity --</form:option>
                                             <c:forEach items="${activeChildEntityList }" var="entity" varStatus="entityStatus">
                                                <form:option value="${entity.mEntityId }">${entity.entityAcronym } - ${entity.locationId.locationName }</form:option>
                                             </c:forEach>
                                          </form:select>
                                          <span class="error invalid-feedback" id="tempEntityIdErrorEdit"></span>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="tempDesignationId"><span class="mandatory">*</span>Designation</label>
                                          <form:select id="tempDesignationIdEdit" path="tempDesignationId" class="form-control">
                                             <form:option value="-1">-- Select Designation --</form:option>
                                             <c:forEach items="${activeDesignationList }" var="designation" varStatus="desginationStatus">
                                                <form:option value="${designation.mDesignationId }">${designation.designationName }</form:option>
                                             </c:forEach>
                                          </form:select>
                                          <span class="error invalid-feedback" id="tempDesignationIdErrorEdit"></span>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="tempDepartmentIdEdit"><span class="mandatory">*</span>Department</label>
                                          <form:select id="tempDepartmentIdEdit" path="tempDepartmentId" class="form-control">
                                             <form:option value="-1">-- Select Department --</form:option>
                                             <c:forEach items="${activeDepartmentList }" var="department" varStatus="departmentStatus">
                                                <form:option value="${department.mDepartmentId }">${department.departmentName }</form:option>
                                             </c:forEach>
                                          </form:select>
                                          <span class="error invalid-feedback" id="tempDepartmentIdErrorEdit"></span>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="userReportingManagerMailEdit"><span class="mandatory">*</span>Reporting Manager Mail ID</label>
                                          <form:input id="userReportingManagerMailEdit" path="userReportingManagerMail" type="text" class="form-control" placeholder="Reproting Manager Mail ID" />
                                          <span class="error invalid-feedback" id="userReportingManagerMailErrorEdit"></span>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="userReportingManagerNameEdit"><span class="mandatory">*</span>Reporting Manager Name</label>
                                          <form:input id="userReportingManagerNameEdit" path="userReportingManagerName" type="text" class="form-control" placeholder="Reporting Manager Name" />
                                          <span class="error invalid-feedback" id="userReportingManagerNameErrorEdit"></span>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="userRolesTemp"><span class="mandatory">*</span>Roles</label>
                                          <form:select id="userRolesTemp" path="userRolesTemp" class="form-control" multiple="multiple">
                                             <form:option value="-1">-- Select Roles --</form:option>
                                             <c:forEach items="${roleList }" var="role" varStatus="roleStatus">
                                                <c:if test="${role.roleActive eq 1 }">
                                                   <form:option value="${role.mRoleId }">${role.roleName }</form:option>
                                                </c:if>
                                             </c:forEach>
                                          </form:select>
                                          <span class="error invalid-feedback" id="userRolesTempErrorEdit"></span>
                                       </div>
                                    </div>
                                    
                                    <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="userRolesTemp"><span class="mandatory">*</span>Apps Access</label>
                                          <form:select id="userAppsTemp" path="userAppsTemp" class="form-control" multiple="multiple">
                                             <form:option value="-1">-- Select Apps --</form:option>
                                             <c:forEach items="${activeApps }" var="app" varStatus="appStatus">
                                                <c:if test="${app.appActive eq 1 }">
                                                   <form:option value="${app.mAppId }">${app.appName }</form:option>
                                                </c:if>
                                             </c:forEach>
                                          </form:select>
                                          <span class="error invalid-feedback" id="userAppsTempErrorEdit"></span>
                                       </div>
                                    </div>

                                    <div class="col-md-4">
                                       <div class="form-check" id="isActiveDiv">
                                          <label><span class="mandatory">*</span>User Active/InActive</label>
                                          <div class="custom-control custom-radio">
                                             <form:radiobutton path="userActive" class="custom-control-input" value="1" id="userActive1" name="userActive" />
                                             <label for="userActive1" class="custom-control-label text-green">Active</label>
                                          </div>
                                          <div class="custom-control custom-radio">
                                             <form:radiobutton path="userActive" class="custom-control-input" value="0" id="userActive2" name="userActive" />
                                             <label for="userActive2" class="custom-control-label text-red">Inactive</label>
                                          </div>
                                          <span class="error invalid-feedback" id="isActiveError" style="display:block" ></span> 
                                       </div>
                                    </div>
                                    <%-- <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="userPassword"><span class="mandatory">*</span>Password</label>
                                          <form:input id="userPassword" path="userPassword" type="password" class="form-control" placeholder="Password" />
                                          <span class="error invalid-feedback" id="userPasswordError"></span>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="userPasswordTwo"><span class="mandatory">*</span>Re-Type Password</label>
                                          <form:input id="userPasswordTwo" path="userPasswordTwo" type="password" class="form-control" placeholder="Re-Type Password" />
                                          <span class="error invalid-feedback" id="userPasswordTwoError"></span>
                                       </div>
                                    </div> --%>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		      <div class="modal-footer justify-content-between">
		        <button onclick="" id="closeEditUserModal" type="button" class="btn bg-info-anand-danger" data-dismiss="modal">Close</button>
		        <button type="submit" id="saveUserChanges" class="btn bg-color-anand-two text-white" title="Save Company Changes">Save User Changes</button>
		      </div>
		      </form:form>
		    </div>
		  </div>
		</div>
		
		
		<div class="modal fade" id="userInformationModal">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header bg-secondary">
		        <h4 class="modal-title">User Information</h4>
		      </div>
		      <div class="modal-body">
		        <div class="row">
		          <div class="col-md-12">
		            <div class="card-body">
		              <div class="row">
		                <div class="col-md-4">
		                  <div class="form-group">
		                    <label for="userFirstName">First Name</label>
		                    <br><span class="userFirstName"></span>
		                  </div>
		                </div>
		                <div class="col-md-4">
		                  <div class="form-group">
		                    <label for="userMiddleName">Middle Name</label>
		                    <span class="userMiddleName"></span>
		                  </div>
		                </div>
                        <div class="col-md-4">
                          <div class="form-group">
                            <label for="userLastName">Last Name</label>
                            <br><span class="userLastName"></span>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="userLoginId">Email ID</label>
                            <br><span class="userLoginId"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="tempDesignationId">Designation</label>
                            <br><span class="tempDesignationId"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="tempDepartmentId">Department</label>
                            <br><span class="tempDepartmentId"></span>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="tempEntityId">Entity</label>
                            <br><span class="tempEntityId"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="tempLocationId">Location</label>
                            <br><span class="tempLocationId"></span>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label for="userPhoneNumber">Phone No</label>
                            <br><span class="userPhoneNumber"></span>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="userReportingManagerMail">Reporting Manager Mail ID</label>
                            <br><span class="userReportingManagerMail"></span>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="userReportingManagerName">Reporting Manager Name</label>
                            <br><span class="userReportingManagerName"></span>
                          </div>
                        </div>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		      <div class="modal-footer justify-content-between">
		        <button id="userInfoCloase" type="button" class="btn bg-info-anand-danger" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>

      </div>
      <%@include file="/views/includeJSP/footer.jsp"%>
    </div>
    <%@include file="/views/includeJSP/jsFiles.jsp"%>
    <%@include file="/views/includeJSP/dataTablesImport.jsp"%>
    <script src="usedStaticFiles/js/jsp_js_files/masters/user.js"></script>
  </body>
</html>