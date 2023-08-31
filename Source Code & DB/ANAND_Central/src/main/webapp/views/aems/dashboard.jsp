<!-- ****************************************************************************************
# *******************************************************************************************
# Copyright © 2021 Anand Group India. All rights reserved.									*
# No part of this product may be reproduced in any form by any means without prior			*
# written authorization of Anand Automotive Private Limited and its licensors, if any.		*
# *******************************************************************************************
# Author - Sheshadhri Iyer																	*
# *************************************************************************************** -->
<!DOCTYPE html>
<html lang="en">
  <head>
   <title>DASHBOARD | AEMS | ANAND GROUP</title>
   <%@include file="../includeJSP/cssFiles.jsp"%>
  </head>
  <body class="sidebar-mini layout-navbar-fixed sidebar-collapse pace-primary">
    <div class="wrapper">
      <%@include file="../includeJSP/header.jsp"%>
      <%@include file="includeJSP/leftSideBar.jsp"%>
      <div class="content-wrapper">
        <section class="content-header">
          <div class="container-fluid">
            <div class="row mb-2">
              <div class="col-sm-6">
                <h5 class="font-color-anand-one font-weight-bold">DASHBOARD - ANAND Energy Management</h5>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="dashboard" title="Dashboard"><strong>Dashboard</strong></a></li>
                  <li class="breadcrumb-item active"><strong>AEMS Dashboard</strong></li>
                </ol>
              </div>
            </div>
          </div>
        </section>
        <section class="content content-margin">
          <div class="container-fluid">
            <%-- <form action="postTrackerValue" id="postTrackerValue" method="post" >
		    <div class="row">
		      <div class="col-md-2">
                <h6>Year</h6>
                <input type="hidden" id="tempYearId" value="${tempYearId }" />
                <select name="yearId" class="custom-select mb-3 text-light border-0 bg-white yearId" id='date-dropdown'></select>
              </div>
		      <div class="col-md-5">
                <h6>Parent Entity</h6>
                <input type="hidden" id="tempParentId" value="${tempParentId }" />
                <select class="custom-select mb-3 text-light border-0 bg-white parentEntityId" name="parentEntityId" id="parentEntityId">
                  <option value="-1">Select Parent Entity</option>
                  <c:forEach items="${activeParentEntityList}" var="parentEntity">
                    <option value="${parentEntity.mEntityId }">${parentEntity.entityAcronym } - ${parentEntity.entityName}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="col-md-5 childEntityList">
                <h6>Child Entity</h6>
                <input type="hidden" id="tempPlantId" value="${tempPlantId }" />
                <select class="custom-select mb-3 text-light border-0 bg-white plantId" name="plantId" id="plantId">
                  <option value="-1">Select Child Entity</option>
                  <c:forEach items="${activeChildEntityList}" var="parentEntity">
                    <c:choose>
                      <c:when test="${not empty tempParentId }">
                        <c:if test="${tempParentId eq parentEntity.entitySource.mEntityId }">
                          <option value="${parentEntity.mEntityId }">${parentEntity.entityName} - ${parentEntity.locationId.locationName}</option>
                        </c:if>
                      </c:when>
                      <c:otherwise>
                        <option value="${parentEntity.mEntityId }">${parentEntity.entityName} - ${parentEntity.locationId.locationName}</option>
                      </c:otherwise>
                    </c:choose>
                  </c:forEach>
                </select>
              </div>
              <div class="col-md-4">
                <h6>Category</h6>
                <input type="hidden" id="tempProcessId" value="${tempProcessId }" />
                <select class="custom-select mb-3 text-light border-0 bg-white processId" name="processId" id="processId">
                  <option value="-1">Select Category</option>
                  <c:forEach items="${activeCategoryList }" var="category">
                    <option value="${category.mAemsCategoryId }">${category.aemsCategoryName }</option>
                  </c:forEach>
                </select>
              </div>
              <div class="col-md-4">
                <h6>Sub Category</h6>
                <input type="hidden" id="tempProcessId" value="${tempProcessId }" />
                <select class="custom-select mb-3 text-light border-0 bg-white processId" name="processId" id="processId">
                  <option value="-1">Select Sub Category</option>
                  <c:forEach items="${activeSubCategoryList }" var="subCategory">
                    <option value="${subCategory.mAemsSubCategoryId }">${subCategory.aemsSubCategoryName }</option>
                  </c:forEach>
                </select>
              </div>
              <div class="col-md-1"><br>
                <button type="submit" id="savePostTrackerValue" onclick="savePostTrackerValue();" title="Submit Cycle Information" class="btn btn-default">Search</button>
              </div>
              <div class="col-md-1"><br>
                <button type="button" id="clearPostTrackerValue" title="Clear Cycle Information" class="btn btn-default clearRcmTrackerFilter">Clear</button>
              </div>
		    </div>
		    </form> --%>
		    
		    
		    <div class="row">
              <div class="col-md-12">
                <div class="card card-primary card-outline collapsed-card bg-card-primary-anand">
                  <div class="card-header" data-card-widget="collapse">
                    <h5 class="card-title"><i class="fas fa-filter font-color-anand-one"></i>&emsp;Filters</h5>
                    <div class="card-tools">
                      <button type="button" class="btn btn-tool" data-card-widget="collapse">
                        <i class="fas fa-plus font-color-anand-one"></i>
                      </button>
                    </div>
                  </div>
                  <div class="card-body" style="display: none;">
                    <div class="row">
                      <div class="col-md-12">
                        <form action="postTrackerValue" id="postTrackerValue" method="post" >
		                  <div class="row">
		                    <div class="col-md-2">
                              <h6>Year</h6>
                              <input type="hidden" id="tempYearId" value="${tempYearId }" />
                              <select name="yearId" class="custom-select mb-3 text-light border-0 bg-white yearId" id='date-dropdown'></select>
                            </div>
		                    <div class="col-md-5">
                              <h6>Parent Entity</h6>
                              <input type="hidden" id="tempParentId" value="${tempParentId }" />
                              <select class="custom-select mb-3 text-light border-0 bg-white parentEntityId" name="parentEntityId" id="parentEntityId">
                                <option value="-1">Select Parent Entity</option>
                                <c:forEach items="${activeParentEntityList}" var="parentEntity">
                                  <option value="${parentEntity.mEntityId }">${parentEntity.entityAcronym } - ${parentEntity.entityName}</option>
                                </c:forEach>
                              </select>
                            </div>
                            <div class="col-md-5 childEntityList">
                              <h6>Child Entity</h6>
                              <input type="hidden" id="tempPlantId" value="${tempPlantId }" />
                              <select class="custom-select mb-3 text-light border-0 bg-white plantId" name="plantId" id="plantId">
                                <option value="-1">Select Child Entity</option>
                                <c:forEach items="${activeChildEntityList}" var="parentEntity">
                                  <c:choose>
                                    <c:when test="${not empty tempParentId }">
                                      <c:if test="${tempParentId eq parentEntity.entitySource.mEntityId }">
                                        <option value="${parentEntity.mEntityId }">${parentEntity.entityName} - ${parentEntity.locationId.locationName}</option>
                                      </c:if>
                                    </c:when>
                                    <c:otherwise>
                                      <option value="${parentEntity.mEntityId }">${parentEntity.entityName} - ${parentEntity.locationId.locationName}</option>
                                    </c:otherwise>
                                  </c:choose>
                                </c:forEach>
                              </select>
                            </div>
                            <div class="col-md-4">
                              <h6>Category</h6>
                              <input type="hidden" id="tempProcessId" value="${tempProcessId }" />
                              <select class="custom-select mb-3 text-light border-0 bg-white processId" name="processId" id="processId">
                                <option value="-1">Select Category</option>
                                <c:forEach items="${activeCategoryList }" var="category">
                                  <option value="${category.mAemsCategoryId }">${category.aemsCategoryName }</option>
                                </c:forEach>
                              </select>
                            </div>
                            <div class="col-md-4">
                              <h6>Sub Category</h6>
                              <input type="hidden" id="tempProcessId" value="${tempProcessId }" />
                              <select class="custom-select mb-3 text-light border-0 bg-white processId" name="processId" id="processId">
                                <option value="-1">Select Sub Category</option>
                                <c:forEach items="${activeSubCategoryList }" var="subCategory">
                                  <option value="${subCategory.mAemsSubCategoryId }">${subCategory.aemsSubCategoryName }</option>
                                </c:forEach>
                              </select>
                            </div>
                            <div class="col-md-1"><br>
                              <button type="submit" id="savePostTrackerValue" onclick="savePostTrackerValue();" title="Submit Cycle Information" class="btn btn-default">Search</button>
                            </div>
                            <div class="col-md-1"><br>
                              <button type="button" id="clearPostTrackerValue" title="Clear Cycle Information" class="btn btn-default clearRcmTrackerFilter">Clear</button>
                            </div>
		                  </div>
		                </form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="row">
              <div class="col-md-12">
                <div class="card card-primary card-tabs">
                  <div class="card-header p-0 pt-1 bg-color-anand-two">
                    <ul class="nav nav-tabs" id="custom-tabs-three-tab" style="font-size:15px" role="tablist">
                      <c:set var="tabStatus" value="active" />
                      <c:forEach items="${activeCategoryList }" var="category" varStatus="categoryLoop">
                        <li class="nav-item ${tabStatus }">
                          <a class="nav-link ${tabStatus } font-weight-bold" id="category${category.mAemsCategoryId }" data-toggle="pill" href="#category${category.mAemsCategoryId }Href" 
                            role="tab" aria-controls="category${category.mAemsCategoryId }Profile" aria-selected="true">${category.aemsCategoryName }</a>
                        </li>
                        <c:set var="tabStatus" value="" />
                      </c:forEach>
                    </ul>
                  </div>
                  <div class="tab-content active show" id="custom-tabs-three-tabContent">
                    <c:set var="tabStatus" value="active show" />
                    <c:forEach items="${activeCategoryList }" var="category" varStatus="categoryLoop">
                      <div class="tab-pane ${tabStatus } fade" id="category${category.mAemsCategoryId }Href" role="tabpanel" aria-labelledby="category${category.mAemsCategoryId }Dash">
                        <table class="table table-bordered dataTable">
                          <tr class="bg-table-head">
                            <c:forEach items="${activeSubCategoryList }" var="subCategory" varStatus="subCategoryLoop">
                              <c:if test="${subCategory.mAemsCategoryId.mAemsCategoryId eq category.mAemsCategoryId }">
                                <th>${subCategory.aemsSubCategoryName }</th>
                              </c:if>
                            </c:forEach>
                          </tr>
                        </table>
                      </div>
                      <c:set var="tabStatus" value="" />
                    </c:forEach>
                  </div>
                </div>
              </div>
            </div>
		    
		    
          </div>
        </section>
      </div>
      <%@include file="includeJSP/footer.jsp"%>
    </div>
    <%@include file="../includeJSP/jsFiles.jsp"%>
    <script>
    let dateDropdown = document.getElementById('date-dropdown');
	let currentYear = new Date().getFullYear();
	let earliestYear = 2022;
	let dateOption = document.createElement('option');
	dateOption.value = -1;
	dateOption.text = "Select Year";
	dateDropdown.add(dateOption);
	while (currentYear >= earliestYear) {
	  dateOption = document.createElement('option');
	  dateOption.text = currentYear;
	  dateOption.value = currentYear;
	  dateDropdown.add(dateOption);
	  currentYear -= 1;
	}
    </script>
  </body>
</html>