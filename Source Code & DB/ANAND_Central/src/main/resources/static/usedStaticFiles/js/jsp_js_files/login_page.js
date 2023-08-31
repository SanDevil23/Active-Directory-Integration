$(function() {
	var width = $( document ).width();
	console.log(width);
	if(width < 750) {
		width = width - 40
	} else {
		width = 400;
	}
	console.log(width);
	$("#loginPageDiv").width(width);
});
$("#loginForm").submit(function(e){
	var submitOrNot = true;
	if(emailValidation() == false) {
		submitOrNot = false;
	}
	if(passwordValidation() == false) {
		submitOrNot = false;
	}
	
	console.log("submitOrNot : "+submitOrNot);
	if(submitOrNot) {
		return true;
	} else {
		return false;
	}
});
function emailValidation() {
	var email = $("#email").val().replace(/\s+/g, " ");
	$("#emailError").html("");
	$("#email").removeClass("is-valid");
	$("#email").removeClass("is-invalid");
	var validMailIdFormat = /^[A-Z0-9._%+-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
	var stringCheck = /^[a-z0-9_ ]*$/;
	if(email != "") {
		/*if(validMailIdFormat.test(email) == false) {*/
		/*if(stringCheck.test(email) == false) {
			$("#emailError").html("Username can be only lower-case alphabets only");
			return false;
		} else {
			return true;
		}*/
		return true;
	} else {
		$("#emailError").html("Enter your email id");
		return false;
	}
}
$("#email").focusout(function() {
	emailValidation();
});
function passwordValidation() {
	var passwordCheck_v3 = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{6,15}$/;
	var password = $("#password").val().replace(/\s+/g, " ");
	$("#passwordError").html("");
	$("#password").removeClass("is-valid");
	$("#password").removeClass("is-invalid");
	if(password != "") {
		return true;
	} else {
		$("#passwordError").html("Enter your password.");
		return false;
	}
}
$("#password").focusout(function() {
	passwordValidation();
});