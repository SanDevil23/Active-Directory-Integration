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
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="en">
  <head>
     <title>VIEW CHARTER | EIM | AAPL</title>
     <%@include file="../../includeJSP/cssFiles.jsp"%>
     <%@include file="../../includeJSP/datePickerCss.jsp"%>
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
                <h5 class="font-color-anand-one font-weight-bold">VIEW SUSTENANCE AUDIT DETAILS</h5>
              </div>
              <div class="col-sm-6 font-weight-bold">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="dashboard" title="Dashboard">Dashboard</a></li>
                  <li class="breadcrumb-item"><a href="list-charter" title="View/List Charter">View/List Charter</a></li>
                  <li class="breadcrumb-item active">Edit Sustenance Audit</li>
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
			<c:if test="${projectCharter.projectCharterStatus eq 9 }">
            <form:form modelAttribute="projectCharter" action="saveSustenaceAudit" type="POST" id="sustenanceAuditForm" enctype="multipart/form-data">
            <form:hidden path="tProjectCharterId" />
              <div class="col-md-12">
                <div class="card card-primary card-outline">
                  <div class="card-header">
                    <h5 class="card-title">Edit Sustenance Audit</h5>
                  </div>
                  <div class="card-body">
                    <div class="row">
                      <div class="col-md-5">
                        <div class="form-group">
                          <label for="problemSolvingLeaderTemp"><span class="mandatory">*</span>Assign To Problem Solving Leader</label>
                          <form:select class="form-control" id="sustenanceProblemSolvingLeaderTemp" path="sustenanceProblemSolvingLeaderTemp">
                            <form:option value="-1">-- Select Problem Solving Leader --</form:option>
                            <c:forEach items="${problemSolvingLeaderList }" var="problemSolvingLeader" varStatus="problemSolvingLeaderStatus">
                              <form:option value="${problemSolvingLeader.mUserId }">${problemSolvingLeader.userFirstName } ${problemSolvingLeader.userLastName }</form:option>
                            </c:forEach>
                          </form:select>
                          <span class="error invalid-feedback" id="sustenanceProblemSolvingLeaderTempError"></span>
                        </div>
                      </div>
                      <div class="col-md-2"></div>
                      <div class="col-md-5">
                        <div class="form-group">
                          <label><span class="mandatory">*</span>Target Date To Complete</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text">
                                <i class="far fa-calendar-alt"></i>
                              </span>
                            </div>
                            <form:input path="sustenanceAuditTargetTemp" id="sustenanceAuditTarget" type="text" class="form-control float-right" title="Sustenance Audit Target Date" />
                            <span class="error invalid-feedback" id="estimatedEndDateError"></span>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class=""><span class="mandatory">*</span>Sustenance Comments</label>
                          <form:input class="form-control" path="sustenanceComments" id="sustenanceComments" placeholder="Enter Sustenance Comments" />
                          <span class="error invalid-feedback" id="sustenanceCommentsError"></span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="card-footer">
                  	<div class="row">
                      <div class="col-md-11"></div>
                      <div class="col-md-1" style='text-align:center'>
                        <c:if test="${eim eq 1 || projectLeader eq 1 && sessionUserInfo.mUserId eq projectCharter.projectLeader.mUserId }">
                          <button title="Submit Sustenance Details" type="button" id="projectSustenanceSubmit" onclick="submitSustenanceForm(1)" class="btn bg-color-anand-two text-white"><b>Submit</b></button>
                        </c:if>
                      </div>
                  	</div>
                  </div>
                </div>  
              </div>
            </form:form>
            </c:if>
            <c:if test="${projectCharter.projectCharterStatus eq 11 }">
              <form:form modelAttribute="projectCharter" action="saveSustenaceScore" type="POST" id="sustenanceScoreForm" enctype="multipart/form-data">
              <form:hidden path="tProjectCharterId" />
              <form:hidden path="saveOrSubmit" id="saveOrSubmit"/>
        	    <div class="card-body content-margin">
                  <div class="card card-primary card-outline  bg-card-primary-anand">
                    <div class="card-header" data-card-widget="collapse">
                      <h5 class="card-title">Project Control</h5>
                      <div class="card-tools">
                	    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                          <i class="fas fa-minus"></i>
                        </button>
                      </div>
                    </div>
                    <c:set var="controlIndex" value="0" />
                    <div class="card-body">
                      <div class="col-md-12" style="overflow-x: auto;">
                        <table class="table table-bordered dataTable anand-table-font-size" id="addControlTable">
					      <thead>
						   <tr class="bg-table-head">
						     <th>Action</th>
						     <th>Control Established in system</th>
						     <th>Date of Implementation</th>
						     <th>Plan Of Action</th>
						     <th>Comments</th>
						   </tr>
					  	  </thead>
   						  <tbody>
   						    <c:set var="charterApprovalCount" value="0"/>
   						    <c:forEach items="${projectCharter.projectCharterControl }" var="projectCharterControl" >
                              <c:if test="${projectCharterControl.active eq 1 }">
                                <form:input hidden="true" path="controlListTemp[${controlIndex}].tProjectCharterControlIdTemp" value="${projectCharterControl.tProjectCharterControlId }"/>
                                <c:set var="charterApprovalCount" value="${charterApprovalCount + 1}" />
                                <c:set var="rowClassValue" value="${(charterApprovalCount+1) % 2 }" />
                                <tr class="bg-table-row-${rowClassValue }">
                                  <td>
                                  ${projectCharterControl.controlAction }
                                  </td>
                                  <td>
                                   ${projectCharterControl.controlEstablishedInSystem } 
                                  </td>  
                                  <td>
                                   <fmt:formatDate value="${projectCharterControl.controlEstablishedDate }" pattern="dd-MMM-yyyy"/>
                                  </td>
                                  <td>
                                  	<form:select class="form-control" id="sustenancePresenceOfControl${controlIndex}" onclick="updateScore()" path="controlListTemp[${controlIndex}].sustenancePresenceOfControlTemp">
                                      <form:option value="-1">-- Select Presence of Control --</form:option>
                                      <form:option value="1">Yes</form:option>
                                      <form:option value="2">No</form:option>
                                    </form:select>
                                    <span class="error invalid-feedback" id="sustenancePresenceOfControlError${controlIndex}"> </span>
                                  </td>  
                                  <td>
                                    <form:input class="form-control" path="controlListTemp[${controlIndex}].sustenanceAuditCommentsTemp" id="sustenanceAuditComments${controlIndex}" placeholder="Enter Sustenance Comments" value="${projectCharterControl.sustenanceAuditComments}"/>
                                    <span class="error invalid-feedback" id="sustenanceAuditCommentsError${controlIndex}"> </span>
                                  </td>
                                </tr>
                                <c:set var="controlIndex" value="${controlIndex + 1 }" />
                              </c:if>
                            </c:forEach>
                            <form:hidden path="" value="${controlIndex}" id="index"/>
                          </tbody>
       			        </table>
       			        <div class="float-right">
                          <div class="form-group">
                            <strong>Total Score</strong>
                            <form:input id="sustenanceScore" readonly="true" path="sustenanceScore" type="text" class="form-control" placeholder="Sustenance Score" />
                          </div>
                          <strong id="sustenanceColourShow" style="size:13px">
                          </strong>
                        </div>
                        
					  </div>
                    </div>
                    <div class="card-footer" style="overflow-x: auto;">
                      <div class="row">
                        <div class="col-md-1" style='text-align:center'>
                          <button title="Save Charter" type="button" id="projectSustenanceScore" onclick="submitSustenanceScoreForm(0)" class="btn bg-color-anand-one text-white"><b>Save</b></button>
                        </div>
                        <div class="col-md-10"></div>
                        <div class="col-md-1" style='text-align:center'>
                         <c:if test="${sessionUserInfo.mUserId eq projectCharter.sustenanceProblemSolvingLeader.mUserId }">
                           <button title="Submit Sustenance Score" type="button" id="projectSustenanceScore" onclick="submitSustenanceScoreForm(1)" class="btn bg-color-anand-two text-white"><b>Submit</b></button>
                         </c:if>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>  
              </form:form>    
            </c:if>
          </div>
        </section>
      </div>
      <%@include file="../includeJSP/footer.jsp"%>
    </div>
    <%@include file="../../includeJSP/rightSideBar.jsp"%>
    <%@include file="../../includeJSP/jsFiles.jsp"%>
    <%@include file="../../includeJSP/dataTablesImport.jsp"%>
    <%@include file="../../includeJSP/datePickerJs.jsp"%>
    <script>
    var stringCheck = /^[ A-Za-z0-9-Á, ]*$/;
    var holidays = [];
    function noSundaysOrHolidays(date) {
    	var day = date.getDay();
    	if (day != 0) {
    		var d = date.getDate();
    		var m = date.getMonth();
    		var y = date.getFullYear();
    		m = m + 1;
    		for (i = 0; i < holidays.length; i++) {
    			var currDate = d+"/";
    			if(m < 10 ) { currDate += "0"+m;} 
    			else { currDate += ""+m; }
    			currDate += "/"+y;
    			if($.inArray(currDate, holidays) != -1) {
    				return [false];
    			}
    		}
    		return [true];
    	} else {
    		return [day != 0, ''];
    	}
    }
    function DisableDates(date) {
    	return noSundaysOrHolidays(date);
    }
    function parseDate(str) {
    	var mdy = str.split('/');
    	return new Date(mdy[2], mdy[1] - 1, mdy[0]);
    }
    function dateDiff(first, second) {
    	// Take the difference between the dates and divide by milliseconds per day.
    	// Round to nearest whole number to deal with DST.
    	return Math.round((second - first) / (1000 * 60 * 60 * 24));
    }
    function aZero(n) {
    	  return n.toString().length == 1 ?  n = '0' + n: n;
    }
    $(function () {
    	/* bsCustomFileInput.init(); */
    	$('#sustenanceAuditTarget').datepicker({ 
    		dateFormat: 'dd/mm/yy',
    		minDate: new Date(),
    		beforeShowDay: DisableDates
    	});
    	if($("#sustenanceScore").val()==100){
    	    $("#sustenanceColourShow").html("Sustenance Status Green");
    	    document.getElementById("sustenanceColourShow").style.color = "green";
    	    document.getElementById("sustenanceColourShow").style.fontSize = "20px";
    	    
    	}
    	else{
    		$("#sustenanceColourShow").html("Sustenance Status Red");
    	    document.getElementById("sustenanceColourShow").style.color = "red";
    	    document.getElementById("sustenanceColourShow").style.fontSize = "20px";

    		
    	}
    });
    function submitSustenanceForm(saveorsubmit) {
    	$("#sustenanceCommentsError").html("");
    	$("#sustenanceComments").addClass("is-valid");
    	$("#sustenanceComments").removeClass("is-invalid");
    	if($("#sustenanceComments").val() != "") {
    		var approvalComments = $("#sustenanceComments").val();
    		if(stringCheck.test(approvalComments) == false) {
    			$("#sustenanceComments").addClass("is-invalid");
        		$("#sustenanceCommentsError").html("Sustenance Comments cannot contain special character");
    		} else {
    			$("#sustenanceComments").addClass("is-valid");
    			$('#sustenanceAuditForm').submit();
    		}
    	} else {
    		$("#sustenanceComments").addClass("is-invalid");
    		$("#sustenanceCommentsError").html("Sustenance Comments cannot be empty");
    	}
    }
    function updateScore()
    {
    	var count=0;
    	var index= $("#index").val();
    	for(let i=0;i<index;i++)
    	{
    		if($("#sustenancePresenceOfControl"+i).val()==1)
    		{
    			count++;
    		}
    	}
    	let percent=Math.round((count/index)*100);
    	$("#sustenanceScore").val(percent);
    	if(percent==100){
    	    $("#sustenanceColourShow").html("Sustenance Status Green");
    	    document.getElementById("sustenanceColourShow").style.color = "green";
    	}
    	else{
    		$("#sustenanceColourShow").html("Sustenance Status Red");
    		document.getElementById("sustenanceColourShow").style.color = "red";
    	}
    	
    }
    function submitSustenanceScoreForm(saveorsubmit) {
    	var saveOrSubmit=true;
    	var index= $("#index").val();
    	$("#saveOrSubmit").val(saveorsubmit);
    	var approvalComments;
    	for(let i=0;i<index;i++){
    		approvalComments=$("#sustenanceAuditComments"+i).val();
    		if($("#sustenanceAuditComments"+i).val()== "")
    		{
    			$("#sustenanceAuditComments"+i).addClass("is-invalid");
        		$("#sustenanceAuditCommentsError"+i).html("Sustenance Comments cannot be empty");
        		saveOrSubmit=false;
    		}
    		if(stringCheck.test(approvalComments)== false)
    		{
    			$("#sustenanceAuditComments"+i).addClass("is-invalid");
        		$("#sustenanceAuditCommentsError"+i).html("Sustenance Comments is Invalid");
        		saveOrSubmit=false;
    		}
    		approvalComments="";
    		if($("#sustenancePresenceOfControl"+i).val()==-1)
    		{
    			$("#sustenancePresenceOfControl"+i).addClass("is-invalid");
        		$("#sustenancePresenceOfControlError"+i).html("Sustenance Presence Of Control cannot be empty");
        		saveOrSubmit=false;
    		}
    		
    	}
    	if(saveOrSubmit){
        	$('#sustenanceScoreForm').submit();
    	}
    }
    $("#sustenanceAuditTarget").keypress(function(event) {
    	event.preventDefault();
    });
    $("#sustenanceAuditTarget").change(function(event) {
    	if($("#sustenanceAuditTarget").val() != "") {
    		var minEndDate = parseDate($("#sustenanceAuditTarget").val());
    		$("#sustenanceAuditTarget").datepicker("destroy");
    		$('#sustenanceAuditTarget').datepicker({ 
    			dateFormat: 'dd/mm/yy',
    			minDate: minEndDate,
    			beforeShowDay: DisableDates
    		});
    	}
    });
    
    </script>
  </body>
</html>