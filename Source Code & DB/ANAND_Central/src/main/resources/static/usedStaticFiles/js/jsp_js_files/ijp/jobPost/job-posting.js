var pagination = false;
$(function() {
	$('#entityTempId').select2({
		theme: 'bootstrap4'
	});
	$('#departmentIdTempId').select2({
		theme: 'bootstrap4'
	});
	$('#designationIdTemp').select2({
		theme: 'bootstrap4'
	});
	$('#levelTempId').select2({
		theme: 'bootstrap4'
	});
	$('#educationTempIds').select2({
		theme: 'bootstrap4'
	});
    if($("#tempEducation").val() != "") {
    	var tempEducationSplit = $("#tempEducation").val().split(",");
    	$('#educationTempIds').val(tempEducationSplit).trigger("change");
    }
});
$("#jobPosting").submit(function(){
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	var submitOrNot = true;
	if(dropDownValidation("entityTempId") == false) {
		submitOrNot = false;
	}
	if(dropDownValidation("departmentIdTempId") == false) {
		submitOrNot = false;
	}
	if(dropDownValidation("designationIdTempId") == false) {
		submitOrNot = false;
	}
	if(dropDownValidation("levelTempId") == false) {
		submitOrNot = false;
	}
	if(dropDownValidation("educationTempIds") == false) {
		submitOrNot = false;
	}
	
	if(inputValidation("manpowerRequisitioNo") == false) {
		submitOrNot = false;
	}
	if(inputValidation("jobPurpose") == false) {
		submitOrNot = false;
	}
	if(inputValidation("jobDuties") == false) {
		submitOrNot = false;
	}
	if(inputValidation("minExp") == false) {
		submitOrNot = false;
	}
	if(inputValidation("maxExp") == false) {
		submitOrNot = false;
	}
	if(inputValidation("skillSet") == false) {
		submitOrNot = false;
	}
	if(inputValidation("otherPreRequisite") == false) {
		submitOrNot = false;
	}
	if(submitOrNot) {
		return true;
	} else {
		$('body').removeClass('disableClickBody');
		$(".anand-loader").hide();
		return false;
	}
});
function dropDownValidation(id) {
	var error = id+"Error";
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var value = $("#"+id).val();
	if(value == "") {
		$("#"+error).html("Mandatory Field.");
		$("#"+id).addClass("is-invalid");
		return false;
	} if(value != "-1") {
		$("#"+id).addClass("is-valid");
		return true;
	} else {
		$("#"+error).html("Mandatory Field.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
function inputValidation(id) {
	var error = id+"Error";
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var value = $("#"+id).val();
	if(value == "") {
		$("#"+error).html("Mandatory Field.");
		$("#"+id).addClass("is-invalid");
		return false;
	} else if(id.indexOf("min") == 0 || id.indexOf("max") == 0) {
		if(numbersOnlyCheck.test(value) == false) {
			$("#"+error).html("Only Numbers are allowed");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else if(textWithMinimalSpecialCharacterCheck.test(value) == false) {
		$("#"+error).html("Special Characters are not allowed.");
		$("#"+id).addClass("is-invalid");
		return false;
	} else {
		$("#"+id).addClass("is-valid");
		return true;
	}
}