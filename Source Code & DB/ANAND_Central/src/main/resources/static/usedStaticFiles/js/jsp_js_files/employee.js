var emailIdValidation = false;
var emailIdValidationEdit = true;
var pagination = true;
$(function() {
	/*write code here for onload of login_page.jsp*/
	$("#employeeTable").DataTable({
		"ordering": false,
		"paging": true,
		"info": true,
		"lengthChange": false,
		"searching": true,
		"autoWidth": false,
		"responsive": true,
		"drawCallback": function(settings) {
			/*$("#employeeTable_next").remove();
			$("#employeeTable_previous").remove();*/
			if (pagination) {
				$('#employeeTable_paginate').find(".pagination").append('<li class="paginate_button page-item"><a onclick="loadNextSetValues()" id="loadMore_employeeTable" class="fa fa-arrow-right page-link" href="#" title="Load More"></a></li>');
			}
		},
		"createdRow": function (row,data,index) {
	    	if(index % 2 == 0) {
	    		$(row).addClass("bg-table-row-0");
	    	} else {
	    		$(row).addClass("bg-table-row-1");
	    	}
	    },
		"buttons": [/*"csv", */"excel", {
			extend: 'pdf',
			className:'buttons-pdf',
			text:'PDF',
			titleAttr: 'Download in PDF',
			title:"Employee List",
			orientation: 'portrait',
			customize: function (doc) {
				var now = new Date();
				var jsDate = now.getDate()+'-'+(now.getMonth()+1)+'-'+now.getFullYear();
				var logo = 'data:image/png;base64,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';
				doc['header']=(function() { return {
					columns: [{
						alignment: 'left',
						fontSize: 15,
						text: "EMC Tracker",
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
		}/*, "print"*/]
	}).buttons().container().appendTo('#employeeTable_wrapper .col-md-6:eq(0)');
	
	var loadAll = window.location.href.split("all").length;
	var employeeTable = $("#employeeTable").DataTable();
	if(employeeTable.rows().count() == 0) {
		$(".dt-buttons").hide();
		$("#employeeTable_filter").hide();
	}
	if (employeeTable.rows().count() < 10 || loadAll > 1) {
		$("#loadMore_employeeTable").hide();
		pagination = false;
	}
});

function openEditModal(employeeId) {
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	$.ajax({
		url: 'getEmployeeDetails',
		type: 'GET',
		data: { 'employeeId': employeeId },
		dataType: 'json',
		success: function(result) {
			clearEditFormValidation();
			$("#employeeIdEdit").val(employeeId);
			$("#employeeFirstNameEdit").val(result["employeeFirstName"]);
			$("#employeeMiddleNameEdit").val(result["employeeMiddleName"]);
			$("#employeeLastNameEdit").val(result["employeeLastName"]);
			$("#selectCompanyLocationEdit").val(result["comLoc"]);
			$("#selectMemeberDesignationEdit").val(result["employeeDesignation"]);
			$("#selectMemeberTypeEdit").val(result["employeeType"]);
			$("#selectMemeberLevelEdit").val(result["employeeLevel"]);
			$("#employeeEmailEdit").val(result["employeeEmail"]);
			$("#employeePhoneNoEdit").val(result["employeePhoneNo"]);
			if(result["employeeActive"] == "1") {
				$("#customRadio3").prop('checked', true);
			} else {
				$("#customRadio4").prop('checked', true);
			}
			var roleSplit = result["employeeRoles"].split(",");
			var roles = [];
			for(var i=0; i<roleSplit.length; i++) {
				roles.push(roleSplit[i]);
			}
			$("#selectRoleEdit").val(roles);
			$("#selectRoleEdit").select2();
			console.log($("#selectRoleEdit").val());
			$('body').removeClass('disableClickBody');
			$(".anand-loader").hide();
			$("#editEmployee").modal({
			    backdrop: 'static',
			    keyboard: false
			});
		},
		error: function() {
			//alert("Something went wrong, try again later");
		}
	});
}


var stringCheck = /^[a-zA-Z_ ]*$/;
/*submitEmployeeButton*/
$("#addEmployee").submit(function(e) {
	
	$("#submitEmployeeButton").addClass("disabledButton");
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	
	var submitOrNot = true;

	if(employeeFirstNameValidation("") == false) {
		submitOrNot = false;
	}

	if(employeeMiddleNameValidation("") == false) {
		submitOrNot = false;
	}

	if(employeeLastNameValidation("") == false) {
		submitOrNot = false;
	}

	if(selectCompanyLocationValidation("") == false) {
		submitOrNot = false;
	}

	if(selectMemeberDesignationValidation("") == false) {
		submitOrNot = false;
	}

	if($("#customRadio1").prop("checked") == false && $("#customRadio2").prop("checked") == false) {
		$("#isActiveError").html("Employee State must be selected");
		submitOrNot = false;
	}

	if(selectMemeberLevelValidation("") == false) {
		submitOrNot = false;
	}

	if(selectMemeberTypeValidation("") == false) {
		submitOrNot = false;
	}

	if(employeePhoneNoValidation("") == false) {
		submitOrNot = false;
	}

	if(selectRoleValidation("") == false) {
		submitOrNot = false;
	}

	console.log(emailIdValidation+" email submit");
	if(!emailIdValidation) {
		$("#employeeEmail").addClass("is-invalid");
		$("#employeeEmailError").html("Confirm your mail ID again.");
		submitOrNot = false;
	}

	console.log("submitOrNot : "+submitOrNot);
	console.log("emailIdValidation : "+emailIdValidation)
	if(submitOrNot && emailIdValidation) {
		return true;
	} else {
		$("#submitEmployeeButton").removeClass("disabledButton");
		$('body').removeClass('disableClickBody');
		$(".anand-loader").hide();
		return false;
	}
});






$("#editEmployee").submit(function(e) {
	
	$("#submitEditEmployee").addClass("disabledButton");
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	
	var submitOrNot = true;

	if(employeeFirstNameValidation("Edit") == false) {
		submitOrNot = false;
	}

	if(employeeMiddleNameValidation("Edit") == false) {
		submitOrNot = false;
	}

	if(employeeLastNameValidation("Edit") == false) {
		submitOrNot = false;
	}

	if(selectCompanyLocationValidation("Edit") == false) {
		submitOrNot = false;
	}

	if(selectMemeberDesignationValidation("Edit") == false) {
		submitOrNot = false;
	}

	if($("#customRadio3").prop("checked") == false && $("#customRadio4").prop("checked") == false) {
		$("#isActiveError").html("Employee State must be selected");
		submitOrNot = false;
	}

	if(selectMemeberLevelValidation("Edit") == false) {
		submitOrNot = false;
	}

	if(selectMemeberTypeValidation("Edit") == false) {
		submitOrNot = false;
	}

	if(employeePhoneNoValidation("Edit") == false) {
		submitOrNot = false;
	}

	if(selectRoleValidation("Edit") == false) {
		submitOrNot = false;
	}

	console.log(emailIdValidationEdit+" email submit");
	if(!emailIdValidationEdit) {
		$("#employeeEmail").addClass("is-invalid");
		$("#employeeEmailError").html("Confirm your mail ID again.");
		submitOrNot = false;
	}

	console.log("submitOrNot : "+submitOrNot);
	console.log("emailIdValidationEdit : "+emailIdValidationEdit)
	if(submitOrNot && emailIdValidationEdit) {
		return true;
	} else {
		console.log("do no submit form");
		$("#submitEditEmployee").removeClass("disabledButton");
		$('body').removeClass('disableClickBody');
		$(".anand-loader").hide();
		return false;
	}
});







$("#employeeFirstName").focusout(function() {
	employeeFirstNameValidation("");
});
$("#employeeFirstNameEdit").focusout(function() {
	employeeFirstNameValidation("Edit");
});
function employeeFirstNameValidation(addEdit) {
	console.log(addEdit);
	var id = "employeeFirstName"+addEdit;
	var error = "employeeFirstNameError"+addEdit;
	var employeeFirstName = $("#"+id).val().replace(/\s+/g, " ");
	$("#"+id).val(employeeFirstName);
	$("#"+error).html("");
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	console.log(employeeFirstName);
	if(employeeFirstName != "") {
		if(stringCheck.test(employeeFirstName) == false) {
			$("#"+id).addClass("is-invalid");
			$("#"+error).html("First Name can only contain alphabets.");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		$("#"+id).addClass("is-invalid");
		$("#"+error).html("First Name cannot be empty.");
		return false;
	}
}

$("#employeeMiddleName").focusout(function() {
	employeeMiddleNameValidation("");
});
$("#employeeMiddleNameEdit").focusout(function() {
	employeeMiddleNameValidation("Edit");
});
function employeeMiddleNameValidation(addEdit) {
	console.log(addEdit);
	var id = "employeeMiddleName"+addEdit;
	var error = "employeeMiddleNameError"+addEdit;
	var employeeMiddleName = $("#"+id).val().replace(/\s+/g, " ");
	$("#"+id).val(employeeMiddleName);
	$("#"+error).html("");
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	if(employeeMiddleName != "") {
		if(stringCheck.test(employeeMiddleName) == false) {
			$("#"+id).addClass("is-invalid");
			$("#"+error).html("Middle Name can only contain alphabets.");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		/*$("#"+id).addClass("is-invalid");
		$("#"+error).html("Middle Name cannot be empty.");*/
		return true;
	}
}

$("#employeeLastName").focusout(function() {
	employeeLastNameValidation("");
});
$("#employeeLastNameEdit").focusout(function() {
	employeeLastNameValidation("Edit");
});
function employeeLastNameValidation(addEdit) {
	console.log(addEdit);
	var id = "employeeLastName"+addEdit;
	var error = "employeeLastNameError"+addEdit;
	var employeeLastName = $("#"+id).val().replace(/\s+/g, " ");
	$("#"+id).val(employeeLastName);
	$("#"+error).html("");
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	if(employeeLastName != "") {
		if(stringCheck.test(employeeLastName) == false) {
			$("#"+id).addClass("is-invalid");
			$("#"+error).html("Last Name can only contain alphabets.");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		$("#"+id).addClass("is-invalid");
		$("#"+error).html("Last Name cannot be empty.");
		return false;
	}
}

$("#selectCompanyLocation").change(function() {
	selectCompanyLocationValidation("");
});
$("#selectCompanyLocationEdit").change(function() {
	selectCompanyLocationValidation("Edit");
});
function selectCompanyLocationValidation(addEdit) {
	var id = "selectCompanyLocation"+addEdit;
	var error = "selectCompanyLocationError"+addEdit;
	$("#"+error).html("");
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	var selectCompanyLocation = $("#"+id).val();
	if(selectCompanyLocation == "-1") {
		$("#"+id).addClass("is-invalid");
		$("#"+error).html("Select Company-Location.");
		return false;
	} else {
		$("#"+id).addClass("is-valid");
		return true;
	}
}

$("#selectMemeberDesignation").change(function() {
	selectMemeberDesignationValidation("");
});
$("#selectMemeberDesignationEdit").change(function() {
	selectMemeberDesignationValidation("Edit");
});
function selectMemeberDesignationValidation(addEdit) {
	var id = "selectMemeberDesignation"+addEdit;
	var error = "selectMemeberDesignationError"+addEdit;
	$("#"+error).html("");
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	var selectCompanyLocation = $("#"+id).val();
	if(selectCompanyLocation == -1) {
		$("#"+id).addClass("is-invalid");
		$("#"+error).html("Select Designation.");
		return false;
	} else {
		$("#"+id).addClass("is-valid");
		return true;
	}
}

$('#isActiveDiv input[type="radio"]').click(function() {
	$("#isActiveError").html("");
});
$('#isActiveDivEdit input[type="radio"]').click(function() {
	$("#isActiveError").html("");
});

$("#selectMemeberLevel").change(function() {
	selectMemeberLevelValidation("");
});
$("#selectMemeberLevelEdit").change(function() {
	selectMemeberLevelValidation("Edit");
});
function selectMemeberLevelValidation(addEdit) {
	var id = "selectMemeberLevel"+addEdit;
	var error = "selectMemeberLevelError"+addEdit;
	$("#"+error).html("");
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	var selectMemeberLevel = $("#"+id).val();
	if(selectMemeberLevel == -1) {
		$("#"+id).addClass("is-invalid");
		$("#"+error).html("Select Level.");
		return false;
	} else {
		$("#"+id).addClass("is-valid");
		return true;
	}
}

$("#selectMemeberType").change(function() {
	selectMemeberTypeValidation("");
});
$("#selectMemeberTypeEdit").change(function() {
	selectMemeberTypeValidation("Edit");
});
function selectMemeberTypeValidation(addEdit) {
	var id = "selectMemeberType"+addEdit;
	var error = "selectMemeberTypeError"+addEdit;
	$("#"+error).html("");
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	var selectMemeberLevel = $("#"+id).val();
	if(selectMemeberLevel == -1) {
		$("#"+id).addClass("is-invalid");
		$("#"+error).html("Select Type.");
		return false;
	} else {
		$("#"+id).addClass("is-valid");
		return true;
	}
}

$("#selectRole").change(function() {
	selectRoleValidation("");
});
$("#selectRoleEdit").change(function() {
	selectRoleValidation("Edit");
});
function selectRoleValidation(addEdit) {
	var id = "selectRole"+addEdit;
	var error = "selectRoleError"+addEdit;
	$("#"+error).html("");
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	var selectRole = $("#"+id).val();
	console.log(selectRole.length+" - ");
	if(selectRole.length > 0) {
		var roleSelectionError = false;
		for(var i=0; i< selectRole.length; i++) {
			if(selectRole[i] == -1) {
				roleSelectionError = true;
			}
		}
		if(roleSelectionError == true) {
			$("#"+id).addClass("is-invalid");
			$("#"+error).html("Select Role.");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		$("#"+id).addClass("is-invalid");
		$("#"+error).html("Select Role.");
		return false;
	}
}

$("#employeeEmail").focusout(function() {
	employeeEmailValidation("");
});
$("#employeeEmailEdit").focusout(function() {
	employeeEmailValidation("Edit");
});

var validMailIdFormat = /^[A-Z0-9._%+-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
function employeeEmailValidation(addEdit) {
	var id = "employeeEmail"+addEdit;
	var error = "employeeEmailError"+addEdit;
	$("#"+error).html("");
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	var emailAddress = $("#"+id).val().replace(/\s+/g, " ");
	if(emailAddress != "") {
		if(validMailIdFormat.test(emailAddress) == false) {
			$("#"+id).addClass("is-invalid");
			$("#"+error).html("Enter valid email address.");
			return false;
		} else {
			$("#emailCheckLoader").show();
			emailIdValidation = false;
			var editId = $("#employeeIdEdit").val();
			if(editId != "") {
				emailIdValidationEdit = false;
			}
			$.ajax({
				url:'checkUserExists',
				type:'GET',
				data:{'emailAddress':emailAddress,'employeeId':editId},
				success: function(result) {
					$("#emailCheckLoader").hide();
					console.log(result);
					if(result == "proceed") {
						emailIdValidation = true;
						if(editId != "") {
							emailIdValidationEdit = true;
						}
						$("#"+id).addClass("is-valid");
					} else if(result == "exists") {
						$("#"+id).addClass("is-invalid");
						$("#"+error).html("Email Address Already Exists.");
					}
				},
				error:function() {
					$("#emailCheckLoader").hide();
					$("#"+error).html("Some Exception occures, try again after some time.");
				}
			});
			return true;
		}
	} else {
		$("#"+id).addClass("is-invalid");
		$("#"+error).html("Email Address cannot be empty.");
		return false;
	}
}

var allAreNumbers = /^[0-9]+$/;


$("#employeePhoneNo").focusout(function() {
	employeePhoneNoValidation("");
});
$("#employeePhoneNoEdit").focusout(function() {
	employeePhoneNoValidation("Edit");
});
function employeePhoneNoValidation(addEdit) {
	var id = "employeePhoneNo"+addEdit;
	var error = "employeePhoneNoError"+addEdit;
	var phoneNumber = $("#"+id).val().replace(/\s+/g, " ");
	$("#"+error).html("");
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	if(phoneNumber != "") {
		if(allAreNumbers.test(phoneNumber) == false) {
			$("#"+id).addClass("is-invalid");
			$("#"+error).html("You can only enter numeric value here.");
			return false;
		} else if(phoneNumber.length != 10) {
			$("#"+id).addClass("is-invalid");
			$("#"+error).html("Enter 10 digit valid mobile number.");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			return true;
		}
	} else {
		$("#"+id).addClass("is-invalid");
		$("#"+error).html("Enter your phone number.");
		return false;
	}
}

function clearEditFormValidation() {

	$("#employeeIdErrorEdit").html("");
	$("#employeeIdEdit").removeClass("is-invalid");
	$("#employeeIdEdit").removeClass("is-valid");

	$("#employeeFirstNameErrorEdit").html("");
	$("#employeeFirstNameEdit").removeClass("is-valid");
	$("#employeeFirstNameEdit").removeClass("is-invalid");

	$("#employeeMiddleNameErrorEdit").html("");
	$("#employeeMiddleNameEdit").removeClass("is-valid");
	$("#employeeMiddleNameEdit").removeClass("is-invalid");

	$("#employeeLastNameErrorEdit").html("");
	$("#employeeLastNameEdit").removeClass("is-valid");
	$("#employeeLastNameEdit").removeClass("is-invalid");

	$("#selectCompanyLocationErrorEdit").html("");
	$("#selectCompanyLocationEdit").removeClass("is-valid");
	$("#selectCompanyLocationEdit").removeClass("is-invalid");

	$("#selectMemeberDesignationErrorEdit").html("");
	$("#selectMemeberDesignationEdit").removeClass("is-valid");
	$("#selectMemeberDesignationEdit").removeClass("is-invalid");

	$("#selectMemeberTypeErrorEdit").html("");
	$("#selectMemeberTypeEdit").removeClass("is-valid");
	$("#selectMemeberTypeEdit").removeClass("is-invalid");

	$("#selectMemeberLevelErrorEdit").html("");
	$("#selectMemeberLevelEdit").removeClass("is-valid");
	$("#selectMemeberLevelEdit").removeClass("is-invalid");

	$("#employeeEmailErrorEdit").html("");
	$("#employeeEmailEdit").removeClass("is-valid");
	$("#employeeEmailEdit").removeClass("is-invalid");

	$("#employeePhoneNoErrorEdit").html("");
	$("#employeePhoneNoEdit").removeClass("is-valid");
	$("#employeePhoneNoEdit").removeClass("is-invalid");

	$("#selectRoleErrorEdit").html("");
	$("#selectRoleEdit").removeClass("is-valid");
	$("#selectRoleEdit").removeClass("is-invalid");
}