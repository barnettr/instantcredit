<dsp:page>
<link rel="stylesheet" href="/checkout/instantcredit/gadgets/instantcredit.css">
<script src="/static/js/global.js"></script>
<script src="/static/js/jquery/floatbox.js"></script>
<script src="/static/js/jquery/jquery-1.7.2.min.js"></script>
	<script>
		$(window).load(function() {
			try {
				utag.view({page_name : "CR ERROR"});
			} catch (err) {
				//console.log('error');
			}
			fb.resize( 715, 371);
            return false;
		});
	</script>
	<dsp:importbean bean="/OriginatingRequest" var="orgRequest" />
	<div class="final-card-review-container">
		<ul class="tiles">
			<li class="left">
				<div class="title">Eddie Bauer Credit Card<br />Processing Delay</div>
			</li>
			<li class="left credit-limit">
				<div class="cc-image">
					<img src="//eddiebauer.scene7.com/is/image/EBContent/eb%5Fcredit%5Fcard?$jpg12$&scl=1"
						alt="Save an additional 15% on today's purchase when you use your new Eddie Bauer Credit Card*. Combinable with other current promotions!*" />
				</div>
				<div class="response-bg bag-response">
				    <img alt="" src="/static/img/error-icon.png" class="response-icon">
				    <p class="response-text">We apologize, but we are unable to determine if we received your prescreen acceptance.
						Please call Eddie Bauer at 1-800-426-8020.</p>
				</div>
			</li>
		</ul>
		<div id="buttons" class="buttons">
			<div class="continueButton">
				<input type="image" src="//eddiebauer.scene7.com/is/image/EBContent/btn%5Fcontinue%5Fcheckout?$jpg12$&scl=1" class="button" value="CONTINUE CHECKOUT"
					alt="Continue Checkout" onclick="parent.fb.end( 'self' ); return false;">
			</div>
		</div>
		<div class="clear"></div>
	</div>
</dsp:page>