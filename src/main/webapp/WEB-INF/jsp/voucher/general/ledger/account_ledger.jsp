<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<jsp:include page="../../../fragment/header.jsp" />

<head>
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.13/css/dataTables.bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/responsive/2.1.1/css/responsive.bootstrap.min.css">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&subset=latin-ext"
	rel="stylesheet">

<style>
.table-striped>tbody>tr:nth-child(2n)>td, .table-striped>tbody>tr:nth-child(2n)>th
	{
	background-color: #fff;
}
@page {
	size: auto;
	margin: 5mm;
}
</style>

</head>
<body>
	<br />
	<c:choose>
		<c:when
			test="${general_vouchers[0].cashPaidTo.partyId == mainPartyId}">
			<c:set var="mainParty" value="${general_vouchers[0].cashPaidTo}" />
			<c:set var="referenceParty" value="${general_vouchers[0].cashPaidBy}" />
		</c:when>
		<c:otherwise>
			<c:set var="mainParty" value="${general_vouchers[0].cashPaidBy}" />
			<c:set var="referenceParty" value="${general_vouchers[0].cashPaidTo}" />
		</c:otherwise>
	</c:choose>

	<div class="container">

		<div class="row">
			<div class="col-md-12">
				<h4>${mainParty.name}</h4>
				${mainParty.address}<br /> ${mainParty.phone}<br /> <br />
				<div class="panel-heading" style="border: 2px solid #524a4a">
					<h3 class="panel-title text-center">
						<strong>Account Ledger</strong>
					</h3>
				</div>
				<br>
				<div>
					<strong>Account Name</strong> ${referenceParty.partyId} -
					${referenceParty.name}
					<div class="pull-right">
						<jsp:useBean id="now" class="java.util.Date" scope="request" />
					    <strong>Printed Date:</strong>
						<fmt:formatDate type="date" pattern="dd/MM/yyyy" value="${now}" />
						<br /> <strong>Printed Time:</strong>
						<fmt:formatDate type="time" value="${now}" />
					</div>
				</div>
				<br>
				<br>
				<div class="table-responsive">
					<table class="table nowrap table table-striped" style="border: 0">
						<thead style="background-color: #ffffff;">
							<tr>
								<th>ID</th>
								<th>Date</th>
								<th>Detail</th>
								<th>Debit</th>
								<th>Credit</th>
								<th>Balance</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="total" value="${0}" />
							<c:set var="totalDebit" value="${0}" />
							<c:set var="totalCredit" value="${0}" />
							<c:forEach var="voucher" items="${general_vouchers}">
								<tr>
									<td>${voucher.generalVoucherId}</td>
									<td><fmt:formatDate pattern="dd/MM/yyyy"
											value="${voucher.date}" var="date" /> ${date}</td>
									<td>${voucher.details}</td>
									<c:choose>
										<c:when test="${voucher.cashPaidTo.partyId ==  mainPartyId}">
											<c:set var="total" value="${total + voucher.amount}" />
											<c:set var="totalDebit"
												value="${totalDebit + voucher.amount}" />
											<td>${voucher.amount}</td>
											<td></td>
										</c:when>
										<c:otherwise>
											<c:set var="total" value="${total - voucher.amount}" />
											<c:set var="totalCredit"
												value="${totalCredit + voucher.amount}" />
											<td></td>
											<td>${voucher.amount}</td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${total < 0}">
											<td><fmt:formatNumber type="number" maxFractionDigits="5" value="${total * -1}"/> Cr</td>
										</c:when>
										<c:otherwise>
											<td><fmt:formatNumber type="number" maxFractionDigits="5" value="${total}"/> Dr</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>

							<tr>
								<td></td>
								<td></td>
								<td><strong>Total:</strong></td>
								<td><strong><fmt:formatNumber type="number" maxFractionDigits="5" value="${totalDebit}"/></strong></td>
								<td><strong><fmt:formatNumber type="number" maxFractionDigits="5" value="${totalCredit}"/></strong></td>
								<c:choose>
									<c:when test="${total < 0}">
										<td><fmt:formatNumber type="number" maxFractionDigits="5" value="${total * -1}"/> Cr</td>
									</c:when>
									<c:otherwise>
										<td><fmt:formatNumber type="number" maxFractionDigits="5" value="${total}"/> Dr</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</tbody>
					</table>
					<button id="printpagebutton" type="button"
					class="btn btn-primary btn-sx pull-right" onclick="myFunction()">Print
					Ledger</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function myFunction() {

		var printButton = document.getElementById("printpagebutton");
		printButton.style.visibility = 'hidden';
		document.title = "M Rehan Enterprises";
		window.print();
		printButton.style.visibility = 'visible';
	}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#dashboard_page").addClass('active');
	});
</script>

<script
	src="https://cdn.datatables.net/responsive/2.1.1/js/responsive.bootstrap.min.js"></script>

</html>