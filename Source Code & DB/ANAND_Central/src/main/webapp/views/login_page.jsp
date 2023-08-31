<!-- ****************************************************************************************
# *******************************************************************************************
# Copyright � 2022 Anand Group India. All rights reserved.									*
# No part of this product may be reproduced in any form by any means without prior			*
# written authorization of Anand Automotive Private Limited and its licensors, if any.		*
# *******************************************************************************************
# Author - Sheshadhri Iyer																	*
# *************************************************************************************** -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <%@include file="/views/includeJSP/cssFiles.jsp"%>
      <title>LOGIN | ANAND CENTRAL | ANAND GROUP</title>
      <link rel="stylesheet" href="usedStaticFiles/css/generalCss/icheck-bootstrap.css">
   </head>
   <body class="hold-transition layout-top-nav pace-primary">
      <div class="wrapper">
         <nav class="main-header navbar navbar-expand-md navbar-light navbar-white">
            <h4 class="nav-link" style="width: 100%;color: #002E6D;">
               <strong><span class="firstletter">ANAND</span></strong>
               <strong><span class="firstletter">C</span></strong>entral
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
            <form action="login" method="post" id="loginForm">
               <div class="content">
                  <c:if test="${not empty regMsg }">
                     <div class="alert alert-${css } alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">�</button>
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
                        <!-- <div class="col-md-8"></div> -->
                        <div class="col-md-4"></div>
                        <div class="col-md-4"><br><br>
                           <div class="card card-primary">
                              <div class="card-header bg-color-anand-one text-white" align="center">
                                 <h3 class="m-0">Login</h3>
                              </div>
                              <div class="card-body">
                                 <c:if test="${not empty regMsg_login }">
                                    <div class="alert alert-${css_login } alert-dismissible">
                                       <button type="button" class="close" data-dismiss="alert" aria-hidden="true">�</button>
                                       <c:if test="${css_login eq 'danger'}">
                                          <h5><i class="icon fas fa-ban"></i>${regMsg_login }</h5>
                                       </c:if>
                                       <c:if test="${css_login ne 'danger'}">
                                          <h5><i class="icon fas fa-check"></i>${regMsg_login }</h5>
                                       </c:if>
                                    </div>
                                 </c:if>
                                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                 <div class="input-group mb-3">
                                    <input id="email" name="email" type="text" class="form-control" placeholder="Username">
                                    <div class="input-group-append">
                                       <div class="input-group-text">
                                          <span class="fas fa-envelope"></span>
                                       </div>
                                    </div>
                                    <span class="error invalid-feedback" id="emailError" style="display:block"></span>
                                 </div>
                                 <div class="input-group mb-3">
                                    <input id="password" name="password" type="password" class="form-control" placeholder="Password">
                                    <div class="input-group-append">
                                       <div class="input-group-text">
                                          <span class="fas fa-lock"></span>
                                       </div>
                                    </div>
                                    <span class="error invalid-feedback" id="passwordError" style="display:block"></span>
                                 </div>
                                 <div class="row">
                                    <div class="col-7"></div>
                                    <div class="col-5">
                                       <button id="submitLogin" type="submit" class="btn btn-block bg-color-anand-two text-white">Sign In</button>
                                    </div>
                                 </div>
                                 <p class="mb-1">
                                    <a href="forgot-password">I forgot my password</a>
                                 </p>
                                 <p class="mb-1">
                                    <a href="signup">SignUp</a>
                                 </p>
                                 <p class="mb-1">
                                    <a href="https://login.microsoftonline.com/common/oauth2/v2.0/authorize/api://2cb9d070-795b-49c8-a0ad-d5dc3cea1921">Office 365 Login</a>
                                 </p>
                              </div>
                           </div>
                        </div>
                        <!-- <div class="col-md-4"></div> -->
                     </div>
                  </div>
               </div>
            </form>
         </div>
      </div>
      <footer class="main-footer" style="color: #002E6D;margin-left: 0px;font-size: 12px;">
         <div class="float-right d-none d-sm-block">
            <b>ANAND Central - ANAND Group</b> v.1.0.0<br>
         </div>
         <div class="float-left d-none d-sm-block">
            Developed &amp; Maintained by <b>ANAND Automotive Private Limited</b>
         </div>
         <img width="100%" src="usedStaticFiles/images/anand_footer_large.png" />
      </footer>
      <%@include file="/views/includeJSP/jsFiles.jsp"%>
      <script type="text/javascript" src="usedStaticFiles/js/jsp_js_files/login_page.js"></script>
   </body>
</html>