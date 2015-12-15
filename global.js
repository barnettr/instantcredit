var EBGLOBAL = {};

EBGLOBAL.ebcard = {

	newApprovedPrescreenURL : '/checkout/instantcredit/new-approved-prescreen.jsp',
	preScreenStatusURL : '/checkout/instantcredit/prescreen-status.jsp',
	finalCardApprovalURL : '/checkout/instantcredit/final-card-approval.jsp',
	finalCardReviewURL : '/checkout/instantcredit/final-card-review.jsp',
	cardNumberSearchURL : '/checkout/instantcredit/card-number-search-form.jsp',
	cardDiscountExplainationURL : '/checkout/instantcredit/credit-card-discount-explaination.jsp',
	currentThumbnailColor : '',
	selectedColor : '',

	initialize : function() {
	},

	launchShowOfferModal : function() {
		EBGLOBAL.sessionTimeout.resetTimeout();
		var showOfferModalOptions = {

			showOuterClose : false,
			showClose : false,
			outsideClickCloses : false,
			beforeBoxEnd : EBGLOBAL.ebcard.onCloseShowOfferModal,
			width : 715,
			height : 670,
			contentScroll : false,
			boxScroll : false
		}
		fb.start(this.newApprovedPrescreenURL, showOfferModalOptions);
	},
	offerDeclined : function() {
		EBGLOBAL.sessionTimeout.resetTimeout();
		$.ajax({
			type : "POST",
			url : this.newApprovedPrescreenURL,
			data : $('#declineOfferForm').serialize(),
			success : function(data) {
				//console.log('offerDeclined success');
			}
		});
		fb.end();
	},
	offerAccepted : function() {
		EBGLOBAL.sessionTimeout.resetTimeout();
		$.ajax({
			type : "POST",
			url : this.newApprovedPrescreenURL,
			data : $('#acceptOfferForm').serialize(),
			success : function(data) {
				//console.log('acceptOfferForm success');
			}
		});
		fb.end();
		EBGLOBAL.ebcard.launchPreScreenFormModal();
	},
	bannerOfferAccepted : function() {
		EBGLOBAL.sessionTimeout.resetTimeout();
		$.ajax({
			type : "POST",
			url : this.newApprovedPrescreenURL,
			data : $('#bannerOfferAcceptForm').serialize(),
			success : function(data) {
				//console.log('acceptOfferForm success');
			}
		});
		EBGLOBAL.ebcard.launchPreScreenFormModal();
	},
	submitPreScreenAcceptanceForm : function() {
		EBGLOBAL.sessionTimeout.resetTimeout();
		$.ajax({
			type : "POST",
			url : this.preScreenStatusURL,
			data : $('#applyForCardForm').serialize(),
			success : function(data) {
				var reloadModalOptions = {
						sameBox : true
				}
				fb.start(data, reloadModalOptions);
			}
		});
	},
	editPersonalInformation : function() {
		$('#addressData').hide();
		$('#addressFormFields').show();
	},
	declinePreScreenAcceptanceForm : function() {
		fb.end();
	},
	launchPreScreenFormModal : function() {
		EBGLOBAL.sessionTimeout.resetTimeout();
		var acceptPreScreenFormOptions = {
			showOuterClose : false,
			showClose : false,
			outsideClickCloses : false,
			width : 760,
			height : 670,
			contentScroll : true
		};
		fb.start(this.preScreenStatusURL, acceptPreScreenFormOptions);
	},
	onCloseShowOfferModal : function() {
		if (typeof console == "object") {
			//console.log('onCloseShowOfferModal');
		}
	},
	launchFinalCardApprovalModal : function() {
		EBGLOBAL.sessionTimeout.resetTimeout();
		var finalCardApprovalOptions = {
			showOuterClose : true,
			showClose : false,
			outsideClickCloses : true,
			width : 715,
			height : 438,
			contentScroll : false
		};
		fb.start(this.finalCardApprovalURL, finalCardApprovalOptions);
	},
	launchFinalCardReviewModal : function() {
		EBGLOBAL.sessionTimeout.resetTimeout();
		var finalCardReviewOptions = {
			showOuterClose : true,
			showClose : false,
			outsideClickCloses : true,
			width : 715,
			height : 355,
			contentScroll : false
		}
		fb.start(this.finalCardReviewURL, finalCardReviewOptions);
	},
	launchCardNumberSearchFormModal : function() {
		EBGLOBAL.sessionTimeout.resetTimeout();
		var cardNumberSearchOptions = {
			showOuterClose : true,
			showClose : false,
			outsideClickCloses : true,
			width : 715,
			height : 500,
			contentScroll : false
		}
		fb.start(this.cardNumberSearchURL, cardNumberSearchOptions);
	},
	launchCreditCardDiscountExplainationModal : function() {
		EBGLOBAL.sessionTimeout.resetTimeout();
		var cardDiscountExplainationOptions = {
			showOuterClose : true,
			showClose : false,
			outsideClickCloses : true,
			width : 715,
			height : 220,
			contentScroll : false
		}
		fb.start(this.cardDiscountExplainationURL, cardDiscountExplainationOptions);
	}

};
EBGLOBAL.stores = {

	baseURL : '/modals/pdp/new-test-stores.jsp?productId=',
	currentProductId : '',
	currentThumbnailColor : '',
	selectedColor : '',

	initialize : function() {
	},

	launchFindInStoreModal : function(productId, defaultColorId) {
		this.currentProductId = productId;
		var selectedColorId = $('#pdpSelectColor').val();
		if (selectedColorId) {
			this.currentThumbnailColor = selectedColorId;
			this.selectedColor = selectedColorId;
		} else {
			this.currentThumbnailColor = defaultColorId;
		}
		var modalURL = this.baseURL + productId + '&launchColor='
				+ this.currentThumbnailColor;
		var selectedSize = $('#pdpSelectSize').val();
		if (selectedSize) {
			modalURL = modalURL + '&launchSize=' + selectedSize;
		}
		showModal(null, null, modalURL, null, 900, true, '5%', null, null);
		$('#fis_color_id').val(selectedColorId);
	},

	colorClick : function(colorId) {
		$('#fis_color_error').hide();
		this.currentThumbnailColor = colorId;
		this.selectedColor = colorId;
		$('#fis_color_text').html(allColorsMap[colorId]);
		$('#fis_color_id').val(colorId);
		$("#fis_thumbnails").find("a").each(function() {
			if ($(this).attr('data-colorid') == colorId) {
				$(this).show();
			} else {
				$(this).hide();
			}

		});
		$("#fis_swatch_holder").find("a").each(function() {
			if ($(this).attr('data-colorid') == colorId) {
				$(this).addClass("selected");
			} else {
				$(this).removeClass("selected")
			}

		});
	},

	colorMouseOver : function(colorId) {
		$('#fis_color_text').html(allColorsMap[colorId]);
	},

	colorMouseOut : function() {
		$('#fis_color_text').html(allColorsMap[this.currentThumbnailColor]);
	},

	onlaunch : function(colorId) {
		$('#fis_color_text').html(allColorsMap[colorId]);
		$("#fis_swatch_holder").find("a").each(function() {
			if ($(this).attr('data-colorid') == colorId) {
				$(this).addClass("selected");
			} else {
				$(this).removeClass("selected");
			}

		});
	},

	zipCodeSearch : function() {

		var isError = false;

		if ($('#fis_color_id').val() == false) {
			$('#fis_color_error').fadeIn(500);
			isError = true;
		}
		if ($('#fis_size_id').val() == false) {
			$('#fis_size_error').fadeIn(500);
			isError = true;
		}
		if ($('#fis_zip_code').val() == false) {
			$('#fis_zip_error').fadeIn(500);
			isError = true;
		}
		if(isError){
			return;
		}

		var submiturl = this.baseURL + this.currentProductId;
		submiturl = submiturl + '&launchColor=' + this.currentThumbnailColor;
		$('#zip_code_search').val('true');
		var fisForm = $('#fis_form');
		$.ajax({
			type : "POST",
			url : submiturl,
			data : fisForm.serialize(),
			success : function(data) {
				$('.overlay-modal-container').html(data);
			}
		});
	},
	cityStateSearch : function() {
		var isError = false;
		if ($('#fis_color_id').val() == false) {
			$('#fis_color_error').fadeIn(500);
			isError = true;
		}
		if ($('#fis_size_id').val() == false) {
			$('#fis_size_error').fadeIn(500);
			isError = true;
		}
		if ($('#fis_city').val() == false && $('#fis_state').val() == false) {
			$('#fis_city_state_error').fadeIn(500);
			return;
		}
		if ($('#fis_city').val() == false) {
			$('#fis_city_error').fadeIn(500);
			isError = true;
		}
		if ($('#fis_state').val() == false) {
			$('#fis_state_error').fadeIn(500);
			isError = true;
		}
		if(isError){
			return;
		}

		var submiturl = this.baseURL + this.currentProductId;
		submiturl = submiturl + '&launchColor=' + this.currentThumbnailColor;

		$('#city_state_search').val('true');
		var fisForm = $('#fis_form');
		$.ajax({
			type : "POST",
			url : submiturl,
			data : fisForm.serialize(),
			success : function(data) {
				$('.overlay-modal-container').html(data);
			}
		});
	}

};

EBGLOBAL.utils = {
	tooltip : '<div class="tooltip" style="display: none; position: absolute; top: 773px; left: 642px;"><img alt="Tooltip Arrow" src="/static/img/tip-trigger-arrow.png" class="tt-arrow"><strong>Why a phone number?</strong><br>Enter at least one phone number so we can contact you if we have questions about your order. International numbers should include country code.</div>',

	initialize : function() {
	},

	allowOnlyAlphanumeric : function(e) {
		var keyPressed = !e.charCode ? e.which : e.charCode;
		var regex = new RegExp("^[a-zA-Z0-9]+$");
		var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
		if (keyPressed === 8 || regex.test(str)) {
			return true;
		}

		e.preventDefault();
		return false;
	},

	allowOnlyNumericNew : function(e) {
		e = e || window.event;
		var keyPressed = !e.keyCode ? e.which : e.keyCode;
		var regex = new RegExp("^[0-9]+$");
		var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);

		if (keyPressed === 8 || regex.test(str)) {
			return true;
		} else {
			e.preventDefault();
			return false;
		}
	},

	allowOnlyNumeric : function(e) {
		e = e || window.event;
		var keyPressed = !e.keyCode ? e.which : e.keyCode;
		var regex = new RegExp("^[0-9]+$");
		var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
		if (keyPressed === 8 || regex.test(str)) {
			return true;
		}
		var executed = false;
		if (keyPressed === 9 && !executed) {
			executed = true;
			if (jQuery('body.checkout-billing').index() != -1) {
				jQuery('#siteContainer').append(this.tooltip);
				jQuery('head').append('<style type="text/css">.selected{display:block !important;}.tooltip{color:#333 !important;}</style>');
			}
			$('input#editAddressDaytime').one('blur', function(e) {
				$('.daytime-needed-link').focus(function(e) {
					$('.tooltip').toggleClass('selected');
					$('.tooltip').css({
						display: 'block',
						color:   '#333'
					});
					$('.tooltip').attr({
						'aria-expanded': 'true',
						'aria-hidden': 'false'
					});
				}).blur(function() {
					$('.tooltip').toggleClass('selected');
					$('.tooltip').css({
						display: 'none'
					});
					$('.tooltip').attr({
						'aria-expanded': 'false',
						'aria-hidden': 'true'
					});
					jQuery('.tooltip').remove();
				});
			});
			return true;
		}
		e.preventDefault();
		return false;
	},

	allowOnlyZipcode : function(e) {
		e = e || window.event;
		var keyPressed = !e.keyCode ? e.which : e.keyCode;
		var regex = new RegExp("^[a-zA-Z0-9 -]+$");
		var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
		if (keyPressed === 8 || regex.test(str)) {
			return true;
		}
		if (keyPressed === 9) {return true;}
		e.preventDefault();
		return false;
	}

};

EBGLOBAL.sessionTimeout = {

	durationInMinutes : 30,
	durationInMilliSeconds : 1800000,
	timeoutHolder : null,
	pages : null,

	initialize : function() {
	},

	resetTimeout : function() {
		if (this.timeoutHolder != null) {
			clearTimeout(this.timeoutHolder);
		}
		this.timeoutHolder = setTimeout(function() {
			EBGLOBAL.sessionTimeout.endSession()
		}, this.durationInMilliSeconds);
		var currentdatetime = new Date();
		var currentdatetimeString = '' + currentdatetime.getTime();
		document.cookie = 'lastactivity=' + currentdatetimeString + ';path=/';
	},

	endSession : function() {
		var cookieDateTime = getCookie('lastactivity');
		if (cookieDateTime) {
			var currentdatetime = new Date();
			var currentTimeMilliSec=currentdatetime.getTime();
			var timeDiff = currentTimeMilliSec - cookieDateTime;
			var timeDiffinMins=((timeDiff/1000)/60);
			var remainingWaitTime=this.durationInMinutes-timeDiffinMins;
			if (timeDiffinMins < this.durationInMinutes) {
			//	EBGLOBAL.sessionTimeout.resetTimeout();
			setTimeout(function() {	EBGLOBAL.sessionTimeout.endSession()}, remainingWaitTime);
			return;
			}
		}
		var pathname = window.location.pathname;
		var pagesArray = this.pages.split(",");
		var indexOfPath = $.inArray(pathname, pagesArray);
		if (indexOfPath < 0) {
			return;
		}
		if (indexOfPath === 0) {
			var href = window.location.href;
			var DPSLogoutIndex = href.indexOf("DPSLogout");
			if (DPSLogoutIndex > -1) {
				return;
			}
		}

		window.location.href = '/gadgets/session-timeout-logout.jsp';

	},

	printTime : function(thisDate) {
		console.log('printTime');

		var thisDateString = "thisDate: " + thisDate.getDate() + "/"
				+ (thisDate.getMonth() + 1) + "/" + thisDate.getFullYear()
				+ " @ " + thisDate.getHours() + ":" + thisDate.getMinutes()
				+ ":" + thisDate.getSeconds();

		console.log(thisDate.getTime());
		console.log(thisDateString);

	}
};