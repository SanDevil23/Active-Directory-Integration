<!-- ****************************************************************************************
# *******************************************************************************************
# Copyright © 2022 Anand Group India. All rights reserved.									*
# No part of this product may be reproduced in any form by any means without prior			*
# written authorization of Anand Automotive Private Limited and its licensors, if any.		*
# *******************************************************************************************
# Author - Sheshadhri Iyer																	*
# *************************************************************************************** -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>REPORTS DASHBOARD | ANAND GROUP</title>
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
                <h5 class="font-color-anand-one"><strong>REPORTS DASHBOARD</strong></h5>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="dashboard" title="Dashboard"><strong>Dashboard</strong></a></li>
                  <li class="breadcrumb-item active"><strong>Reports</strong></li>
                </ol>
              </div>
            </div>
          </div>
        </section>
		<section class="content content-margin">
		  <div class="container-fluid">
		    <div class="row">
		      <div class="col-md-4">
		        <div class="card card-widget widget-user-2 shadow">
		          <div class="widget-user-header bg-color-anand-one" title="Entit-Wise-Report" onclick="location.href='entity-wise-report';" style="cursor: pointer;">
		            <h4 class="text-white"><i class="fas fa-building"></i>&emsp;Entity Wise Report</h4>
		          </div>
		        </div>
		      </div>
		      <div class="col-md-4">
		        <div class="card card-widget widget-user-2 shadow">
		          <div class="widget-user-header bg-color-anand-two" title="Location Master" onclick="location.href='location';" style="cursor: pointer;">
		            <h4 class="text-white"><i class="fas fa-street-view"></i>&emsp;Location Wise Report</h4>
		          </div>
		        </div>
		      </div>
		      <div class="col-md-4">
		        <div class="card card-widget widget-user-2 shadow">
		          <div class="widget-user-header bg-color-anand-three" title="Department Master" onclick="location.href='department';" style="cursor: pointer;">
		            <h4 class="text-white"><i class="fas fa-puzzle-piece"></i>&emsp;Department Wise Report</h4>
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
  </body>
</html>