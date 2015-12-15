<%@ include file="/includes/taglibs.jspf"%>
<dsp:page>
	<dsp:getvalueof var="weekTotal" vartype="java.lang.String" param="weekTotal" />
	<dsp:getvalueof var="weekStatusMap" param="weekStatusMap" />
	<dsp:getvalueof var="monthTotal" vartype="java.lang.String" param="monthTotal" />
	<dsp:getvalueof var="monthStatusMap" param="monthStatusMap" />
	<dsp:getvalueof var="yearTotal" vartype="java.lang.String" param="yearTotal" />
	<dsp:getvalueof var="yearStatusMap" param="yearStatusMap" />

	<div style="margin-left: 10px;">
		<h1>EB WRTPS Report</h1>
		<h3>Server Name: <dsp:valueof bean="/atg/dynamo/service/ServerName.serverName" /></h3>
		<h2>This week - <dsp:valueof param="firstDayOfWeek" date="M/dd/yy"/></h2>
		<p>Total prescreens with last modified date this week : ${weekTotal}</p>
		<table border="1">
			<tr>
				<th>Status</th>
				<th>Count</th>
			</tr>
			<c:forEach var="statusCount" items="${weekStatusMap}" varStatus="statusCountIndex">
				<tr>
					<td>${statusCount.key}</td>
					<td>${statusCount.value}</td>
				</tr>
			</c:forEach>
			<tr>
				<td><b>Total</b></td>
				<td><b>${weekTotal}</b></td>
			</tr>
		</table>
	</div>
	<div>
		<h2>This Month - <dsp:valueof param="firstDayOfMonth" date="M/dd/yy"/></h2>
		<p>Total prescreens with last modified date this month : ${monthTotal}</p>
		<table border="1">
			<tr>
				<th>Status</th>
				<th>Count</th>
			</tr>
			<c:forEach var="statusCount" items="${monthStatusMap}" varStatus="statusCountIndex">
				<tr>
					<td>${statusCount.key}</td>
					<td>${statusCount.value}</td>
				</tr>
			</c:forEach>
			<tr>
				<td><b>Total</b></td>
				<td><b>${monthTotal}</b></td>
			</tr>
		</table>
	</div>
	<div>
		<h2>This Year - <dsp:valueof param="firstDayOfYear" date="M/dd/yy"/></h2>
		<p>Total prescreens with last modified date this year : ${yearTotal}</p>
		<table border="1">
			<tr>
				<th>Status</th>
				<th>Count</th>
			</tr>
			<c:forEach var="statusCount" items="${yearStatusMap}" varStatus="statusCountIndex">
				<tr>
					<td>${statusCount.key}</td>
					<td>${statusCount.value}</td>
				</tr>
			</c:forEach>
			<tr>
				<td><b>Total</b></td>
				<td><b>${yearTotal}</b></td>
			</tr>
		</table>
	</div>
	<div>
	<h2>Legend</h2>
	<p>prescreenApproved : when the initial prescreen request is approved by ADS and customer is now eligible to be presented with prescreen offer</p>
	<p>prescreenRejected : when the initial prescreen request is rejected by ADS and customer won't know that anything has happened</p>
	<p>prescreenOfferAccepted : prescreen offer is accepted by the customer</p>
	<p>prescreenBannerAccepted : customer has clicked on the prescreen banner</p>
	<p>prescreenOfferDeclined : prescreen offer modal is declined by the customer</p>
	<p>prescreenAcceptFormDeclined : customer has clicked no thanks button in the accept form</p>
	<p>cardApproved : customer has filled the accept form and ADS has approved a final card</p>
	<p>cardApprovedFromBanner : Came from banner - customer has filled the accept form and ADS has approved a final card</p>
	<p>cardUnderReview : customer has filled the accept form, but ADS did not approve the card immediately</p>
	<p>cardProcessError : error processing accept form</p>
	<p>cardBannerProcessError : Came from banner - error processing accept form</p>
	</div>
</dsp:page>