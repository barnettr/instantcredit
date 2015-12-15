<dsp:page>
<link rel="stylesheet" href="/checkout/instantcredit/gadgets/instantcredit.css">
<script src="/static/js/jquery/jquery-1.7.2.min.js"></script>
<script src="/static/js/global.js"></script>
<script src="/static/js/jquery/floatbox.js"></script>
	<dsp:importbean bean="/OriginatingRequest" var="orgRequest" />
	<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
	<dsp:importbean bean="/com/eb/stores/droplet/EBStoreInventoryLookupDroplet" />
	<dsp:importbean bean="/com/eb/ebcard/EBCardFormHandler" />
	<dsp:getvalueof var="isProduction" vartype="boolean" bean="/com/eb/common/EBGlobalProperties.production" />
	<script>
		(function(a, b, c, d) {
			a = '//tags.tiqcdn.com/utag/eddiebauer/desktopeb/${isProduction ? "prod" : "dev"}/utag.js';
			b = document;
			c = 'script';
			d = b.createElement(c);
			d.src = a;
			d.type = 'text/java' + c;
			d.async = true;
			a = b.getElementsByTagName(c)[0];
			a.parentNode.insertBefore(d, a);
		})();
		$(window).load(function() {
			try {
				utag.view({page_name : "CR Modal Invitation"});
			} catch (err) {
				///console.log('error');
			}
		});
	</script>
	<div class="new-approved-prescreen-container">
		<ul class="tiles">
			<li class="left">
				<div class="title">You're Pre-Approved</div>
				<div class=sub-title>For the Eddie Bauer Credit Card</div>
			</li>
			<li class="left">
				<img src="//eddiebauer.scene7.com/is/image/EBContent/banner%5Fsave%5Fextra?$jpg12$&scl=1"
					alt="Save an additional 15% on today's purchase when you use your new Eddie Bauer Credit Card*. Combinable with other current promotions!*" />
			</li>
		</ul>

		<p class="benefits">CARDHOLDER BENEFITS INCLUDE</p>
		<ul class="offers">
			<li><div>Free Return Shipping on all orders with your Eddie Bauer Credit Card.</div></li>
			<li><div>With your first purchase on your Eddie Bauer Credit Card receive Double Friends rewards.**</div></li>
			<li><div>Exclusive cardholder discounts.</div></li>
			<li aria-flowto="terms"><div>And more!</div></li>
		</ul>
		<dsp:form formid="acceptOfferForm" id="acceptOfferForm" action="${orgRequest.contextPath}/checkout/instantcredit/new-approved-prescreen.jsp" method="post">
		<dsp:input type="hidden" aria-hidden="true" bean="EBCardFormHandler.successURL" value="${orgRequest.contextPath}/checkout/instantcredit/new-approved-prescreen.jsp" />
		<dsp:input type="hidden" aria-hidden="true" bean="EBCardFormHandler.errorURL" value="${orgRequest.contextPath}/checkout/instantcredit/new-approved-prescreen.jsp" />
		<dsp:input type="hidden" aria-hidden="true" bean="EBCardFormHandler.acceptOffer" value="submit" submitform="true" />
		</dsp:form>
		<dsp:form formid="declineOfferForm" id="declineOfferForm" action="${orgRequest.contextPath}/checkout/instantcredit/new-approved-prescreen.jsp" method="post">
		<dsp:input type="hidden" aria-hidden="true" bean="EBCardFormHandler.successURL" value="${orgRequest.contextPath}/checkout/instantcredit/new-approved-prescreen.jsp" />
		<dsp:input type="hidden" aria-hidden="true" bean="EBCardFormHandler.errorURL" value="${orgRequest.contextPath}/checkout/instantcredit/new-approved-prescreen.jsp" />
		<dsp:input type="hidden" aria-hidden="true" bean="EBCardFormHandler.declineOffer" value="submit" submitform="true" />
		</dsp:form>
		<dsp:form formid="bannerOfferAcceptForm" id="bannerOfferAcceptForm" action="${orgRequest.contextPath}/checkout/instantcredit/new-approved-prescreen.jsp" method="post">
		<dsp:input type="hidden" aria-hidden="true" bean="EBCardFormHandler.successURL" value="${orgRequest.contextPath}/checkout/instantcredit/new-approved-prescreen.jsp" />
		<dsp:input type="hidden" aria-hidden="true" bean="EBCardFormHandler.errorURL" value="${orgRequest.contextPath}/checkout/instantcredit/new-approved-prescreen.jsp" />
		<dsp:input type="hidden" aria-hidden="true" bean="EBCardFormHandler.bannerAcceptOffer" value="submit" submitform="true" />
		</dsp:form>
		<div id="buttons" class="buttons">
			<div class="acceptButton">
				<input type="image" src="//eddiebauer.scene7.com/is/image/EBContent/btn%5Finterested?$jpg12$&scl=1" class="button" value="YES I'M INTERESTED"
					alt="Yes I'm Interested" onclick="EBGLOBAL.ebcard.offerAccepted();">
			</div>
			<div class="declineButton">
				<input type="image" src="//eddiebauer.scene7.com/is/image/EBContent/btn%5Fno%5Fthanks?$jpg12$&scl=1" class="button" value="NO THANKS"
					alt="No Thanks" onclick="EBGLOBAL.ebcard.offerDeclined();return false;">
			</div>
		</div>
		<div class="clear"></div>
		<hr class="line" />
		<div class="program">
			<p id="terms" class="terms">*Subject to final credit approval. Eddie Bauer Credit Card Accounts are issued by Comenity Bank.
				Promotional offer is subject to final credit approval and completion of order within this session. Offer does not include and cannot be applied
				to previous or pending purchases, taxes, monogramming charges, gift cards or gift boxes. New accounts only.
				Cannot be combined with employee discount. Eddie Bauer Credit Card is valid for
				use at eddiebauer.com, by phone (1-800-426-8020), and at Eddie Bauer US retail and outlet stores.</p>
			<p id="two-terms" class="terms">**Must be member of Eddie Bauer Friends rewards program to receive. This rewards program is provided by Eddie Bauer,
				and its terms may change at any time.</p>
		</div>
		<div class="bound">
			<p aria-flowto="buttons">You can choose to stop receiving "prescreened" offer of credit from this and other
				companies by calling toll-free 1-888-567-8688. See <u>PRESCREEN & OPT-OUT NOTICE</u>
				in the <a class="terms" href="https://d.comenity.net/eddiebauer/public/apply/Disclosures.xhtml" target="_blank">Terms and Conditions</a>
				for more information about prescreen offers.
			</p>
		</div>
	</div>
</dsp:page>