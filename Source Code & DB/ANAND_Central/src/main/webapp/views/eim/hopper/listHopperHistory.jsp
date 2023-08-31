<!-- ****************************************************************************************
# *******************************************************************************************
# Copyright © 2021 Anand Group India. All rights reserved.									*
# No part of this product may be reproduced in any form by any means without prior			*
# written authorization of Anand Automotive Private Limited and its licensors, if any.		*
# *******************************************************************************************
# Author - Sheshadhri R Iyer																*
# *************************************************************************************** -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>HOPPER HISTORY LIST | EMC | ANAND U</title>
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
								<h5 class="font-color-anand-one font-weight-bold">HOPPER HISTORY LIST</h5>
							</div>
							<div class="col-sm-6">
								<ol class="breadcrumb float-sm-right">
									<li class="breadcrumb-item"><a href="dashboard" title="Dashboard">Dashboard</a></li>
									<li class="breadcrumb-item"><a href="list-hopper" title="Hopper List">View/Assign Hopper</a></li>
									<li class="breadcrumb-item active">Hopper History List</li>
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
								<div class="card card-primary card-outline">
									<div class="card-header">
										<h5 class="card-title">History Details of Hopper Project -&nbsp;
										<c:forEach items="${hopperProjectList }" var="hopper" varStatus="hopperLoop">
										   <c:if test="${hopperLoop.index eq 0 }">
										      <button title="Create New Hopper" type="button" onclick="location.href='edit-hopper?id=${hopper.projectHopperHistory.mProjectHopperId }';" class="btn bg-color-anand-one text-white">Edit Hopper Information</button>
										   </c:if>
										</c:forEach>
										</h5>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-md-12 tableDiv" style="">
												<table class="table table-bordered dataTable anand-table-font-size" id="hopperListTable">
													<thead>
														<tr class="bg-table-head">
															<th>Project Name</th>
															<th>Created On</th>
															<th>Created By</th>
															<th>Company</th>
															<th>Location</th>
															<th>Project Leader</th>
															<th>Methodology</th>
															<th>Department</th>
															<th>Type</th>
															<th>Confidentiality</th>
															<th>Sponsor</th>
															<th>Problem Solving Leader</th>
															<th>Corporate Problem Solving Leader</th>
															<th>Primary Driver</th>
															<th>Updated By</th>
															<th>Updated On</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${hopperProjectList }" var="hopper" varStatus="hopperLoop">
															<tr class="bg-table-row-${hopperLoop.index }">
																<td>${hopper.projectName }</td>
																<td>
	                                                           	   <fmt:formatDate value="${hopper.projectHopperHistory.hopperCreatedOn }" pattern="yyyy-MM-dd"/>
	                                                           	</td>
	                                                           	<td>${hopper.projectHopperHistory.hopperCreatedBy.userFirstName } ${hopper.projectHopperHistory.hopperCreatedBy.userLastName }</td>
	                                                           	<td>${hopper.mEntityId.entityAcronym }</td>
	                                                           	<td>${hopper.mEntityId.locationId.locationName }</td>
	                                                           	<td>${hopper.projectLeader.userFirstName } ${hopper.projectLeader.userLastName }</td>
	                                                           	<td>${hopper.projectMethodologyId.projectMethodologyName }</td>
	                                                           	<td>${hopper.projectFunctionId.projectFunctionName }</td>
	                                                           	<td>${hopper.projectTypeId.projectTypeName }</td>
	                                                           	<td>
	                                                           	   <c:if test="${hopper.confidentiality eq 1 }">
	                                                           	      Non-Confidential
	                                                           	   </c:if>
	                                                           	   <c:if test="${hopper.confidentiality eq 2 }">
	                                                           	      Confidential
	                                                           	   </c:if>
	                                                           	</td>
	                                                           	<td>${hopper.sponsor.userFirstName } ${hopper.sponsor.userLastName }</td>
	                                                           	<td>${hopper.problemSolvingLeader.userFirstName } ${hopper.problemSolvingLeader.userLastName }</td>
	                                                           	<td>${hopper.corporateProblemSolvingLeader.userFirstName } ${hopper.corporateProblemSolvingLeader.userLastName }</td>
	                                                           	<td>
	                                                           	   <c:if test="${hopper.hopperPrimaryDriver eq 1 }">
	                                                           	      Productivity
	                                                           	   </c:if>
	                                                           	   <c:if test="${hopper.hopperPrimaryDriver eq 2 }">
	                                                           	      Quality
	                                                           	   </c:if>
	                                                           	   <c:if test="${hopper.hopperPrimaryDriver eq 3 }">
	                                                           	      Cost
	                                                           	   </c:if>
	                                                           	   <c:if test="${hopper.hopperPrimaryDriver eq 4 }">
	                                                           	      Delivery
	                                                           	   </c:if>
	                                                           	   <c:if test="${hopper.hopperPrimaryDriver eq 5 }">
	                                                           	      Safety
	                                                           	   </c:if>
	                                                           	</td>
	                                                           	<td>${hopper.hopperCreatedBy.userFirstName } ${hopper.hopperCreatedBy.userLastName }</td>
	                                                           	<td>
	                                                           	   <fmt:formatDate value="${hopper.hopperCreatedOn}" pattern="yyyy-MM-dd"/>
	                                                           	</td>
	                                                    	</tr>
	                                                    </c:forEach>
													</tbody>
													<tfoot>
														<tr class="bg-table-foot">
															<th>Project Name</th>
															<th>Created On</th>
															<th>Created By</th>
															<th>Company</th>
															<th>Location</th>
															<th>Project Leader</th>
															<th>Methodology</th>
															<th>Department</th>
															<th>Type</th>
															<th>Confidentiality</th>
															<th>Sponsor</th>
															<th>Problem Solving Leader</th>
															<th>Corporate Problem Solving Leader</th>
															<th>Primary Driver</th>
															<th>Updated By</th>
															<th>Updated On</th>
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
			</div>
			<%@include file="../includeJSP/footer.jsp"%>
		</div>
		<%@include file="../../includeJSP/rightSideBar.jsp"%>
		<%@include file="../../includeJSP/jsFiles.jsp"%>
		<%@include file="../../includeJSP/dataTablesImportReports.jsp"%>
		<script src="usedStaticFiles/js/jsp_js_files/eim/hopper/listHopperHistory.js"></script>
	</body>
</html>