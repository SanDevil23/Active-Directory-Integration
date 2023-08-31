<script src="usedStaticFiles/js/generalJs/jquery.js"></script>
	<script src="usedStaticFiles/js/generalJs/bootstrap.bundle.js"></script>
	<script src="usedStaticFiles/js/generalJs/adminlte.js"></script>
	<script src="usedStaticFiles/js/generalJs/pace.min.js"></script>
	<script src="usedStaticFiles/js/generalJs/select2.full.min.js"></script>
	<script>
		/** ************************** */
		/* Disable Right Click on Tool */
		/* $(document).contextmenu(function() {
			return false;
		}); */
		/** ************************** */
		$('body').addClass('disableClickBody');
		var myVar = setInterval(checkForBodyClass, 300);
		function checkForBodyClass() {
			if($('body').attr('class').includes("pace-done")) {
				clearInterval(myVar);
				$(".anand-loader").hide();
				/* $('body').removeAttr('disableClickBody'); */
				$('body').removeClass('disableClickBody');
			}
		}
		$('.select2bs4').select2({
			theme: 'bootstrap4'
		});
		$('.select2').select2({
			theme: 'bootstrap4'
		});
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
		var numbersOnlyCheck = /^[ 0-9]*$/;
		var textWithMinimalSpecialCharacterCheck = /^[ A-Za-z0-9.\r\n;():/"',-]*$/
		//(Allowed special characters . ; ( ) : / \" ' , -)
	</script>