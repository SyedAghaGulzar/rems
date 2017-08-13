<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="en">
<jsp:include page="../fragment/header.jsp" />
<body>
	<div class="container">

		<h1>
			M Rehan Enterprises<br>
		</h1>
		<c:choose>
			<c:when test="${receipt['new']}">
				<c:set var="action" value="/receipt/add" />
				<c:set var="button" value="Save" />
				<h2 style="text-align: center">
					Add Receipt<br> <br>
				</h2>
			</c:when>
			<c:otherwise>
				<c:set var="action" value="/receipt/update/${receipt.receiptId}" />
				<c:set var="button" value="Update" />
				<h2 style="text-align: center">
					Edit Receipt<br> <br>
				</h2>
			</c:otherwise>
		</c:choose>

		<form:form class=".form-horizontal" action="${action}" method="post"
			modelAttribute="receipt">
			<form:hidden class="form-control" value="${receipt.receiptId}"
				path="receiptId" />

			<div class="col-xs-12">

				<div class="col-xs-3 form-group">
					<label for="date">Date:</label>
					<fmt:formatDate pattern="dd/MM/yyyy" value="${receipt.date}"
						var="date" />
					<form:input type="text" path="date" class=" form-control"
						value="${date}" />
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
					<form:select path="paymentType" class="form-control">
						<form:option value="CASH" label="Cash" />
						<form:option value="CHEQUE" label="Cheque" />
					</form:select>
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
				<div class="col-xs-6 form-group">
					<label for="referenceName">Reference:</label>
					<form:input type="text" class="form-control" path="referenceName" />
					<br> <br>
				</div>
				<div class="col-xs-12">
					<div class="col-sx-6">
						<button type="submit"
							style="display: inline; width =50%;"
							class="btn btn-lg">${button}</button>
					</div>
					<div class="col-sx-6">		
							<button type="button" onclick="location.href='<c:url value="/receipt" />'"
							style="display: inline; width =50%;"
							class="btn btn-lg">Cancel</button>
					</div>		
				</div>
			</div>

		</form:form>

	</div>
</body>
</html>