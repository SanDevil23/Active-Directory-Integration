<!-- ****************************************************************************************
# *******************************************************************************************
# Copyright © 2021 Anand Group India. All rights reserved.									*
# No part of this product may be reproduced in any form by any means without prior			*
# written authorization of Anand Automotive Private Limited and its licensors, if any.				*
# *******************************************************************************************
# Author - Anand Group India - R S Iyer																	*
# *************************************************************************************** -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
     <%@include file="includeJSP/cssFiles.jsp"%>
     <title>Registration | EMC Tracker | AAPL</title>
     <link rel="stylesheet" href="usedStaticFiles/css/generalCss/icheck-bootstrap.css">
     <link rel="stylesheet" href="usedStaticFiles/css/generalCss/sweet-alert.css">
     <link rel="stylesheet" href="usedStaticFiles/css/generalCss/toastr.min.css">
  </head>
  <body class="hold-transition layout-top-nav">
     <div class="wrapper">
        <!-- <div class="loader">
        </div> -->
        <nav class="main-header navbar navbar-expand-md navbar-light navbar-white">
           <div class="container">
              <a href="https://www.anandgroupindia.com/" title="Anand Group India" target="_" class="navbar-brand">
                 <img src="usedStaticFiles/images/logo.png" alt="AdminLTE Logo" class="brand-image" style="opacity: .8">
                 <span class="brand-text font-weight-light"><strong>Anand Group India</strong></span>
              </a>
              <ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">
                 <li class="nav-item">
                    <h4 class="nav-link"><strong>Internal Audit Tool</strong></h4>
                 </li>
              </ul>
           </div>
        </nav>
        <div class="content-wrapper bg-image">
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
           <div class="content-header">
           </div>
           <%-- <form:form modelAttribute="userMaster" action="registerUser" method="post" id="signUpForm"> --%>
              <%-- <form:hidden id="userId" path="userId" /> --%>
              <div class="content">
                 <div class="container">
                    <div class="card card-primary">
                       <div class="card-header" align="center" style="background-color:#00aeef">
                          <h3 class="m-0"> Registration</h3>
                       </div>
                       <%-- <div class="card-body">
                          <div class="row">
                             <div class="col-lg-4">
                                <div class="form-group">
                                   <label for="firstName"><span class="mandatory">*</span>First Name</label>
                                   <!-- <input type="text" class="form-control" id="firstName" title="First Name" placeholder="Enter First Name"> -->
                                   <form:input type="text" class="form-control" id="firstName" path="userFirstName" title="First Name" placeholder="Enter First Name" />
                                   <span class="error invalid-feedback formError" id="firstNameError"></span>
                                </div>
                             </div>
                             <div class="col-lg-4">
                                <div class="form-group">
                                   <label for="middleName"><span class="mandatory"></span>Middle Name</label>
                                   <!-- <input type="text" class="form-control" id="middleName"  title="Middle Name" placeholder="Enter Middle Name"> -->
                                   <form:input type="text" class="form-control" id="middleName" path="userMiddleName"  title="Middle Name" placeholder="Enter Middle Name" />
                                   <span class="error invalid-feedback formError" id="middleNameError"></span>
                                </div>
                             </div>
                             <div class="col-lg-4">
                                <div class="form-group">
                                   <label for="lastName"><span class="mandatory">*</span>Last Name</label>
                                   <!-- <input type="text" class="form-control" id="lastName" title="Last Name" placeholder="Enter Last Name"> -->
                                   <form:input type="text" class="form-control" id="lastName" path="userLastName" title="Last Name" placeholder="Enter Last Name" />
                                   <span class="error invalid-feedback formError" id="lastNameError"></span>
                                </div>
                             </div>
                             <div class="col-lg-6">
                                <div class="form-group">
                                   <label for="emailAddress"><span class="mandatory">*</span>Email Address</label>
                                   <!-- <input type="email" class="form-control" id="emailAddress" placeholder="Enter your email address"> -->
                                   <form:input type="email" class="form-control" id="emailAddress" path="userEmail" placeholder="Enter your email address" />
                                   <span class="error invalid-feedback formError" id="emailAddressError"></span>
                                   <span class="error invalid-feedback formError" id="emailCheckLoader" style="display:none;color:black;">
                                      Checking for email uniqueness&nbsp;<img src="usedStaticFiles/images/dotted_loader.gif" height="10px" />
                                   </span>
                                </div>
                             </div>
                             <div class="col-lg-6">
                                <div class="form-group">
                                   <label for="selectEntity"><span class="mandatory">*</span>Company/Entity</label>
                                   <!-- <select class="form-control" id="selectEntity">
                                      <option value="-1">Select Company</option>
                                      <option value="1">AAPL</option>
                                      <option value="2">Gabriel HO</option>
                                      <option value="3">MAFS</option>
                                   </select> -->
                                   <form:select path="selectUserEntity" class="form-control" id="selectEntity">
                                      <form:option value="-1">Select Company</form:option>
                                      <form:option value="1">AAPL</form:option>
                                      <form:option value="2">Gabriel HO</form:option>
                                      <form:option value="3">MAFS</form:option>
                                      <c:forEach items="${parentEntities}" var="parentEntity">
                                         <form:option value="${parentEntity.entityId}">${parentEntity.entityName}</form:option>
                                      </c:forEach>
                                   </form:select>
                                   <span class="error invalid-feedback formError" id="selectEntityError"></span>
                                </div>
                             </div>
                             <div class="col-lg-4">
                                <div class="form-group">
                                   <label for="password"><span class="mandatory">*</span>Password</label>
                                   <!-- <input type="password" class="form-control" id="password" placeholder="Password"> -->
                                   <form:input type="password" class="form-control" id="password" path="userPassword" placeholder="Password" />
                                   <span class="error invalid-feedback formError" id="passwordError"></span>
                                </div>
                             </div>
                             <div class="col-lg-4">
                                <div class="form-group">
                                   <label for="retypePassword"><span class="mandatory">*</span>Re-Enter Password</label>
                                   <!-- <input type="password" class="form-control" id="retypePassword" placeholder="Re-Enter Password"> -->
                                   <form:input type="password" class="form-control" id="retypePassword" path="userPasswordTwo" placeholder="Re-Enter Password" />
                                   <span class="error invalid-feedback formError" id="retypePasswordError"></span>
                                </div>
                             </div>
                             <div class="col-lg-4">
                                <div class="form-group">
                                   <label for="phoneNumber"><span class="mandatory">*</span>Phone Number</label>
                                   <!-- <input type="text" class="form-control" id="phoneNumber" placeholder="Enter Phone Number"> -->
                                   <form:input type="text" class="form-control" id="phoneNumber" path="userPhoneNo" placeholder="Enter Phone Number" />
                                   <span class="error invalid-feedback formError" id="phoneNumberError"></span>
                                </div>
                             </div>
                             <div class="col-1">
                                <button onclick="location.href='login';" id="loginPage" style="width:90px" type="button" class="btn btn-primary btn-sm" 
                             	    title="Go to Login Page">Go To Login</button>
                             </div>
                             <div class="col-10"></div>
                             <div class="col-1">
                                <button id="formSubmitButton" type="submit" class="btn btn-primary btn-sm" 
                             	    title="Click to Register">Register</button>
                             </div>
                          </div>
                       </div> --%>
                    </div>
                 </div>
              </div>
           <%-- </form:form> --%>
        </div>
        <%@include file="includeJSP/footer.jsp"%>
     </div>
     <%@include file="includeJSP/jsFiles.jsp"%>
     <script src="usedStaticFiles/js/generalJs/sweetalert.js"></script>
     <script src="usedStaticFiles/js/generalJs/toastr.min.js"></script>
     <script type="text/javascript" src="usedStaticFiles/js/jsp_js_files/register.js"></script>
  </body>
</html>