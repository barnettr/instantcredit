<dsp:page>
	<script>
		$(window).load(function() {
			try {
				utag.view({page_name : "CR 1"});
			} catch (err) {
				///console.log('error');
			}
			fb.resize( 715, 438);
            return false;
		});
	</script>
	<dsp:importbean bean="/OriginatingRequest" var="orgRequest" />
	<dsp:getvalueof var="creditLimit" vartype="java.lang.String" param="creditLimit" />
	<dsp:droplet name="/atg/commerce/order/purchase/RepriceOrderDroplet">
			<dsp:param name="pricingOp" value="ORDER_TOTAL"/>
	</dsp:droplet>
	<dsp:droplet name="/com/eb/droplet/OrderSummaryHelperDroplet">
				<dsp:param name="order" bean="/atg/commerce/ShoppingCart.current"/>
				<dsp:oparam name="output">
					<dsp:getvalueof var="promotionDiscount" param="promotionDiscount" />
					<dsp:getvalueof var="ebCardDiscount" param="ebCardDiscount" />
					<dsp:getvalueof var="savingsCardAmount" param="savingsCardAmount" />
					<dsp:getvalueof var="giftCertificatesAmount" param="giftCertificatesAmount" />
					<dsp:getvalueof var="charitySkuMap" param="charitySkuMap" />
					<dsp:getvalueof var="balanceDue" param="balanceDue" />
					<dsp:getvalueof var="itemsTotalAdjusted" param="itemsTotalAdjusted" />
					<dsp:getvalueof var="shipping" param="shipping" />
					<dsp:getvalueof var="oversizedShipping" param="oversizedShipping" />
				</dsp:oparam>
	</dsp:droplet>
	<div class="final-card-approval-container">
		<ul class="tiles">
			<li class="left">
				<div class="title">Congratulations!</div>
				<div class=sub-title>On Your New Eddie Bauer Credit Card Account</div>
			</li>
			<li class="left credit-limit">
				<div class="cc-image">
					<img src="//eddiebauer.scene7.com/is/image/EBContent/eb%5Fcredit%5Fcard?$jpg12$&scl=1"
						alt="Save an additional 15% on today's purchase when you use your new Eddie Bauer Credit Card*. Combinable with other current promotions!*" />
				</div>
				<div class="approval-copy">
					<p class="title">Your approved credit limit is <span><fmt:formatNumber value="${creditLimit}" type="currency" currencySymbol="$" maxFractionDigits="0" /></span></p>
					<p class="message">By using your Eddie Bauer Credit Card today, you save <span><fmt:formatNumber value="${ebCardDiscount}" type="currency" currencySymbol="$" /></span> on your purchase!<span class="star">*</span></p>
				</div>
			</li>
			<li class="left card-arrival">
				<p>You can expect to receive your card via US mail within 7-10 business days.</p>
			</li>
		</ul>
		<div id="buttons" class="buttons">
			<div class="continueButton">
				<input type="image" src="//eddiebauer.scene7.com/is/image/EBContent/btn%5Fcontinue%5Fcheckout?$jpg12$&scl=1" class="button" value="CONTINUE CHECKOUT"
					alt="Continue Checkout" onclick="parent.fb.end( 'self' ); return false;">
			</div>
		</div>
		<div class="clear"></div>
		<hr class="line" />
		<p class="complete">*You must complete your order <strong>within this session</strong> to receive the promotional discount.</p>
	</div>
</dsp:page>