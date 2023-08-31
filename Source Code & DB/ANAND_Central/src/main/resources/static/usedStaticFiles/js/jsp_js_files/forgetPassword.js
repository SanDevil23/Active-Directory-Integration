var emailIdValidation = false;
$(function() {
	/*write code here for onload of login_page.jsp*/
});
var stringCheck = /^[a-zA-Z_ ]*$/;
$("#loginForm").submit(function(e) {
	var submitOrNot = true;
	
	console.log("emailIdValidation : "+emailIdValidation);
	
	if(!emailIdValidation) {
		$("#emailAddress").addClass("is-invalid");
		$("#emailAddressError").html("Confirm your mail ID again.");
		submitOrNot = false;
	}

	console.log("submitOrNot : "+submitOrNot);
	if(submitOrNot) {
		return false;
	} else {
		e.preventDefault();
		return false;
	}
});
var validMailIdFormat = /^[A-Z0-9._%+-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
function emailValidation() {
	$("#emailError").html("");
	$("#email").removeClass("is-valid");
	$("#email").removeClass("is-invalid");
	var email = $("#email").val().replace(/\s+/g, " ");
	if(email != "") {
		if(validMailIdFormat.test(email) == false) {
			$("#email").addClass("is-invalid");
			$("#emailError").html("Enter valid email address.");
			return false;
		} else {
			$.ajax({
				url:'checkUserExists',
				type:'GET',
				data:{'emailAddress':email},
				success: function(result) {
					console.log(result);
					if(result == "proceed") {
						$("#email").addClass("is-invalid");
						$("#emailError").html("Email does not exists.");
					} else if(result == "exists") {
						$("#email").addClass("is-valid");
						emailIdValidation = true;
					}
				},
				error:function() {
					
				}
			});
			return true;
		}
	} else {
		$("#email").addClass("is-invalid");
		$("#emailError").html("Email Address cannot be empty.");
		return false;
	}
}
$("#email").focusout(function() {
	emailValidation();
});