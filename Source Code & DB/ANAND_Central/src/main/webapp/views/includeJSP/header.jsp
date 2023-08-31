<!-- ****************************************************************************************
# *******************************************************************************************
# Copyright © 2021 Anand Group India. All rights reserved.									*
# No part of this product may be reproduced in any form by any means without prior			*
# written authorization of Anand Automotive Private Limited and its licensors, if any.				*
# *******************************************************************************************
# Author - Sheshadhri Iyer																	*
# *************************************************************************************** -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
        <li class="nav-link font-color-anand-three"><strong>${sessionUserInfo.userFirstName } ${sessionUserInfo.userLastName },</strong> ${sessionUserInfo.mDepartmentId.departmentName }, ${sessionUserInfo.mEntityId.entityAcronym }, ${sessionUserInfo.mEntityId.locationId.locationName }</li>
    </ul>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <img src="usedStaticFiles/images/logo_old.png" height="33px" style="padding-top:10px" alt="Anand Logo" class="brand-image">
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
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
  </nav>
  
  <div class="anand-loader">
				<img id = "loaderImageNow" src="usedStaticFiles/images/loader.gif" width="64" alt="">
			</div>