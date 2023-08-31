<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <%@include file="/views/includeJSP/cssFiles.jsp"%>
      <title>LOGIN | EIM | ANAND GROUP</title>
      <link rel="stylesheet" href="usedStaticFiles/css/generalCss/icheck-bootstrap.css">
   </head>
   <body class="hold-transition layout-top-nav pace-primary">
      <div class="wrapper">
         <nav class="main-header navbar navbar-expand-md navbar-light navbar-white">
            <h4 class="nav-link" style="width: 100%;color: #002E6D;">
               <strong><span class="firstletter">ANAND</span></strong>
               <strong><span class="firstletter">P</span></strong>rojects - SELF REGISTRATION
            </h4>
            <div class="container">
               <button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
               </button>
               <ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">
                  <li class="nav-item">
                     <a target="_blank" href="https://www.anandgroupindia.com/" title="Anand Group India" target="_" class="navbar-brand">
                        <img src="usedStaticFiles/images/logo.png" style="height:27px;padding-top:2px" alt="AdminLTE Logo" class="brand-image">
                     </a>
                  </li>
               </ul>
            </div>
         </nav>
         <div class="anand-loader">
            <img id = "loaderImageNow" src="usedStaticFiles/images/loader.gif" width="64" alt="">
         </div>
         <!-- <div class="content-wrapper bg-image"> -->
         <div class="content-wrapper">
            <form:form modelAttribute="user" action="signup" id="signUpForm" method="post">
               <div class="content">
                  <c:if test="${not empty regMsg }">
                     <div class="alert alert-${css } alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <c:if test="${css eq 'danger'}">
                           <h5><i class="icon fas fa-ban"></i>${regMsg }</h5>
                        </c:if>
                        <c:if test="${css ne 'danger'}">
                           <h5><i class="icon fas fa-check"></i>${regMsg }</h5>
                        </c:if>
                     </div>
                  </c:if>
                  <div class="container">
                     <div class="row">
                        <div class="col-md-12"><br>
                           <div class="card card-primary">
                              <form:hidden id="userId" path="mUserId" />
                              <div class="card-body">
                                 <div class="row">
                                    <c:if test="${not empty regMsg_login }">
                                    <div class="alert alert-${css_login } alert-dismissible">
                                       <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                       <c:if test="${css_login eq 'danger'}">
                                          <h5><i class="icon fas fa-ban"></i>${regMsg_login }</h5>
                                       </c:if>
                                       <c:if test="${css_login ne 'danger'}">
                                          <h5><i class="icon fas fa-check"></i>${regMsg_login }</h5>
                                       </c:if>
                                    </div>
                                 </c:if>
                                   <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
                                    <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="userFirstName"><span class="mandatory">*</span>First Name</label>
                                          <form:input id="userFirstName" path="userFirstName" type="text" class="form-control" placeholder="First Name" />
                                          <span class="error invalid-feedback" id="userFirstNameError"></span>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="userMiddleName"><span class="mandatory">*</span>Middle Name</label>
                                          <form:input id="userMiddleName" path="userMiddleName" type="text" class="form-control" placeholder="Middle Name" />
                                          <span class="error invalid-feedback" id="userMiddleNameError"></span>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="userLastName"><span class="mandatory">*</span>Last Name</label>
                                          <form:input id="userLastName" path="userLastName" type="text" class="form-control" placeholder="Last Name" />
                                          <span class="error invalid-feedback" id="userLastNameError"></span>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="userLoginId"><span class="mandatory">*</span>Email ID</label>
                                          <form:input id="userLoginId" path="userLoginId" type="text" class="form-control" placeholder="Email ID" />
                                          <span class="error invalid-feedback" id="userLoginIdError"></span>
                                          <span class="error invalid-feedback formError" id="emailCheckLoader" style="display:none;color:black;">
                                             Checking for email uniqueness&nbsp;<img src="usedStaticFiles/images/dotted_loader.gif" height="10px" />
                                          </span>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="userPhoneNumber"><span class="mandatory">*</span>Phone No</label>
                                          <form:input id="userPhoneNumber" path="userPhoneNumber" type="text" class="form-control" placeholder="Phone No" />
                                          <span class="error invalid-feedback" id="userPhoneNumberError"></span>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="tempEntityId"><span class="mandatory">*</span>Entity</label>
                                          <form:select path="tempEntityId" id="tempEntityId" class="form-control">
                                             <form:option value="-1">-- Select Entity --</form:option>
                                             <c:forEach items="${activeChildEntityList }" var="entity" varStatus="entityStatus">
                                                <form:option value="${entity.mEntityId }">${entity.entityAcronym } - ${entity.locationId.locationName }</form:option>
                                             </c:forEach>
                                          </form:select>
                                          <span class="error invalid-feedback" id="tempEntityIdError"></span>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="tempDesignationId"><span class="mandatory">*</span>Designation</label>
                                          <form:select id="tempDesignationId" path="tempDesignationId" class="form-control">
                                             <form:option value="-1">-- Select Designation --</form:option>
                                             <c:forEach items="${activeDesignationList }" var="designation" varStatus="desginationStatus">
                                                <form:option value="${designation.mDesignationId }">${designation.designationName }</form:option>
                                             </c:forEach>
                                          </form:select>
                                          <span class="error invalid-feedback" id="tempDesignationIdError"></span>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="tempDepartmentId"><span class="mandatory">*</span>Department</label>
                                          <form:select id="tempDepartmentId" path="tempDepartmentId" class="form-control">
                                             <form:option value="-1">-- Select Department --</form:option>
                                             <c:forEach items="${activeDepartmentList }" var="department" varStatus="departmentStatus">
                                                <form:option value="${department.mDepartmentId }">${department.departmentName }</form:option>
                                             </c:forEach>
                                          </form:select>
                                          <span class="error invalid-feedback" id="tempDepartmentIdError"></span>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="userReportingManagerMail"><span class="mandatory">*</span>Reporting Manager Mail ID</label>
                                          <form:input id="userReportingManagerMail" path="userReportingManagerMail" type="text" class="form-control" placeholder="Reproting Manager Mail ID" />
                                          <span class="error invalid-feedback" id="userReportingManagerMailError"></span>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="form-group">
                                          <label for="userReportingManagerName"><span class="mandatory">*</span>Reporting Manager Name</label>
                                          <form:input id="userReportingManagerName" path="userReportingManagerName" type="text" class="form-control" placeholder="Reporting Manager Name" />
                                          <span class="error invalid-feedback" id="userReportingManagerNameError"></span>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
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
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="col-1"><a href="login">Login</a></div>
                                    <div class="col-10"></div>
                                    <div class="col-1">
                                       <button id="submitSignUpForm" type="submit" onclick="" class="btn btn-block bg-color-anand-two text-white">Sign Up</button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </form:form>
         </div>
      </div>
      <footer class="main-footer" style="color: #002E6D;margin-left: 0px;font-size: 12px;">
         <div class="float-right d-none d-sm-block">
            <b>ANAND Group</b> v.1.0.0<br>
         </div>
         <div class="float-left d-none d-sm-block">
            Developed &amp; Maintained by <b>ANAND Automotive Private Limited</b>
         </div>
         <img width="100%" src="usedStaticFiles/images/anand_footer_large.png" />
      </footer>
      <%@include file="/views/includeJSP/jsFiles.jsp"%>
      <script type="text/javascript" src="usedStaticFiles/js/jsp_js_files/signup.js"></script>
   </body>
</html>