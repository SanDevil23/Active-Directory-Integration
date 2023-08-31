var stringCheck = /^[ A-Za-z0-9-Á, ]*$/;
var decimalNumber = /^[ 0-9-. ]*$/;
var onlyNumber = /^[ 0-9 ]*$/;
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
	bsCustomFileInput.init();
	$('#estimatedStartDate').datepicker({ 
		dateFormat: 'dd/mm/yy',
		minDate: new Date(),
		beforeShowDay: DisableDates
	});
	$('#estimatedEndDate').datepicker({ 
		dateFormat: 'dd/mm/yy',
		minDate: new Date(),
		beforeShowDay: DisableDates
	});
	$('#defineDate').datepicker({ 
		dateFormat: 'dd/mm/yy',
		minDate: new Date(),
		beforeShowDay: DisableDates
	});
	/*$("#customRadio1").prop("checked", true);
	$("#customRadio4").prop("checked", true);
	$("#customRadio6").prop("checked", true);
	$("#customRadio8").prop("checked", true);*/
	deActivateAllDisabledFeilds();

	var hopperEstimateComment = ""+$("#hopperEstimateComment").val()
	if(hopperEstimateComment.trim() == "") {
		$("#hopperEstimateComment").val("");
	} else {
		$("#hopperEstimateComment").val(hopperEstimateComment.trim());
	}
	var newEstimateCommentDuringProjectContract = ""+$("#newEstimateCommentDuringProjectContract").val();
	if(newEstimateCommentDuringProjectContract.trim() == "") {
		$("#newEstimateCommentDuringProjectContract").val("");
	} else {
		$("#newEstimateCommentDuringProjectContract").val(newEstimateCommentDuringProjectContract.trim());
	}
	if($("#projectWarrantyFocus1").prop("checked") == true) {
		$("#warrantyFocusState").prop("disabled",false);
	} else {
		$("#warrantyFocusState").prop("disabled", true);
	}
	if($("#externalCustomerFocusProject1").prop("checked") == true) {
		$("#nameOfCustomer").prop("disabled",false);
		$("#contactPersonName").prop("disabled",false);
	} else {
		$("#nameOfCustomer").prop("disabled", true);
		$("#contactPersonName").prop("disabled", true);
	}
	var processOrProductOppterrunityExists = ""+$("#processOrProductOppterrunityExists").val();
	if(processOrProductOppterrunityExists.trim() == "") {
		$("#processOrProductOppterrunityExists").val("");
	} else {
		$("#processOrProductOppterrunityExists").val(processOrProductOppterrunityExists.trim());
	}
	var projectTeamMemberExternal = ""+$("#projectTeamMemberExternal").val();
	if(projectTeamMemberExternal.trim() == "") {
		$("#projectTeamMemberExternal").val("");
	} else {
		$("#projectTeamMemberExternal").val(projectTeamMemberExternal.trim());
	}
	var projectScope = ""+$("#projectScope").val()
	if(projectScope.trim() == "") {
		$("#projectScope").val("");
	} else {
		$("#projectScope").val(projectScope.trim());
	}

	if($("#projectTeamMemberInternalTemp").val() != "") {
		var projectTeamMemberInternalTempSplit = $("#projectTeamMemberInternalTemp").val().split(",");
		var projectTeamMemberInternalTempNow = [];
		for(var i=0; i<projectTeamMemberInternalTempSplit.length; i++) {
			projectTeamMemberInternalTempNow.push(projectTeamMemberInternalTempSplit[i]);
		}
		$("#projectTeamMemberInternal").val(projectTeamMemberInternalTempNow);
		$("#projectTeamMemberInternal").select2();
	}

	var impactToExternalCustomerOrOtherIntercompanyCustomer = ""+$("#impactToExternalCustomerOrOtherIntercompanyCustomer").val();
	if(impactToExternalCustomerOrOtherIntercompanyCustomer.trim() == "") {
		$("#impactToExternalCustomerOrOtherIntercompanyCustomer").val("");
	} else {
		$("#impactToExternalCustomerOrOtherIntercompanyCustomer").val(impactToExternalCustomerOrOtherIntercompanyCustomer.trim());
	}

	var supportRequired = ""+$("#supportRequired").val();
	if(supportRequired.trim() == "") {
		$("#supportRequired").val("");
	} else {
		$("#supportRequired").val(supportRequired.trim());
	}
});
$("#estimatedStartDate").keypress(function(event) {
	event.preventDefault();
});
$("#estimatedStartDate").change(function(event) {
	if($("#estimatedStartDate").val() != "") {
		console.log("came here");
		var minEndDate = parseDate($("#estimatedStartDate").val());
		$("#estimatedEndDate").datepicker("destroy");
		$('#estimatedEndDate').datepicker({ 
			dateFormat: 'dd/mm/yy',
			minDate: minEndDate,
			beforeShowDay: DisableDates
		});
	}
});
$("#estimatedEndDate").keypress(function(event) {
	event.preventDefault();
});
$("#estimatedEndDate").change(function(event) {
	if($("#estimatedStartDate").val() != "" && $("#estimatedEndDate").val() != "") {
		var differenceInDays = dateDiff(parseDate($("#estimatedStartDate").val()), parseDate($("#estimatedEndDate").val()));
		$("#estimatedThroughPutDays").val(differenceInDays);
	}
	feildEmptyValidation("estimatedThroughPutDays");
});

$("#defineDate").keypress(function(event) {
	event.preventDefault();
});
$("#defineDate").change(function(event) {
	var definedate = parseDate($("#defineDate").val());
	/*MeasureDate = DefineDate + 15 Days */
	var measureDate = new Date(definedate.getTime() + 15 * 24*60*60*1000);
	$("#measureDate").val(aZero(measureDate.getDate())+"/"+aZero(measureDate.getMonth()+1)+"/"+measureDate.getFullYear());
	/*AnalyzeDate = DefineDate + 45 Days */
	var analyzeDate = new Date(definedate.getTime() + 45 * 24*60*60*1000);
	$("#analyzeDate").val(aZero(analyzeDate.getDate())+"/"+aZero(analyzeDate.getMonth()+1)+"/"+analyzeDate.getFullYear());
	/*ImproveDays = DefineDate + 75 Days */
	var improveDays = new Date(definedate.getTime() + 75 * 24*60*60*1000);
	$("#improveDays").val(aZero(improveDays.getDate())+"/"+aZero(improveDays.getMonth()+1)+"/"+improveDays.getFullYear());
	/*ClosureDate = DefineDate + 75 Days */
	var closureDate = new Date(definedate.getTime() + 100 * 24*60*60*1000);
	$("#closureDate").val(aZero(closureDate.getDate())+"/"+aZero(closureDate.getMonth()+1)+"/"+closureDate.getFullYear());

	feildEmptyValidation("defineDate");
	feildEmptyValidation("measureDate");
	feildEmptyValidation("analyzeDate");
	feildEmptyValidation("improveDays");
	feildEmptyValidation("closureDate");
});
var saveOrSubmit = 0;
function submitCharterForm(saveSubmit) {
	saveOrSubmit = saveSubmit;
	$("#saveOrSubmit").val(saveOrSubmit);
	$("#projectCharterForm").submit();
}
$("#projectCharterForm").submit(function() {
	$("#projectHopperSubmit").addClass("disabledButton");
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();

	var submitOrNot = true;
	if(projectNameValidation("") == false) {
		submitOrNot = false;
	}
	var sum;
	calculateSavingOrGains();
	sum=$("#annualCostSaving").val() - $("#annualTaxSaving").val();
	$("#netAnnualProfitImprovement").val(sum);
	sum=$("#completionYearCostSaving").val() - $("#oneTimeCostToImplement").val();
	$("#netCompletionYearProfitImprovement").val(sum);
	activateAllDisabledFeilds();
	if(saveOrSubmit == 4) {
		submitOrNot = true;
	} else if(saveOrSubmit == 1) {
		if(projectDescriptionValidation("") == false) {
			submitOrNot = false;
		}
		if(functionTempValidation("") == false) {
			submitOrNot = false;
		}
		if(metheodologyTempValidation("") == false) {
			submitOrNot = false;
		}
		if(typeTempValidation("") == false) {
			submitOrNot = false;
		}
		if(companyTempValidation("") == false) {
			submitOrNot = false;
		}
		/*if(locationTempValidation("") == false) {
			submitOrNot = false;
		}*/
		if(confidentialityValidation("") == false) {
			submitOrNot = false;
		}
		if(sponsorTempValidation("") == false) {
			submitOrNot = false;
		}
		if(problemSolvingLeaderTempValidation("") == false) {
			submitOrNot = false;
		}
		if(financeControllerTempValidation("") == false) {
			submitOrNot = false;
		}
		if(corporateProblemSolvingLeaderTempValidation("") == false) {
			submitOrNot = false;
		}
		if(projectLeaderTempValidation("") == false) {
			submitOrNot = false;
		}
		if(businessHeadTempValidation("") == false) {
			submitOrNot = false;
		}
		/*if(additionalProjectLeaderTempValidation("") == false) {
			submitOrNot = false;
		}*/
		if($("#additionalProjectLeaderTemp").val() != -1 && $("#projectLeaderTemp").val() == $("#additionalProjectLeaderTemp").val()) {
			$("#additionalProjectLeaderTempError").html("Project Leader & Additional Reader cannot be same.");
			$("#additionalProjectLeaderTemp").addClass("is-invalid");
			submitOrNot = false;
		}
			
		/*if(additionalSponsorTempValidation("") == false) {
			submitOrNot = false;
		}*/
		if($("#additionalSponsorTemp").val() != -1 && $("#sponsorTemp").val() == $("#additionalSponsorTemp").val()) {
			$("#additionalSponsorTempError").html("Project Sponsor & Additional Sponsor cannot be same.");
			$("#additionalSponsorTemp").addClass("is-invalid");
			submitOrNot = false;
		}
		if(charterPrimaryDriverValidation("") == false) {
			submitOrNot = false;
		}
		if(estimatedSavingValidation("") == false) {
			submitOrNot = false;
		}
		$("#isActiveError").hide();
		if($("#customRadio1").prop("checked") == false && $("#customRadio2").prop("checked") == false) {
			$("#isActiveError").show();
			$("#isActiveError").html("Project Hopper state must be selected");
			submitOrNot = false;
		}
		$("#countForCertificationError").hide();
		if($("#customRadio3").prop("checked") == false && $("#customRadio4").prop("checked") == false) {
			$("#countForCertificationError").show();
			$("#countForCertificationError").html("Count for Certification state must be selected");
			submitOrNot = false;
		}
		$("#alignedForBusinessGoalTreeError").hide();
		if($("#customRadio5").prop("checked") == false && $("#customRadio6").prop("checked") == false) {
			$("#alignedForBusinessGoalTreeError").show();
			$("#alignedForBusinessGoalTreeError").html("Business Goal state must be selected");
			submitOrNot = false;
		}
		$("#fallsUnderSponsorFunctionalAreaError").hide();
		if($("#customRadio7").prop("checked") == false && $("#customRadio8").prop("checked") == false) {
			$("#fallsUnderSponsorFunctionalAreaError").show();
			$("#fallsUnderSponsorFunctionalAreaError").html("Sponsor Functional state must be selected");
			submitOrNot = false;
		}
		if(feildEmptyValidation("estimatedStartDate") == false) {
			submitOrNot = false;
		}
		if(feildEmptyValidation("estimatedEndDate") == false) {
			submitOrNot = false;
		}
		/*if(feildEmptyValidation("estimatedThroughPutDays") == false) {
			submitOrNot = false;
		}*/
		/*if(feildEmptyValidation("projectLaunchDate") == false) {
			submitOrNot = false;
		}
		if(feildEmptyValidation("actualThroughputDays") == false) {
			submitOrNot = false;
		}*/
		if(feildEmptyValidation("defineDate") == false) {
			submitOrNot = false;
		}
		/*if(feildEmptyValidation("measureDate") == false) {
			submitOrNot = false;
		}
		if(feildEmptyValidation("analyzeDate") == false) {
			submitOrNot = false;
		}
		if(feildEmptyValidation("improveDays") == false) {
			submitOrNot = false;
		}
		if(feildEmptyValidation("closureDate") == false) {
			submitOrNot = false;
		}*/
		if(annualCostSavingValidation("", 1) == false) {
			submitOrNot = false;
		}
		if(completionYearCostSavingValidation("", 1) == false) {
			submitOrNot = false;
		}
		
		if(projectStatusValidation("") == false) {
			submitOrNot = false;
		}
		$("#supplyChainImprovementProjectError").hide();
		if($("#customRadioSupplyChainImprovementProject1").prop("checked") == false && $("#customRadioSupplyChainImprovementProject2").prop("checked") == false) {
			$("#supplyChainImprovementProjectError").show();
			$("#supplyChainImprovementProjectError").html("Mandatory Feild");
			submitOrNot = false;
		}
		$("#supplierFocusProjectError").hide();
		if($("#supplierFocusProject1").prop("checked") == false && $("#supplierFocusProject2").prop("checked") == false) {
			$("#supplierFocusProjectError").show();
			$("#supplierFocusProjectError").html("Mandatory Feild");
			submitOrNot = false;
		}
		
		$("#projectWarrantyFocusError").hide();
		if($("#projectWarrantyFocus1").prop("checked") == false && $("#projectWarrantyFocus2").prop("checked") == false) {
			$("#projectWarrantyFocusError").show();
			$("#projectWarrantyFocusError").html("Mandatory Feild");
			submitOrNot = false;
		}
		if($("#projectWarrantyFocus1").prop("checked") == true) {
			if(warrantyFocusStateValidation("") == false) {
				submitOrNot = false;
			}
		}
		$("#externalCustomerFocusProjectError").hide();
		if($("#externalCustomerFocusProject1").prop("checked") == false && $("#externalCustomerFocusProject2").prop("checked") == false) {
			$("#externalCustomerFocusProjectError").show();
			$("#externalCustomerFocusProjectError").html("Mandatory Feild");
			submitOrNot = false;
		}
		if(nameOfCustomerValidation("") == false) {
			submitOrNot = false;
		}
		if(contactPersonNameValidation("") == false) {
			submitOrNot = false;
		}
		$("#interCompanyCustomerFocusProjectError").hide();
		if($("#interCompanyCustomerFocusProject1").prop("checked") == false && $("#interCompanyCustomerFocusProject2").prop("checked") == false) {
			$("#interCompanyCustomerFocusProjectError").show();
			$("#interCompanyCustomerFocusProjectError").html("Mandatory Feild");
			submitOrNot = false;
		}
		
		if(qualityBaselineValidation("", 1) == false) {
			submitOrNot = false;
		}
		if(qualityGoalValidation("", 1) == false) {
			submitOrNot = false;
		}
		if(qualityEntitlementValidation("", 1) == false) {
			submitOrNot = false;
		}
		if(qualityUnitOfMeasureValidation("", 1) == false) {
			submitOrNot = false;
		}
		if(costBaselineValidation("", 1) == false) {
			submitOrNot = false;
		}
		if(costGoalValidation("", 1) == false) {
			submitOrNot = false;
		}
		if(costEntitlementValidation("", 1) == false) {
			submitOrNot = false;
		}
		if(costUnitOfMeasureValidation("", 1) == false) {
			submitOrNot = false;
		}
		if(cycleCountValidation("", 1) == false) {
			submitOrNot = false;
		}
		$("#charterAttachmentTempError").html("");
		$("#charterAttachmentTempError").hide();
		if($("#charterAttachmentTemp").val() == "") {
			$("#charterAttachmentTempError").html("Charter Attachment cannot be empty.");
			$("#charterAttachmentTempError").show();
		}
		
	} else {
		if(annualCostSavingValidation("", 0) == false) {
			submitOrNot = false;
		}
		if(completionYearCostSavingValidation("", 0) == false) {
			submitOrNot = false;
		}
		
		if(qualityBaselineValidation("", 0) == false) {
			submitOrNot = false;
		}
		if(qualityGoalValidation("", 0) == false) {
			submitOrNot = false;
		}
		if(qualityEntitlementValidation("", 0) == false) {
			submitOrNot = false;
		}
		if(qualityUnitOfMeasureValidation("", 0) == false) {
			submitOrNot = false;
		}
		if(costBaselineValidation("", 0) == false) {
			submitOrNot = false;
		}
		if(costGoalValidation("", 0) == false) {
			submitOrNot = false;
		}
		if(costEntitlementValidation("", 0) == false) {
			submitOrNot = false;
		}
		if(costUnitOfMeasureValidation("", 0) == false) {
			submitOrNot = false;
		}
		if(cycleCountValidation("", 0) == false) {
			submitOrNot = false;
		}
	}
	if(annualTaxSavingValidation("", 0) == false) {
		submitOrNot = false;
	}
	if(netAnnualProfitImprovementValidation("", 0) == false) {
		submitOrNot = false;
	}
	if(oneTimeCostToImplementValidation("", 0) == false) {
		submitOrNot = false;
	}
	if(netCompletionYearProfitImprovementValidation("", 0) == false) {
		submitOrNot = false;
	}
	if(annualAvoidanceCostSavingValidation("", 0) == false) {
		submitOrNot = false;
	}
	if(annualInterestSavingValidation("", 0) == false) {
		submitOrNot = false;
	}
	if(completionYearAvoidanceCostSavingValidation("", 0) == false) {
		submitOrNot = false;
	}
	if(externalCustomerSavingValidation("", 0) == false) {
		submitOrNot = false;
	}
	if(hopperEstimateCommentValidation("", 0) == false) {
		submitOrNot = false;
	}
	if(newEstimateCommentDuringProjectContractValidation("", 0) == false) {
		submitOrNot = false;
	}
	if(processOrProductOppterrunityExistsValidation("") == false) {
		submitOrNot = false;
	}
	if(projectTeamMemberInternalValidation("", 0) == false) {
		submitOrNot = false;
	}
	if(projectTeamMemberExternalValidation("", 0) == false) {
		submitOrNot = false;
	}
	if(projectScopeValidation("", 0) == false) {
		submitOrNot = false;
	}
	if(impactToExternalCustomerOrOtherIntercompanyCustomerValidation("", 0) == false) {
		submitOrNot = false;
	}
	if(supportRequiredValidation("", 0) == false) {
		submitOrNot = false;
	}
    console.log("submitOrNot : "+submitOrNot);
	if(submitOrNot) {
		activateAllDisabledFeilds()
		return true;
	} else {
		$("#projectHopperSubmit").removeClass("disabledButton");
		$('body').removeClass('disableClickBody');
		$(".anand-loader").hide();
		deActivateAllDisabledFeilds();
		return false;
	}
});
function activateAllDisabledFeilds() {
	$("#estimatedThroughPutDays").prop("disabled",false);
	$("#projectLaunchDate").prop("disabled",false);
	$("#actualThroughputDays").prop("disabled",false);
	$("#estimatedThroughPutDays").prop("disabled",false);
	$("#measureDate").prop("disabled",false);
	$("#analyzeDate").prop("disabled",false);
	$("#improveDays").prop("disabled",false);
	$("#closureDate").prop("disabled",false);
	$("#netAnnualProfitImprovement").prop("disabled",false);
	$("#netCompletionYearProfitImprovement").prop("disabled",false);
	$("#warrantyFocusState").prop("disabled",false);
	$("#nameOfCustomer").prop("disabled",false);
	$("#contactPersonName").prop("disabled",false);
	$("#savingOrGains").prop("disabled",false);
}
function deActivateAllDisabledFeilds() {
	$("#estimatedThroughPutDays").prop("disabled",true);
	$("#projectLaunchDate").prop("disabled",true);
	$("#actualThroughputDays").prop("disabled",true);
	$("#estimatedThroughPutDays").prop("disabled",true);
	$("#measureDate").prop("disabled",true);
	$("#analyzeDate").prop("disabled",true);
	$("#improveDays").prop("disabled",true);
	$("#closureDate").prop("disabled",true);
	$("#netAnnualProfitImprovement").prop("disabled",true);
	$("#netCompletionYearProfitImprovement").prop("disabled",true);
	$("#savingOrGains").prop("disabled",true);
	activateIfRequired();
}
function activateIfRequired() {
	if($("#projectWarrantyFocus1").prop("checked") == true) {
		$("#warrantyFocusState").prop("disabled",false);
	} else {
		$("#warrantyFocusState").prop("disabled", true);
	}
	if($("#externalCustomerFocusProject1").prop("checked") == true) {
		$("#nameOfCustomer").prop("disabled",false);
		$("#contactPersonName").prop("disabled",false);
	} else {
		$("#nameOfCustomer").prop("disabled",true);
		$("#contactPersonName").prop("disabled",true);
	}
}
function feildEmptyValidation(idName) {
	var error = idName+"Error"
	$("#"+idName).removeClass("is-valid");
	$("#"+idName).removeClass("is-invalid");
	$("#"+error).html("");
	var dateValue = $("#"+idName).val().replace(/\s+/g, " ");
	if(dateValue != "") {
		$("#"+idName).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Feild cannot be empty.");
		$("#"+idName).addClass("is-invalid");
		return false;
	}
}
$("#projectName").focusout(function() {
	projectNameValidation("");
});
function projectNameValidation(idAppend) {
	var id = "projectName"+idAppend;
	var error = "projectNameError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var projectName = $("#"+id).val().replace(/\s+/g, " ");
	if(projectName != "") {
		if(stringCheck.test(projectName) == false) {
			$("#"+error).html("Project Name cannot contain special characters.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		$("#"+error).html("Project Name cannot be empty.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#projectDescription").focusout(function() {
	projectDescriptionValidation("");
});
function projectDescriptionValidation(idAppend) {
	var id = "projectDescription"+idAppend;
	var error = "projectDescriptionError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var projectDescription = $("#"+id).val().replace(/\s+/g, " ");
	if(projectDescription != "") {
		if(stringCheck.test(projectDescription) == false) {
			$("#"+error).html("Project Description cannot contain special characters.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		$("#"+error).html("Project Description cannot be empty.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#functionTemp").change(function() {
	functionTempValidation("");
});
function functionTempValidation(idAppend) {
	var id = "functionTemp"+idAppend;
	var error = "functionTempError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var functionTemp = $("#"+id).val();
	if(functionTemp != -1) {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Department must be selected.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#metheodologyTemp").change(function() {
	metheodologyTempValidation("");
});
function metheodologyTempValidation(idAppend) {
	var id = "metheodologyTemp"+idAppend;
	var error = "metheodologyTempError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var metheodologyTemp = $("#"+id).val();
	if(metheodologyTemp != -1) {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Project Methodology must be selected.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#typeTemp").change(function() {
	typeTempValidation("");
});
function typeTempValidation(idAppend) {
	var id = "typeTemp"+idAppend;
	var error = "typeTempError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var typeTemp = $("#"+id).val();
	if(typeTemp != -1) {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Project Type must be selected.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#companyTemp").change(function() {
	companyTempValidation("");
});
function companyTempValidation(idAppend) {
	var id = "companyTemp"+idAppend;
	var error = "companyTempError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var companyTemp = $("#"+id).val();
	if(companyTemp != -1) {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Company must be selected.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#locationTemp").change(function() {
	locationTempValidation("");
});
function locationTempValidation(idAppend) {
	var id = "locationTemp"+idAppend;
	var error = "locationTempError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var locationTemp = $("#"+id).val();
	if(locationTemp != -1) {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Location must be selected.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#confidentiality").change(function() {
	confidentialityValidation("");
});
function confidentialityValidation(idAppend) {
	var id = "confidentiality"+idAppend;
	var error = "confidentialityError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var confidentiality = $("#"+id).val();
	if(confidentiality != -1) {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Project Confidentiality must be selected.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#sponsorTemp").change(function() {
	sponsorTempValidation("");
});
function sponsorTempValidation(idAppend) {
	var id = "sponsorTemp"+idAppend;
	var error = "sponsorTempError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var sponsorTemp = $("#"+id).val();
	if(sponsorTemp != -1) {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Project Sponsor must be selected.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}$("#processOwnerTemp").change(function() {
	processOwnerTempValidation("");
});
function processOwnerTempValidation(idAppend) {
	var id = "processOwnerTemp"+idAppend;
	var error = "processOwnerTempError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var problemSolvingLeaderTemp = $("#"+id).val();
	if(problemSolvingLeaderTemp != -1) {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Psrocess Owner must be selected.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$
$("#problemSolvingLeaderTemp").change(function() {
	problemSolvingLeaderTempValidation("");
});
function problemSolvingLeaderTempValidation(idAppend) {
	var id = "problemSolvingLeaderTemp"+idAppend;
	var error = "problemSolvingLeaderTempError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var problemSolvingLeaderTemp = $("#"+id).val();
	if(problemSolvingLeaderTemp != -1) {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Problem Solving Leader must be selected.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#financeControllerTemp").change(function() {
	financeControllerTempValidation("");
});
function financeControllerTempValidation(idAppend) {
	var id = "financeControllerTemp"+idAppend;
	var error = "financeControllerTempError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var financeControllerTemp = $("#"+id).val();
	if(financeControllerTemp != -1) {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Finance Controller must be selected.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#corporateProblemSolvingLeaderTemp").change(function() {
	corporateProblemSolvingLeaderTempValidation("");
});
function corporateProblemSolvingLeaderTempValidation(idAppend) {
	var id = "corporateProblemSolvingLeaderTemp"+idAppend;
	var error = "corporateProblemSolvingLeaderTempError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var corporateProblemSolvingLeaderTemp = $("#"+id).val();
	if(corporateProblemSolvingLeaderTemp != -1) {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Corporate Problem Solving Leader must be selected.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#projectLeaderTemp").change(function() {
	projectLeaderTempValidation("");
});
function projectLeaderTempValidation(idAppend) {
	var id = "projectLeaderTemp"+idAppend;
	var error = "projectLeaderTempError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var projectLeaderTemp = $("#"+id).val();
	if(projectLeaderTemp != -1) {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Project Leader must be selected.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#businessHeadTemp").change(function() {
	businessHeadTempValidation("");
});
function businessHeadTempValidation(idAppend) {
	var id = "businessHeadTemp"+idAppend;
	var error = "businessHeadTempError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var businessHeadTemp = $("#"+id).val();
	if(businessHeadTemp != -1) {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Business Head must be selected.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#additionalProjectLeaderTemp").change(function() {
	additionalProjectLeaderTempValidation("");
});
function additionalProjectLeaderTempValidation(idAppend) {
	var id = "additionalProjectLeaderTemp"+idAppend;
	var error = "additionalProjectLeaderTempError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	if($("#additionalProjectLeaderTemp").val() != -1 && $("#projectLeaderTemp").val() == $("#additionalProjectLeaderTemp").val()) {
		$("#additionalProjectLeaderTempError").html("Project Leader & Additional Reader cannot be same.");
		$("#additionalProjectLeaderTemp").addClass("is-invalid");
		return false;
	}
	var additionalProjectLeaderTemp = $("#"+id).val();
	if(additionalProjectLeaderTemp != -1) {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		/*$("#"+error).html("Business Head must be selected.");
		$("#"+id).addClass("is-invalid");
		return false;*/
		$("#"+id).addClass("is-valid");
		return true;
	}
}
$("#additionalSponsorTemp").change(function() {
	additionalSponsorTempValidation("");
});
function additionalSponsorTempValidation(idAppend) {
	var id = "additionalSponsorTemp"+idAppend;
	var error = "additionalSponsorTempError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var additionalSponsorTemp = $("#"+id).val();
	if(additionalSponsorTemp != -1) {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+id).addClass("is-valid");
		return true;
	}
}

$("#charterPrimaryDriver").change(function() {
	charterPrimaryDriverValidation("");
});
function charterPrimaryDriverValidation(idAppend) {
	var id = "charterPrimaryDriver"+idAppend;
	var error = "charterPrimaryDriverError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var charterPrimaryDriver = $("#"+id).val();
	if(charterPrimaryDriver != -1) {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Primary Driver must be selected.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#estimatedSaving").change(function() {
	estimatedSavingValidation("");
});
function estimatedSavingValidation(idAppend) {
	var id = "estimatedSaving"+idAppend;
	var error = "estimatedSavingError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var estimatedSaving = $("#"+id).val().replace(/\s+/g, " ");
	if(estimatedSaving != "") {
		if(decimalNumber.test(estimatedSaving) == false) {
			$("#"+error).html("Estimated Saving can only decimal value.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		$("#"+error).html("Estimated Saving cannot be empty.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$('#isActiveDiv input[type="radio"]').click(function() {
	$("#isActiveError").html("");
});
if($("#customRadio1").prop("checked") == false && $("#customRadio2").prop("checked") == false) {
	$("#isActiveError").html("Project Charter state must be selected");
	submitOrNot = false;
}
$('#countForCertificationDiv input[type="radio"]').click(function() {
	$("#countForCertificationError").html("");
});
if($("#customRadio3").prop("checked") == false && $("#customRadio4").prop("checked") == false) {
	$("#countForCertificationError").html("Count for Certification state must be selected");
	submitOrNot = false;
}

$('#alignedForBusinessGoalTreeDiv input[type="radio"]').click(function() {
	$("#alignedForBusinessGoalTreeError").html("");
});
if($("#customRadio5").prop("checked") == false && $("#customRadio6").prop("checked") == false) {
	$("#alignedForBusinessGoalTreeError").html("Business Goal state must be selected");
	submitOrNot = false;
}

$('#fallsUnderSponsorFunctionalAreaDiv input[type="radio"]').click(function() {
	$("#fallsUnderSponsorFunctionalAreaError").html("");
});
if($("#customRadio7").prop("checked") == false && $("#customRadio8").prop("checked") == false) {
	$("#fallsUnderSponsorFunctionalAreaError").html("Sponsor Functional Area state must be selected");
	submitOrNot = false;
}
$("#annualCostSaving").focusout(function() {
	annualCostSavingValidation("", 0);
});
function annualCostSavingValidation(idAppend, mandatoryNonMandatory) {
	var id = "annualCostSaving"+idAppend;
	var error = "annualCostSavingError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var annualCostSaving = $("#"+id).val().replace(/\s+/g, " ");
	if(annualCostSaving != "") {
		if(onlyNumber.test(annualCostSaving) == false) {
			$("#"+error).html("Annual Cost Saving can only numberic value.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			netAnnualProfitImprovementUpdate();
			return true;
		}
	} else {
		if(mandatoryNonMandatory == 1) {
			$("#"+error).html("Annual Cost Saving cannot be empty.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			netAnnualProfitImprovementUpdate();
			return true;
		}
	}
}
$("#annualTaxSaving").focusout(function() {
	annualTaxSavingValidation("", 0);
});
function annualTaxSavingValidation(idAppend, mandatoryNonMandatory) {
	var id = "annualTaxSaving"+idAppend;
	var error = "annualTaxSavingError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var annualTaxSaving = $("#"+id).val().replace(/\s+/g, " ");
	if(annualTaxSaving != "") {
		if(onlyNumber.test(annualTaxSaving) == false) {
			$("#"+error).html("Annual Tax Saving can only numberic value.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			netAnnualProfitImprovementUpdate();
			return true;
		}
	} else {
		if(mandatoryNonMandatory == 1) {
			$("#"+error).html("Annual Tax Saving cannot be empty.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			netAnnualProfitImprovementUpdate();
			return true;
		}
	}
}
function netAnnualProfitImprovementUpdate() {
	if($("#annualCostSaving").val() != "" && $("#annualTaxSaving").val() != "") {
		var difference = $("#annualCostSaving").val() - $("#annualTaxSaving").val();
		$("#netAnnualProfitImprovement").val(difference);
	} else if ($("#annualCostSaving").val() != "" && $("#annualTaxSaving").val() == "") {
		var difference = $("#annualCostSaving").val() - $("#annualTaxSaving").val();
		$("#netAnnualProfitImprovement").val(difference);
	} else if ($("#annualCostSaving").val() == "" && $("#annualTaxSaving").val() != "") {
		var difference = $("#annualCostSaving").val() - $("#annualTaxSaving").val();
		$("#netAnnualProfitImprovement").val(difference);
	} else {
		$("#netAnnualProfitImprovement").val("");
	}
}

$("#netAnnualProfitImprovement").focusout(function() {
	netAnnualProfitImprovementValidation("", 0);
});
function netAnnualProfitImprovementValidation(idAppend, mandatoryNonMandatory) {
	var id = "netAnnualProfitImprovement"+idAppend;
	var error = "netAnnualProfitImprovementError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var netAnnualProfitImprovement = $("#"+id).val().replace(/\s+/g, " ");
	if(netAnnualProfitImprovement != "") {
		if(onlyNumber.test(netAnnualProfitImprovement) == false) {
			$("#"+error).html("Net Annualized Profit Improvement can only numberic value.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		if(mandatoryNonMandatory == 1) {
			$("#"+id).addClass("is-valid");
			return true;
		} else {
			return true;
		}
	}
}
$("#completionYearCostSaving").focusout(function() {
	completionYearCostSavingValidation("", 0);
});
function completionYearCostSavingValidation(idAppend, mandatoryNonMandatory) {
	var id = "completionYearCostSaving"+idAppend;
	var error = "completionYearCostSavingError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var completionYearCostSaving = $("#"+id).val().replace(/\s+/g, " ");
	if(completionYearCostSaving != "") {
		if(onlyNumber.test(completionYearCostSaving) == false) {
			$("#"+error).html("Completion Year Cost Saving can only numberic value.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			netCompletionYearProfitImprovement();
			return true;
		}
	} else {
		if(mandatoryNonMandatory == 1) {
			$("#"+error).html("Completion Year Cost Saving cannot be empty.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			netCompletionYearProfitImprovement();
			return true;
		}
	}
}
$("#oneTimeCostToImplement").focusout(function() {
	oneTimeCostToImplementValidation("", 0);
});
function oneTimeCostToImplementValidation(idAppend, mandatoryNonMandatory) {
	var id = "oneTimeCostToImplement"+idAppend;
	var error = "oneTimeCostToImplementError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var oneTimeCostToImplement = $("#"+id).val().replace(/\s+/g, " ");
	if(oneTimeCostToImplement != "") {
		if(onlyNumber.test(oneTimeCostToImplement) == false) {
			$("#"+error).html("One Time Cost to Implement can only numberic value.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			netCompletionYearProfitImprovement();
			return true;
		}
	} else {
		if(mandatoryNonMandatory == 1) {
			$("#"+error).html("One Time Cost to Implement cannot be empty.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			netCompletionYearProfitImprovement();
			return true;
		}
	}
}
function netCompletionYearProfitImprovement() {
	if($("#completionYearCostSaving").val() != "" && $("#oneTimeCostToImplement").val() != "") {
		var difference = $("#completionYearCostSaving").val() - $("#oneTimeCostToImplement").val();
		$("#netCompletionYearProfitImprovement").val(difference);
	} else if ($("#completionYearCostSaving").val() != "" && $("#oneTimeCostToImplement").val() == "") {
		var difference = $("#completionYearCostSaving").val() - $("#oneTimeCostToImplement").val();
		$("#netCompletionYearProfitImprovement").val(difference);
	} else if ($("#completionYearCostSaving").val() == "" && $("#oneTimeCostToImplement").val() != "") {
		var difference = $("#completionYearCostSaving").val() - $("#oneTimeCostToImplement").val();
		$("#netCompletionYearProfitImprovement").val(difference);
	} else {
		$("#netCompletionYearProfitImprovement").val("");
	}
}
$("#netCompletionYearProfitImprovement").focusout(function() {
	netCompletionYearProfitImprovementValidation("", 0);
});
function netCompletionYearProfitImprovementValidation(idAppend, mandatoryNonMandatory) {
	var id = "netCompletionYearProfitImprovement"+idAppend;
	var error = "netCompletionYearProfitImprovementError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var netCompletionYearProfitImprovement = $("#"+id).val().replace(/\s+/g, " ");
	if(netCompletionYearProfitImprovement != "") {
		if(onlyNumber.test(netCompletionYearProfitImprovement) == false) {
			$("#"+error).html("Net Completion Year Profit Improvement can only numberic value.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		if(mandatoryNonMandatory == 1) {
			/*$("#"+error).html("Net Completion Year cannot be empty.");
			$("#"+id).addClass("is-invalid");
			return false;*/
			$("#"+id).addClass("is-valid");
			return true;
		} else {
			/*$("#"+id).addClass("is-valid");*/
			return true;
		}
	}
}
$("#annualAvoidanceCostSaving").focusout(function() {
	annualAvoidanceCostSavingValidation("", 0);
});
function annualAvoidanceCostSavingValidation(idAppend, mandatoryNonMandatory) {
	var id = "annualAvoidanceCostSaving"+idAppend;
	var error = "annualAvoidanceCostSavingError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var annualAvoidanceCostSaving = $("#"+id).val().replace(/\s+/g, " ");
	if(annualAvoidanceCostSaving != "") {
		if(onlyNumber.test(annualAvoidanceCostSaving) == false) {
			$("#"+error).html("Annual Avoidance Cost Saving can only numberic value.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		if(mandatoryNonMandatory == 1) {
			/*$("#"+error).html("Annual Avoidance Cost Saving cannot be empty.");
			$("#"+id).addClass("is-invalid");
			return false;*/
			$("#"+id).addClass("is-valid");
			return true;
		} else {
			/*$("#"+id).addClass("is-valid");*/
			return true;
		}
	}
}
$("#annualInterestSaving").focusout(function() {
	annualInterestSavingValidation("", 0);
});
function annualInterestSavingValidation(idAppend, mandatoryNonMandatory) {
	var id = "annualInterestSaving"+idAppend;
	var error = "annualInterestSavingError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var annualInterestSaving = $("#"+id).val().replace(/\s+/g, " ");
	if(annualInterestSaving != "") {
		if(onlyNumber.test(annualInterestSaving) == false) {
			$("#"+error).html("Annual Interest Saving can only numberic value.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		if(mandatoryNonMandatory == 1) {
			/*$("#"+error).html("Annual Interest Saving cannot be empty.");
			$("#"+id).addClass("is-invalid");
			return false;*/
			$("#"+id).addClass("is-valid");
			return true;
		} else {
			/*$("#"+id).addClass("is-valid");*/
			return true;
		}
	}
}
$("#completionYearAvoidanceCostSaving").focusout(function() {
	completionYearAvoidanceCostSavingValidation("", 0);
});
function completionYearAvoidanceCostSavingValidation(idAppend, mandatoryNonMandatory) {
	var id = "completionYearAvoidanceCostSaving"+idAppend;
	var error = "completionYearAvoidanceCostSavingError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var completionYearAvoidanceCostSaving = $("#"+id).val().replace(/\s+/g, " ");
	if(completionYearAvoidanceCostSaving != "") {
		if(onlyNumber.test(completionYearAvoidanceCostSaving) == false) {
			$("#"+error).html("Completion Year Avoidance Cost can only numberic value.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		if(mandatoryNonMandatory == 1) {
			/*$("#"+error).html("Completion Year Avoidance Cost cannot be empty.");
			$("#"+id).addClass("is-invalid");
			return false;*/
			$("#"+id).addClass("is-valid");
			return true;
		} else {
			/*$("#"+id).addClass("is-valid");*/
			return true;
		}
	}
}
$("#externalCustomerSaving").focusout(function() {
	externalCustomerSavingValidation("", 0);
});
function externalCustomerSavingValidation(idAppend, mandatoryNonMandatory) {
	var id = "externalCustomerSaving"+idAppend;
	var error = "externalCustomerSavingError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var externalCustomerSaving = $("#"+id).val().replace(/\s+/g, " ");
	if(externalCustomerSaving != "") {
		if(onlyNumber.test(externalCustomerSaving) == false) {
			$("#"+error).html("External Customer Saving can be only numeric value.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		if(mandatoryNonMandatory == 1) {
			/*$("#"+error).html("Completion Year Avoidance Cost cannot be empty.");
			$("#"+id).addClass("is-invalid");
			return false;*/
			$("#"+id).addClass("is-valid");
			return true;
		} else {
			/*$("#"+id).addClass("is-valid");*/
			return true;
		}
	}
}
$("#hopperEstimateComment").focusout(function() {
	hopperEstimateCommentValidation("", 0);
});
function hopperEstimateCommentValidation(idAppend, mandatoryNonMandatory) {
	var id = "hopperEstimateComment"+idAppend;
	var error = "hopperEstimateCommentError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var hopperEstimateComment = $("#"+id).val().replace(/\s+/g, " ");
	if(hopperEstimateComment != "") {
		if(stringCheck.test(hopperEstimateComment) == false) {
			$("#"+error).html("Comment cannot contain special characters.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		if(mandatoryNonMandatory == 1) {
			/*$("#"+error).html("Completion Year Avoidance Cost cannot be empty.");
			$("#"+id).addClass("is-invalid");
			return false;*/
			$("#"+id).addClass("is-valid");
			return true;
		} else {
			/*$("#"+id).addClass("is-valid");*/
			return true;
		}
	}
}
$("#newEstimateCommentDuringProjectContract").focusout(function() {
	newEstimateCommentDuringProjectContractValidation("", 0);
});
function newEstimateCommentDuringProjectContractValidation(idAppend, mandatoryNonMandatory) {
	var id = "newEstimateCommentDuringProjectContract"+idAppend;
	var error = "newEstimateCommentDuringProjectContractError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var newEstimateCommentDuringProjectContract = $("#"+id).val().replace(/\s+/g, " ");
	if(newEstimateCommentDuringProjectContract != "") {
		if(stringCheck.test(newEstimateCommentDuringProjectContract) == false) {
			$("#"+error).html("Comment cannot contain special characters.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		if(mandatoryNonMandatory == 1) {
			/*$("#"+error).html("Completion Year Avoidance Cost cannot be empty.");
			$("#"+id).addClass("is-invalid");
			return false;*/
			$("#"+id).addClass("is-valid");
			return true;
		} else {
			/*$("#"+id).addClass("is-valid");*/
			return true;
		}
	}
}
$("#projectStatus").change(function() {
	projectStatusValidation("");
});
function projectStatusValidation(idAppend) {
	var id = "projectStatus"+idAppend;
	var error = "projectStatusError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var projectStatus = $("#"+id).val();
	if(projectStatus != -1) {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Primary Status must be selected.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#supplyChainImprovementProjectDiv input[type='radio']").click(function() {
	$("#supplyChainImprovementProjectError").html("");
});
$("#supplierFocusProjectDiv input[type='radio']").click(function() {
	$("#supplierFocusProjectError").html("");
});
$("#projectWarrantyFocusDiv input[type='radio']").click(function() {
	$("#projectWarrantyFocusError").html("");
	if($("#projectWarrantyFocus1").prop("checked") == true) {
		$("#warrantyFocusState").prop("disabled", false);
	} else {
		$("#warrantyFocusState").removeClass("is-valid");
		$("#warrantyFocusState").removeClass("is-invalid");
		$("#warrantyFocusStateError").html("");
		$("#warrantyFocusState").val(-1);
		$("#warrantyFocusState").prop("disabled", true);
	}
});
$("#warrantyFocusState").change(function() {
	warrantyFocusStateValidation("");
});
function warrantyFocusStateValidation(idAppend) {
	var id = "warrantyFocusState"+idAppend;
	var error = "warrantyFocusStateError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var warrantyFocusState = $("#"+id).val();
	if(warrantyFocusState != -1) {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Project Warranty Focus is marked YES, Must Select Warranty.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#externalCustomerFocusProjectDiv input[type='radio']").click(function() {
	$("#externalCustomerFocusProjectError").html("");
	if($("#externalCustomerFocusProject1").prop("checked") == true) {
		$("#nameOfCustomer").prop("disabled",false);
		$("#contactPersonName").prop("disabled",false);
	} else {
		$("#nameOfCustomer").prop("disabled", true);
		$("#contactPersonName").prop("disabled", true);
	}
});
$("#nameOfCustomer").focusout(function() {
	nameOfCustomerValidation("");
});
function nameOfCustomerValidation(idAppend) {
	var id = "nameOfCustomer"+idAppend;
	var error = "nameOfCustomerError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var nameOfCustomer = $("#"+id).val().replace(/\s+/g, " ");
	if($("#externalCustomerFocusProject1").prop("checked") == true) {
		if(nameOfCustomer != "") {
			if(stringCheck.test(nameOfCustomer) == false) {
				$("#"+error).html("Name of Customer cannot contain special characters.");
				$("#"+id).addClass("is-invalid");
				return false;
			} else {
				$("#"+id).addClass("is-valid");
				return true;
			}
		} else {
			$("#"+error).html("Name of Customer cannot be empty.");
			$("#"+id).addClass("is-invalid");
			return false;
		}
	} else {
		$("#"+id).val("");
		return true;
	}
}
$("#contactPersonName").focusout(function() {
	contactPersonNameValidation("");
});
function contactPersonNameValidation(idAppend) {
	var id = "contactPersonName"+idAppend;
	var error = "contactPersonNameError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var contactPersonName = $("#"+id).val().replace(/\s+/g, " ");
	if($("#externalCustomerFocusProject1").prop("checked") == true) {
		if(contactPersonName != "") {
			if(stringCheck.test(contactPersonName) == false) {
				$("#"+error).html("Contact Person Name cannot contain special characters.");
				$("#"+id).addClass("is-invalid");
				return false;
			} else {
				$("#"+id).addClass("is-valid");
				return true;
			}
		} else {
			$("#"+error).html("Contact Person Name cannot be empty.");
			$("#"+id).addClass("is-invalid");
			return false;
		}
	} else {
		$("#"+id).val("");
		return true;
	}
}
$("#interCompanyCustomerFocusProjectDiv input[type='radio']").click(function() {
	$("#interCompanyCustomerFocusProjectError").html("");
});

$("#processOrProductOppterrunityExists").focusout(function() {
	processOrProductOppterrunityExistsValidation("");
});
function processOrProductOppterrunityExistsValidation(idAppend) {
	var id = "processOrProductOppterrunityExists"+idAppend;
	var error = "processOrProductOppterrunityExistsError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var processOrProductOppterrunityExists = $("#"+id).val().replace(/\s+/g, " ");
	if(processOrProductOppterrunityExists != "") {
		if(stringCheck.test(processOrProductOppterrunityExists) == false) {
			$("#"+error).html("Contact Person Name cannot contain special characters.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		$("#"+id).addClass("is-valid");
		return true;
	}
}
$("#qualityBaseline").focusout(function() {
	qualityBaselineValidation("", 0);
});
function qualityBaselineValidation(idAppend, mandatory) {
	var id = "qualityBaseline"+idAppend;
	var error = "qualityBaselineError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var qualityBaseline = $("#"+id).val().replace(/\s+/g, " ");
	if(qualityBaseline != "") {
		if(onlyNumber.test(qualityBaseline) == false) {
			$("#"+error).html("Only Numeric.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		if(mandatory == 1) {
			$("#"+error).html("Mandatory Feild.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			return true;
		}
	}
}
$("#qualityGoal").focusout(function() {
	qualityGoalValidation("", 0);
});
function qualityGoalValidation(idAppend, mandatory) {
	var id = "qualityGoal"+idAppend;
	var error = "qualityGoalError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var qualityGoal = $("#"+id).val().replace(/\s+/g, " ");
	if(qualityGoal != "") {
		if(onlyNumber.test(qualityGoal) == false) {
			$("#"+error).html("Only Numeric.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		if(mandatory == 1) {
			$("#"+error).html("Mandatory Feild.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			return true;
		}
	}
}
$("#qualityEntitlement").focusout(function() {
	qualityEntitlementValidation("", 0);
});
function qualityEntitlementValidation(idAppend, mandatory) {
	var id = "qualityEntitlement"+idAppend;
	var error = "qualityEntitlementError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var qualityEntitlement = $("#"+id).val().replace(/\s+/g, " ");
	if(qualityEntitlement != "") {
		if(onlyNumber.test(qualityEntitlement) == false) {
			$("#"+error).html("Only Numeric.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		if(mandatory == 1) {
			$("#"+error).html("Mandatory Feild.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			return true;
		}
	}
}
$("#qualityUnitOfMeasure").change(function() {
	qualityUnitOfMeasureValidation("", 0);
});
function qualityUnitOfMeasureValidation(idAppend, mandatory) {
	var id = "qualityUnitOfMeasure"+idAppend;
	var error = "qualityUnitOfMeasureError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var qualityUnitOfMeasure = $("#"+id).val();
	if(qualityUnitOfMeasure != "-1") {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		if(mandatory == 1) {
			$("#"+error).html("Mandatory Feild.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			return true;
		}
	}
}
$("#costBaseline").focusout(function() {
	costBaselineValidation("", 0);
});
function costBaselineValidation(idAppend, mandatory) {
	var id = "costBaseline"+idAppend;
	var error = "costBaselineError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var costBaseline = $("#"+id).val().replace(/\s+/g, " ");
	if(costBaseline != "") {
		if(onlyNumber.test(costBaseline) == false) {
			$("#"+error).html("Only Numeric.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			calculateSavingOrGains();
			return true;
		}
	} else {
		if(mandatory == 1) {
			$("#"+error).html("Mandatory Feild.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			return true;
		}
	}
}
$("#costGoal").focusout(function() {
	costGoalValidation("", 0);
});
function costGoalValidation(idAppend, mandatory) {
	var id = "costGoal"+idAppend;
	var error = "costGoalError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var costGoal = $("#"+id).val().replace(/\s+/g, " ");
	if(costGoal != "") {
		if(onlyNumber.test(costGoal) == false) {
			$("#"+error).html("Only Numeric.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			calculateSavingOrGains();
			return true;
		}
	} else {
		if(mandatory == 1) {
			$("#"+error).html("Mandatory Feild.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			return true;
		}
	}
}
function calculateSavingOrGains() {
	var savingOrGains = 0;
	if($("#costGoal").val() != "" && $("#costBaseline").val() != "") {
		savingOrGains = $("#costBaseline").val() - $("#costGoal").val();
	} else if($("#costGoal").val() != "" && $("#costBaseline").val() == "") {
		savingOrGains = 0 - $("#costGoal").val();
	} else if($("#costGoal").val() == "" && $("#costBaseline").val() != "") {
		savingOrGains = $("#costBaseline").val() - 0;
	} else {
		
	}
	$("#savingOrGains").val(savingOrGains);
}
$("#costEntitlement").focusout(function() {
	costEntitlementValidation("", 0);
});
function costEntitlementValidation(idAppend, mandatory) {
	var id = "costEntitlement"+idAppend;
	var error = "costEntitlementError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var costEntitlement = $("#"+id).val().replace(/\s+/g, " ");
	if(costEntitlement != "") {
		if(onlyNumber.test(costEntitlement) == false) {
			$("#"+error).html("Only Numeric.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		if(mandatory == 1) {
			$("#"+error).html("Mandatory Feild.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			return true;
		}
	}
}
$("#costUnitOfMeasure").change(function() {
	costUnitOfMeasureValidation("", 0);
});
function costUnitOfMeasureValidation(idAppend, mandatory) {
	var id = "costUnitOfMeasure"+idAppend;
	var error = "costUnitOfMeasureError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var costUnitOfMeasure = $("#"+id).val();
	if(costUnitOfMeasure != "-1") {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		if(mandatory == 1) {
			$("#"+error).html("Mandatory Feild.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			return true;
		}
	}
}
$("#projectTeamMemberInternal").change(function() {
	projectTeamMemberInternalValidation("", 0);
});
function projectTeamMemberInternalValidation(idAppend, mandatory) {
	var id = "projectTeamMemberInternal"+idAppend;
	var error = "projectTeamMemberInternalError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var projectTeamMemberInternal = $("#"+id).val();
	if(projectTeamMemberInternal != "") {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		if(mandatory == 1) {
			$("#"+error).html("Mandatory Feild.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			return true;
		}
	}
}
$("#projectTeamMemberExternal").change(function() {
	projectTeamMemberExternalValidation("", 0);
});
function projectTeamMemberExternalValidation(idAppend, mandatory) {
	var id = "projectTeamMemberExternal"+idAppend;
	var error = "projectTeamMemberExternalError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var projectTeamMemberExternal = $("#"+id).val();
	if(projectTeamMemberExternal != "") {
		if(stringCheck.test(projectTeamMemberExternal) == false) {
			$("#"+error).html("Project Team External cannot contain special characters.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		if(mandatory == 1) {
			$("#"+error).html("Mandatory Feild.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			return true;
		}
	}
}
$("#projectScope").change(function() {
	projectScopeValidation("", 0);
});
function projectScopeValidation(idAppend, mandatory) {
	var id = "projectScope"+idAppend;
	var error = "projectScopeError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var projectScope = $("#"+id).val();
	if(projectScope != "") {
		if(stringCheck.test(projectScope) == false) {
			$("#"+error).html("Project Scope cannot contain special characters.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		if(mandatory == 1) {
			$("#"+error).html("Project Scope Cannot be empty.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			return true;
		}
	}
}
$("#impactToExternalCustomerOrOtherIntercompanyCustomer").change(function() {
	impactToExternalCustomerOrOtherIntercompanyCustomerValidation("", 0);
});
function impactToExternalCustomerOrOtherIntercompanyCustomerValidation(idAppend, mandatory) {
	var id = "impactToExternalCustomerOrOtherIntercompanyCustomer"+idAppend;
	var error = "impactToExternalCustomerOrOtherIntercompanyCustomerError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var impactToExternalCustomerOrOtherIntercompanyCustomer = $("#"+id).val();
	if(impactToExternalCustomerOrOtherIntercompanyCustomer != "") {
		if(stringCheck.test(impactToExternalCustomerOrOtherIntercompanyCustomer) == false) {
			$("#"+error).html("Feild cannot contain special characters.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		if(mandatory == 1) {
			$("#"+error).html("Feild Cannot be empty.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			return true;
		}
	}
}
$("#supportRequired").change(function() {
	supportRequiredValidation("", 0);
});
function supportRequiredValidation(idAppend, mandatory) {
	var id = "supportRequired"+idAppend;
	var error = "supportRequiredError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var supportRequired = $("#"+id).val();
	if(supportRequired != "") {
		if(stringCheck.test(supportRequired) == false) {
			$("#"+error).html("Support cannot contain special characters.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		if(mandatory == 1) {
			$("#"+error).html("Support Cannot be empty.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			return true;
		}
	}
}
$("#cycleCount").focusout(function() {
	cycleCountValidation("", 0);
});
function cycleCountValidation(idAppend, mandatory) {
	var id = "cycleCount"+idAppend;
	var error = "cycleCountError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var cycleCount = $("#"+id).val().replace(/\s+/g, " ");
	if(cycleCount != "") {
		if(onlyNumber.test(cycleCount) == false) {
			$("#"+error).html("Only Numeric.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		if(mandatory == 1) {
			$("#"+error).html("Mandatory Feild.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			return true;
		}
	}
}