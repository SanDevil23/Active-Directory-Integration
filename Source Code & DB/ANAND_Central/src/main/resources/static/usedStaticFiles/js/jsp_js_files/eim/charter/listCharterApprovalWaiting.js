/**
 * *******************************************************************************************
 * Copyright © 2021 Anand Group India. All rights reserved.
 * No part of this product may be reproduced in any form by any means without prior
 * written authorization of Anand Automotive Private Limited and its licensors, if any.
 * *******************************************************************************************
 * Author - Anand Group India - Sheshadhri R Iyer
 * *******************************************************************************************
 */
var pagination = true;
var companyAdd = 0;
$(function () {
	$("#charterApprovalListTable").DataTable({
		"ordering": false,
		"paging": true,
		"scrollX": true,
		"scrollY": false,
		"info": true,
		"lengthChange": true,
		"searching": true,
		"autoWidth": false,
		"responsive": false,
		"drawCallback": function(settings) {
			/*$("#charterApprovalListTable_next").remove();
			$("#charterApprovalListTable_previous").remove();*/
			if (pagination) {
				$('#charterApprovalListTable_paginate').find(".pagination").append('<li class="paginate_button page-item"><a onclick="loadNextSetValues()" id="loadMore_charterApprovalListTable" class="fa fa-arrow-right page-link" href="#" title="Load More"></a></li>');
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
			title:"Hopper Projects List",
			orientation: 'portrait',
			customize: function (doc) {
				var now = new Date();
				var jsDate = now.getDate()+'-'+(now.getMonth()+1)+'-'+now.getFullYear();
				var logo = 'data:image/png;base64,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';
				doc['header']=(function() { return {
					columns: [{
						alignment: 'left',
						fontSize: 15,
						text: "Executive Metoring & Coaching",
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
	}).buttons().container().appendTo('#charterApprovalListTable_wrapper .col-md-6:eq(0)');
	
	var loadAll = window.location.href.split("all").length;
	var charterApprovalListTable = $("#charterApprovalListTable").DataTable();
	if(charterApprovalListTable.rows().count() == 0) {
		$(".dt-buttons").hide();
		$("#charterApprovalListTable_filter").hide();
	}
	if (charterApprovalListTable.rows().count() < 10 || loadAll > 1) {
		$("#loadMore_charterApprovalListTable").hide();
		pagination = false;
	}
});
function loadNextSetValues() {
	var charterApprovalListTable = $("#charterApprovalListTable").DataTable();
	var offsetValue = charterApprovalListTable.rows().count();
	$("#charterApprovalListLoader").show();
	$('#charterApprovalListTable_paginate').hide();
	$.ajax({
		url: 'loadMoreCompany',
		type: 'GET',
		data: { 'offsetValue': offsetValue },
		dataType: 'json',
		success: function(result) {
			if (result.length <= 20) {
				for (var i = 0; i < result.length; i++) {
					charterApprovalListTable.row.add([
						result[i]["companyName"], result[i]["companyShortName"], result[i]["companyAcronym"],
						result[i]["companyActive"], result[i]["action"]
					]);
				}
				charterApprovalListTable.draw(false);
				var currentPage = charterApprovalListTable.page.info().page;
				var totalPages = charterApprovalListTable.page.info().pages;
				console.log(totalPages);
				if (totalPages > 1) {
					if (currentPage != (totalPages - 1)) {
						charterApprovalListTable.page(currentPage + 1).draw(false);
					}
				}
				$("#charterApprovalListTable_paginate").scroll();
				$('#charterApprovalListTable_paginate').show();
				if (result.length < 10) {
					hideAllPaginationFunctions();
				} else {
					$("#charterApprovalLoaderImage").hide();
				}
			} else {
				hideAllPaginationFunctions();
			}
		},
		error: function() {
			$("#charterApprovalListLoader").hide();
			$('#charterApprovalListTable_paginate').show();
		}
	});
}
function hideAllPaginationFunctions() {
	$("#nothingMore").show();
	$("#charterApprovalLoaderImage").hide();
	$('#charterApprovalListTable_paginate').show();
	$("#loadMore_charterApprovalListTable").hide();
	setTimeout(function() {
		$("#nothingMore").hide();
		$("#charterApprovalListLoader").hide();
	}, 5000);
	pagination = false;
}
function openEditModal(companyId) {
	console.log(companyId+" - companyId");
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	$.ajax({
		url: 'getCompanyDetails',
		type: 'GET',
		data: { 'companyId': companyId },
		dataType: 'json',
		success: function(result) {
			clearEditFormValidation();
			$("#companyIdEdit").val(companyId);
			$("#companyNameEdit").val(result["companyName"]);
			$("#companyAcronymEdit").val(result["companyAcronym"]);
			$("#companyShortNameEdit").val(result["companyShortName"]);
			if(result["companyActive"] == "1") {
				$("#customRadio3").prop('checked', true);
			} else {
				$("#customRadio4").prop('checked', true);
			}
			$('body').removeClass('disableClickBody');
			$(".anand-loader").hide();
			var companyLocationSplit = result["companyLocation"].split(",");
			var locations = [];
			for(var i=0; i<companyLocationSplit.length; i++) {
				locations.push(companyLocationSplit[i]);
			}
			$("#companyLocationIds").val(locations);
			$("#companyLocationIds").select2();
			$("#editCompany").modal({
			    backdrop: 'static',
			    keyboard: false
			});
		},
		error: function() {
			alert("Something went wrong, try again later");
		}
	});
}
function clearEditFormValidation() {
	$("#companyNameErrorEdit").html("");
	$("#companyShortNameErrorEdit").html("");
	$("#companyAcronymErrorEdit").html("");
	$("#isActiveErrorEdit").html("");
	$("#companyNameEdit").removeClass("is-valid");
	$("#companyNameEdit").removeClass("is-invalid");
	$("#companyShortNameEdit").removeClass("is-valid");
	$("#companyShortNameEdit").removeClass("is-invalid");
	$("#companyAcronymEdit").removeClass("is-valid");
	$("#companyAcronymEdit").removeClass("is-invalid");
	$("#isActiveEdit").removeClass("is-valid");
	$("#isActiveEdit").removeClass("is-invalid");
}
var stringCheck = /^[ A-Za-z0-9-Á]*$/;
/*var stringCheckOnly = /^[A-Za-z ]*$/; with space*/
var stringCheckOnly = /^[A-Za-zÁ]*$/;

$("#addCompany").submit(function(){
	
	$("#submitCompanyButton").addClass("disabledButton");
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	
	var submitOrNot = true;
	
	/*if(companyNameValidation("") == false) {
		submitOrNot = false;
	}*/
	console.log("index of : "+$("#companyName").attr("class").indexOf("is-valid"));
	if($("#companyName").attr("class").indexOf("is-invalid") != -1) {
		submitOrNot = false;
	}
	
	if(companyShortNameValidation("") == false) {
		submitOrNot = false;
	}
	
	if(companyAcronymValidation("") == false) {
		submitOrNot = false;
	}

	if($("#customRadio1").prop("checked") == false && $("#customRadio2").prop("checked") == false) {
		$("#isActiveError").html("Company state must be selected");
		submitOrNot = false;
	}

    console.log("submitOrNot : "+submitOrNot);
	if(submitOrNot) {
		console.log("submit the form");
		return true;
	} else {
		console.log("error in form");
		$("#submitCompanyButton").removeClass("disabledButton");
		$('body').removeClass('disableClickBody');
		$(".anand-loader").hide();
		return false;
	}
});

$("#editCompany").submit(function(){
	
	$("#submitCompanyButton").addClass("disabledButton");
	$('body').addClass('disableClickBody');
	$(".anand-loader").show();
	
	var submitOrNot = true;
	
	/*if(companyNameValidation("Edit") == false) {
		submitOrNot = false;
	}*/
	console.log("index of : "+$("#companyName").attr("class").indexOf("is-valid"));
	if($("#companyNameEdit").attr("class").indexOf("is-invalid") != -1) {
		submitOrNot = false;
	}
	
	if(companyShortNameValidation("Edit") == false) {
		submitOrNot = false;
	}
	
	if(companyAcronymValidation("Edit") == false) {
		submitOrNot = false;
	}

	if($("#customRadio3").prop("checked") == false && $("#customRadio4").prop("checked") == false) {
		$("#isActiveError").html("Company state must be selected");
		submitOrNot = false;
	}

    console.log("submitOrNot : "+submitOrNot);
	if(submitOrNot) {
		console.log("submit the form");
		return true;
	} else {
		console.log("error in form");
		$("#submitCompanyButton").removeClass("disabledButton");
		$('body').removeClass('disableClickBody');
		$(".anand-loader").hide();
		return false;
	}
});

$("#companyName").focusout(function() {
	companyNameValidation("");
});
$("#companyNameEdit").focusout(function() {
	companyNameValidation("Edit");
});

$('#isActiveDiv input[type="radio"]').click(function() {
	$("#isActiveError").html("");
});
function companyNameValidation(idAppend) {
	var id = "companyName"+idAppend;
	var error = "companyNameError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var companyName = $("#"+id).val().replace(/\s+/g, " ");
	if(companyName != "") {
		if(stringCheck.test(companyName) == false) {
			$("#"+error).html("Company Name cannot contain special characters.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).val(companyName);
			$('body').addClass('disableClickBody');
			$(".anand-loader").show();
			var companyId = ""
			if(idAppend != "") {
				companyId = $("#companyIdEdit").val();
			}
			$.ajax({
				url:'getDuplicateCompanyName',
				type:'GET',
				data:{'companyName':companyName, 'companyId': companyId},
				success: function(result) {
					console.log("result : "+result);
					if(result == "error") {
						$("#"+error).html("Something went wrong, Please try after sometime.");
						$("#"+id).addClass("is-invalid");
					} else if(result == "1") {
						$("#"+error).html("Company Name already exists.");
						$("#"+id).addClass("is-invalid");
					} else {
						companyAdd = 1
						$("#"+id).addClass("is-valid");
					}
					$('body').removeClass('disableClickBody');
					$(".anand-loader").hide();
				},
				error:function() {
					$("#"+error).html("Something went wrong, Please try after sometime.");
					$("#"+id).addClass("is-invalid");
					$('body').removeClass('disableClickBody');
					$(".anand-loader").hide();
				}
			});
			return true;
		}
	} else {
		$("#"+error).html("Company Name cannot be empty.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#companyShortName").focusout(function() {
	companyShortNameValidation("");
});
$("#companyShortNameEdit").focusout(function() {
	companyShortNameValidation("Edit");
});
function companyShortNameValidation(idAppend) {
	var id = "companyShortName"+idAppend;
	var error = "companyShortNameError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var companyShortName = $("#"+id).val().replace(/\s+/g, " ");
	if(companyShortName != "") {
		if(stringCheck.test(companyShortName) == false) {
			$("#"+error).html("Company Short Name cannot contain special characters.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			$("#"+id).val(companyShortName);
			return true;
		}
	} else {
		$("#"+error).html("Company Short Name cannot be empty.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}
$("#companyAcronym").focusout(function() {
	companyAcronymValidation("");
});
$("#companyAcronymEdit").focusout(function() {
	companyAcronymValidation("Edit");
});
function companyAcronymValidation(idAppend) {
	var id = "companyAcronym"+idAppend;
	var error = "companyAcronymError"+idAppend;
	$("#"+id).removeClass("is-valid");
	$("#"+id).removeClass("is-invalid");
	$("#"+error).html("");
	var companyAcronym = $("#"+id).val().replace(/\s+/g, " ");
	if(companyAcronym != "") {
		if(stringCheckOnly.test(companyAcronym) == false) {
			$("#"+error).html("Company Acronym can only contain alphabets without spaces.");
			$("#"+id).addClass("is-invalid");
			return false;
		} else {
			$("#"+id).addClass("is-valid");
			$("#"+id).val(companyAcronym);
			return true;
		}
	} else {
		$("#"+error).html("Company Acronym cannot be empty.");
		$("#"+id).addClass("is-invalid");
		return false;
	}
}