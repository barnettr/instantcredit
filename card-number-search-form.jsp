<dsp:page>
	<link rel="stylesheet" href="/checkout/instantcredit/gadgets/instantcredit.css">
	<script src="/static/js/global.js"></script>
	<script src="/static/js/jquery/floatbox.js"></script>
	<script src="/static/js/jquery/jquery-1.7.2.min.js"></script>
	<script src="/checkout/instantcredit/gadgets/card-number-search-form.js?hdsdj=<%=Math.random()%>"></script>

	<dsp:importbean bean="/OriginatingRequest" var="orgRequest" />
	<dsp:importbean bean="/atg/userprofiling/Profile" />
	<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
	<dsp:importbean bean="/com/eb/ebcard/EBCardFormHandler" />
	<dsp:getvalueof var="billingAddress" bean="Profile.billingAddress" scope="request" />
	<dsp:droplet name="/com/eb/droplet/GetAddressDroplet">
		<dsp:param name="fromProfile" value="${false}" />
		<dsp:param name="order" bean="/atg/commerce/ShoppingCart.current" />
		<dsp:oparam name="output">
			<dsp:getvalueof var="billingAddress" param="orderBillingAddress" scope="request"/>
			<dsp:getvalueof var="paymentGroup" param="paymentGroup" scope="request"/>
			<dsp:getvalueof var="shippingAddress" param="orderShippingAddress" scope="request"/>
		</dsp:oparam>
	</dsp:droplet>

	<div id="card-number-search-form-container" class="card-number-search-form-container">
		<div id="overlay" style="display:none;"></div>
		<div id="modal" style="display:none;">
		    <div class="aero">
				<img src="/static/img/aerobusy.gif" alt="" style="" />
			</div>
		    <div id="content">Processing Your Application</div>
		</div>

		<dsp:form formid="cardNumberSearchForm" id="cardNumberSearchForm" name="cardNumberSearchForm" action="${orgRequest.requestURI}" method="post" autocomplete="off">
			<dsp:input type="hidden" bean="EBCardFormHandler.successURL" value="${orgRequest.contextPath}/checkout/instantcredit/card-number-found.jsp" />
			<dsp:input type="hidden" bean="EBCardFormHandler.errorURL" value="${orgRequest.contextPath}/checkout/instantcredit/card-number-search-form.jsp" />

			<ul class="tiles">
				<li class="left">
					<div class="title">Eddie Bauer Credit Card<br />Card Number Search</div>
				</li>
				<li class="left">
					<p class="filloutfields">To look up your card number and apply it to your purchase, please fill out the fields below.
					   If you need help, please call 1-800-426-8020.</p>
				</li>
				<dsp:droplet name="/atg/dynamo/droplet/IsEmpty">
				<dsp:param name="value" bean="EBCardFormHandler.formExceptions"/>
				<dsp:oparam name="false">
				<li class="left" style="margin: 0px; background: #FDFAD7; height: 40px;">
                    <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
		                <dsp:param bean="EBCardFormHandler.formExceptions" name="exceptions" />
		                <dsp:oparam name="output">
							    <img alt="" src="/static/img/error-icon.png" class="response-icon">
							    <p class="response-text">
							    <dsp:valueof param="message" />
							    </p>
		                </dsp:oparam>
		            </dsp:droplet>
		        </li>
		        </dsp:oparam>
		        </dsp:droplet>
			</ul>
			<div class="ssn-wrapper">
				<label class="label" id="ssn" for="fieldSSN">Social Security Number (last 4) <span>*</span></label>
				<dsp:input type="password" priority="10" id="fieldSSN" bean="EBCardFormHandler.lastFourSSN"
					placeholder="XXXX" pattern="\d{4}" maxlength="4" autocomplete="off" />
				<div class="error-ssnTooltip" style="display:none;">
					<img alt="" src="/static/img/tooltip-arrow.png" class="left">
					<p class="left">Please enter the last 4 digits of your Social Security Number.</p>
					<span class="clear-break"></span>
				</div>
				<div class="error-ssn-minTooltip" style="display:none;">
					<img alt="" src="/static/img/tooltip-arrow.png" class="left">
					<p class="left">Your Social Security Number must be a least 4 digits.</p>
					<span class="clear-break"></span>
				</div>
				<div class="error-ssn-alpha-characters" style="display:none;">
					<img alt="" src="/static/img/tooltip-arrow.png" class="left">
					<p class="left"></p>
					<span class="clear-break"></span>
				</div>
			</div>
			<div class="postalcode-wrapper">
				<label class="label" id="zip" for="fieldPostalCode">Zip Code (on account) <span>*</span></label>
				<dsp:input type="text" priority="10" id="fieldPostalCode" bean="EBCardFormHandler.postalCode"
					placeholder="XXXXX" pattern="\d{5}" maxlength="5" autocomplete="off" />
				<div class="error-zipTooltip" style="display:none;">
					<img alt="" src="/static/img/tooltip-arrow.png" class="left">
					<p class="left">Please enter the zip code associated with your account.</p>
					<span class="clear-break"></span>
				</div>
				<div class="error-zip-minTooltip" style="display:none;">
					<img alt="" src="/static/img/tooltip-arrow.png" class="left">
					<p class="left">Your Zip Code/PostalCode must be a least 5 digits.</p>
					<span class="clear-break"></span>
				</div>
				<div class="error-postal-alpha-characters" style="display:none;">
					<img alt="" src="/static/img/tooltip-arrow.png" class="left">
					<p class="left"></p>
					<span class="clear-break"></span>
				</div>
			</div>
			<div class="dob-wrapper">
				<label class="label" id="dob" for="fieldDOB">Birthday (month and day) <span>*</span></label>
				<dsp:input type="text" priority="10" id="fieldDOB" bean="EBCardFormHandler.dateOfBirth"
					pattern="\d{4}" placeholder="MMDD" maxlength="4" autocomplete="off" /> <div class="mdy">MMDD</div>
				<div class="error-dobTooltip" style="display:none;">
					<img alt="" src="/static/img/tooltip-arrow.png" class="left">
					<p class="left">Please enter your date of birth.</p>
					<span class="clear-break"></span>
				</div>
				<div class="error-dob-alpha-characters" style="display:none;">
					<img alt="" src="/static/img/tooltip-arrow.png" class="left">
					<p class="left"></p>
					<span class="clear-break"></span>
				</div>
			</div>
			<div class="required">
				<span><div class="star">*</div> Required fields</span>
			</div>

			<div id="buttons" class="buttons">
				<div class="acceptButton">
					<dsp:input type="image" id="submit" class="button" priority="-10"
						src="//eddiebauer.scene7.com/is/image/EBContent/btn%5Fsubmit?$jpg12$&scl=1"
						bean="EBCardFormHandler.accountLookup" />
				</div>
			</div>
		</dsp:form>
	</div>
</dsp:page>