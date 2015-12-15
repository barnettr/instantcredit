$(document).ready(function () {
	var alpha = "";
	$("input#fieldSSN").keypress(function (e) {
     	if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
     		alpha = String.fromCharCode(e.which);
     		$(".error-ssn-alpha-characters p").html('You entered an alpha or special character: <br><span class="alpha">" ' + alpha + ' "</span>. Only numbers are allowed in this field.');
     		$(".error-ssn-alpha-characters").css('display', 'block');
     		$( "#fieldSSN" ).focus(function() {$('.error-ssn-alpha-characters').css('display', 'none');});
     		$( "#fieldSSN" ).click(function() {$('.error-ssn-alpha-characters').css('display', 'none');});
        	return false;
		}
  	});
	$("input#fieldPostalCode").keypress(function (e) {
     	if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
     		alpha = String.fromCharCode(e.which);
     		$(".error-postal-alpha-characters p").html('You entered an alpha or special character: <br><span class="alpha">" ' + alpha + ' "</span>. Only numbers are allowed in this field.');
     		$(".error-postal-alpha-characters").css('display', 'block');
     		$( "#fieldPostalCode" ).focus(function() {$('.error-postal-alpha-characters').css('display', 'none');});
     		$( "#fieldPostalCode" ).click(function() {$('.error-postal-alpha-characters').css('display', 'none');});
        	return false;
		}
  	});
	$("input#fieldDOB").keypress(function (e) {
     	if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
     		alpha = String.fromCharCode(e.which);
     		$(".error-dob-alpha-characters p").html('You entered an alpha or special character: <br><span class="alpha">" ' + alpha + ' "</span>. Only numbers are allowed in this field.');
     		$(".error-dob-alpha-characters").css('display', 'block');
     		$( "#fieldDOB" ).focus(function() { $('.error-dob-alpha-characters').css('display', 'none'); });
     		$( "#fieldDOB" ).click(function() { $('.error-dob-alpha-characters').css('display', 'none'); });
        	return false;
		}
  	});
});

$(function() {
	$('#submit').on('click',function() {

		var modal = (function() {
		    var method = {};

		    var $overlay = $('<div id="overlay"></div>');
			var $modal = $('<div id="modal" style="font-family:Helvetica,Arial,sans-serif;font-weight:bold;font-size:13px;line-height:16px;"></div>');
			var $content = $('<div id="content" style="display:blockborder-radius:8px;background:#fff;padding:9px 20px 20px 20px;width:200px;height:85px;text-align:center;border:solid 2px #333333;">Processing Your Application</div>');
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
		        	top : '200px',
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

		var dobValue = $('.card-number-search-form-container input#fieldDOB').val();
		var postalValue = $('.card-number-search-form-container input#fieldPostalCode').val();
		var ssnValue = $('.card-number-search-form-container input#fieldSSN').val();

		if (ssnValue == "") {
			$('.error-ssnTooltip').css('display', 'block');
			$( "#fieldSSN" ).addClass('error').focus();
			$( "#fieldSSN" ).focus(function() {
				$('.error-ssnTooltip').css('display', 'none');
				$(this).removeClass('error');
			});
        } else if (ssnValue != "") {

        	$('.error-ssnTooltip').css('display', 'none');
        	$( "#fieldSSN" ).removeClass('error');
        	if (ssnValue.length < 4) {
        		$('.error-ssn-minTooltip').css('display', 'block');
        		$( "#fieldSSN" ).addClass('error').focus();
        		return false;
        	} else if (ssnValue.length == 4) {
        		$( "#fieldSSN" ).focus(function() {
					$('.error-ssn-minTooltip').css('display', 'none');
					$(this).removeClass('error');
				});
        	}
        }

		if (postalValue == "") {
			$('.error-zipTooltip').css('display', 'block');
			$( "#fieldPostalCode" ).addClass('error').focus();
			$( "#fieldPostalCode" ).focus(function() {
				$('.error-zipTooltip').css('display', 'none');
				$(this).removeClass('error');
			});
        } else if (postalValue != "") {
        	$('.error-zipTooltip').css('display', 'none');
        	$( "#fieldPostalCode" ).removeClass('error');
        	if (postalValue.length < 5) {
        		$('.error-zip-minTooltip').css('display', 'block');
        		$( "#fieldPostalCode" ).addClass('error').focus();
        		$( "#fieldPostalCode" ).focus(function() {
					$('.error-zip-minTooltip').css('display', 'none');
					$(this).removeClass('error');
				});
        		return false;
        	} else if (postalValue.length == 5) {
        		$( "#fieldPostalCode" ).focus(function() {
					$('.error-zip-minTooltip').css('display', 'none');
					$(this).removeClass('error');
				});
        	}
        }

		if (dobValue == "") {

			$('.error-dobTooltip').css('display', 'block');
			$( "#fieldDOB" ).addClass('error').focus();
			$( "#fieldDOB" ).focus(function() {
				jQuery('.error-dobTooltip').css('display', 'none');
				$(this).removeClass('error');
			});
        } else if (dobValue != "") {
        	var num1 = dobValue.substring(0, 1);
        	var num2 = dobValue.substring(1, 2);
        	var num3 = dobValue.substring(2, 3);
        	var num4 = dobValue.substring(3, 4);

        	if ((num1 + num2) > 12) {
        		$(".error-dob-alpha-characters p").html('You entered an invalid number for the day or month.');
        		$(".error-dob-alpha-characters").css('display', 'block');
            	$(".error-dob-alpha-characters").addClass('error').focus();
         		$( "#fieldDOB" ).focus(function() {
         			$('.error-dob-alpha-characters').css('display', 'none');
         			$('.error-dob-alpha-characters').removeClass('error');
         		});
         		$( "#fieldDOB" ).click(function() {
         			$('.error-dob-alpha-characters').css('display', 'none');
         			$('.error-dob-alpha-characters').removeClass('error');
         		});
         		return false;
        	} else {
        		$( "#fieldDOB" ).focus(function() {
         			$('.error-dob-alpha-characters').css('display', 'none');
         			$('.error-dob-alpha-characters').removeClass('error');
         		});
         		$( "#fieldDOB" ).click(function() {
         			$('.error-dob-alpha-characters').css('display', 'none');
         			$('.error-dob-alpha-characters').removeClass('error');
         		});
        	}
        	if ((num3 + num4) > 31) {
        		$(".error-dob-alpha-characters p").html('You entered an invalid number for the day or month.');
        		$(".error-dob-alpha-characters").css('display', 'block');
            	$(".error-dob-alpha-characters").addClass('error').focus();
         		$( "#fieldDOB" ).focus(function() {
         			$('.error-dob-alpha-characters').css('display', 'none');
         			$('.error-dob-alpha-characters').removeClass('error');
         		});
         		$( "#fieldDOB" ).click(function() {
         			$('.error-dob-alpha-characters').css('display', 'none');
         			$('.error-dob-alpha-characters').removeClass('error');
         		});
         		return false;
        	} else {
        		$( "#fieldDOB" ).focus(function() {
         			$('.error-dob-alpha-characters').css('display', 'none');
         			$('.error-dob-alpha-characters').removeClass('error');
         		});
         		$( "#fieldDOB" ).click(function() {
         			$('.error-dob-alpha-characters').css('display', 'none');
         			$('.error-dob-alpha-characters').removeClass('error');
         		});
        	}

        }
		if (dobValue == "" || ssnValue == "" || postalValue == "") {
			return false;
		} else {
			modal.open();
		}
	});
});