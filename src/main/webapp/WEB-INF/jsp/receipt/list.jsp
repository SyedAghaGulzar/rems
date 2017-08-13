<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="../fragment/header.jsp" />
<body>
	<div class="container">
		<h2>Receipt</h2>

		<a href='<c:url value="/receipt/add"/>'><button type="button"
				class="btn btn-primary btn-md pull-right">New Receipt</button> <br>
		<br>
		<br>
		<br> </a>

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
						<fmt:formatDate pattern="dd/MM/yyyy" value="${receipt.date}"
							var="date" />
						<td>${date}</td>
						<td>${receipt.cashReceivedFrom}</td>
						<td>${receipt.amount}</td>
						<td>${receipt.paymentType}</td>
						<td>${receipt.babat}</td>
						<td>${receipt.bankName}</td>
						<td>${receipt.bankBranch}</td>
						<td>${receipt.referenceName}</td>
						<td><a href="/receipt/${receipt.receiptId}"> <span
								class="glyphicon glyphicon-pencil"></span>
						</a> <a href="/receipt/delete/${receipt.receiptId}"> <span
								class="glyphicon glyphicon-trash"></span>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>