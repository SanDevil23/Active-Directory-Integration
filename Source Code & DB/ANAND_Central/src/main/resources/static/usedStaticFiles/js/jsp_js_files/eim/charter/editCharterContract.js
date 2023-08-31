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
	
	deActivateAllDisabledFeilds();

	
	var projectScope = ""+$("#projectScope").val()
	if(projectScope.trim() == "") {
		$("#projectScope").val("");
	} else {
		$("#projectScope").val(projectScope.trim());
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
function reviewCommentsValidation()
{
	var submitOrNot=true;
	var check;
	var index=$("#reviewIndex").val();
	for(let i=0;i<index;i++){
		check=$("#reviewCommentsTemp"+i).val();
		if(check==''){
			$("#reviewCommentsTemp"+i).addClass("is-invalid");
			$("#reviewCommentsTempError"+i).html("Review Comments Cannot Be Empty.");
			$("#reviewCommentsTempError"+i).show();
		}
		if(stringCheck.test(check)== false)
		{
			$("#reviewCommentsTemp"+i).addClass("is-invalid");
    		$("#reviewCommentsTempError"+i).html("Review Comments cannot contain special characters");
    		$("#reviewCommentsTempError"+i).show();
    		submitOrNot=false;
		}
		$("#reviewMomTempError"+i).html("");
		$("#reviewMomTempError"+i).hide();
		if($("#reviewMomTemp"+i).val() == "") {
			$("#reviewMomTempError"+i).html("Review MOM cannot be empty.");
			$("#reviewMomTempError"+i).show();
			submitOrNot=false;
		}
		check='';
	}
	return submitOrNot;
}

function submitCharterForm(saveSubmit) {
	saveOrSubmit = saveSubmit;
	$("#saveOrSubmit").val(saveOrSubmit);
	$("#projectCharterForm").submit();
}
$("#projectCharterForm").submit(function() {
	$("#projectCharterSubmit").addClass("disabledButton");
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	var sum=0;
	calculateSavingOrGains();
	sum=$("#annualCostSaving").val() - $("#annualTaxSaving").val();
	$("#netAnnualProfitImprovement").val(sum);
	sum=$("#completionYearCostSaving").val() - $("#oneTimeCostToImplement").val();
	$("#netCompletionYearProfitImprovement").val(sum);
	var submitOrNot = true;
	submitOrNot=reviewCommentsValidation();
	if(saveOrSubmit == 4) {
		submitOrNot = true;
	} else if(saveOrSubmit == 1) {
		if(projectDescriptionValidation("") == false) {
			submitOrNot = false;
		}
		
		if(annualCostSavingValidation("", 1) == false) {
			submitOrNot = false;
		}
		if(completionYearCostSavingValidation("", 1) == false) {
			submitOrNot = false;
		}
		
		if(projectStatusValidation("") == false) {
			submitOrNot = false;
		}
		
		if(qualityBaselineValidation("", 1) == false) {
			submitOrNot = false;
		}
		if(costBaselineValidation("", 1) == false) {
			submitOrNot = false;
		}
		
		$("#finalPresentationTempError").html("");
		$("#finalPresentationTempError").hide();
		if($("#finalPresentationTemp").val() == "") {
			$("#finalPresentationTempError").html("Final Presentation cannot be empty.");
			$("#finalPresentationTempError").show();
			submitOrNot = false;
		}
	} else {
		
		if(projectDescriptionValidation("") == false) {
			submitOrNot = false;
		}
		
		if(annualCostSavingValidation("", 0) == false) {
			submitOrNot = false;
		}
		if(completionYearCostSavingValidation("", 0) == false) {
			submitOrNot = false;
		}
		if(projectStatusValidation("") == false) {
			submitOrNot = false;
		}
		
		if(qualityBaselineValidation("", 0) == false) {
			submitOrNot = false;
		}
		if(costBaselineValidation("", 0) == false) {
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
	if(projectScopeValidation("", 0) == false) {
		submitOrNot = false;
	}
	if(supportRequiredValidation("", 0) == false) {
		submitOrNot = false;
	}
	if($("#additionalProjectLeaderTemp").val() != -1 && $("#projectLeaderTemp").val() == $("#additionalProjectLeaderTemp").val()) {
		$("#additionalProjectLeaderTempError").html("Project Leader & Additional Reader cannot be same.");
		$("#additionalProjectLeaderTemp").addClass("is-invalid");
		submitOrNot = false;
	}
	else{
		$("#additionalProjectLeaderTemp").removeClass("is-invalid");
		$("#additionalProjectLeaderTemp").addClass("is-valid");
	}
    console.log("submitOrNot : "+submitOrNot);
	if(submitOrNot) {
		activateAllDisabledFeilds();
		return true;
	} else {
		$("#projectCharterSubmit").removeClass("disabledButton");
		$('body').removeClass('disableClickBody');
		$(".anand-loader").hide();
		deActivateAllDisabledFeilds();
		return false;
	}
});
function activateAllDisabledFeilds() {
	$("#netAnnualProfitImprovement").prop("disabled",false);
	$("#netCompletionYearProfitImprovement").prop("disabled",false);
	$("#savingOrGains").prop("disabled",false);
}
function deActivateAllDisabledFeilds() {
	$("#netAnnualProfitImprovement").prop("disabled",true);
	$("#netCompletionYearProfitImprovement").prop("disabled",true);
	$("#savingOrGains").prop("disabled",true);
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
			/*$("#"+error).html("Annual Tax Saving cannot be empty.");
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

function calculateSavingOrGains() {
	var savingOrGains = 0;
	if($("#costGoal").val() != "" && $("#costBaseline").val() != "") {
		savingOrGains = $("#costBaseline").val() - $("#costGoal").val();
	} else if($("#costGoal").val() != "" && $("#costBaseline").val() == "") {
		savingOrGains = 0 - $("#costGoal").val();
	} else if($("#costGoal").val() == "" && $("#costBaseline").val() != "") {
		savingOrGains = $("#costBaseline").val() - 0;
	} else {
		alert(1);
	}
	$("#savingOrGains").val(savingOrGains);
}
$("#costEntitlement").focusout(function() {
	costEntitlementValidation("", 0);
});


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
var reviewIndex=0;
var index=0;
function addReviewRow()
{
	$('body').addClass('disableClickBody');
    $(".anand-loader").show();
    
	var t_table=$("#addReviewTable").DataTable();
	var review="<input type='text' class='form-control' name='reviewListTemp["+reviewIndex+"].reviewCommentsTemp' id='reviewCommentsTemp"+reviewIndex+"' placeholder='Enter Review Comments'>";
	var attachment="<input type='file' class='form-control' name='reviewListTemp["+reviewIndex+"].reviewMomTemp' id='reviewMomTemp"+reviewIndex+"' placeholder='Attach Review MOM'>";
	review+="<span class='error invalid-feedback' id='reviewCommentsTempError"+reviewIndex+"'></span>"
	review +="</input>";
	attachment+="<span class='error invalid-feedback' id='reviewMomTempError"+reviewIndex+"'></span>";
	attachment +="</input>";
	var date="<p></p>"
	var user="<p></p>"
	t_table.row.add([review,attachment,user,date]).draw(false);
	$('body').removeClass('disableClickBody');
    $(".anand-loader").hide();
	reviewIndex++;
	$("#reviewIndex").val(reviewIndex);
	}
