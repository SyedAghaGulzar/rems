<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<jsp:include page="../fragment/header.jsp" />

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
	background-color: lightblue;
}
</style>

</head>
<body>
	<br>

	<div class="container">
		<div class="row">                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href='<c:url value="/voucher/general/ledger"/>'><button
							type="button" class="btn btn-primary btn-sx">Account
							Ledger</button></a>
					<a href='<c:url value="/voucher/general/trialbalance"/>'><button
							type="button" class="btn btn-primary btn-sx">Trial
							Balance</button></a>
			<div class="col-xs-12">
				<div class="col-xs-4"></div>
				<div class="col-xs-2">
				                                                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href='<c:url value="/party/add"/>'><button type="button"
							class="btn btn-primary btn-sx">Add New Party</button> </a>
				</div>
				<div class="col-xs-3"></div>
				<div class="col-xs-3 ">
					<a href='<c:url value="/account/add"/>'><button type="button"
							class="btn btn-primary btn-sx pull-right">Add New
							Account</button> </a>
				</div>
				<br> <br>
			</div>
		</div>


		<div class="row">
			<div class="col-xs-12">
				<div class="col-xs-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">Party List</h3>
						</div>
						<br>
						<div class="table-responsive">
							<table
								class="table table-bordered dt-responsive nowrap table table-striped"
								id="party_table">
								<thead style="background-color: #689efd">
									<tr>
										<th>Actions</th>
										<th>No.</th>
										<th>Name</th>
										<th>Phone</th>
										<th>Address</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="party" items="${parties}">
										<tr>
											<td><a href="/party/${party.partyId}"> <span
													title="Edit" class="glyphicon glyphicon-pencil"></span></a>&nbsp;
												<a href="/party/delete/${party.partyId}"> <span
													title="Delete" class="glyphicon glyphicon-trash"></span></a></td>
											<td><fmt:formatNumber minIntegerDigits="2" pattern="#"
													value="${party.partyId}" /></td>
											<td>${party.name}</td>
											<td>${party.phone}</td>
											<td>${party.address}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="col-xs-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">Account List</h3>
						</div>
						<br>
						<div class="table-responsive">
							<table
								class="table table-bordered dt-responsive nowrap table table-striped" id="account_table">
								<thead style="background-color: #689efd">
									<tr>
										<th>Actions</th>
										<th>No.</th>
										<th>Name</th>
										<th>Details</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="account" items="${accounts}">
										<tr>
											<td><a href="/account/${account.accountId}"> <span
													title="Edit" class="glyphicon glyphicon-pencil"></span></a>&nbsp;
												<a href="/account/delete/${account.accountId}"> <span
													title="Delete" class="glyphicon glyphicon-trash"></span></a></td>
											<td>AC-<fmt:formatNumber minIntegerDigits="4"
													pattern="#" value="${account.accountId}" /></td>
											<td>${account.name}</td>
											<td>${account.detail}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>

<script type="text/javascript">
	$(document).ready(function() {
		$('#party_table').DataTable();
		$('#account_table').DataTable();
		$("#dashboard_page").addClass('active');
	});
</script>

<script
	src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>
<script
	src="https://cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.min.js"></script>
<script
	src="https://cdn.datatables.net/responsive/2.1.1/js/responsive.bootstrap.min.js"></script>

</html>