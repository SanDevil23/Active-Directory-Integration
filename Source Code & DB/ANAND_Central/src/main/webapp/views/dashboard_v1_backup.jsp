<!-- ****************************************************************************************
# *******************************************************************************************
# Copyright © 2022 Anand Group India. All rights reserved.									*
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
    <%@include file="includeJSP/cssFiles.jsp"%>
    <title>ANAND Central | ANAND GROUP</title>
    <link rel="stylesheet" href="usedStaticFiles/css/generalCss/icheck-bootstrap.css">
  </head>
  <body class="hold-transition layout-top-nav pace-primary">
    <div class="wrapper">
      <nav class="main-header navbar navbar-expand-md navbar-light navbar-white">
        <h4 class="nav-link font-color-anand-two" style="width: 100%;">
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
            <li class="nav-item dropdown">
              <a class="nav-link" href="#" title="Logout" data-toggle="dropdown">
                <i class="fas fa-sign-out-alt"></i>
              </a>
              <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                <a href="logout" class="dropdown-item">
                  <i class="fas fa-sign-out-alt"></i> Logout
                </a>
              </div>
            </li>
          </ul>
        </div>
      </nav>
      <div class="anand-loader">
        <img id = "loaderImageNow" src="usedStaticFiles/images/loader.gif" width="64" alt="">
      </div>
      <div class="content-wrapper">
        <section class="content-header">
          <div class="container">
            <div class="row mb-2">
              <div class="col-sm-8">
                <h5 class="font-color-anand-two font-weight-bold">${sessionUserInfo.userFirstName } ${sessionUserInfo.userLastName },</strong> ${sessionUserInfo.mDepartmentId.departmentName }, ${sessionUserInfo.mEntityId.entityAcronym }, ${sessionUserInfo.mEntityId.locationId.locationName }</h5>
              </div>
              <div class="col-sm-4">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item active font-weight-bold">Dashboard</li>
                </ol>
              </div>
            </div>
          </div>
        </section>

        <section class="content content-margin">
          <div class="container">
            <div class="container-fluid">
              <div class="row">
                <c:if test="${itAdmin eq 1 || aemsAdmin eq 1 }">
                <div class="col-md-3">
                  <div class="info-box mb-3 bg-color-anand-one" title="Admin & Masters" onclick="location.href='master';" style="cursor: pointer;">
                    <span class="info-box-icon"><i class="fas fa-user-shield"></i></span>
                    <div class="info-box-content">
                      <span class="info-box-text font-weight-bold">Admin</span>
                    </div>
                  </div>
                </div>
                </c:if>
                <c:if test="${EMC eq 1 }">
                <div class="col-md-3">
                  <div class="info-box mb-3 bg-color-anand-two" title="Executive Mentoring & Coaching" onclick="location.href='dashboard-emc'" style="cursor: pointer;">
                    <span class="info-box-icon"><i class="fas fa-chalkboard-teacher"></i></span>
                    <div class="info-box-content">
                      <span class="info-box-text font-weight-bold">EMC</span>
                    </div>
                  </div>
                </div>
                </c:if>
                <c:if test="${ALDP eq 1 }">
                <div class="col-md-3">
                  <div class="info-box mb-3 bg-color-anand-three" title="ANAND Coaching Tracker" onclick="location.href='dashboard-act'" style="cursor: pointer;">
                    <span class="info-box-icon"><i class="fas fa-graduation-cap"></i></span>
                    <div class="info-box-content">
                      <span class="info-box-text font-weight-bold">ACT</span>
                    </div>
                  </div>
                </div>
                </c:if>
                <c:if test="${IJP eq 1 }">
                <div class="col-md-3">
                  <div class="info-box mb-3 bg-color-anand-fourteen" title="Internal Job Posting" onclick="location.href='dashboard-ijp';" style="cursor: pointer;">
                    <span class="info-box-icon"><i class="fas fa-user-tie"></i></span>
                    <div class="info-box-content">
                      <span class="info-box-text font-weight-bold">IJP</span>
                    </div>
                  </div>
                </div>
                </c:if>
                <c:if test="${EIM eq 1 }">
                <div class="col-md-3">
                  <div class="info-box mb-3 bg-color-anand-one" title="Excellence In Manufacturing" onclick="location.href='dashboard-eim';" style="cursor: pointer;">
                    <span class="info-box-icon"><i class="fas fa-industry"></i></span>
                    <div class="info-box-content">
                      <span class="info-box-text font-weight-bold">EIM</span>
                    </div>
                  </div>
                </div>
                </c:if>
                <c:if test="${IFC eq 1 }">
                <div class="col-md-3">
                  <div class="info-box mb-3 bg-color-anand-two" title="Internal Financial Control" onclick="location.href='dashboard-ifc';" style="cursor: pointer;">
                    <span class="info-box-icon"><i class="fas fa-money-check"></i></span>
                    <div class="info-box-content">
                      <span class="info-box-text font-weight-bold">IFC</span>
                    </div>
                  </div>
                </div>
                </c:if>
                <c:if test="${AEMS eq 1 }">
                <div class="col-md-3">
                  <div class="info-box mb-3 bg-color-anand-three" title="ANAND Energy Management System" onclick="location.href='dashboard-aems';" style="cursor: pointer;">
                    <span class="info-box-icon"><i class="fas fa-money-check"></i></span>
                    <div class="info-box-content">
                      <span class="info-box-text font-weight-bold">AEMS</span>
                    </div>
                  </div>
                </div>
                </c:if>
                
              </div>
              <div class="row">
                <c:if test="${itAdmin eq 1 || aemsAdmin eq 1 }">
                <div class="col-md-5">
                  <div class="card card-widget widget-user" title="Admin & Masters" onclick="location.href='master';" style="cursor: pointer;">
                    <div class="widget-user-header text-white">
                      <h3 class="widget-user-username text-right font-color-anand-one font-weight-bold"><i class="fas fa-chalkboard-teacher"></i>&emsp;Admin</h3>
                      <h5 class="widget-user-desc text-right font-color-anand-one font-weight-bold">IT &amp; Functional Admin</h5>
                      <h5 class="widget-user-desc text-right font-color-anand-one font-weight-bold">Masters &amp; Other Basic Information</h5>
                    </div>
                  </div>
                </div>
                </c:if>
                <c:if test="${EMC eq 1 }">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                  <div class="card card-widget widget-user" title="Executive Mentoring & Coaching" onclick="location.href='dashboard-emc';" style="cursor: pointer;">
                    <div class="widget-user-header text-white">
                      <h3 class="widget-user-username text-right font-color-anand-two font-weight-bold"><i class="fas fa-chalkboard-teacher"></i>&emsp;EMC</h3>
                      <h5 class="widget-user-desc text-right font-color-anand-two font-weight-bold">Executive Mentoring &amp; Coaching</h5>
                      <h5 class="widget-user-desc text-right font-color-anand-two font-weight-bold">Senior Executive Mentoring &amp; Coaching</h5>
                    </div>
                  </div>
                </div>
                </c:if>
                <c:if test="${ALDP eq 1 }">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                  <div class="card card-widget widget-user" title="ANAND Coaching Tracker" onclick="location.href='dashboard-act';" style="cursor: pointer;">
                    <div class="widget-user-header text-white">
                      <h3 class="widget-user-username text-right font-color-anand-three font-weight-bold"><i class="fas fa-graduation-cap"></i>&emsp;ACT</h3>
                      <h5 class="widget-user-desc text-right font-color-anand-three font-weight-bold">ANAND Coaching Tracker</h5>
                      <h5 class="widget-user-desc text-right font-color-anand-three font-weight-bold">ANAND Leadership Development Program</h5>
                    </div>
                  </div>
                </div>
                </c:if>
                <c:if test="${IJP eq 1 }">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                  <div class="card card-widget widget-user" title="IJP" onclick="location.href='dashboard-ijp';" style="cursor: pointer;">
                    <div class="widget-user-header text-white">
                      <h3 class="widget-user-username text-right font-color-anand-fourteen font-weight-bold"><i class="fas fa-user-tie"></i>&emsp;IJP</h3>
                      <h5 class="widget-user-desc text-right font-color-anand-fourteen font-weight-bold">Internal Job Posting</h5>
                      <h5 class="widget-user-desc text-right font-color-anand-fourteen font-weight-bold">ANAND Group Companies Job Posting</h5>
                    </div>
                  </div>
                </div>
                </c:if>
                <c:if test="${EIM eq 1 }">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                  <div class="card card-widget widget-user" title="Six Sigma" onclick="location.href='dashboard-eim';" style="cursor: pointer;">
                    <div class="widget-user-header text-white">
                      <h3 class="widget-user-username text-right font-color-anand-one font-weight-bold"><i class="fas fa-industry"></i>&emsp;EIM</h3>
                      <h5 class="widget-user-desc text-right font-color-anand-one font-weight-bold">Excellence in Manufacturing</h5>
                      <h5 class="widget-user-desc text-right font-color-anand-one font-weight-bold">Six Sigma Portal</h5>
                    </div>
                  </div>
                </div>
                </c:if>
                <c:if test="${IFC eq 1 }">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                  <div class="card card-widget widget-user" title="Six Sigma" onclick="location.href='dashboard-ifc';" style="cursor: pointer;">
                    <div class="widget-user-header text-white">
                      <h3 class="widget-user-username text-right font-color-anand-two font-weight-bold"><i class="fas fa-money-check"></i>&emsp;IFC</h3>
                      <h5 class="widget-user-desc text-right font-color-anand-two font-weight-bold">Internal Financial Control Portal</h5>
                      <h5 class="widget-user-desc text-right font-color-anand-two font-weight-bold">State of Health - SOH</h5>
                    </div>
                  </div>
                </div>
                </c:if>
                
                <c:if test="${AEMS eq 1 }">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                  <div class="card card-widget widget-user" title="ANAND Energy Management System" onclick="location.href='dashboard-aems';" style="cursor: pointer;">
                    <div class="widget-user-header text-white">
                      <h3 class="widget-user-username text-right font-color-anand-three font-weight-bold"><i class="fas fa-money-check"></i>&emsp;AEMS</h3>
                      <h5 class="widget-user-desc text-right font-color-anand-three font-weight-bold">ANAND Energy Management System</h5>
                      <h5 class="widget-user-desc text-right font-color-anand-three font-weight-bold">ANAND Sustainability Portal</h5>
                    </div>
                  </div>
                </div>
                </c:if>
                
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
    <footer class="main-footer" style="color: #002E6D;margin-left: 0px;font-size: 12px;">
      <div class="float-right d-none d-sm-block"><b>ANAND Central - ANAND Group</b> v.1.0.0<br></div>
      <div class="float-left d-none d-sm-block">
        Developed &amp; Maintained by <b>ANAND Automotive Private Limited</b>
      </div>
      <img width="100%" src="usedStaticFiles/images/anand_footer_large.png" />
    </footer>
    <%@include file="includeJSP/jsFiles.jsp"%>
  </body>
</html>