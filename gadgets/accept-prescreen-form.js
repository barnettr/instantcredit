$(document).ready(function () {
	var alpha = "";
	$("input#fieldSSN").keypress(function (e) {
     	if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
     		alpha = String.fromCharCode(e.which);
     		$(".error-ssn-alpha-characters p").html('You entered an alpha or special character: <br><span class="alpha">" ' + alpha + ' "</span>. Only numbers are allowed in this field.');
     		$(".error-ssn-alpha-characters").css('display', 'block');
     		$('html, body').animate({scrollTop:100});
     		$( "#fieldSSN" ).focus(function() {$('.error-ssn-alpha-characters').css('display', 'none');});
     		$( "#fieldSSN" ).click(function() {$('.error-ssn-alpha-characters').css('display', 'none');});
        	return false;
		}
  	});
	$("input#confirmFieldSSN").keypress(function (e) {
     	if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
     		alpha = String.fromCharCode(e.which);
     		$(".error-confirm-alpha-characters p").html('You entered an alpha or special character: <br><span class="alpha">" ' + alpha + ' "</span>. Only numbers are allowed in this field.');
     		$(".error-confirm-alpha-characters").css('display', 'block');
     		$('html, body').animate({scrollTop:100});
     		$( "#confirmFieldSSN" ).focus(function() {$('.error-confirm-alpha-characters').css('display', 'none');});
     		$( "#confirmFieldSSN" ).click(function() {$('.error-confirm-alpha-characters').css('display', 'none');});
        	return false;
		}
  	});
	$("input#fieldPostalCode").keypress(function (e) {
     	if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
     		alpha = String.fromCharCode(e.which);
     		$(".error-zipcode-alpha-characters p").html('You entered an alpha or special character: <br><span class="alpha">" ' + alpha + ' "</span>. Only numbers are allowed in this field.');
     		$(".error-zipcode-alpha-characters").css('display', 'block');
     		$('html, body').animate({scrollTop:100});
     		$( "#fieldPostalCode" ).focus(function() {$('.error-zipcode-alpha-characters').css('display', 'none');});
     		$( "#fieldPostalCode" ).click(function() {$('.error-zipcode-alpha-characters').css('display', 'none');});
        	return false;
		}
  	});
	$("input#fieldPhoneNumber").keypress(function (e) {
     	if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
     		alpha = String.fromCharCode(e.which);
     		$(".error-phone-alpha-characters p").html('You entered an alpha or special character: <br><span class="alpha">" ' + alpha + ' "</span>. Only numbers are allowed in this field.');
     		$(".error-phone-alpha-characters").css('display', 'block');
     		$('html, body').animate({scrollTop:100});
     		$( "#fieldPhoneNumber" ).focus(function() {$('.error-phone-alpha-characters').css('display', 'none');});
     		$( "#fieldPhoneNumber" ).click(function() {$('.error-phone-alpha-characters').css('display', 'none');});
        	return false;
		}
  	});
	$("input#fieldDOB").keypress(function(e) {
		if (e.which != 8 && e.which != 0 && (e.which < 47 || e.which > 57)) {
			var alpha = String.fromCharCode(e.which);
     		$(".error-dob-alpha-characters p").html('You entered an alpha or special character: <br><span class="alpha">" ' + alpha + ' "</span>. Only numbers are allowed in this field.');
     		$(".error-dob-alpha-characters").css('display', 'block');
     		$('html, body').animate({scrollTop:100});
     		$( "#fieldDOB" ).focus(function() {$('.error-dob-alpha-characters').css('display', 'none');});
     		$( "#fieldDOB" ).click(function() {$('.error-dob-alpha-characters').css('display', 'none');});
        	return false;
		}
	})
});


var editInformation = function() {
	$('.initialdisplay, .indented').css({
		display : 'block'
	});
	$('.info').css({
		display : 'none'
	});
	$('.editdisplay').css({
		display : 'block'
	});
}

$(function() {
	$('.checkbox').click(function() {
		if ($('.checkbox').prop('checked')) {
			$('.error-checkboxTooltip').css({
				display : 'none'
			});
	        $('#submit').attr('submitform', 'true');
	        $('#submit').removeClass('disabled');
	        $('#submit').addClass('button');
		} else if ( !$('.checkbox').prop('checked') ) {
	        $('#submit').attr('submitform', 'false');
	        $('#submit').addClass('disabled');
	        $('#submit').removeClass('button');
		}
	});

	$('#submit').on('click',function() {
		var dobValue = $('.accept-prescreen-form-container input#fieldDOB').val();
		var ssnValue = $('.accept-prescreen-form-container input#fieldSSN').val();
		var confirmValue = $('.accept-prescreen-form-container input#confirmFieldSSN').val();
		var firstName = $('.accept-prescreen-form-container input#fieldFirstName').val();
		var lastName = $('.accept-prescreen-form-container input#fieldLastName').val();
		var address1 = $('.accept-prescreen-form-container input#fieldAddress1').val();
		var city = $('.accept-prescreen-form-container input#fieldCity').val();
		var state = $('.accept-prescreen-form-container input#fieldState').val();
		var postalCode = $('.accept-prescreen-form-container input#fieldPostalCode').val();
		var phoneNumber = $('.accept-prescreen-form-container input#fieldPhoneNumber').val();

		if ( !$('.checkbox').prop('checked') ) {
 			$('.error-checkboxTooltip').css('display', 'block');
			if ($('.checkbox').prop('checked')) {
				$('.error-checkboxTooltip').css('display', 'none');
			}
			return false;
		} else if ( $('.checkbox').prop('checked') ) {

			var modal = (function() {
			    var method = {};

			    var $overlay = $('<div id="overlay"></div>');
				var $modal = $('<div id="modal" style="font-family:Helvetica,Arial,sans-serif;font-weight:bold;font-size:13px;line-height:16px;"></div>');
				var $content = $('<div id="content" style="display:blockborder-radius:8px;background:#fff;padding:20px 20px 20px 20px;width:200px;height:85px;text-align:center;border:solid 2px #333333;">Processing Your Application</div>');
				var $aero = $('<div class="aero" style="position:absolute;top:54px;left:100px;display:block;"><img src="/static/img/aerobusy.gif" alt="" /></div>');

				$modal.hide();
				$overlay.hide();
				$modal.append($content, $aero);

				$(document).ready(function(){
				    $('body').append($overlay, $modal);
				});

			    method.center = function () {
			        $modal.css({
			            position : 'absolute',
			        	top : '300px',
			            left : '245px'
			        });
			    };

			    // Open the modal
			    method.open = function (settings) {

			        method.center();

			        $(window).bind('resize.modal', method.center);

			        $modal.show();
			        $modal.addClass('selected');
			        $overlay.show();
			    };

			    return method;
			}());

			$('.exceptions').css({
				display : 'block'
			});

			if (firstName == "") {
				$('.error-tooltip-fname').css('display', 'block');
				$('html, body').animate({scrollTop:100});
				$( "#fieldFirstName" ).addClass('error');
				$( "#fieldFirstName" ).focus(function() {
					$('.error-tooltip-fname').css('display', 'none');
					$('.exceptions').css({ display : 'none' });
					$(this).removeClass('error');
				});
			} else if (firstName != "") {
				$( "#fieldFirstName" ).focus(function() {
					$('.error-tooltip-fname').css('display', 'none');
					$('.exceptions').css({ display : 'none' });
					$(this).removeClass('error');
				});
			}
			if (lastName == "") {
				$('.error-tooltip-lname').css('display', 'block');
				$('html, body').animate({scrollTop:100});
				$( "#fieldLastName" ).addClass('error');
				$( "#fieldLastName" ).focus(function() {
					$('.error-tooltip-lname').css('display', 'none');
					$('.exceptions').css({ display : 'none' });
					$(this).removeClass('error');
				});
			} else if (lastName != "") {
				$( "#fieldLastName" ).focus(function() {
					$('.error-tooltip-lname').css('display', 'none');
					$('.exceptions').css({ display : 'none' });
					$(this).removeClass('error');
				});
			}
			if (address1 == "") {
				$('.error-tooltip-address1').css('display', 'block');
				$('html, body').animate({scrollTop:100});
				$( "#fieldAddress1" ).addClass('error');
				$( "#fieldAddress1" ).focus(function() {
					$('.error-tooltip-address1').css('display', 'none');
					$('.exceptions').css({ display : 'none' });
					$(this).removeClass('error');
				});
			} else if (address1 != "") {
				$( "#fieldAddress1" ).focus(function() {
					$('.error-tooltip-address1').css('display', 'none');
					$('.exceptions').css({ display : 'none' });
					$(this).removeClass('error');
				});
			}
			if (city == "") {
				$('.error-tooltip-city').css('display', 'block');
				$('html, body').animate({scrollTop:100});
				$( "#fieldCity" ).addClass('error');
				$( "#fieldCity" ).focus(function() {
					$('.error-tooltip-city').css('display', 'none');
					$('.exceptions').css({ display : 'none' });
					$(this).removeClass('error');
				});
			} else if (city != "") {
				$( "#fieldCity" ).focus(function() {
					$('.error-tooltip-city').css('display', 'none');
					$('.exceptions').css({ display : 'none' });
					$(this).removeClass('error');
				});
			}
			if (state == "") {
				$('.error-tooltip-state').css('display', 'block');
				$('html, body').animate({scrollTop:100});
				$( "#fieldState" ).addClass('error');
				$( "#fieldState" ).focus(function() {
					$('.error-tooltip-state').css('display', 'none');
					$('.exceptions').css({ display : 'none' });
					$(this).removeClass('error');
				});
			} else if (state != "") {
				$( "#fieldState" ).focus(function() {
					$('.error-tooltip-state').css('display', 'none');
					$('.exceptions').css({ display : 'none' });
					$(this).removeClass('error');
				});
			}
			if (postalCode == "") {
				$('.error-tooltip-pcode').css('display', 'block');
				$('html, body').animate({scrollTop:100});
				$( "#fieldPostalCode" ).addClass('error');
				$( "#fieldPostalCode" ).focus(function() {
					$('.error-tooltip-pcode').css('display', 'none');
					$('.exceptions').css({ display : 'none' });
					$(this).removeClass('error');
				});
			} else if (postalCode != "") {
				$( "#fieldPostalCode" ).focus(function() {
					$('.error-tooltip-pcode').css('display', 'none');
					$('.exceptions').css({ display : 'none' });
					$(this).removeClass('error');
				});
			}
			if (phoneNumber == "") {
				$('.error-tooltip-phone').css('display', 'block');
				$('html, body').animate({scrollTop:100});
				$( "#fieldPhoneNumber" ).addClass('error');
				$( "#fieldPhoneNumber" ).focus(function() {
					$('.error-tooltip-phone').css('display', 'none');
					$('.exceptions').css({ display : 'none' });
					$(this).removeClass('error');
				});
			} else if (phoneNumber != "") {
				$( "#fieldPhoneNumber" ).focus(function() {
					$('.error-tooltip-phone').css('display', 'none');
					$('.exceptions').css({ display : 'none' });
					$(this).removeClass('error');
				});
			}

			if (dobValue == "") {
				$('.error-dobTooltip').css('display', 'block');
				$('html, body').animate({scrollTop:100});
				$( "#fieldDOB" ).addClass('error');
				$( "#fieldDOB" ).focus(function() {
					$('.error-dobTooltip').css('display', 'none');
					$('.exceptions').css({ display : 'none' });
					$(this).removeClass('error');
				});
	        } else if (dobValue != "") {

	        	$( "#fieldDOB" ).focus(function() {
					jQuery('.error-dobTooltip').css('display', 'none');
					$('.exceptions').css({ display : 'none' });
					$(this).removeClass('error');
				});

	        	var day = dobValue.substring(3, 5);
				var month = dobValue.substring(0, 2);
				var year = dobValue.substring(6, 10);
				var age = 18;

				var givenDate = new Date();
				givenDate.setFullYear(year, month-1, day);
				var thresholdDate = new Date();
				thresholdDate.setFullYear(thresholdDate.getFullYear() - age);

				if ( givenDate > thresholdDate ) {
				    // error-tooltip: under 18
					$('.error-tooltip').css('display', 'block');
					$( "#fieldDOB" ).focus(function() {
						jQuery('.error-tooltip').css('display', 'none');
						$('.exceptions').css({ display : 'none' });
					});
				}

				var valid = "0123456789/";
				var slashcount = 0;

				if (dobValue.length != 10) {
					$(".error-dob-alpha-characters p").html("You entered an invalid date format. The correct date format is: '01/01/2004'.");
					$(".error-dob-alpha-characters").css('display', 'block');
					$('html, body').animate({scrollTop:100});
					$( "#fieldDOB" ).addClass('error');
					$( "#fieldDOB" ).focus(function() {
						$(".error-dob-alpha-characters").css('display', 'none');
						$('.exceptions').css({ display : 'none' });
						$(this).removeClass('error');
					});
		 	        return false;
		 	    } else if (dobValue.length == 10) {
		 	    	$( "#fieldDOB" ).focus(function() {
						$(".error-dob-alpha-characters").css('display', 'none');
						$('.exceptions').css({ display : 'none' });
						$(this).removeClass('error');
					})
		 	    }
				for (var i = 0; i < dobValue.length; i++) {
			        temp = "" + dobValue.substring(i, i + 1);
			        if (temp == "/") {
			            slashcount++;
			        }
				}
	            if (valid.indexOf(temp) == "-1") {
	            	$(".error-dob-alpha-characters p").html("Invalid characters in your date. Please try again.");
	                $(".error-dob-alpha-characters").css('display', 'block');
	                $('html, body').animate({scrollTop:100});
	                $( "#fieldDOB" ).addClass('error');
	                $( "#fieldDOB" ).focus(function() {
	    				$(".error-dob-alpha-characters").css('display', 'none');
	    				$('.exceptions').css({ display : 'none' });
	    				$(this).removeClass('error');
	    			});
	                return false;
	            }
	            if (slashcount != 2) {
		        	$(".error-dob-alpha-characters p").html("You entered an invalid date format. The correct date format is: '01/01/2004'.");
		        	$(".error-dob-alpha-characters").css('display', 'block');
		        	$('html, body').animate({scrollTop:100});
		        	$( "#fieldDOB" ).addClass('error');
		        	$( "#fieldDOB" ).focus(function() {
		 				$(".error-dob-alpha-characters").css('display', 'none');
		 				$('.exceptions').css({ display : 'none' });
		 				$(this).removeClass('error');
		 			});
		            return false;
		        }
		        if ((dobValue.charAt(2) != '/') || (dobValue.charAt(5) != '/')) {
		        	$(".error-dob-alpha-characters p").html("You entered an invalid date format. The correct date format is: '01/01/2004'.");
		        	$(".error-dob-alpha-characters").css('display', 'block');
		        	$('html, body').animate({scrollTop:100});
		        	$( "#fieldDOB" ).addClass('error');
		        	$( "#fieldDOB" ).focus(function() {
		 				$(".error-dob-alpha-characters").css('display', 'none');
		 				$('.exceptions').css({ display : 'none' });
		 				$(this).removeClass('error');
		 			});
		            return false
		        }
		        $( "#fieldDOB" ).focus(function() {
					$(".error-dob-alpha-characters").css('display', 'none');
					$('.exceptions').css({ display : 'none' });
					$(this).removeClass('error');
				});
		    }

			if (ssnValue == "") {
				$('.error-ssnTooltip').css('display', 'block');
				$('html, body').animate({scrollTop:100});
				$( "#fieldSSN" ).addClass('error');
				$( "#fieldSSN" ).focus(function() {
					$('.error-ssnTooltip').css('display', 'none');
					$('.exceptions').css({ display : 'none' });
					$(this).removeClass('error');
				});
	        } else if (ssnValue != "") {
	        	if (ssnValue.length < 4) {
	        		$('.error-ssn-minTooltip').css('display', 'block');
	        		$('html, body').animate({scrollTop:100});
	        		$( "#fieldSSN" ).addClass('error');
	        		$( "#fieldSSN" ).focus(function() {
						$('.error-ssn-minTooltip').css('display', 'none');
						$('.exceptions').css({ display : 'none' });
						$(this).removeClass('error');
					});
	        		return false;
	        	} else if (ssnValue.length == 4) {
	        		$( "#fieldSSN" ).focus(function() {
						$('.error-ssn-minTooltip').css('display', 'none');
						$('.exceptions').css({ display : 'none' });
						$(this).removeClass('error');
					});
	        	}
	        }

			if (confirmValue == "") {
				$('.error-confirmTooltip').css('display', 'block');
				$('html, body').animate({scrollTop:100});
				$( "#confirmFieldSSN" ).addClass('error');
				$( "#confirmFieldSSN" ).focus(function() {
					$('.error-confirmTooltip').css('display', 'none');
					$('.exceptions').css({ display : 'none' });
					$(this).removeClass('error');
				});
	        } else if (confirmValue != "") {
	        	if ($('#fieldSSN').val() != "" && $('#fieldSSN').val() === $('#confirmFieldSSN').val()) {
	        		$('#fieldSSN-error').css('display', 'none');
	        		$('.exceptions').css({ display : 'none' });
	        		$(this).removeClass('error');
	        	} else {
	        		$('#fieldSSN-error').css('display', 'none');
	        		$('.error-confirm-match-Tooltip').css('display', 'block');
	        		$('html, body').animate({scrollTop:100});
	        		$( "#confirmFieldSSN" ).addClass('error');
	        		$( "#confirmFieldSSN" ).focus(function() {
						$('.error-confirm-match-Tooltip').css('display', 'none');
						$('.exceptions').css({ display : 'none' });
						$(this).removeClass('error');
					});
	        		return false;
	        	}
	        }

			if (dobValue == "" || ssnValue == "" || confirmValue == "") {
				return false;
			} else {

				modal.open();
				var targetOffset = $("#accept-prescreen-form-container").offset().top;
				console.log('targetOffset = ' + targetOffset);
				$('html,body').animate({scrollTop: targetOffset});
				$('html,body').stop( true, true );
				console.log('animate up');

			}
		}
    });
});
