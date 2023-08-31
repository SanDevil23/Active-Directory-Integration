<!-- ****************************************************************************************
# *******************************************************************************************
# Copyright � 2022 Anand Group India. All rights reserved.									*
# No part of this product may be reproduced in any form by any means without prior			*
# written authorization of Anand Automotive Private Limited and its licensors, if any.		*
# *******************************************************************************************
# Author - Sheshadhri Iyer																	*
# *************************************************************************************** -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>DASHBOARD | EIM | ANAND GROUP</title>
    <%@include file="includeJSP/cssFiles.jsp"%>
  </head>
  <body class="sidebar-mini layout-navbar-fixed sidebar-collapse pace-primary">
    <div class="wrapper">
      <%@include file="includeJSP/header.jsp"%> <%@include
      file="includeJSP/leftSideBar.jsp"%>
      <div class="content-wrapper">
        <section class="content-header">
          <div class="container-fluid">
            <div class="row mb-2">
              <div class="col-sm-10">
                <h5 class="font-color-anand-one"><strong>HOME</strong></h5>
              </div>
              <div class="col-sm-2">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item active">Dashboard</li>
                </ol>
              </div>
            </div>
          </div>
        </section>
      </div>
      <%@include file="includeJSP/footer.jsp"%>
    </div>
    <%@include file="includeJSP/jsFiles.jsp"%>
    <script src="usedStaticFiles/js/generalJs/charts/Chart.js"></script>
    <script src="usedStaticFiles/js/generalJs/charts/chart.datalabels.js"></script>
    <script src="usedStaticFiles/js/jsp_js_files/dashboard.js"></script>
  </body>
</html>
