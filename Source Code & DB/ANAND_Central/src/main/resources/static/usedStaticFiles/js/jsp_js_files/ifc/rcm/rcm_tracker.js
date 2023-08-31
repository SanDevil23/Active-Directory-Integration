var pagination = true;
$(function() {
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
	$("#showTransactionInfo").DataTable();
	var tempYearId = $("#tempYearId").val();
	$(".yearId").val(tempYearId);
	var tempParentId = $("#tempParentId").val();
	$(".parentEntityId").val(tempParentId);
	$(".childEntityList").hide();
	if(tempParentId != -1) {
		$(".childEntityList").show();
	}
	var tempProcessId = $("#tempProcessId").val();
	$(".processId").val(tempProcessId);
	var tempFrequency = $("#tempFrequency").val();
	$(".frequency").val(tempFrequency);
	var tempPlantId = $("#tempPlantId").val();
	$(".plantId").val(tempPlantId);
	var tempResponsiblePersonId = $("#tempResponsiblePersonId").val();
	$(".responsiblePersonId").val(tempResponsiblePersonId);
	var tempLineManagerId = $("#tempLineManagerId").val();
	$(".lineManagerId").val(tempLineManagerId);
	var tempPraacId = $("#tempPraacId").val();
	$(".praacId").val(tempPraacId);
});
$("#departmentTable").DataTable({
	"ordering": false,
	"paging": true,
	"info": true,
	"lengthChange": true,
	"searching": true,
	"autoWidth": false,
	"responsive": true,
	"drawCallback": function(settings) {
		if (pagination) {
			$('#departmentTable_paginate').find(".pagination").append('<li class="paginate_button page-item"><a onclick="loadNextSetValues()" id="loadMore_departmentTable" class="fa fa-arrow-right page-link" href="#" title="Load More"></a></li>');
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
		title:"Location List",
		orientation: 'portrait',
		customize: function (doc) {
			var now = new Date();
			var jsDate = now.getDate()+'-'+(now.getMonth()+1)+'-'+now.getFullYear();
			var logo = 'data:image/png;base64,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';
			doc['header']=(function() { return {
				columns: [{
					alignment: 'left',
					fontSize: 15,
					text: "ANAND Projects",
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
}).buttons().container().appendTo('#departmentTable_wrapper .col-md-6:eq(0)');

var departmentTable = $("#departmentTable").DataTable();
var loadAll = window.location.href.split("all").length;
if(departmentTable.rows().count() < 20 || loadAll > 1) {
	$("#loadMore_departmentTable").hide();
	pagination = false;
}


function getTxnInfo(rcmTransactionId) {
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	$.ajax({
		url: 'getRcmTransactionDetails',
		type: 'GET',
		data: { 'rcmTransactionId': rcmTransactionId },
		dataType: 'json',
		success: function(result) {
			$(".plant").html(result["plant"]);
			$(".uploadDate").html(result["uploadDate"]);
			$(".tempDepartmentId").html(result["departmentName"]);
			$(".controlNo").html(result["controlNo"]);
			$(".tempProcessId").html(result["processName"]);
			$(".subProcess").html(result["subProcess"]);
			$(".processOwner").html(result["processOwner"]);
			$(".controlObjective").html(result["controlObjective"]);
			$(".risk").html(result["risk"]);
			$(".entityControl").html(result["entityControl"]);
			$(".controlStartDate").html(result["controlStartDate"]);
			$(".validityDate").html(result["validityDate"]);
			if(result["riskRating"] == 1) {
				$(".riskRating").html("Critical");
			} if(result["riskRating"] == 2) {
				$(".riskRating").html("Important");
			} if(result["riskRating"] == 3) {
				$(".riskRating").html("Preventive");
			}
			if(result["controlFrequency"] == 1) {
				$(".controlFrequency").html("Weekly");
			} if(result["controlFrequency"] == 2) {
				$(".controlFrequency").html("Every Fortnight");
			} if(result["controlFrequency"] == 3) {
				$(".controlFrequency").html("Monthly");
			} if(result["controlFrequency"] == 4) {
				$(".controlFrequency").html("Quarterly");
			} if(result["controlFrequency"] == 5) {
				$(".controlFrequency").html("Yearly");
			} if(result["controlFrequency"] == 6) {
				$(".controlFrequency").html("Once in Two Years");
			}
			if(result["uploadFrequency"] == 1) {
				$(".uploadFrequency").html("Weekly");
			} if(result["uploadFrequency"] == 2) {
				$(".uploadFrequency").html("Every Fortnight");
			} if(result["uploadFrequency"] == 3) {
				$(".uploadFrequency").html("Monthly");
			} if(result["uploadFrequency"] == 4) {
				$(".uploadFrequency").html("Quarterly");
			} if(result["uploadFrequency"] == 5) {
				$(".uploadFrequency").html("Yearly");
			} if(result["uploadFrequency"] == 6) {
				$(".uploadFrequency").html("Once in Two Years");
			}
			if(result["fraudRisk"] == 1) {
				$(".fraudRisk").html("No");
			} if(result["fraudRisk"] == 0) {
				$(".fraudRisk").html("Yes");
			}
			if(result["uniqueReferred"] == 1) {
				$(".uniqueReferred").html("Referred");
			} if(result["uniqueReferred"] == 0) {
				$(".uniqueReferred").html("Unique");
			}
			if(result["keyInfo"] == 0) {
				$(".keyInfo").html("Key");
			} if(result["keyInfo"] == 1) {
				$(".keyInfo").html("Non-Key");
			} if(result["keyInfo"] == 2) {
				$(".keyInfo").html("Others");
			}
			if(result["preventiveDetective"] == 1) {
				$(".preventiveDetective").html("Detective");
			} if(result["preventiveDetective"] == 0) {
				$(".preventiveDetective").html("Preventive");
			}
			if(result["controlType"] == 1) {
				$(".controlType").html("Manual");
			} if(result["controlType"] == 0) {
				$(".controlType").html("Automated");
			}
			$(".selfCertificateCheck").html(result["selfCertificateCheck"]);
			$(".remarks").html(result["remarks"]);
			$(".soh").html(result["soh"]);
			$(".lineManager").html(result["lineManager"]);
			$(".praac").html(result["praac"]);
			$(".compliantDate").html(result["compliantDate"]);
			$(".score").html(result["score"]);
			
			if(result["moreInfoDiv"] == 1) {
				var trackerIndex = parseInt(result["trackerIndex"]);
				var id = "showTransactionInfo";
				var t = $('#'+id).DataTable();
				t.clear().draw();
				for(var i=0; i< trackerIndex; i++) {
					var approverType = "approverType"+i;
					var approvedRejected = "approvedRejected"+i;
					var comments = "comments"+i;
					var approvalTimestamp = "approvalTimestamp"+i;
					if(result[approverType] == 1)
						approverType = "Line Manager";
					if(result[approverType] == 2)
						approverType = "PRAAC";
					if(result[approvedRejected] == 1)
						approvedRejected = "Approved";
					if(result[approvedRejected] == 0)
						approvedRejected = "Rejected";
					comments = result[comments];
					approvalTimestamp = result[approvalTimestamp];	
					t.row.add([approverType, approvedRejected, comments, approvalTimestamp]);
				}
				t.draw(false);
				$(".comments").html(result["comments"]);
				if(result["complianceFlag"] == 1) {
					$(".complianceFlag").html("Compliant");
				} else {
					$(".complianceFlag").html("Non-Compliant");
				}
				$("#fileDownload1").attr("href","getProofAttachment?id="+rcmTransactionId);
				$("#fileDownload1").html("<i class='fas fa-download'></i>&nbsp;"+result["proofName"]);
				$(".moreInfoDiv").show();
			} else {
				$(".moreInfoDiv").hide();
			}
			$('body').removeClass('disableClickBody');
			$(".anand-loader").hide();
			$("#rcmTransactionInformationModal").modal({
			    backdrop: 'static',
			    keyboard: false
			});
		},
		error: function() {
			$('body').removeClass('disableClickBody');
	        $(".anand-loader").hide();
			alert("Something went wrong, try again later");
		}
	});
}
function getApprovalInfo(rcmTransactionId,approvalStatus) {
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	$.ajax({
		url: 'getApprovalDetails',
		type: 'GET',
		data: { 'rcmTransactionId': rcmTransactionId },
		dataType: 'json',
		success: function(result) {
			$(".plant").html(result["plant"]);
			$(".uploadDate").html(result["uploadDate"]);
			$(".tempDepartmentId").html(result["departmentName"]);
			$(".controlNo").html(result["controlNo"]);
			$(".tempProcessId").html(result["processName"]);
			$(".subProcess").html(result["subProcess"]);
			$(".processOwner").html(result["processOwner"]);
			$(".controlObjective").html(result["controlObjective"]);
			$(".risk").html(result["risk"]);
			$(".entityControl").html(result["entityControl"]);
			$(".controlStartDate").html(result["controlStartDate"]);
			$(".validityDate").html(result["validityDate"]);
			if(result["riskRating"] == 1) {
				$(".riskRating").html("Critical");
			} if(result["riskRating"] == 2) {
				$(".riskRating").html("Important");
			} if(result["riskRating"] == 3) {
				$(".riskRating").html("Preventive");
			}
			if(result["controlFrequency"] == 1) {
				$(".controlFrequency").html("Weekly");
			} if(result["controlFrequency"] == 2) {
				$(".controlFrequency").html("Every Fortnight");
			} if(result["controlFrequency"] == 3) {
				$(".controlFrequency").html("Monthly");
			} if(result["controlFrequency"] == 4) {
				$(".controlFrequency").html("Quarterly");
			} if(result["controlFrequency"] == 5) {
				$(".controlFrequency").html("Yearly");
			} if(result["controlFrequency"] == 6) {
				$(".controlFrequency").html("Once in Two Years");
			}
			if(result["uploadFrequency"] == 1) {
				$(".uploadFrequency").html("Weekly");
			} if(result["uploadFrequency"] == 2) {
				$(".uploadFrequency").html("Every Fortnight");
			} if(result["uploadFrequency"] == 3) {
				$(".uploadFrequency").html("Monthly");
			} if(result["uploadFrequency"] == 4) {
				$(".uploadFrequency").html("Quarterly");
			} if(result["uploadFrequency"] == 5) {
				$(".uploadFrequency").html("Yearly");
			} if(result["uploadFrequency"] == 6) {
				$(".uploadFrequency").html("Once in Two Years");
			}
			if(result["fraudRisk"] == 1) {
				$(".fraudRisk").html("No");
			} if(result["fraudRisk"] == 0) {
				$(".fraudRisk").html("Yes");
			}
			if(result["uniqueReferred"] == 1) {
				$(".uniqueReferred").html("Referred");
			} if(result["uniqueReferred"] == 0) {
				$(".uniqueReferred").html("Unique");
			}
			if(result["keyInfo"] == 0) {
				$(".keyInfo").html("Key");
			} if(result["keyInfo"] == 1) {
				$(".keyInfo").html("Non-Key");
			} if(result["keyInfo"] == 2) {
				$(".keyInfo").html("Others");
			}
			if(result["preventiveDetective"] == 1) {
				$(".preventiveDetective").html("Detective");
			} if(result["preventiveDetective"] == 0) {
				$(".preventiveDetective").html("Preventive");
			}
			if(result["controlType"] == 1) {
				$(".controlType").html("Manual");
			} if(result["controlType"] == 0) {
				$(".controlType").html("Automated");
			}
			$(".selfCertificateCheck").html(result["selfCertificateCheck"]);
			$(".remarks").html(result["remarks"]);
			$(".soh").html(result["soh"]);
			$(".lineManager").html(result["lineManager"]);
			$(".praac").html(result["praac"]);
			$(".compliantDate").html(result["compliantDate"]);
			$(".score").html(result["score"]);
			
			if(result["moreInfoDiv"] == 1) {
				var trackerIndex = parseInt(result["trackerIndex"]);
				var id="addTransactionInfo";
				if(approvalStatus == 3){
				    id = "showAllTransactionInfo";
				}
				else{
					id= "addTransactionInfo";
				}
				var t = $('#'+id).DataTable();
				t.clear();
				for(var i=0; i< trackerIndex; i++) {
					var approverType = "approverType"+i;
					var approvedRejected = "approvedRejected"+i;
					var comments = "comments"+i;
					var approvalTimestamp = "approvalTimestamp"+i;
					if(result[approverType] == 1)
						approverType = "Line Manager";
					if(result[approverType] == 2)
						approverType = "PRAAC";
					if(result[approvedRejected] == 1)
						approvedRejected = "Approved";
					if(result[approvedRejected] == 0)
						approvedRejected = "Rejected";
					comments = result[comments];
					approvalTimestamp = result[approvalTimestamp];
					t.row.add([approverType, approvedRejected, comments, approvalTimestamp]).draw(false);
				}
				$(".comments").html(result["comments"]);
				if(result["complianceFlag"] == 1) {
					$(".complianceFlag").html("Compliant");
				} else {
					$(".complianceFlag").html("Non-Compliant");
				}
				$("#fileDownload").attr("href","getProofAttachment?id="+rcmTransactionId);
				$("#fileDownload").html("<i class='fas fa-download'></i>&nbsp;"+result["proofName"]);
				$(".moreInfoDiv").show();
			}
			else{
				$(".moreInfoDiv").hide();
			}
			
			if(approvalStatus == null || approvalStatus == 3){
				$("#rcmTransactionId").val(rcmTransactionId);
				$('body').removeClass('disableClickBody');
				$(".anand-loader").hide();
				if(result["actionAllowed"] == 0) {
					$(".submitControlComplianceInformation").hide();
				}
				else {
					$(".submitControlComplianceInformation").show();
				}
				if(approvalStatus == null){
					$(".sohInfoDiv").hide();
				}
				else{
					$(".sohInfoDiv").show();
				}
				$("#rcmSOHTransactionApprovalModal").modal({
				    backdrop: 'static',
				    keyboard: false
				});
			}
			else{
				if(approvalStatus == 0 || approvalStatus == 4){
					$("#transaction").val(rcmTransactionId);
					$("#approverType").val("1");
					$("#headingInfo").html("RCM Transaction Line Manager Approval Information")
				}
				if(approvalStatus == 2){
					$("#transaction").val(rcmTransactionId);
					$("#approverType").val("2");
					$("#headingInfo").html("RCM Transaction PRAAC Approval Information")
				}
				if(approvalStatus == 1){
					$("#transaction").val(rcmTransactionId);
					$("#approverType").val("2");
					$("#headingInfo").html("RCM Transaction PRAAC Approval Information")
				}
				$('body').removeClass('disableClickBody');
				$(".anand-loader").hide();
				$("#rcmTransactionApprovalModal").modal({
				    backdrop: 'static',
				    keyboard: false
				});
			}
			
		},
		error: function() {
			$('body').removeClass('disableClickBody');
			$(".anand-loader").hide();
			alert("Something went wrong, try again later");
		}
	});
}

$("#rcmSOHTransactionApproval").submit(function(){
	$("#saveRcmSOHTransactionApproval").addClass("disabledButton");
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	var submitOrNot = true;
	console.log(commentsValidation(""));
	if(commentsValidation("") == false) {
		submitOrNot = false;
	}
	if($("#complianceFlag1").prop("checked") == false && $("#complianceFlag2").prop("checked") == false) {
		$("#complianceFlagError").html("Compliance Flag must be selected");
		submitOrNot = false;
	}
	if(submitOrNot) {
		return true;
	} else {
		$("#saveRcmSOHTransactionApproval").removeClass("disabledButton");
		$('body').removeClass('disableClickBody');
		$(".anand-loader").hide();
		return false;
	}
});
$("#rcmTransactionApproval").submit(function(){
	$("#saveRcmTransactionApproval").addClass("disabledButton");
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	var submitOrNot = true;
	if(commentsValidation1("") == false) {
		submitOrNot = false;
	}
	if($("#approvedRejected1").prop("checked") == false && $("#approvedRejected2").prop("checked") == false) {
		$("#approvedRejectedError").html("Approval State must be selected");
		submitOrNot = false;
	}
	if(submitOrNot) {
		return true;
	} else {
		$("#saveRcmTransactionApproval").removeClass("disabledButton");
		$('body').removeClass('disableClickBody');
		$(".anand-loader").hide();
		return false;
	}
});
$("#comments").focusout(function() {
	commentsValidation("");
});
var commentsCheck = /^[ A-Za-z0-9-Á& ]*$/;
function commentsValidation(idAppend) {
	console.log("111");
	var id = "comments"+idAppend;
	var error = "commentsError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var comments = $("#"+id).val().replace(/\s+/g, " ");
	if(comments != "") {
		if(commentsCheck.test(comments) == false) {
			$("#"+error).html("Comments cannot contain special characters.");
			$("#"+id).addClass("is-invalid");
			console.log("1");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			console.log("2");
			return true;
		}
	} else {
		$("#"+error).html("Comments cannot be empty.");
		$("#"+id).addClass("is-invalid");
		console.log("3");
		return false;
	}
}
$("#comments1").focusout(function() {
	commentsValidation("");
});
var commentsCheck = /^[ A-Za-z0-9-Á& ]*$/;
function commentsValidation1(idAppend) {
	var id = "comments1"+idAppend;
	var error = "commentsError1"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var comments = $("#"+id).val().replace(/\s+/g, " ");
	if(comments != "") {
		if(commentsCheck.test(comments) == false) {
			$("#"+error).html("Comments cannot contain special characters.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		$("#"+error).html("Comments cannot be empty.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#approvedRejected").change(function() {
	approvedRejectedValidation("");
});
function approvedRejectedValidation(idAppend) {
	var id = "approvedRejected"+idAppend;
	var error = "approvedRejectedError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var approvedRejected = $("#"+id).val();
	if(approvedRejected != "-1") {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Approval State cannot be empty.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$('#complianceFlag input[type="radio"]').click(function() {
	$("#complianceFlagError").html("");
});
function savePostTrackerValue(){
	$('#postTrackerValue').submit();
	$("#savePostTrackerValue").addClass("disabledButton");
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
};
$(".clearRcmTrackerFilter").click(function(){
	$("#processId").val(-1);
	$("#frequency").val(-1);
	$("#plantId").val(-1);
	$("#parentEntityId").val(-1);
	$(".yearId").val(-1);
	$("#responsiblePersonId").val(-1);
	$("#lineManagerId").val(-1);
	$("#praacId").val(-1);
	$("#clearPostTrackerValue").addClass("disabledButton");
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	$("#postTrackerValue").submit();
});