<dsp:page>
	<script src="/static/js/jquery/jquery-1.7.2.min.js"></script>
	<script language="JavaScript" type="text/javascript" src="https://ci-mpsnare.iovation.com/snare.js"></script>
	<script language="JavaScript" type="text/javascript">

		var io_bbout_element_id = "ioBlackBox"; // populate ioBlackBox in form
		var io_install_stm = false; // do not install ActiveX
		var io_install_flash = false; // do not install ActiveX
		var io_exclude_stm = 12; // exclude Active X on XP and higher
		// configure parameters for network latency
		var io_submit_element_id = "finalSubmit"; // tie to form's submit button
		var io_max_wait = 3000; // wait 3 seconds
		var io_submit_form_id = "your form name here";

		$(window).load(function() {

		   $("#frameWrapper").attr("src","https://d.comenity.net/eddiebauer/public/apply/Disclosures.xhtml").on("load",function() {
		   });
		   try {
				utag.view({page_name : "CR Verify"});
			} catch (err) {
				///console.log('error');
			}

		});

	</script>
	<dsp:importbean bean="/OriginatingRequest" var="orgRequest" />
	<dsp:importbean bean="/atg/userprofiling/Profile" />
	<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
	<dsp:importbean bean="/com/eb/ebcard/EBCardFormHandler" />

	<div id="accept-prescreen-form-container" ng-app="" ng-init="basicCheckValue=false" class="accept-prescreen-form-container">
		<div id="overlay" style="display:none;"></div>
			<div id="modal" style="display:none;">
			    <div class="aero">
					<img src="/static/img/aerobusy.gif" alt="" style="" />
				</div>
			    <div id="content">Processing Your Application</div>
			</div>
		<div>
			<dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
				<dsp:param bean="EBCardFormHandler.formExceptions" name="exceptions" />
				<dsp:oparam name="output">
					<p style="color: red;">
						<dsp:valueof param="message" />
					</p>
				</dsp:oparam>
			</dsp:droplet>
		</div>
		<dsp:form formid="applyForCardForm" id="applyForCardForm" name="applyForCardForm" action="${orgRequest.requestURI}" method="post" autocomplete="off">
			<dsp:input type="hidden" bean="EBCardFormHandler.successURL" value="${orgRequest.contextPath}/checkout/instantcredit/prescreen-status.jsp" />
			<dsp:input type="hidden" bean="EBCardFormHandler.errorURL" value="${orgRequest.contextPath}/checkout/instantcredit/prescreen-status.jsp" />
			<input name="BF_ioBlackBox" type="hidden" id="ioBlackBox"/>

			<ul class="tiles">
				<li class="left">
					<div class="title">Get Started By Filling Out The Acceptance Form Below</div>
				</li>
				<li class="left">
					<span class="uppercase">CONTENT INFORMATION AND RULES</span>
					<div class="clear"></div>
					<span class="message">Comenity Bank issues Eddie Bauer Credit Card Accounts. If you wish to
						proceed with this online application, you will be providing your personal information to
						Comenity Bank.</span>
				</li>
				<li class="left marginTop">
					<span class="uppercase">PERSONAL INFORMATION </span> <span class="edit">
					<a href="#" onclick="return editInformation(); EBGLOBAL.ebcard.editPersonalInformation(); return false;" class="info">Edit personal information</a></span>
				</li>
				<li class="left initialdisplay">
					<script>
					$(document).ready(function() {
						var phoneNum = "${billingAddress.phoneNumber}";
						var prefix = phoneNum.substring(0, 3);
						var lineNum1 = phoneNum.substring(3, 6);
						var lineNum2 = phoneNum.substring(6, 10);
						var newPhoneNum = "Phone: ("
							+ prefix
							+ ") "
							+ lineNum1
							+ "-"
							+ lineNum2
						jQuery("#phone").html( newPhoneNum );
					});
					</script>
					<span class="firstname">${billingAddress.firstName}</span><span class="lastname">${billingAddress.lastName}</span><br />
					<span class="address">${billingAddress.address1}</span><br />
					<c:if test="${not empty billingAddress.address2}">
						<span class="address2">${billingAddress.address2}</span><br />
					</c:if>
					<span class="city">${billingAddress.city}</span> <span class="state">${billingAddress.state}, ${billingAddress.postalCode}</span>
					<br />
					<span id="phone"></span>
				</li>
				<li class="left editdisplay">
					<div class="firstname-wrapper">
						<label class="label" for="fieldFirstName">First Name<span>*</span></label>
						<dsp:input type="text" priority="10" id="fieldFirstName" bean="EBCardFormHandler.firstName" maxlength="20"  />
						<div class="error-tooltip-fname" style="display:none;">
							<img alt="" src="/static/img/tooltip-arrow.png" class="left">
							<p class="left">Please enter a first name.</p>
							<span class="clear-break"></span>
						</div>
					</div>
					<div class="lastname-wrapper">
						<label class="label" for="fieldLastName">Last Name<span>*</span></label>
		   				<dsp:input type="text" priority="10" id="fieldLastName" bean="EBCardFormHandler.lastName" maxlength="20" />
		   				<div class="error-tooltip-lname" style="display:none;">
							<img alt="" src="/static/img/tooltip-arrow.png" class="left">
							<p class="left">Please enter a last name.</p>
							<span class="clear-break"></span>
						</div>
		   			</div>
		   			<div class="address1-wrapper">
		   				<label class="label" for="fieldAddress1">Street Address<span>*</span></label>
		   				<dsp:input type="text" priority="10" id="fieldAddress1" bean="EBCardFormHandler.address1" maxlength="40"  />
		   				<div class="error-tooltip-address1" style="display:none;">
							<img alt="" src="/static/img/tooltip-arrow.png" class="left">
							<p class="left">Please enter a street address.</p>
							<span class="clear-break"></span>
						</div>
					</div>
					<div class="address2-wrapper">
						<label class="label" for="fieldAddress2">Address 2</label>
		   				<dsp:input type="text" priority="10" id="fieldAddress2" bean="EBCardFormHandler.address2" maxlength="40"  />
					</div>
					<div class="city-wrapper">
						<label class="label" for="fieldCity">City<span>*</span></label>
		   				<dsp:input type="text" priority="10" id="fieldCity" bean="EBCardFormHandler.city"  maxlength="40"  />
		   				<div class="error-tooltip-city" style="display:none;">
							<img alt="" src="/static/img/tooltip-arrow.png" class="left">
							<p class="left">Please enter a city name.</p>
							<span class="clear-break"></span>
						</div>
					</div>
					<div class="state-wrapper">
						<label class="label" for="fieldState">State<span>*</span></label>
		   				<dsp:input type="text" priority="10" id="fieldState" bean="EBCardFormHandler.state" maxlength="40" />
		   				<div class="error-tooltip-state" style="display:none;">
							<img alt="" src="/static/img/tooltip-arrow.png" class="left">
							<p class="left">Please enter a state.</p>
							<span class="clear-break"></span>
						</div>
					</div>
					<div class="code-wrapper">
						<label class="label" for="fieldPostalCode">Postal Code<span>*</span></label>
						<dsp:input type="text" priority="10" id="fieldPostalCode" bean="EBCardFormHandler.postalCode" maxlength="40"  />
						<div class="error-tooltip-pcode" style="display:none;">
							<img alt="" src="/static/img/tooltip-arrow.png" class="left">
							<p class="left">Please enter the zip code associated with your account.</p>
							<span class="clear-break"></span>
						</div>
						<div class="error-zipcode-alpha-characters" style="display:none;">
							<img alt="" src="/static/img/tooltip-arrow.png" class="left">
							<p class="left"></p>
							<span class="clear-break"></span>
						</div>
					</div>
					<div class="phone-wrapper">
						<label class="label" for="fieldPhoneNumber">Phone Number<span>*</span></label>
						<dsp:input type="text" priority="10" id="fieldPhoneNumber" bean="EBCardFormHandler.phoneNumber" maxlength="40" />
						<div class="error-tooltip-phone" style="display:none;">
							<img alt="" src="/static/img/tooltip-arrow.png" class="left">
							<p class="left">Please enter a phone number.</p>
							<span class="clear-break"></span>
						</div>
						<div class="error-phone-alpha-characters" style="display:none;">
							<img alt="" src="/static/img/tooltip-arrow.png" class="left">
							<p class="left"></p>
							<span class="clear-break"></span>
						</div>
					</div>
					<div class="required">
						<span><div class="star">*</div> Required fields</span>
					</div>
				</li>
			</ul>

			<div>
				<p>By providing your contact information above, including any cellular or other phone numbers, you agree to be contacted regarding any of your Comenity Bank or Comenity Capital Bank accounts
					via calls to cell phones, text messages or telephone calls, including the use of artificial or pre-recorded message calls, as well as calls made via automatic telephone dialing systems, or via
					e-mail.</p>
			</div>
			<div class="exceptions" style="display:none;">
				<div class="response-bg bag-response">
				    <img alt="" src="/static/img/error-icon.png" class="response-icon">
				    <p class="response-text">We're sorry, but we have encountered issue(s) below. Please try again.</p>
				</div>
			</div>
			<div class="indented">
				<p class="uppercase">The following information is required to complete your application:</p>
				<div class="dob-wrapper">
					<label class="label" id="dob" for="fieldDOB">Date of Birth<span>*</span></label>
					<dsp:input type="text" priority="10" id="fieldDOB" bean="EBCardFormHandler.dateOfBirth" pattern="\d{1,2}/\d{1,2}/\d{4}"
						placeholder="MM/DD/YYYY" name="fieldDOB" class="theclass" autocomplete="off" /> <span class="form-hint">MM/DD/YYYY</span>
					<div class="error-dobTooltip" style="display:none;">
						<img alt="" src="/static/img/tooltip-arrow.png" class="left">
						<p class="left">Please enter your date of birth.</p>
						<span class="clear-break"></span>
					</div>
					<div class="error-tooltip" style="display:none;">
						<img alt="" src="/static/img/tooltip-arrow.png" class="left">
						<p class="left">You must be 18 years of age to qualify for this offer.</p>
						<span class="clear-break"></span>
					</div>
					<div class="error-dob-alpha-characters" style="display:none;">
						<img alt="" src="/static/img/tooltip-arrow.png" class="left">
						<p class="left"></p>
						<span class="clear-break"></span>
					</div>
				</div>
				<div class="ssn-wrapper">
				    <script>

				    </script>
					<label class="label" id="ssn" for="fieldSSN">Social Security Number - Last 4 digits Only<span>*</span></label>
	   				<dsp:input type="password" class="pw" priority="10" id="fieldSSN" bean="EBCardFormHandler.lastFourSSN" name="fieldSSN"
	   					placeholder="XXXX" pattern="\d{4}" maxlength="4" autocomplete="off" />
	   				<div class="error-ssnTooltip" style="display:none;">
						<img alt="" src="/static/img/tooltip-arrow.png" class="left">
						<p class="left">Please enter the last 4 digits of your Social Security Number.</p>
						<span class="clear-break"></span>
					</div>
					<div class="error-ssn-minTooltip" style="display:none;">
						<img alt="" src="/static/img/tooltip-arrow.png" class="left">
						<p class="left">Social Security Number must be a least 4 digits!</p>
						<span class="clear-break"></span>
					</div>
					<div class="error-ssn-alpha-characters" style="display:none;">
						<img alt="" src="/static/img/tooltip-arrow.png" class="left">
						<p class="left"></p>
						<span class="clear-break"></span>
					</div>
	   			</div>
	   			<div class="confirm-wrapper">
	   				<label class="label" id="confirm" for="confirmFieldSSN">Confirm Social Security Number - Last 4 digits Only<span>*</span></label>
	   				<dsp:input type="password" class="pw" priority="10" id="confirmFieldSSN" bean="EBCardFormHandler.confirmSSN" name="confirmFieldSSN"
	   					placeholder="XXXX" pattern="\d{4}" maxlength="4" autocomplete="off" />
	   				<div class="error-confirmTooltip" style="display:none;">
						<img alt="" src="/static/img/tooltip-arrow.png" class="left">
						<p class="left">Please confirm the last 4 digits of your Social Security Number.</p>
						<span class="clear-break"></span>
					</div>
					<div class="error-confirm-match-Tooltip" style="display:none;">
						<img alt="" src="/static/img/tooltip-arrow.png" class="left">
						<p class="left">Social Security Number and Confirmation do not match!</p>
						<span class="clear-break"></span>
					</div>
					<div class="error-confirm-alpha-characters" style="display:none;">
						<img alt="" src="/static/img/tooltip-arrow.png" class="left">
						<p class="left"></p>
						<span class="clear-break"></span>
					</div>
				</div>
				<div class="required">
                    <span><div class="star">*</div> Required fields</span>
                </div>
			</div>
			<iframe id="frameWrapper" class="bound" src="about:blank">
			</iframe>
			<dsp:input type="hidden" priority="-10" bean="EBCardFormHandler.applyForCard" value="true" />

		<div class="disclaimer">
			<p class="uppercase">IMPORTANT INFORMATION ABOUT OPENING AN ACCOUNT:</p>
			<p>To help the government fight the funding of terrorism and money laundering activities, Federal law requires all financial institutions to obtain, verify and record information that identifies each person who opens an account. What this means for you: When you open an account, we will ask for your name, address, date of birth, or other information that will allow us to identify you. We may also ask to see your driver's license or other identifying documents.</p>
			<p>You must read the disclosures presented in the Electronic Consent section of the terms and Conditions box below prior to checking the consent box. Please also read the Credit Card Agreement, Privacy Statement and other information presented in the Terms and Conditions box prior to submitting this application and <a href="https://d.comenity.net/eddiebauer/public/apply/Disclosures.xhtml" target="_blank">print a copy</a> for your records.</p>
			<p>By signing or otherwise submitting this application/solicitation, each applicant ("I," "me" or "my" below) agrees and certifies that (1) I have read and agree to the disclosures provided on or with this application/solicitation, (2) the information I have supplied is true and correct. (3) I am applying to Comenity Bank ("Bank") for the Eddie Bauer Credit Card, (4) I authorize the Bank to obtain credit reports on me, (5) if approved,
				my account will be governed by the Credit Card Agreement, (6) I understand that I may pay all of my account balance at any time without penalty and (7) this application/solicitation and any information I submitted to the bank may be shared with and retained by Eddie Bauer</p>
		</div>
		<input type="checkbox" ng-model="basicCheckValue" name="checkbox"
			class="checkbox" id="agree" />
		<div class="error-checkboxTooltip" style="display:none;">
			<img alt="" src="/static/img/tooltip-arrow.png" class="left">
			<p class="left">Before clicking the "Submit" button, please electronically sign this application by clicking the checkbox.</p>
			<span class="clear-break"></span>
		</div>

		<div class="{{ basicCheckValue }}" id="sign">By checking this box and clicking "Submit", I am electronically signing this application/solicitation.</div>

		<div id="buttons" class="buttons">
			<div class="acceptButton">
				<a href="#accept-top"><dsp:input type="image" id="submit" class="disabled" src="//eddiebauer.scene7.com/is/image/EBContent/btn%5Fsubmit%5Factive?$jpg12$&scl=1"
					alt="Submit Now" bean="EBCardFormHandler.applyForCard" submitform="false" /></a>
			</div>
			<div class="declineButton">
				<input type="image" id="nothanks" src="//eddiebauer.scene7.com/is/image/EBContent/btn%5Fno%5Fthanks?$jpg12$&scl=1" class="button" value="NO THANKS"
					alt="No Thanks" onclick="EBGLOBAL.ebcard.offerDeclined();return false;" />
			</div>
		</div>
		</dsp:form>
	</div>
</dsp:page>