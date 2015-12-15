<dsp:page>
	<link rel="stylesheet" href="/checkout/instantcredit/gadgets/instantcredit.css">
	<script src="/static/js/jquery/jquery-1.7.2.min.js"></script>
	<script src="/static/js/jquery/floatbox.js"></script>
	<script src="/checkout/instantcredit/gadgets/accept-prescreen-form.js?hdsdj=<%=Math.random()%>"></script>
	<script src="/static/js/global.js"></script>
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
	</script>
	<dsp:importbean bean="/OriginatingRequest" var="orgRequest" />
	<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
	<dsp:importbean bean="/com/eb/stores/droplet/EBStoreInventoryLookupDroplet" />
	<dsp:importbean bean="/com/eb/ebcard/EBCardFormHandler" />
	<dsp:droplet name="/com/eb/droplet/GetAddressDroplet">
		<dsp:param name="fromProfile" value="${false}" />
		<dsp:param name="order" bean="/atg/commerce/ShoppingCart.current" />
		<dsp:oparam name="output">
			<dsp:getvalueof var="billingAddress" param="orderBillingAddress" scope="request"/>
			<dsp:getvalueof var="paymentGroup" param="paymentGroup" scope="request"/>
			<dsp:getvalueof var="shippingAddress" param="orderShippingAddress" scope="request"/>
		</dsp:oparam>
	</dsp:droplet>
	<div id="wrapper">
		<dsp:droplet name="/com/eb/ebcard/EBCardPrescreenDroplet">
			<dsp:param name="profileId" bean="/atg/userprofiling/Profile.id" />
			<dsp:param name="billingAddress" value="${billingAddress}" />
			<dsp:oparam name="empty">
				<h1>no prescreen information</h1>
			</dsp:oparam>
			<dsp:oparam name="prescreenApproved">
				<dsp:include page="/checkout/instantcredit/accept-prescreen-form.jsp" />
			</dsp:oparam>
			<dsp:oparam name="prescreenOfferAccepted">
				<dsp:include page="/checkout/instantcredit/accept-prescreen-form.jsp" />
			</dsp:oparam>
			<dsp:oparam name="prescreenBannerAccepted">
				<dsp:include page="/checkout/instantcredit/accept-prescreen-form.jsp" />
			</dsp:oparam>
			<dsp:oparam name="prescreenOfferDeclined">
				<dsp:include page="/checkout/instantcredit/accept-prescreen-form.jsp" />
			</dsp:oparam>
			<dsp:oparam name="prescreenAcceptFormDeclined">
				<dsp:include page="/checkout/instantcredit/accept-prescreen-form.jsp" />
			</dsp:oparam>
			<dsp:oparam name="cardApplied">
				<dsp:include page="/checkout/instantcredit/final-card-review.jsp" />
			</dsp:oparam>
			<dsp:oparam name="cardApproved">
				<dsp:include page="/checkout/instantcredit/final-card-approval.jsp" >
				<dsp:param name="creditLimit" param="creditLimit" />
				</dsp:include>
			</dsp:oparam>
			<dsp:oparam name="cardApprovedFromBanner">
				<dsp:include page="/checkout/instantcredit/final-card-approval.jsp" >
				<dsp:param name="creditLimit" param="creditLimit" />
				</dsp:include>
			</dsp:oparam>
			<dsp:oparam name="cardUnderReview">
				<dsp:include page="/checkout/instantcredit/final-card-review.jsp" />
			</dsp:oparam>
			<dsp:oparam name="cardProcessError">
				<dsp:include page="/checkout/instantcredit/card-accept-error.jsp" />
			</dsp:oparam>
			<dsp:oparam name="cardBannerProcessError">
				<dsp:include page="/checkout/instantcredit/card-accept-error.jsp" />
			</dsp:oparam>
			<dsp:oparam name="error">
			<dsp:include page="/checkout/instantcredit/card-accept-error.jsp" />
			</dsp:oparam>
		</dsp:droplet>
	</div>
</dsp:page>