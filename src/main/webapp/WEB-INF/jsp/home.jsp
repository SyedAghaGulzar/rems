<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="en">
<head>
<title>M Rehan Enterprises</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<nav class="navbar .navbar-inverse" style="background-color: #000000">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" style="color: #fff" href="#">M Rehan
					Enterprises</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<li><a href='<c:url value="/receipt" />'>Receipt</a></li>
				<li><a href='<c:url value="/receipt/${1}"/>'>Cash Voucher</a></li>
				<li><a href="#">General Voucher</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<c:choose>
			<c:when test="${mode == 'show'}">
				<h2>Receipt</h2>

				<a href='<c:url value="/receipt/new"/>'><button type="button"
						class="btn btn-primary btn-md pull-right">New Receipt</button></a>
				<br>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Receipt Id</th>
							<th>Date</th>
							<th>Cash Received From</th>
							<th>Amount</th>
							<th>Payment Type</th>
							<th>Babat</th>
							<th>Bank Name</th>
							<th>Branch</th>
							<th>Reference Name</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="receipt" items="${receipts}">
							<tr>
								<td>${receipt.receiptId}</td>
								<td>${receipt.date}</td>
								<td>${receipt.cashReceivedFrom}</td>
								<td>${receipt.amount}</td>
								<td>${receipt.paymentType}</td>
								<td>${receipt.babat}</td>
								<td>${receipt.bankName}</td>
								<td>${receipt.bankBranch}</td>
								<td>${receipt.referenceName}</td>
								<td><a href="/receipt/update?id=${receipt.receiptId}">
										<span class="glyphicon glyphicon-pencil"></span>
								</a> <a href="/receipt/delete/${receipt.receiptId}"> <span
										class="glyphicon glyphicon-trash"></span>
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
			<c:when test="${mode == 'edit'}">
				<form:form class="form-inline"
					action="/receipt/update/${receipt.receiptId}" method="post"
					modelAttribute="receipt">
					<form:hidden class="form-control" value="${receipt.receiptId}"
						path="receiptId" />

					<div class="col-xs-12">
						<form:hidden class="form-control" path="receiptId" />

						<div class="col-xs-3 form-group">
							<label for="date">Date:</label>
							<fmt:formatDate pattern="dd/MM/yyyy" value="${receipt.date}" var="vacancyDate" />
							<form:input type="text" path="date"
								class=" form-control" value="${vacancyDate}"/>
						</div>

						<div class="col-xs-3 form-group">
							<label for="cashReceivedFrom">Cash Received From:</label>
							<form:input type="text" class="form-control"
								path="cashReceivedFrom" />
						</div>
						<div class="col-xs-3 form-group">
							<label for="amount">Amount:</label>
							<form:input type="text" class="form-control" path="amount" />
						</div>
						<div class="col-xs-3 form-group">
							<label for="paymentType">Payment Type:</label>
							<form:input type="text" class="form-control" path="paymentType" />
						</div>
						</div>
						<div class="col-xs-12">
							<div class="col-xs-3 form-group">
								<label for="babat">Babat:</label>
								<form:input type="text" class="form-control" path="babat" />
							</div>

							<div class="col-xs-3 form-group">
								<label for="bankName">Bank Name:</label>
								<form:input type="text" class="form-control" path="bankName" />
							</div>
							<div class="col-xs-3 form-group">
								<label for="bankBranch">Branch:</label>
								<form:input type="text" class="form-control" path="bankBranch" />
							</div>
							<div class="col-xs-3 form-group">
								<label for="referenceName">Reference:</label>
								<form:input type="text" class="form-control"
									path="referenceName" />
							</div>
						</div>
						<div class="col-xs-12">
							<div class="col-sx-12">
								<button type="submit" class="btn pull-center">Submit</button>
							</div>
						</div>


				</form:form>

			</c:when>
			<c:when test="${mode == 'new_receipt'}">
				<form:form class=".form-horizontal" action="/receipt/new"
					method="post" modelAttribute="receipt">
					<div class="col-xs-12">
						<form:hidden class="form-control" path="receiptId" />
						<div class="col-xs-3 form-group">
							<label for="date">Date:</label>
							<form:input type="text" class="form-control" path="date" />
						</div>

						<div class="col-xs-3 form-group">
							<label for="cashReceivedFrom">Cash Received From:</label>
							<form:input type="text" class="form-control"
								path="cashReceivedFrom" />
						</div>
						<div class="col-xs-3 form-group">
							<label for="amount">Amount:</label>
							<form:input type="text" class="form-control" path="amount" />
						</div>
						<div class="col-xs-3 form-group">
							<label for="paymentType">Payment Type:</label>
							<form:input type="text" class="form-control" path="paymentType" />
						</div>
						<div class="col-xs-3 form-group">
							<label for="babat">Babat:</label>
							<form:input type="text" class="form-control" path="babat" />
						</div>
						<div class="col-xs-3 form-group">
							<label for="bankName">Bank Name:</label>
							<form:input type="text" class="form-control" path="bankName" />
						</div>
						<div class="col-xs-3 form-group">
							<label for="bankBranch">Branch:</label>
							<form:input type="text" class="form-control" path="bankBranch" />
						</div>

						<div class="col-xs-12">


							<div class="col-xs-3 form-group">
								<label for="referenceName">Reference:</label>
								<form:input type="text" class="form-control"
									path="referenceName" />
							</div>
						</div>
						<div class="col-xs-12">
							<div class="col-sx-12">
								<button type="submit" class="btn">Submit</button>
							</div>
						</div>
					</div>


				</form:form>


			</c:when>
		</c:choose>
	</div>

</body>
</html>
