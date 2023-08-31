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
    <title>COMPANY-NAME Central | COMPANY-NAME</title>
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
        
        <c:if test="${not empty regMsg }">
          <section class="content">
            <div class="container-fluid">
              <div class="alert bg-${css } alert-dismissible">
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
        
        <section class="content-header">
          <div class="">
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
          <div class="">
            <div class="container-fluid">
              <div class="row">
                <c:if test="${itAdmin eq 1 || aemsAdmin eq 1 }">
                <div class="col-lg-3">
                  <div class="small-box bg-color-anand-one">
                    <div class="inner">
                      <h3>Admin</h3>
                      <p class="text-md font-weight-bold">
                        IT &amp; Functional Admin<br>
                        Masters &amp; Configuration Information
                      </p>
                    </div>
                    <div class="icon">
                      <i class="fas fa-chalkboard-teacher"></i>
                    </div>
                    <a href="master" class="small-box-footer">
                      Go to Dashboard&ensp;<i class="fas fa-arrow-circle-right"></i>
                    </a>
                  </div>
                </div>
                </c:if>
                
                <c:if test="${EMC eq 1 }">
                <div class="col-lg-3">
                  <div class="small-box bg-color-anand-two">
                    <div class="inner">
                      <h3>EMC</h3>
                      <p class="text-md font-weight-bold">
                        Executive Mentoring &amp; Coaching<br>
                        Senior Executive Mentoring &amp; Coaching
                      </p>
                    </div>
                    <div class="icon">
                      <i class="fas fa-chalkboard-teacher"></i>
                    </div>
                    <a href="dashboard-emc" class="small-box-footer">
                      Go to Dashboard&ensp;<i class="fas fa-arrow-circle-right"></i>
                    </a>
                  </div>
                </div>
                </c:if>
                <c:if test="${ALDP eq 1 }">
                <div class="col-lg-3">
                  <div class="small-box bg-color-anand-three">
                    <div class="inner">
                      <h3>ACT</h3>
                      <p class="text-md font-weight-bold">
                        ANAND Coaching Tracker<br>
                        ANAND Leadership Development Program
                      </p>
                    </div>
                    <div class="icon">
                      <i class="fas fa-graduation-cap"></i>
                    </div>
                    <a href="dashboard-act" class="small-box-footer">
                      Go to Dashboard&ensp;<i class="fas fa-arrow-circle-right"></i>
                    </a>
                  </div>
                </div>
                </c:if>
                <c:if test="${IJP eq 1 }">
                <div class="col-lg-3">
                  <div class="small-box bg-info-anand-warning">
                    <div class="inner">
                      <h3>IJP</h3>
                      <p class="text-md font-weight-bold">
                        Internal Job Posting<br>
                        ANAND Group Companies Job Posting
                      </p>
                    </div>
                    <div class="icon">
                      <i class="fas fa-user-tie"></i>
                    </div>
                    <a href="dashboard-ijp" class="small-box-footer">
                      Go to Dashboard&ensp;<i class="fas fa-arrow-circle-right"></i>
                    </a>
                  </div>
                </div>
                </c:if>
                <c:if test="${EIM eq 1 }">
                <div class="col-lg-3">
                  <div class="small-box bg-info-anand-success2">
                    <div class="inner">
                      <h3>EIM</h3>
                      <p class="text-md font-weight-bold">
                        Six Sigma Portal<br>
                        Excellence in Manufacturing
                      </p>
                    </div>
                    <div class="icon">
                      <i class="fas fa-industry"></i>
                    </div>
                    <a href="dashboard-eim" class="small-box-footer">
                      Go to Dashboard&ensp;<i class="fas fa-arrow-circle-right"></i>
                    </a>
                  </div>
                </div>
                </c:if>
                <c:if test="${IFC eq 1 }">
                <div class="col-lg-3">
                  <div class="small-box bg-color-anand-fourteen">
                    <div class="inner">
                      <h3>IFC</h3>
                      <p class="text-md font-weight-bold">
                        Internal Financial Control Portal<br>
                        State of Health - SOH
                      </p>
                    </div>
                    <div class="icon">
                      <i class="fas fa-money-check"></i>
                    </div>
                    <a href="dashboard-ifc" class="small-box-footer">
                      Go to Dashboard&ensp;<i class="fas fa-arrow-circle-right"></i>
                    </a>
                  </div>
                </div>
                </c:if>
                <c:if test="${AEMS eq 1 }">
                <div class="col-lg-3">
                  <div class="small-box bg-info-anand-success">
                    <div class="inner">
                      <h3>AEMS</h3>
                      <p class="text-md font-weight-bold">
                        ANAND Sustainability Portal<br>
                        ANAND Energy Management System
                      </p>
                    </div>
                    <div class="icon">
                      <i class="fas fa-solar-panel"></i>
                    </div>
                    <a href="dashboard-eim" class="small-box-footer">
                      Go to Dashboard&ensp;<i class="fas fa-arrow-circle-right"></i>
                    </a>
                  </div>
                </div>
                </c:if>
                
                <c:if test="${MR eq 1 }">
                <div class="col-lg-3">
                  <div class="small-box bg-color-anand-fifteen">
                    <div class="inner">
                      <h3>MR</h3>
                      <p class="text-md font-weight-bold">
                        Manpower Requisition Portal<br>
                        ANAND Group Manpower Requisition Portal
                      </p>
                    </div>
                    <div class="icon">
                      <i class="fas fa-user-plus"></i>
                    </div>
                    <a href="dashboard-mr" class="small-box-footer font-weight-bold" title="MR Portal">
                      Go to Dashboard&ensp;<i class="fas fa-arrow-circle-right"></i>
                    </a>
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