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
</style>

</head>
<body>
	<br />
	<div class="container">

		<div class="row">
			<div class="col-md-12">
	 		<h4>${mainParty.name}</h4>
				${mainParty.address}<br /> ${mainParty.phone}<br /> <br />
				<div class="panel-heading" style="border: 2px solid #524a4a">
					<h3 class="panel-title text-center">
						<strong>Trial Balance</strong>
					</h3>
				</div>
				<br>
				<div>
					<jsp:useBean id="now" class="java.util.Date" scope="request" />
					<br /> <strong>Printed Date:</strong>
					<fmt:formatDate type="date" pattern="dd/MM/yyyy" value="${now}" />
					<br /> <strong>Printed Time:</strong>
					<fmt:formatDate type="time" value="${now}" />

				</div>
				<br>
				<div class="table-responsive">
					<table class="table nowrap table table-striped" style="border: 0">
						<thead style="background-color: #ffffff;">
							<tr>
								<th>Account</th>
								<th>Debit</th>
								<th>Credit</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="totalDebit" value="${0}" />
							<c:set var="totalCredit" value="${0}" />
							<c:forEach var="row" items="${data}">
								<tr>
									<td>${row[0]}</td>
									<td>${row[1]}</td>
									<td>${row[2]}</td>
								</tr>
								<c:set var="totalDebit"	value="${totalDebit + row[1]}" />
								<c:set var="totalCredit" value="${totalCredit + row[2]}" />
							</c:forEach>

							<tr>
								<td><strong>Total:</strong></td>
								<td><strong>${totalDebit}</strong></td>
								<td><strong>${totalCredit}</strong></td>
							</tr>
							<tr>
								<td><strong>Net Income: </strong> ${totalDebit} - ${totalCredit} = ${totalDebit - totalCredit}</td>
								<td></td>
								<td></td>
							</tr>  
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		$("#general_voucher_page").addClass('active');
	});
</script>

<script
	src="https://cdn.datatables.net/responsive/2.1.1/js/responsive.bootstrap.min.js"></script>

</html>