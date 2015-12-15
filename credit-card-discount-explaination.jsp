<dsp:page>
<link rel="stylesheet" href="/checkout/instantcredit/gadgets/instantcredit.css">
<script src="/static/js/global.js"></script>
<script src="/static/js/jquery/floatbox.js"></script>
	<dsp:importbean bean="/OriginatingRequest" var="orgRequest" />
	<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
	<dsp:importbean bean="/com/eb/stores/droplet/EBStoreInventoryLookupDroplet" />
	<dsp:importbean bean="/com/eb/ebcard/EBApplyCardFormHandler" />
	<div class="credit-card-discount-container">
		<div class="title">New Eddie Bauer Credit Card Promotion*</div>
		<p class="exception">
			Offer can be combined with other current promotions, except employee discount.
		</p>
		<p class="explaination">
			<span class="eighteen">*</span>To receive the new card promotion, all of the following must occur within the
			same session: final credit approval; first-time use of new account; completion of order.
			Promotion is forfeited if: customer leaves site during sessions; approval is delayed for
			any reason; session times out before completion.
		</p>
	</div>
</dsp:page>