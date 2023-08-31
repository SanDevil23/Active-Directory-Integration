var stringCheck = /^[ A-Za-z0-9-Á, ]*$/;
var decimalNumber = /^[ 0-9-. ]*$/;
$(function () {
});
$("#projectHopperForm").submit(function(){
	$("#projectHopperSubmit").addClass("disabledButton");
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	var submitOrNot = true;
	if(projectNameValidation("") == false) {
		submitOrNot = false;
	}
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
	if(locationTempValidation("") == false) {
		submitOrNot = false;
	}
	if(confidentialityValidation("") == false) {
		submitOrNot = false;
	}
	if(sponsorTempValidation("") == false) {
		submitOrNot = false;
	}
	if(problemSolvingLeaderTempValidation("") == false) {
		submitOrNot = false;
	}
	if(corporateProblemSolvingLeaderTempValidation("") == false) {
		submitOrNot = false;
	}
	if(projectLeaderTempValidation("") == false) {
		submitOrNot = false;
	}
	if(hopperPrimaryDriverValidation("") == false) {
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

    console.log("submitOrNot : "+submitOrNot);
	if(submitOrNot) {
		return true;
	} else {
		$("#projectHopperSubmit").removeClass("disabledButton");
		$('body').removeClass('disableClickBody');
		$(".anand-loader").hide();
		return false;
	}
});

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
}
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
		/*$("#"+error).html("Project Leader must be selected.");
		$("#"+id).addClass("is-invalid");
		return false;*/
	}
}
$("#hopperPrimaryDriver").change(function() {
	hopperPrimaryDriverValidation("");
});
function hopperPrimaryDriverValidation(idAppend) {
	var id = "hopperPrimaryDriver"+idAppend;
	var error = "hopperPrimaryDriverError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var hopperPrimaryDriver = $("#"+id).val();
	if(hopperPrimaryDriver != -1) {
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
			$("#"+error).html("Estimated Saving can only only decimal value.");
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
	$("#isActiveError").html("Project Hopper state must be selected");
	submitOrNot = false;
}