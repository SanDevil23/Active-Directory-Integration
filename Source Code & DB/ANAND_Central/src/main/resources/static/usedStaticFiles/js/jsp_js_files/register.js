const Toast = Swal.mixin({
	toast: true,
	position: 'top-end',
	showConfirmButton: false,
	timer: 5000
});
var emailIdValidation = false;
$(function() {
	/*write code here for onload of login_page.jsp*/
});
var stringCheck = /^[a-zA-Z_ ]*$/;
$("#signUpForm").submit(function(e) {
	var submitOrNot = true;
	if(firstNameValidation() == false) {
		submitOrNot = false;
	}

	if(middleNameValidation() == false) {
		submitOrNot = false;
	}

	if(lastNameValidation() == false) {
		submitOrNot = false;
	}

	/*if(emailValidation() == false) {
		submitOrNot = false;
	}*/
	if(!emailIdValidation) {
		$("#emailAddress").addClass("is-invalid");
		$("#emailAddressError").html("Confirm your mail ID again.");
		submitOrNot = false;
	}

	if(entityValidation() == false) {
		submitOrNot = false;
	}

	if(passwordValidation() == false) {
		submitOrNot = false;
	}

	if(retypePasswordValidation() == false) {
		submitOrNot = false;
	}

	if(phoneNumberValidation() == false) {
		submitOrNot = false;
	}

	console.log("submitOrNot : "+submitOrNot);
	console.log("emailIdValidation : "+emailIdValidation)
	if(submitOrNot && emailIdValidation) {
		$("#signUpForm").submit();
		return true;
	} else {
		Toast.fire({
			icon: 'error',
			title: 'You have few validation errors while filling the form.'
		});
		e.preventDefault();
	}
});
function firstNameValidation() {
	var firstName = $("#firstName").val().replace(/\s+/g, " ");
	$("#firstNameError").html("");
	$("#firstName").removeClass("is-valid");
	$("#firstName").removeClass("is-invalid");
	if(firstName != "") {
		if(stringCheck.test(firstName) == false) {
			$("#firstName").addClass("is-invalid");
			$("#firstNameError").html("First Name can only contain alphabets.");
			return false;
		} else {
			$("#firstName").addClass("is-valid");
			return true;
		}
	} else {
		$("#firstName").addClass("is-invalid");
		$("#firstNameError").html("First Name cannot be empty.");
		return false;
	}
}
function middleNameValidation() {
	var middleName = $("#middleName").val().replace(/\s+/g, " ");
	$("#middleNameError").html("");
	$("#middleName").removeClass("is-valid");
	$("#middleName").removeClass("is-invalid");
	if(middleName != "") {
		if(stringCheck.test(middleName) == false) {
			$("#middleName").addClass("is-invalid");
			$("#middleNameError").html("Middle Name can only contain alphabets.");
			return false;
		} else {
			$("#middleName").addClass("is-valid");
			return true;
		}
	} else {
		return true;
	}
}
function lastNameValidation() {
	var lastName = $("#lastName").val().replace(/\s+/g, " ");
	$("#lastNameError").html("");
	$("#lastName").removeClass("is-valid");
	$("#lastName").removeClass("is-invalid");
	if(lastName != "") {
		if(stringCheck.test(lastName) == false) {
			$("#lastName").addClass("is-invalid");
			$("#lastNameError").html("Last Name can only contain alphabets.");
			return false;
		} else {
			$("#lastName").addClass("is-valid");
			return true;
		}
	} else {
		$("#lastName").addClass("is-invalid");
		$("#lastNameError").html("Last Name cannot be empty.");
		return false;
	}
}
var validMailIdFormat = /^[A-Z0-9._%+-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
function emailValidation() {
	$("#emailAddressError").html("");
	$("#emailAddress").removeClass("is-valid");
	$("#emailAddress").removeClass("is-invalid");
	var emailAddress = $("#emailAddress").val().replace(/\s+/g, " ");
	if(emailAddress != "") {
		if(validMailIdFormat.test(emailAddress) == false) {
			$("#emailAddress").addClass("is-invalid");
			$("#emailAddressError").html("Enter valid email address.");
			return false;
		} else {
			$("#emailCheckLoader").show();
			$.ajax({
				url:'checkUserExists',
				type:'GET',
				data:{'emailAddress':emailAddress},
				success: function(result) {
					$("#emailCheckLoader").hide();
					console.log(result);
					if(result == "proceed") {
						emailIdValidation = true;
						$("#emailAddress").addClass("is-valid");
					} else if(result == "exists") {
						$("#emailAddress").addClass("is-invalid");
						$("#emailAddressError").html("Email Address Already Exists.");
					}
				},
				error:function() {
					$("#emailCheckLoader").hide();
					$("#emailAddressError").html("Some Exception occures, try again after some time.");
				}
			});
			return true;
		}
	} else {
		$("#emailAddress").addClass("is-invalid");
		$("#emailAddressError").html("Email Address cannot be empty.");
		return false;
	}
}
function entityValidation() {
	$("#selectEntityError").html("");
	$("#selectEntity").removeClass("is-valid");
	$("#selectEntity").removeClass("is-invalid");
	var selectEntity = $("#selectEntity").val();
	if(selectEntity == -1) {
		$("#selectEntity").addClass("is-invalid");
		$("#selectEntityError").html("Select your company/entity.");
		return false;
	} else {
		$("#selectEntity").addClass("is-valid");
		return true;
	}
}
var passwordCheck = /^[a-zA-Z0-9_ ]*$/;
/*6-20 one upper-case, one lower-case and one numeric*/
var passwordCheck_v1 = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
/*7 to 15 characters which contain at least one numeric digit and a special character*/
var passwordCheck_v2 = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$/;
/*8 to 15 characters which contain at least one lowercase letter, one uppercase letter, one numeric digit, and one special character*/
var passwordCheck_v3 = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{6,15}$/;
function passwordValidation() {
	$("#passwordError").html("");
	$("#password").removeClass("is-valid");
	$("#password").removeClass("is-invalid");
	var password = $("#password").val().replace(/\s+/g, " ");
	if(password != "") {
		if(password.match(passwordCheck_v3)) {
			$("#password").addClass("is-valid");
			return true;
		} else {
			$("#password").addClass("is-invalid");
			$("#passwordError").html("Password must contain 6 to 15 characters, one lowercase letter, one uppercase letter, one numeric digit, and one special character");
			return false;
		}
	} else {
		$("#password").addClass("is-invalid");
		$("#passwordError").html("Type your password.");
		return false;
	}
}
function retypePasswordValidation() {
	var retypePassword = $("#retypePassword").val().replace(/\s+/g, " ");
	var password = $("#password").val().replace(/\s+/g, " ");
	$("#retypePasswordError").html("");
	$("#retypePassword").removeClass("is-valid");
	$("#retypePassword").removeClass("is-invalid");
	if(retypePassword != "") {
		if(retypePassword.match(passwordCheck_v3)) {
			if(password != retypePassword) {
				$("#retypePassword").addClass("is-invalid");
				$("#retypePasswordError").html("Password does not match.");
				return false;
			} else {
				$("#retypePassword").addClass("is-valid");
				return true;
			}
		} else {
			$("#retypePassword").addClass("is-invalid");
			$("#retypePasswordError").html("Password must contain 6 to 15 characters, one lowercase letter, one uppercase letter, one numeric digit, and one special character");
			return false;
		}
	} else {
		$("#retypePassword").addClass("is-invalid");
		$("#retypePasswordError").html("Re-Type your password.");
		return false;
	}
}
var allAreNumbers = /^[0-9]+$/;
function phoneNumberValidation() {
	var phoneNumber = $("#phoneNumber").val().replace(/\s+/g, " ");
	$("#phoneNumberError").html("");
	$("#phoneNumber").removeClass("is-valid");
	$("#phoneNumber").removeClass("is-invalid");
	if(phoneNumber != "") {
		if(allAreNumbers.test(phoneNumber) == false) {
			$("#phoneNumber").addClass("is-invalid");
			$("#phoneNumberError").html("You can only enter numeric value here.");
			return false;
		} else if(phoneNumber.length != 10) {
			$("#phoneNumber").addClass("is-invalid");
			$("#phoneNumberError").html("Enter 10 digit valid mobile number.");
			return false;
		} else {
			$("#phoneNumber").addClass("is-valid");
			return true;
		}
	} else {
		$("#phoneNumber").addClass("is-invalid");
		$("#phoneNumberError").html("Enter your phone number.");
		return false;
	}
}
$("#firstName").focusout(function() {
	firstNameValidation();
});
$("#middleName").focusout(function() {
	middleNameValidation();
});
$("#lastName").focusout(function() {
	lastNameValidation();
});
$("#emailAddress").focusout(function() {
	emailValidation();
});
$("#selectEntity").change(function() {
	entityValidation();
});
$("#password").focusout(function() {
	passwordValidation();
});
$("#retypePassword").focusout(function() {
	retypePasswordValidation();
});
$("#phoneNumber").focusout(function() {
	phoneNumberValidation();
});