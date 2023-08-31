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
function projectControlValidation()
{
	var submitOrNot=true;
	var check;
	var index=$("#controlIndex").val();
	for(let i=0;i<index;i++){
		check=$("#controlEstablishedInSystemTemp"+i).val();
		if(check==''){
			$("#controlEstablishedInSystemTemp"+i).addClass("is-invalid");
			$("#controlEstablishedInSystemTempError"+i).html("Control Established In System Cannot Be Empty.");
			$("#controlEstablishedInSystemTempError"+i).show();
		}
		if(stringCheck.test(check)== false)
		{
			$("#controlEstablishedInSystemTemp"+i).addClass("is-invalid");
    		$("#controlEstablishedInSystemTempError"+i).html("Control Established In Systems cannot contain special characters");
    		$("#controlEstablishedInSystemTempError"+i).show();
    		submitOrNot=false;
		}
		check=$("#controlActionTemp"+i).val();
		if(check==''){
			$("#controlActionTemp"+i).addClass("is-invalid");
			$("#controlActionTempError"+i).html("Control Action Cannot Be Empty.");
			$("#controlActionTempError"+i).show();
		}
		if(stringCheck.test(check)== false)
		{
			$("#controlActionTemp"+i).addClass("is-invalid");
    		$("#controlActionTempError"+i).html("Control Action cannot contain special characters");
    		$("#controlActionTempError"+i).show();
    		submitOrNot=false;
		}
		if($("#controlEstablishedDateTemp"+i).val() == "") {
			$("#controlEstablishedDateTemp"+i).addClass("is-invalid");
			$("#controlEstablishedDateTempError"+i).html("Control Established Date cannot be empty.");
			$("#controlEstablishedDateTempError"+i).show();
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
	var submitOrNot = true;
	submitOrNot=projectControlValidation();
	if(saveOrSubmit == 4) {
		submitOrNot = true;
	} else if(saveOrSubmit == 1) {
		
		$("#finalPresentationClosureTempError").html("");
		$("#finalPresentationClosureTempError").hide();
		if($("#finalClosurePresentationTemp").val() == "") {
			$("#finalPresentationClosureTempError").html("Final Closure Presentation cannot be empty.");
			$("#finalPresentationClosureTempError").show();
			submitOrNot = false;
		}
	} 
	if(projectStatusValidation("") == false) {
		submitOrNot = false;
	}
	if(supportRequiredValidation("", 0) == false) {
		submitOrNot = false;
	}
    console.log("submitOrNot : "+submitOrNot);
	if(submitOrNot) {
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
var controlIndex=0;
var index=0;
function addControlRow()
{
	$('body').addClass('disableClickBody');
    $(".anand-loader").show();
    
	var t_table=$("#addControlTable").DataTable();
	var action="<input type='text' class='form-control' name='controlListTemp["+controlIndex+"].controlActionTemp' id='controlActionTemp"+controlIndex+"' placeholder='Enter Action'>";
	var establishment="<input type='text' class='form-control' name='controlListTemp["+controlIndex+"].controlEstablishedInSystemTemp' id='controlEstablishedInSystemTemp"+controlIndex+"' placeholder='Enter control established in system'>";
	var date="<input type='date' class='form-control' name='controlListTemp["+controlIndex+"].controlEstablishedDateTemp' id='controlEstablishedDateTemp"+controlIndex+"' placeholder='Enter control date established'>";
	action +="<span class='error invalid-feedback' id='controlActionTempError"+controlIndex+"'></span>";
	establishment +="<span class='error invalid-feedback' id='controlEstablishedInSystemTempError"+controlIndex+"'></span>";
	date +="<span class='error invalid-feedback' id='controlEstablishedDateTempError"+controlIndex+"'></span>";
	action +="</input>";
	establishment +="</input>";
	date +="</input>";
	t_table.row.add([action,establishment,date]).draw(false);
	$('body').removeClass('disableClickBody');
    $(".anand-loader").hide();
	controlIndex++;
	$("#controlIndex").val(controlIndex);
}
