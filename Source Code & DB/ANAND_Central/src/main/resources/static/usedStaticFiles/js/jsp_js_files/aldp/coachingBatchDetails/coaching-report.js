var pagination = true;
var jsBatchName = "";
var jsCoacheeName = "";
var jsCoachName = "";
var jsSupervisorName = "";

var textCheck = /^[ A-Za-z0-9.\r\n;:/"',-]*$/

$("#sessionDateString").keypress(function(e) {
	e.preventDefault();
});

$(function() {
	
	var coacheeActionIndex = $("#coacheeActionIndex").val();
	for(var i=0; i< coacheeActionIndex; i++) {
		var id="reportActionStatusTemp"+i;
		if($("#"+id).val() == 1) {
			id="batchActiveEdit1"+i;
			$("#"+id).prop('checked', true);
		} else if($("#"+id).val() == 2) {
			id="batchActiveEdit2"+i;
			$("#"+id).prop('checked', true);
		} else {
			id="batchActiveEdit3"+i;
			$("#"+id).prop('checked', true);
		}
	}
	
	if($("#coachCoacheeAdminFlag").val() == 1) {
		$(".coacheeReportFooter").remove();
		$(".coachReportFooter").hide();
	} else if($("#coachCoacheeAdminFlag").val() == 2) {
		$(".coacheeReportFooter").show();
		$(".coachReportFooter").remove();
	} else {
		$(".coachReportFooter").hide();
		$(".coacheeReportFooter").show();
	}
	
	$(".conducted").hide();
	$(".not-conducted").hide();
	
	$("#reasonForNotConducting").val("");
	$("#addlitionalCommentsCoachee").val("");
	$("#coacheeAdditionalComments").val("");
	$("#coacheeGoalAction").val("");
	
	$('#sessionDateString').datepicker({ 
		dateFormat: 'dd/mm/yy',
		//minDate: new Date(),
		maxDate: new Date(),
		beforeShowDay: DisableDates
	});
	
	jsBatchName = $("#jsBatchName").val();
	jsCoacheeName = $("#jsCoacheeName").val();
	jsCoachName = $("#jsCoachName").val();
	jsSupervisorName = $("#jsSupervisorName").val();
	
	$("#coachingGoalTableActive").DataTable({
		"ordering": false,
		"paging": true,
		"info": true,
		"lengthChange": true,
		"searching": true,
		"autoWidth": false,
		"responsive": true,
		"drawCallback": function(settings) {
			if (pagination) {
				$('#coachingGoalTableActive_paginate').find(".pagination").append('<li class="paginate_button page-item"><a onclick="loadNextSetValues()" id="loadMore_coachingGoalTableActive" class="fa fa-arrow-right page-link" href="#" title="Load More"></a></li>');
			}
		},
		"createdRow": function (row,data,index) {
	    	if(index % 2 == 0) {
	    		$(row).addClass("bg-table-row-0");
	    	} else {
	    		$(row).addClass("bg-table-row-1");
	    	}
	    },
		"buttons": ["csv", "excel", {
			extend: 'pdf',
			className:'buttons-pdf',
			text:'PDF',
			titleAttr: 'Download in PDF',
			title:"Coaching Report for Batch: "+jsBatchName+" - Coachee: "+jsCoacheeName+"\nCoach: "+jsCoachName+" - Supervisor : "+jsSupervisorName,
			orientation: 'portrait',
			customize: function (doc) {
				var now = new Date();
				var jsDate = now.getDate()+'-'+(now.getMonth()+1)+'-'+now.getFullYear();
				var logo = 'data:image/png;base64,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';
				doc['header']=(function() { return {
					columns: [{
						alignment: 'left',
						fontSize: 15,
						text: "ACT - ANAND Coaching Tracker",
					}, {
						alignment: 'right',
						image: logo,
						width: 100,
						height:20
					}],
					margin: 10
				}});
				doc['footer']=(function(page, pages) { return {
					columns: [{
						alignment: 'left',
						text: ['Created on: ', { text: jsDate.toString() }]
					}, {
						alignment: 'right',
						text: ['page ', { text: page.toString() },	' of ',	{ text: pages.toString() }]
					}],
					margin: 20
				}});
			},
			pageSize: 'LEGAL',
			exportOptions: {
				columns: ':visible thead th:not(.noExport)'
			}
		}, "print", "colvis"]
	}).buttons().container().appendTo('#coachingGoalTableActive_wrapper .col-md-6:eq(0)');

	var coachingGoalTableActive = $("#coachingGoalTableActive").DataTable();
	var loadAll = window.location.href.split("all").length;
	if(coachingGoalTableActive.rows().count() < 20 || loadAll > 1) {
		$("#loadMore_coachingGoalTableActive").hide();
		pagination = false;
	}
});
function loadNextSetValues() {
	var coachingGoalTableActive = $("#coachingGoalTableActive").DataTable();
	var offsetValue = coachingGoalTableActive.rows().count();
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	$.ajax({
		url:'loadMoreBatch',
		type:'GET',
		data:{'offsetValue':offsetValue},
		dataType : 'json',
		success: function(result) {
			for(var i=0; i<result.length; i++) {
				coachingGoalTableActive.row.add([
					result[i]["batchAction"],result[i]["batchName"],
					result[i]["batchDescription"],result[i]["batchActive"],
					result[i]["batchCreatedBy"],result[i]["batchCreatedOn"],
					result[i]["batchUpdatedBy"],result[i]["batchUpdatedOn"]
				]);
			}
			coachingGoalTableActive.draw(false);
			var currentPage = coachingGoalTableActive.page.info().page;
			var totalPages = coachingGoalTableActive.page.info().pages;
			console.log(totalPages);
			if(totalPages > 1) {
				if(currentPage != (totalPages-1)) {
					coachingGoalTableActive.page(currentPage+1).draw(false);
				}
			}
			$("#coachingGoalTableActive_paginate").scroll();
			$('#coachingGoalTableActive_paginate').show();
			if(result.length < 20) {
				pagination = false;
				$('#loadMore_coachingGoalTableActive').hide();
			}
			$('body').removeClass('disableClickBody');
			$(".anand-loader").hide();
		},
		error:function() {
			$('#coachingGoalTableActive_paginate').show();
			$('body').removeClass('disableClickBody');
			$(".anand-loader").hide();
			alert("Something went wrong, kindly try again after sometime.");
		}
	});
}
$('#reportStatusDiv input[type="radio"]').click(function() {
	$("#reportStatusError").html("");
});
$("#actCoacheeReport").submit(function(){
	$("#submitCoachingReportButton").addClass("disabledButton");
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	var submitOrNot = true;
	if(sessionDateStringValidation() == false) {
		submitOrNot = false;
	}
	if(meetingConductedStatusValidation() == false) {
		submitOrNot = false;
	}
	if(reasonForNotConductingValidation() == false) {
		submitOrNot = false;
	}
	if(coacheeAdditionalCommentsValidation() == false) {
		submitOrNot = false;
	}
	if(discussionAndInputsFromCoachValidation() == false) {
		submitOrNot = false;
	}
	$("#reportStatusError").html("");
	if($("#reportStatus1").prop("checked") == false && $("#reportStatus2").prop("checked") == false) {
		$("#reportStatusError").html("Report State must be selected.");
		submitOrNot = false;
	}
	if(submitOrNot) {
		return true;
	} else {
		$("#submitCoachingReportButton").removeClass("disabledButton");
		$('body').removeClass('disableClickBody');
		$(".anand-loader").hide();
		return false;
	}
});
$("#sessionDateString").focusout(function() {
	sessionDateStringValidation();
});

$("#actCoachReport").submit(function(){
	$("#submitCoachingReportButton").addClass("disabledButton");
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	var submitOrNot = true;
	
	if(coachAdditionalCommentsValidation() == false) {
		submitOrNot = false;
	}
	if(anyConcernOrObservationValidation() == false) {
		submitOrNot = false;
	}
	if(coachReasonForNotConductingValidation() == false) {
		submitOrNot = false;
	}
	if(submitOrNot) {
		return true;
	} else {
		$("#submitCoachingReportButton").removeClass("disabledButton");
		$('body').removeClass('disableClickBody');
		$(".anand-loader").hide();
		return false;
	}
});
$("#sessionDateString").focusout(function() {
	sessionDateStringValidation();
});

function sessionDateStringValidation() {
	$("#sessionDateString").removeClass("is-valid");
	$("#sessionDateString").removeClass("is-invalid");
	$("#sessionDateStringError").show();
	$("#sessionDateStringError").html("");
	var sessionDateString = $("#sessionDateString").val();
	if(sessionDateString != "") {
		$("#reasonForNotConducting").addClass("is-valid");
		return true;
	} else {
		$("#sessionDateString").addClass("is-invalid");
		$("#sessionDateStringError").html("Session Date must be selected.");
		return false;
	}
}
$("#meetingConductedStatus").change(function() {
	meetingConductedStatusValidation();
});
function meetingConductedStatusValidation() {
	$(".conducted").hide();
	$(".not-conducted").hide();
	$("#meetingConductedStatus").removeClass("is-valid");
	$("#meetingConductedStatus").removeClass("is-invalid");
	$("#meetingConductedStatusError").show();
	$("#meetingConductedStatusError").html("");
	var meetingConductedStatus = $("#meetingConductedStatus").val();
	if(meetingConductedStatus != -1) {
		if(meetingConductedStatus == 2) {
			$(".not-conducted").show();
			$(".conducted").hide();
			/*$("#reportStatus2").prop("checked", true);*/
		} else {
			$(".conducted").show();
			$(".not-conducted").hide();
			/*$("#reportStatus1").prop("checked", true);*/
		}
		$("#meetingConductedStatus").addClass("is-valid");
		return true;
	} else {
		$("#meetingConductedStatus").addClass("is-invalid");
		$("#meetingConductedStatusError").html("Select Meeting Status");
		return false;
	}
}
$("#reasonForNotConducting").focusout(function() {
	reasonForNotConductingValidation();
});
function reasonForNotConductingValidation() {
	$("#reasonForNotConducting").removeClass("is-valid");
	$("#reasonForNotConducting").removeClass("is-invalid");
	$("#reasonForNotConductingError").show();
	$("#reasonForNotConductingError").html("");
	var reasonForNotConducting = $("#reasonForNotConducting").val();
	var meetingConductedStatus = $("#meetingConductedStatus").val();
	if(meetingConductedStatus == 2) {
		if(reasonForNotConducting != "") {
			if(textCheck.test(reasonForNotConducting)) {
				$("#reasonForNotConducting").addClass("is-valid");
				return true;
			} else {
				$("#reasonForNotConducting").addClass("is-invalid");
				$("#reasonForNotConductingError").html("Special characters are not allowed");
				return false;
			}
		} else {
			$("#reasonForNotConducting").addClass("is-invalid");
			$("#reasonForNotConductingError").html("Enter reason for not conducting the meeting");
			return false;
		}
	} else {
		return true;
	}
}
$("#coacheeAdditionalComments").focusout(function() {
	coacheeAdditionalCommentsValidation();
});
function coacheeAdditionalCommentsValidation() {
	$("#coacheeAdditionalComments").removeClass("is-valid");
	$("#coacheeAdditionalComments").removeClass("is-invalid");
	$("#coacheeAdditionalCommentsError").show();
	$("#coacheeAdditionalCommentsError").html("");
	var coacheeAdditionalComments = $("#coacheeAdditionalComments").val();
	var meetingConductedStatus = $("#meetingConductedStatus").val();
	if(meetingConductedStatus == 1) {
		if(coacheeAdditionalComments != "") {
			if(textCheck.test(coacheeAdditionalComments)) {
				$("#coacheeAdditionalComments").addClass("is-valid");
				return true;
			} else {
				$("#coacheeAdditionalComments").addClass("is-invalid");
				$("#coacheeAdditionalCommentsError").html("Special characters are not allowed");
				return false;
			}
		} else {
			$("#coacheeAdditionalComments").addClass("is-invalid");
			$("#coacheeAdditionalCommentsError").html("Enter reason for not conducting the meeting");
			return false;
		}
	} else {
		return true;
	}
}
$("#discussionAndInputsFromCoach").focusout(function() {
	discussionAndInputsFromCoachValidation();
});
function discussionAndInputsFromCoachValidation() {
	$("#discussionAndInputsFromCoach").removeClass("is-valid");
	$("#discussionAndInputsFromCoach").removeClass("is-invalid");
	$("#discussionAndInputsFromCoachError").show();
	$("#discussionAndInputsFromCoachError").html("");
	var discussionAndInputsFromCoach = $("#discussionAndInputsFromCoach").val();
	var meetingConductedStatus = $("#meetingConductedStatus").val();
	if(meetingConductedStatus == 1) {
		if(discussionAndInputsFromCoach != "") {
			if(textCheck.test(discussionAndInputsFromCoach)) {
				$("#discussionAndInputsFromCoach").addClass("is-valid");
				return true;
			} else {
				$("#discussionAndInputsFromCoach").addClass("is-invalid");
				$("#discussionAndInputsFromCoachError").html("Special characters are not allowed");
				return false;
			}
		} else {
			$("#discussionAndInputsFromCoach").addClass("is-invalid");
			$("#discussionAndInputsFromCoachError").html("Enter discussion and inputs");
			return false;
		}
	} else {
		return true;
	}
}
$("#coachAdditionalComments").focusout(function() {
	coachAdditionalCommentsValidation();
});
function coachAdditionalCommentsValidation() {
	$("#coachAdditionalComments").removeClass("is-valid");
	$("#coachAdditionalComments").removeClass("is-invalid");
	$("#coachAdditionalCommentsError").show();
	$("#coachAdditionalCommentsError").html("");
	var coachAdditionalComments = $("#coachAdditionalComments").val();
	var meetingConductedStatusCoach = $("#meetingConductedStatusCoach").val();
	if(meetingConductedStatusCoach == 1) {
		if(coachAdditionalComments != "") {
			if(textCheck.test(coachAdditionalComments)) {
				$("#coachAdditionalComments").addClass("is-valid");
				return true;
			} else {
				$("#coachAdditionalComments").addClass("is-invalid");
				$("#coachAdditionalCommentsError").html("Special characters are not allowed");
				return false;
			}
		} else {
			$("#coachAdditionalComments").addClass("is-invalid");
			$("#coachAdditionalCommentsError").html("Enter additional comments");
			return false;
		}
	} else {
		return true;
	}
}
$("#anyConcernOrObservation").focusout(function() {
	anyConcernOrObservationValidation();
});
function anyConcernOrObservationValidation() {
	$("#anyConcernOrObservation").removeClass("is-valid");
	$("#anyConcernOrObservation").removeClass("is-invalid");
	$("#anyConcernOrObservationError").show();
	$("#anyConcernOrObservationError").html("");
	var anyConcernOrObservation = $("#anyConcernOrObservation").val();
	var meetingConductedStatusCoach = $("#meetingConductedStatusCoach").val();
	if(meetingConductedStatusCoach == 1) {
		if(anyConcernOrObservation != "") {
			if(textCheck.test(anyConcernOrObservation)) {
				$("#anyConcernOrObservation").addClass("is-valid");
				return true;
			} else {
				$("#anyConcernOrObservation").addClass("is-invalid");
				$("#anyConcernOrObservationError").html("Special characters are not allowed");
				return false;
			}
		} else {
			$("#anyConcernOrObservation").addClass("is-invalid");
			$("#anyConcernOrObservationError").html("Enter concern or observation noticed.");
			return false;
		}
	} else {
		return true;
	}
}
$("#coachReasonForNotConducting").focusout(function() {
	coachReasonForNotConductingValidation();
});
function coachReasonForNotConductingValidation() {
	$("#coachReasonForNotConducting").removeClass("is-valid");
	$("#coachReasonForNotConducting").removeClass("is-invalid");
	$("#coachReasonForNotConductingError").show();
	$("#coachReasonForNotConductingError").html("");
	var coachReasonForNotConducting = $("#coachReasonForNotConducting").val();
	var meetingConductedStatusCoach = $("#meetingConductedStatusCoach").val();
	if(meetingConductedStatusCoach == 2) {
		if(coachReasonForNotConducting != "") {
			if(textCheck.test(coachReasonForNotConducting)) {
				$("#coachReasonForNotConducting").addClass("is-valid");
				return true;
			} else {
				$("#coachReasonForNotConducting").addClass("is-invalid");
				$("#coachReasonForNotConductingError").html("Special characters are not allowed");
				return false;
			}
		} else {
			$("#coachReasonForNotConducting").addClass("is-invalid");
			$("#coachReasonForNotConductingError").html("Enter reason for not conducting the session.");
			return false;
		}
	} else {
		return true;
	}
}
function editReport(actCoacheeReportId) {
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	$.ajax({
		url: 'getCoacheeReportDetails',
		type: 'GET',
		data: { 'actCoacheeReportId': actCoacheeReportId },
		dataType: 'json',
		success: function(result) {
			clearEditFormValidation();
			$(".coacheeReportFooter").show();
			$(".coachReportFooter").hide();
			$("#actCoacheeReportId").val(actCoacheeReportId);
			
			$("#sessionDateString").val(result["sessionDate"]);
			$("#meetingConductedStatus").val(result["meetingStatus"]);
			
			if(result["meetingStatus"] == "1") {
				$(".reasonForNotConducting").hide();
				$(".coacheeAdditionalComments").show();
				$(".discussionAndInputsFromCoach").show();
				$("#coacheeAdditionalComments").val(result["additionalCommentsByCoachee"]);
				$("#discussionAndInputsFromCoach").val(result["discussionAndInputsFromCoach"]);
				
				$(".goalActionDiv").show();
				
			} else {
				$(".reasonForNotConducting").show();
				$("#reasonForNotConducting").val(result["reasonForNotConducting"]);
				$(".coacheeAdditionalComments").hide();
				$(".discussionAndInputsFromCoach").hide();
			}
			
			if(result["reportStatus"] == "1") {
				$("#reportStatus2").prop("checked", true);
			} else {
				$("#reportStatus1").prop("checked", true);
			}
			$('body').removeClass('disableClickBody');
			$(".anand-loader").hide();
			$('html, body').animate({
		        scrollTop: $(".coacheeReportFooter").offset().top
		    }, 800);
		},
		error: function() {
			alert("Something went wrong, try again later");
		}
	});
}
function clearEditFormValidation() {
}

function editReportCoach(actCoacheeReportId) {
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	$.ajax({
		url: 'getCoacheeReportDetails',
		type: 'GET',
		data: { 'actCoacheeReportId': actCoacheeReportId },
		dataType: 'json',
		success: function(result) {
			$(".coachReportFooter").show();
			$(".coacheeReportFooter").hide();
			clearEditFormValidation();
			$("#actCoacheeReportIdCoach").val(actCoacheeReportId);
			$("#sessionDateStringShow").html(result["sessionDate"]);
			$("#meetingConductedStatusCoach").val(result["meetingStatus"]);
			if(result["meetingStatus"] == "1") {
				$("#meetingConductedStatusShow").html("<span class='badge bg-primary'>Conducted</span>");
				$(".reasonForNotConductingShow").hide();
				$("#discussionAndInputsFromCoachShow").html(result["discussionAndInputsFromCoach"]);
				$(".discussionAndInputsFromCoachShow").show();
				$(".coachAdditionalComments").show();
				$(".anyConcernOrObservation").show();
				$(".coachReasonForNotConducting").remove();
			} else {
				$("#meetingConductedStatusShow").html("<span class='badge bg-danger'>Not-Conducted</span>");
				$(".reasonForNotConductingShow").show();
				$("#reasonForNotConductingShow").html(result["reasonForNotConducting"]);
				$(".discussionAndInputsFromCoachShow").remove();
				$(".coachAdditionalComments").remove();
				$(".anyConcernOrObservation").remove();
				$(".coachReasonForNotConducting").show();
			}
			$(".coachReportFooter").show();
			$('body').removeClass('disableClickBody');
			$(".anand-loader").hide();
			$('html, body').animate({
		        scrollTop: $(".coachReportFooter").offset().top
		    }, 800);
		},
		error: function() {
			alert("Something went wrong, try again later");
		}
	});
}
$("#addMoreGoalActionItem").click(function(){
	var coacheeActionIndex = $("#coacheeActionIndex").val();
	
	var goalOptionHtml = ""
	var jsGoalIndex = $("#jsGoalIndex").val();
	for(var i=0; i<jsGoalIndex; i++) {
		goalOptionHtml += "<option value='"+$("goalId"+i).val()+"'>"+$("goalName"+i).val()+"</option>"
	}
	
	var appendCoacheeGoalAction = "<div class='row goalAction"+coacheeActionIndex+"'>" +
	  "<div class='col-md-1'>" +
	    "<div class='form-group'>" +
	      "<a href='#' onclick='removeGoalAction("+coacheeActionIndex+");'><i class='fas fa-times'></i></a>" +
	      "<input id='actionGoalActive"+coacheeActionIndex+"' class='form-control' value='1' name='coacheeReportTemp.coacheeReportActionTempList["+coacheeActionIndex+"].reportActionActive' />" +
	    "</div>" +
	  "</div>" +
	  "<div class='col-md-4'>" +
	    "<div class='form-group'>" +
	      "<label for='actionGoal"+coacheeActionIndex+"'><span class='mandatory'>*</span>Select Goal</label>" +
	      "<select id='actionGoal"+coacheeActionIndex+"' class='form-control' name='coacheeReportTemp.coacheeReportActionTempList["+coacheeActionIndex+"].actCoacheeGoalId.actCoacheeGoalsId'>" + 
	        "<option value='-1'>Select Goal</option>" +
	        goalOptionHtml +
	      "</select>" +
          "<span class='error invalid-feedback' id='actionGoal"+coacheeActionIndex+"Error'></span>" +
        "</div>" +
      "</div>" +
      "<div class='col-md-7'>" +
        "<div class='form-group'>" +
          "<label for='goalAction"+coacheeActionIndex+"'><span class='mandatory'>*</span>Goal Action</label>" +
          "<textarea rows='3' class='form-control' type='text' id='goalAction["+coacheeActionIndex+"]' name='coacheeReportTemp.coacheeReportActionTempList["+coacheeActionIndex+"].goalAction' placeholder='Enter Goal Action' ></textarea>" +
          "<span class='error invalid-feedback' id='goalAction"+coacheeActionIndex+"Error'></span>" +
        "</div>" +
      "</div>" +
    "</div>";
	$(".goalActionBody").append(appendCoacheeGoalAction);
	
	coacheeActionIndex++;
	$("#coacheeActionIndex").val(coacheeActionIndex);
});
function removeGoalAction(goalActionIndex) {
	var coacheeActionFlag = 0;
	var coacheeActionIndex = $("#coacheeActionIndex").val();
	var id = "goalAction"+goalActionIndex
	$("."+id).hide();
	id = "actionGoalActive"+goalActionIndex
	$("#"+id).val(0);
	$('html, body').animate({
        scrollTop: $(".coacheeReportFooter").offset().top
    }, 800);
}