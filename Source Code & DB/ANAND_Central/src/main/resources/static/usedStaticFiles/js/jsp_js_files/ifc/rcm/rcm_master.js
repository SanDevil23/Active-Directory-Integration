var pagination = true;
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
$(function() {
	$('#controlStartDateTemp').datepicker({ 
		dateFormat: 'dd/mm/yy',
		//minDate: new Date(),
		beforeShowDay: DisableDates
	});
	$('#validityDateTemp').datepicker({ 
		dateFormat: 'dd/mm/yy',
		//minDate: new Date(),
		beforeShowDay: DisableDates
	});
	$("#controlStartDateTempEdit").datepicker({ 
		dateFormat: 'dd/mm/yy',
		//minDate: new Date(),
		beforeShowDay: DisableDates
	});
});
var counter=1;
var plantIndex = 0;
var plantIndexEdit = 0;
function addDataToTable(idAppend) {
	var id = "addPlantTable"+idAppend;
	var t = $('#'+id).DataTable();
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	$.ajax({
		url:'loadMoreEntity',
		type:'GET',
		data:{'offsetValue':1, 'all' : 1},
		dataType : 'json',
		success: function(result) {
			var tempPlantIndex = 0;
			if(idAppend == "Edit") {
				tempOlantIndex = $("#plantIndexEditForm").val();
			} else {
				tempOlantIndex = plantIndex;
			}
			var plantInfo = "<input type='hidden' name='plantListTemp["+tempOlantIndex+"].rcmPlantId' value='' />"
			plantInfo += "<select name='plantListTemp["+tempOlantIndex+"].plantIdTemp' class='form-control' id='plant"+tempOlantIndex+"' onchange='addEntries("+tempOlantIndex+",this,\""+idAppend+"\")' >";
			/*var sohBy = "<select name='plantListTemp["+tempOlantIndex+"].sohBy' class='form-control' id='responsiblePerson"+tempOlantIndex+"' onchange='addEntries1("+tempOlantIndex+",this);'>";*/
			var sohBy = "<select name='plantListTemp["+tempOlantIndex+"].sohByTemp' class='form-control' id='responsiblePerson"+tempOlantIndex+"'>";
			var lineManager = "<select name='plantListTemp["+tempOlantIndex+"].lineManagerTemp' class='form-control' id='lineManager"+tempOlantIndex+"'>";
			var praac = "<select name='plantListTemp["+tempOlantIndex+"].praacTemp' class='form-control' id='praac"+tempOlantIndex+"'>";
			plantInfo += "<option value='-1'>Select Plant</option>";
			var remove = "";
			for(var i=0; i<result.length; i++) {
				plantInfo += "<option value='"+result[i]["mEntityId"]+"'>"+result[i]["entityName"]+"</option>";
			}
			sohBy += "<option value='-1'>Select SOH By "+tempOlantIndex+"</option>";
			lineManager += "<option value='-1'>Select Line Manager "+tempOlantIndex+"</option>";
			praac += "<option value='-1'>Select PRAAC "+tempOlantIndex+"</option>";
			remove = "";
			remove = "<a style='padding-top:10px' href='#' title='remove'><i class='fas fa-trash row"+tempOlantIndex+"'><input type='hidden' name='plantListTemp["+tempOlantIndex+"].plantActive' id='plantActive"+tempOlantIndex+"' value='1' /></i></a>";
			plantInfo += "</select>";
			plantInfo +="<span class='error invalid-feedback' id='plantError"+tempOlantIndex+"'></span>"
			sohBy += "</select>";
			sohBy +="<span class='error invalid-feedback' id='responsiblePersonError"+tempOlantIndex+"'></span>"
			lineManager += "</select>";
			lineManager +="<span class='error invalid-feedback' id='lineManagerError"+tempOlantIndex+"'></span>"
			praac += "</select>";
			t.row.add([plantInfo, sohBy, lineManager, praac, remove]).draw(false);
			t.draw(false);
			if(idAppend == "Edit") {
				plantIndexEdit = $("#plantIndexEditForm").val();
				plantIndexEdit++;
				$("#plantIndexEditForm").val(plantIndexEdit);
			} else {
				plantIndex++;
			}
			$('body').removeClass('disableClickBody');
			$(".anand-loader").hide();
		},
		error:function() {
			$('#appTable_paginate').show();
			$('body').removeClass('disableClickBody');
			$(".anand-loader").hide();
			alert("Something went wrong, kindly try again after sometime.");
		}
	});
}
function addEntries(plant,num,idAppend){
	var id = "addPlantTable"+idAppend;
	var t = $('#'+id).DataTable();
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	$.ajax({
	    url:'getSohPerson',
	    type:'GET',
	    data:{'mEntityId': num.value},
	    dataType : 'json',
	    success: function(result) {
	    	var responsiblePersonId = "responsiblePerson"+plant;
	    	var lineManager = "lineManager"+plant;
	    	var praac = "praac"+plant;
	    	$("#"+responsiblePersonId).empty();
	    	$("#"+responsiblePersonId).append("<option value='-1'>Select SOH By "+plant+"</option>");
	    	/*$("#"+lineManager).empty();
	    	$("#"+lineManager).append("<option value='-1'>Select Line Manager "+plant+"</option>");
	    	$("#"+praac).empty();
	    	$("#"+praac).append("<option value='-1'>Select PRAAC "+plant+"</option>");*/
	        for(var i=0; i<result.length; i++) {
	        	if(parseInt(result[i]["mEntityId"])==parseInt(num.value)) {
	        		$("#"+responsiblePersonId).append("<option value='"+result[i]["mUserId"]+"'>" + result[i]["userFirstName"] + " " + result[i]["userLastName"] +"</option>");
	        	}
	        }
	        $('body').removeClass('disableClickBody');
	        $(".anand-loader").hide();
	    },
	    error:function() {
	        $('#appTable_paginate').show();
	        $('body').removeClass('disableClickBody');
	        $(".anand-loader").hide();
	        alert("Something went wrong, kindly try again after sometime.");
	    }
	});
	$.ajax({
	    url:'getLineManager',
	    type:'GET',
	    data:{'mEntityId': num.value},
	    dataType : 'json',
	    success: function(result) {
	    	var lineManager = "lineManager"+plant;
    	$("#"+lineManager).empty();
	    	$("#"+lineManager).append("<option value='-1'>Select Line Manager "+plant+"</option>");
	        for(var i=0; i<result.length; i++) {
	        	$("#"+lineManager).append("<option value='"+result[i]["mUserId"]+"'>" + result[i]["userFirstName"] + " " + result[i]["userLastName"] +"</option>");
	        }
	        $('body').removeClass('disableClickBody');
	        $(".anand-loader").hide();
	    },
	    error:function() {
	        $('#appTable_paginate').show();
	        $('body').removeClass('disableClickBody');
	        $(".anand-loader").hide();
	        alert("Something went wrong, kindly try again after sometime.");
	    }
	});
	$.ajax({
	    url:'getPraac',
	    type:'GET',
	    data:{'mEntityId': num.value},
	    dataType : 'json',
	    success: function(result) {
	    	var praac = "praac"+plant;
	    	var lineManager = "lineManager"+plant;
	    	$("#"+praac).empty();
	    	$("#"+praac).append("<option value='-1'>Select PRAAC "+plant+"</option>");
	    	console.log(result.length+" - "+praac);
	        for(var i=0; i<result.length; i++) {
	        	console.log(result[i]["userFirstName"]);
	        	$("#"+praac).append("<option value='"+result[i]["mUserId"]+"'>" + result[i]["userFirstName"] + " " + result[i]["userLastName"] +"</option>");
	        }
	        $('body').removeClass('disableClickBody');
	        $(".anand-loader").hide();
	    },
	    error:function() {
	        $('#appTable_paginate').show();
	        $('body').removeClass('disableClickBody');
	        $(".anand-loader").hide();
	        alert("Something went wrong, kindly try again after sometime.");
	    }
	});	
}
$('#addPlantTable tbody').on( 'click', 'i.fa-trash', function () {
	var table = $('#addPlantTable').DataTable();
	var classNow = $(this).attr("class");
	var classSplit = classNow.split("row");
	var a="plantActive"+classSplit[1];
	$("#"+a).val('0');
	table.row($(this).parents('tr')).remove().draw();
	$('html, body').animate({
		scrollTop: $("#rcmStatus").offset().top
	}, 20);
	
});
$('#addPlantTableEdit tbody').on( 'click', 'i.fa-trash', function () {
	var table = $('#addPlantTableEdit').DataTable();
	var classNow = $(this).attr("class");
	var classSplit = classNow.split("row");
	var a="plantActive"+classSplit[1];
	$("#"+a).val('0');
	table.row($(this).parents('tr')).remove().draw();
	$('html, body').animate({
		scrollTop: $("#rcmStatus").offset().top
	}, 20);
	
});

$("#rcmMasterTable").DataTable({
	"ordering": false,
	"paging": true,
	"info": true,
	"lengthChange": true,
	"searching": true,
	"autoWidth": true,
	"responsive": true,
	"drawCallback": function(settings) {
		if (pagination) {
			$('#rcmMasterTable_paginate').find(".pagination").append('<li class="paginate_button page-item"><a onclick="loadNextSetValues()" id="loadMore_rcmMasterTable" class="fa fa-arrow-right page-link" href="#" title="Load More"></a></li>');
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
}).buttons().container().appendTo('#rcmMasterTable_wrapper .col-md-6:eq(0)');

var rcmMasterTable = $("#rcmMasterTable").DataTable();
var loadAll = window.location.href.split("all").length;
if(rcmMasterTable.rows().count() < 20 || loadAll > 1) {
	$("#loadMore_rcmMasterTable").hide();
	pagination = false;
}
if($("#openAddModel").val() != "") {
	$(".btn-tool").click();
}
if($("#openEditModel").val() != "") {
	$("#closeEditRcmModal").attr("onclick", "location.href='rcm'");
	$("#rcmMasterEditModal").modal({
	    backdrop: 'static',
	    keyboard: false
	});
}

$("#rcmMasterEdit").submit(function(){
	$("#saveRcmChanges").addClass("disabledButton");
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	var submitOrNot = true;
	if(controlNoValidation("Edit") == false) {
		submitOrNot = false;
	}
	if(subProcessValidation("Edit") == false) {
		submitOrNot = false;
	}
	if(processOwnerValidation("Edit") == false) {
		submitOrNot = false;
	}
	if(controlObjectiveValidation("Edit") == false) {
		submitOrNot = false;
	}
	if(riskValidation("Edit") == false) {
		submitOrNot = false;
	}
	if(entityControlValidation("Edit") == false) {
		submitOrNot = false;
	}
	if(selfCertificateCheckValidation("Edit") == false) {
		submitOrNot = false;
	}
	if(remarksValidation("Edit") == false) {
		submitOrNot = false;
	}
	if(processCycleValidation("Edit") == false) {
		submitOrNot = false;
	}
	if(departmentValidation("Edit") == false) {
		submitOrNot = false;
	}
	if(riskRatingValidation("Edit") == false) {
		submitOrNot = false;
	}
	if(controlFrequencyValidation("Edit") == false) {
		submitOrNot = false;
	}
	if(uploadFrequencyValidation("Edit") == false) {
		submitOrNot = false;
	}
	if(controlStartDateTempValidation("Edit") == false) {
		submitOrNot = false;
	}
	if(validityDateTempValidation("Edit") == false) {
		submitOrNot = false;
	}
	
	for(i=0;i<$('#plantIndexEditForm').val();i++){
		if(plantInfoValidation(i,"") == false) {
			submitOrNot = false;
		}
		if(sohValidation(i,"") == false) {
			submitOrNot = false;
		}
		if(lineManagerValidation(i,"") == false) {
			submitOrNot = false;
		}
		var k="plant"+i;
		$("#"+k).change(function() {
			plantInfoValidation(i,"");
		});
		var k1="responsiblePerson"+i;
		$("#"+k1).change(function() {
			sohValidation(i,"");
		});
		var k2="lineManager"+i;
		$("#"+k2).change(function() {
			lineManagerValidation(i,"");
		});
	}
	function plantInfoValidation(plantIndex,idAppend) {
		var id = "plant"+plantIndex+idAppend;
		var error = "plantError"+plantIndex+idAppend;
		$("#"+id).removeClass("is-valid");
		$("#"+id).removeClass("is-invalid");
		$("#"+error).html("");
		var plant = $("#"+id).val();
		if(plant != "-1") {
			$("#"+id).addClass("is-valid");
			return true;
		} else {
			$("#"+error).html("Plant cannot be empty.");
			$("#"+id).addClass("is-invalid");
			return false;
		}
	}
	function sohValidation(plantIndex,idAppend) {
		var id = "responsiblePerson"+plantIndex+idAppend;
		var error = "responsiblePersonError"+plantIndex+idAppend;
		$("#"+id).removeClass("is-valid");
		$("#"+id).removeClass("is-invalid");
		$("#"+error).html("");
		var plant = $("#"+id).val();
		if(plant != "-1") {
			$("#"+id).addClass("is-valid");
			return true;
		} else {
			$("#"+error).html("SOH cannot be empty.");
			$("#"+id).addClass("is-invalid");
			return false;
		}
	}
	function lineManagerValidation(plantIndex,idAppend) {
		var id = "lineManager"+plantIndex+idAppend;
		var error = "lineManagerError"+plantIndex+idAppend;
		$("#"+id).removeClass("is-valid");
		$("#"+id).removeClass("is-invalid");
		$("#"+error).html("");
		var plant = $("#"+id).val();
		if(plant != "-1") {
			$("#"+id).addClass("is-valid");
			return true;
		} else {
			$("#"+error).html("Line Manager cannot be empty.");
			$("#"+id).addClass("is-invalid");
			return false;
		}
	}
	
	if($("#fraudRiskEdit1").prop("checked") == false && $("#fraudRiskEdit2").prop("checked") == false) {
		$("#fraudRiskEditError").html("Fraud Risk state must be selected");
		submitOrNot = false;
	}
	if($("#uniqueReferredEdit1").prop("checked") == false && $("#uniqueReferredEdit2").prop("checked") == false) {
		$("#uniqueReferredEditError").html("Unique Referred state must be selected");
		submitOrNot = false;
	}
	if($("#keyNonKeyOthersEdit1").prop("checked") == false && $("#keyNonKeyOthersEdit2").prop("checked") == false && $("#keyNonKeyOthersEdit3").prop("checked") == false) {
		$("#keyNonKeyOthersEditError").html("Key state must be selected");
		submitOrNot = false;
	}
	if($("#preventiveDetectiveEdit1").prop("checked") == false && $("#preventiveDetectiveEdit2").prop("checked") == false) {
		$("#preventiveDetectiveEditError").html("Preventive Detective state must be selected");
		submitOrNot = false;
	}
	if($("#typeOfControlEdit1").prop("checked") == false && $("#typeOfControlEdit2").prop("checked") == false) {
		$("#typeOfControlEditError").html("Type Of Control state must be selected");
		submitOrNot = false;
	}
	if($("#rcmStatusEdit1").prop("checked") == false && $("#rcmStatusEdit2").prop("checked") == false) {
		$("#rcmStatusEditError").html("RCM Status must be selected");
		submitOrNot = false;
	}
	if(submitOrNot) {
		return true;
	} else {
		$("#saveRcmChanges").removeClass("disabledButton");
		$('body').removeClass('disableClickBody');
		$(".anand-loader").hide();
		return false;
	}
});

function editRcm(rcmId) {
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	$.ajax({
		url: 'getRcmDetails',
		type: 'GET',
		data: { 'rcmId': rcmId },
		dataType: 'json',
		success: function(result) {
			$("#rcmId").val(rcmId);
			$("#controlNoEdit").val(result["controlNo"]);
			$("#tempProcessIdEdit").val(result["mProcessId"]);
			$("#subProcessEdit").val(result["subProcess"]);
			$("#processOwnerEdit").val(result["processOwner"]);
			$("#controlObjectiveEdit").val(result["controlObjective"]);
			$("#riskEdit").val(result["risk"]);
			$("#riskRatingEdit").val(result["riskRating"]);
			$("#controlFrequencyEdit").val(result["controlFrequency"]);
			$("#entityControlEdit").val(result["entityControl"]);
			$("#tempDepartmentIdEdit").val(result["mDepartmentId"]);
			$("#uploadFrequencyEdit").val(result["uploadFrequency"]);
			$("#selfCertificateCheckEdit").val(result["selfCertificateCheck"]);
			$("#remarksEdit").val(result["remarks"]);

			var plantIndex = parseInt(result["plantIndex"]);
			$("#plantIndexEditForm").val(plantIndex);
			var plantTableEdit = $("#addPlantTableEdit").DataTable();
			plantTableEdit.clear().draw();

			for(var i=0; i< plantIndex; i++) {
				var plant = "plant"+i;
				var sohBy = "sohBy"+i;
				var lineManager = "lineManager"+i;
				var praac = "praac"+i;
				var rcmPlantId = "rcmPlantId"+i;
				plant = result[plant] + "<input type='hidden' name='plantListTemp["+i+"].rcmPlantId' value='"+result[rcmPlantId]+"' />"
				sohBy = result[sohBy];
				lineManager = result[lineManager];
				praac = result[praac];
				/*rcmPlantId = result[rcmPlantId];*/
				rcmPlantId = "<a style='padding-top:10px' href='#' title='remove'><i class='fas fa-trash row"+i+"'><input type='hidden' name='plantListTemp["+i+"].plantActive' id='plantActive"+i+"' value='1' /></i></a>";
				plantTableEdit.row.add([plant, sohBy, lineManager, praac, rcmPlantId]).draw(false);
			}

			if(result["rcmStatus"] == "1") {
				$("#rcmStatusEdit1").prop('checked', true);
				$("#rcmStatusEdit2").prop('checked', false);
			} else {
				$("#rcmStatusEdit1").prop('checked', false);
				$("#rcmStatusEdit2").prop('checked', true);
			}
			if(result["controlType"] == "0") {
				$("#typeOfControlEdit1").prop('checked', true);
				$("#typeOfControlEdit2").prop('checked', false);
			} else {
				$("#typeOfControlEdit1").prop('checked', false);
				$("#typeOfControlEdit2").prop('checked', true);
			}
			if(result["preventiveDetective"] == "0") {
				$("#preventiveDetectiveEdit1").prop('checked', true);
				$("#preventiveDetectiveEdit2").prop('checked', false);
			} else {
				$("#preventiveDetectiveEdit1").prop('checked', false);
				$("#preventiveDetectiveEdit2").prop('checked', true);
			}
			if(result["keyInfo"] == "0") {
				$("#keyNonKeyOthersEdit1").prop('checked', true);
				$("#keyNonKeyOthersEdit2").prop('checked', false);
				$("#keyNonKeyOthersEdit3").prop('checked', false);
			} else if(result["keyInfo"] == "1") {
				$("#keyNonKeyOthersEdit1").prop('checked', false);
				$("#keyNonKeyOthersEdit2").prop('checked', true);
				$("#keyNonKeyOthersEdit3").prop('checked', false);
			}
			else{
				$("#keyNonKeyOthersEdit1").prop('checked', false);
				$("#keyNonKeyOthersEdit2").prop('checked', false);
				$("#keyNonKeyOthersEdit3").prop('checked', true);
			}
			if(result["uniqueReferred"] == "0") {
				$("#uniqueReferredEdit1").prop('checked', true);
				$("#uniqueReferredEdit2").prop('checked', false);
			} else {
				$("#uniqueReferredEdit1").prop('checked', false);
				$("#uniqueReferredEdit2").prop('checked', true);
			}
			if(result["fraudRisk"] == "0") {
				$("#fraudRiskEdit1").prop('checked', true);
				$("#fraudRiskEdit2").prop('checked', false);
			} else {
				$("#fraudRiskEdit1").prop('checked', false);
				$("#fraudRiskEdit2").prop('checked', true);
			}

			$('body').removeClass('disableClickBody');
			$(".anand-loader").hide();
			$("#rcmMasterEditModal").modal({
			    backdrop: 'static',
			    keyboard: false
			});
		},
		error: function() {
			alert("Something went wrong, try again later");
		}
	});
}
function getRcmInfo(rcmId) {
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	$.ajax({
		url: 'getRcmDetails',
		type: 'GET',
		data: { 'rcmId': rcmId },
		dataType: 'json',
		success: function(result) {
			$(".controlNo").html(result["controlNo"]);
			$(".tempProcessId").html(result["processName"]);
			$(".subProcess").html(result["subProcess"]);
			$(".processOwner").html(result["processOwner"]);
			$(".controlObjective").html(result["controlObjective"]);
			$(".risk").html(result["risk"]);
			$(".entityControl").html(result["entityControl"]);
			$(".tempDepartmentId").html(result["departmentName"]);
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
			if(result["rcmStatus"] == 1) {
				$(".rcmStatus").html("Active");
			} if(result["rcmStatus"] == 0) {
				$(".rcmStatus").html("Inactive");
			}
			var plantIndex = parseInt(result["plantIndex"]);
			$("#plantIndexInfoForm").val(plantIndex);
			var plantTableInfo = $("#addPlantTableInfo").DataTable();
			plantTableInfo.clear().draw();

			for(var i=0; i< plantIndex; i++) {
				var plant = "plant"+i;
				var sohBy = "sohBy"+i;
				var lineManager = "lineManager"+i;
				var praac = "praac"+i;
				$(".controlObjective").html(result["plant"]);
				var rcmPlantId = "rcmPlantId"+i;
				plant = result[plant] + "<input type='hidden' name='plantListTemp["+i+"].rcmPlantId' value='"+result[rcmPlantId]+"' />"
				sohBy = result[sohBy];
				lineManager = result[lineManager];
				praac = result[praac];
				plantTableInfo.row.add([plant, sohBy, lineManager, praac]).draw(false);
			}

			$('body').removeClass('disableClickBody');
			$(".anand-loader").hide();
			$("#rcmMasterInformationModal").modal({
			    backdrop: 'static',
			    keyboard: false
			});
		},
		error: function() {
			alert("Something went wrong, try again later");
		}
	});
}

$("#rcmMaster").submit(function(){
	$("#submitRcmButton").addClass("disabledButton");
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	var submitOrNot = true;
	if(controlNoValidation("") == false) {
		submitOrNot = false;
	}
	if(subProcessValidation("") == false) {
		submitOrNot = false;
	}
	if(processOwnerValidation("") == false) {
		submitOrNot = false;
	}
	if(controlObjectiveValidation("") == false) {
		submitOrNot = false;
	}
	if(riskValidation("") == false) {
		submitOrNot = false;
	}
	if(entityControlValidation("") == false) {
		submitOrNot = false;
	}
	if(selfCertificateCheckValidation("") == false) {
		submitOrNot = false;
	}
	if(remarksValidation("") == false) {
		submitOrNot = false;
	}
	if(processCycleValidation("") == false) {
		submitOrNot = false;
	}
	if(departmentValidation("") == false) {
		submitOrNot = false;
	}
	if(riskRatingValidation("") == false) {
		submitOrNot = false;
	}
	if(controlFrequencyValidation("") == false) {
		submitOrNot = false;
	}
	if(uploadFrequencyValidation("") == false) {
		submitOrNot = false;
	}
	if(controlStartDateTempValidation("") == false) {
		submitOrNot = false;
	}
	if(validityDateTempValidation("") == false) {
		submitOrNot = false;
	}

	for(i=0;i<plantIndex;i++){
		if(plantInfoValidation(i,"") == false) {
			submitOrNot = false;
		}
		if(sohValidation(i,"") == false) {
			submitOrNot = false;
		}
		if(lineManagerValidation(i,"") == false) {
			submitOrNot = false;
		}
		var k="plant"+i;
		$("#"+k).change(function() {
			plantInfoValidation(i,"");
		});
		var k1="responsiblePerson"+i;
		$("#"+k1).change(function() {
			sohValidation(i,"");
		});
		var k2="lineManager"+i;
		$("#"+k2).change(function() {
			lineManagerValidation(i,"");
		});
	}
	function plantInfoValidation(plantIndex,idAppend) {
		var id = "plant"+plantIndex+idAppend;
		var error = "plantError"+plantIndex+idAppend;
		$("#"+id).removeClass("is-valid");
		$("#"+id).removeClass("is-invalid");
		$("#"+error).html("");
		var plant = $("#"+id).val();
		if(plant != "-1") {
			$("#"+id).addClass("is-valid");
			return true;
		} else {
			$("#"+error).html("Plant cannot be empty.");
			$("#"+id).addClass("is-invalid");
			return false;
		}
	}
	function sohValidation(plantIndex,idAppend) {
		var id = "responsiblePerson"+plantIndex+idAppend;
		var error = "responsiblePersonError"+plantIndex+idAppend;
		$("#"+id).removeClass("is-valid");
		$("#"+id).removeClass("is-invalid");
		$("#"+error).html("");
		var plant = $("#"+id).val();
		if(plant != "-1") {
			$("#"+id).addClass("is-valid");
			return true;
		} else {
			$("#"+error).html("SOH cannot be empty.");
			$("#"+id).addClass("is-invalid");
			return false;
		}
	}
	function lineManagerValidation(plantIndex,idAppend) {
		var id = "lineManager"+plantIndex+idAppend;
		var error = "lineManagerError"+plantIndex+idAppend;
		$("#"+id).removeClass("is-valid");
		$("#"+id).removeClass("is-invalid");
		$("#"+error).html("");
		var plant = $("#"+id).val();
		if(plant != "-1") {
			$("#"+id).addClass("is-valid");
			return true;
		} else {
			$("#"+error).html("Line Manager cannot be empty.");
			$("#"+id).addClass("is-invalid");
			return false;
		}
	}

	if($("#fraudRisk1").prop("checked") == false && $("#fraudRisk2").prop("checked") == false) {
		$("#fraudRiskError").html("Fraud Risk state must be selected");
		submitOrNot = false;
	}
	if($("#uniqueReferred1").prop("checked") == false && $("#uniqueReferred2").prop("checked") == false) {
		$("#uniqueReferredError").html("Unique Referred state must be selected");
		submitOrNot = false;
	}
	if($("#keyNonKeyOthers1").prop("checked") == false && $("#keyNonKeyOthers2").prop("checked") == false && $("#keyNonKeyOthers3").prop("checked") == false) {
		$("#keyNonKeyOthersError").html("Key state must be selected");
		submitOrNot = false;
	}
	if($("#preventiveDetective1").prop("checked") == false && $("#preventiveDetective2").prop("checked") == false) {
		$("#preventiveDetectiveError").html("Preventive Detective state must be selected");
		submitOrNot = false;
	}
	if($("#typeOfControl1").prop("checked") == false && $("#typeOfControl2").prop("checked") == false) {
		$("#typeOfControlError").html("Type Of Control state must be selected");
		submitOrNot = false;
	}
	if($("#rcmStatus1").prop("checked") == false && $("#rcmStatus2").prop("checked") == false) {
		$("#rcmStatusError").html("RCM Status must be selected");
		submitOrNot = false;
	}
	if(submitOrNot) {
		return true;
	} else {
		$("#submitRcmButton").removeClass("disabledButton");
		$('body').removeClass('disableClickBody');
		$(".anand-loader").hide();
		return false;
	}
});
$("#controlNo").focusout(function() {
	controlNoValidation("");
});
$("#controlNoEdit").focusout(function() {
	controlNoValidation("Edit");
});
var controlNoCheck = /^[ A-Za-z0-9-Á& ]*$/;
function controlNoValidation(idAppend) {
	var id = "controlNo"+idAppend;
	var error = "controlNoError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var controlNo = $("#"+id).val().replace(/\s+/g, " ");
	if(controlNo != "") {
		if(controlNoCheck.test(controlNo) == false) {
			$("#"+error).html("Control No cannot contain special characters.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		$("#"+error).html("Control No cannot be empty.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#subProcess").focusout(function() {
	subProcessValidation("");
});
$("#subProcessEdit").focusout(function() {
	subProcessValidation("Edit");
});
var subProcessCheck = /^[ A-Za-z0-9-Á& ]*$/;
function subProcessValidation(idAppend) {
	var id = "subProcess"+idAppend;
	var error = "subProcessError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var subProcess = $("#"+id).val().replace(/\s+/g, " ");
	if(subProcess != "") {
		if(subProcessCheck.test(subProcess) == false) {
			$("#"+error).html("Sub Process cannot contain special characters.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		$("#"+error).html("Sub Process cannot be empty.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#processOwner").focusout(function() {
	processOwnerValidation("");
});
$("#processOwnerEdit").focusout(function() {
	processOwnerValidation("Edit");
});
var processOwnerCheck = /^[ A-Za-z0-9-Á& ]*$/;
function processOwnerValidation(idAppend) {
	var id = "processOwner"+idAppend;
	var error = "processOwnerError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var processOwner = $("#"+id).val().replace(/\s+/g, " ");
	if(processOwner != "") {
		if(processOwnerCheck.test(processOwner) == false) {
			$("#"+error).html("Process Owner cannot contain special characters.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		$("#"+error).html("Process Owner cannot be empty.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#controlObjective").focusout(function() {
	controlObjectiveValidation("");
});
$("#controlObjectiveEdit").focusout(function() {
	controlObjectiveValidation("Edit");
});
var controlObjectiveCheck = /^[ A-Za-z0-9-Á& ]*$/;
function controlObjectiveValidation(idAppend) {
	var id = "controlObjective"+idAppend;
	var error = "controlObjectiveError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var controlObjective = $("#"+id).val().replace(/\s+/g, " ");
	if(controlObjective != "") {
		if(controlObjectiveCheck.test(controlObjective) == false) {
			$("#"+error).html("Control Objective cannot contain special characters.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		$("#"+error).html("Control Objective cannot be empty.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#risk").focusout(function() {
	riskValidation("");
});
$("#riskEdit").focusout(function() {
	riskValidation("Edit");
});
var riskCheck = /^[ A-Za-z0-9-Á& ]*$/;
function riskValidation(idAppend) {
	var id = "risk"+idAppend;
	var error = "riskError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var risk = $("#"+id).val().replace(/\s+/g, " ");
	if(risk != "") {
		if(riskCheck.test(risk) == false) {
			$("#"+error).html("Risk cannot contain special characters.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		$("#"+error).html("Risk cannot be empty.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#entityControl").focusout(function() {
	entityControlValidation("");
});
$("#entityControlEdit").focusout(function() {
	entityControlValidation("Edit");
});
var entityControlCheck = /^[ A-Za-z0-9-Á& ]*$/;
function entityControlValidation(idAppend) {
	var id = "entityControl"+idAppend;
	var error = "entityControlError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var entityControl = $("#"+id).val().replace(/\s+/g, " ");
	if(entityControl != "") {
		if(entityControlCheck.test(entityControl) == false) {
			$("#"+error).html("Entity Control cannot contain special characters.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		$("#"+error).html("Entity Control cannot be empty.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#selfCertificateCheck").focusout(function() {
	selfCertificateCheckValidation("");
});
$("#selfCertificateCheckEdit").focusout(function() {
	selfCertificateCheckValidation("Edit");
});
var selfCertificateCheckCheck = /^[ A-Za-z0-9-Á& ]*$/;
function selfCertificateCheckValidation(idAppend) {
	var id = "selfCertificateCheck"+idAppend;
	var error = "selfCertificateCheckError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var selfCertificateCheck = $("#"+id).val().replace(/\s+/g, " ");
	if(selfCertificateCheck != "") {
		if(selfCertificateCheckCheck.test(selfCertificateCheck) == false) {
			$("#"+error).html("Self Certification Check cannot contain special characters.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		$("#"+error).html("Self Certification Check cannot be empty.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#remarks").focusout(function() {
	remarksValidation("");
});
$("#remarksEdit").focusout(function() {
	remarksValidation("Edit");
});
var remarksCheck = /^[ A-Za-z0-9-Á& ]*$/;
function remarksValidation(idAppend) {
	var id = "remarks"+idAppend;
	var error = "remarksError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var remarks = $("#"+id).val().replace(/\s+/g, " ");
	if(remarks != "") {
		if(remarksCheck.test(remarks) == false) {
			$("#"+error).html("Remarks cannot contain special characters.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		$("#"+error).html("Remarks cannot be empty.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#tempProcessId").change(function() {
	processCycleValidation("");
});
$("#tempProcessIdEdit").change(function() {
	processCycleValidation("Edit");
});
function processCycleValidation(idAppend) {
	var id = "tempProcessId"+idAppend;
	var error = "tempProcessIdError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var processCycle = $("#"+id).val();
	if(processCycle != "-1") {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Process Cycle cannot be empty.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#tempDepartmentId").change(function() {
	departmentValidation("");
});
$("#tempDepartmentIdEdit").change(function() {
	departmentValidation("Edit");
});
function departmentValidation(idAppend) {
	var id = "tempDepartmentId"+idAppend;
	var error = "tempDepartmentIdError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var department = $("#"+id).val();
	if(department != "-1") {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Department cannot be empty.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#riskRating").change(function() {
	riskRatingValidation("");
});
$("#riskRatingEdit").change(function() {
	riskRatingValidation("Edit");
});
function riskRatingValidation(idAppend) {
	var id = "riskRating"+idAppend;
	var error = "riskRatingError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var riskRating = $("#"+id).val();
	if(riskRating != "-1") {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Risk Rating cannot be empty.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#controlFrequency").change(function() {
	controlFrequencyValidation("");
});
$("#controlFrequencyEdit").change(function() {
	controlFrequencyValidation("Edit");
});
function controlFrequencyValidation(idAppend) {
	var id = "controlFrequency"+idAppend;
	var error = "controlFrequencyError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var controlFrequency = $("#"+id).val();
	if(controlFrequency != "-1") {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Control Frequency cannot be empty.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#uploadFrequency").change(function() {
	uploadFrequencyValidation("");
});
$("#uploadFrequencyEdit").change(function() {
	uploadFrequencyValidation("Edit");
});
function uploadFrequencyValidation(idAppend) {
	var id = "uploadFrequency"+idAppend;
	var error = "uploadFrequencyError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var uploadFrequency = $("#"+id).val();
	if(uploadFrequency != "-1") {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Upload Frequency cannot be empty.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#controlStartDateTemp").change(function() {
	controlStartDateTempValidation("");
});
$("#controlStartDateTempEdit").change(function() {
	controlStartDateTempValidation("Edit");
});
function controlStartDateTempValidation(idAppend) {
	var id = "controlStartDateTemp"+idAppend;
	var error = "controlStartDateTempError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
//	var controlStartDateTemp = $("#"+id).datepicker("getDate");
	if($("#"+id).datepicker("getDate") == null) {
		$("#"+error).html("Control Start Date cannot be empty.");
		$("#"+id).addClass("is-invalid");
		return false;
	} else {
		$("#"+id).addClass("is-valid");
		return true;
	}
}
$("#validityDateTemp").change(function() {
	validityDateTempValidation("");
});
$("#validityDateTempEdit").change(function() {
	validityDateTempValidation("Edit");
});
function validityDateTempValidation(idAppend) {
	var id = "validityDateTemp"+idAppend;
	var error = "validityDateTempError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
//	var validityDateTemp = $("#"+id).val();
	/*if($("#"+id).datepicker("getDate") == null) {*/
	if($("#"+id).val() == "") {
		$("#"+error).html("Validity cannot be empty.");
		$("#"+id).addClass("is-invalid");
//		alert("1");
		return false;
	} else {
		$("#"+id).addClass("is-valid");
//		alert("2");
		return true;
	}
}


$('#fraudRisk input[type="radio"]').click(function() {
	$("#fraudRiskError").html("");
});
$('#fraudRiskEdit input[type="radio"]').click(function() {
	$("#fraudRiskEditError").html("");
});
$('#uniqueReferred input[type="radio"]').click(function() {
	$("#uniqueReferredError").html("");
});
$('#uniqueReferredEdit input[type="radio"]').click(function() {
	$("#uniqueReferredEditError").html("");
});
$('#keyNonKeyOthers input[type="radio"]').click(function() {
	$("#keyNonKeyOthersError").html("");
});
$('#keyNonKeyOthersEdit input[type="radio"]').click(function() {
	$("#keyNonKeyOthersEditError").html("");
});
$('#preventiveDetective input[type="radio"]').click(function() {
	$("#preventiveDetectiveError").html("");
});
$('#preventiveDetectiveEdit input[type="radio"]').click(function() {
	$("#preventiveDetectiveEditError").html("");
});
$('#typeOfControl input[type="radio"]').click(function() {
	$("#typeOfControlError").html("");
});
$('#typeOfControlEdit input[type="radio"]').click(function() {
	$("#typeOfControlEditError").html("");
});
$('#rcmStatus input[type="radio"]').click(function() {
	$("#rcmStatusError").html("");
});
$('#rcmStatusEdit input[type="radio"]').click(function() {
	$("#rcmStatusEditError").html("");
});