<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="../fragment/header.jsp" />
<head>
	<!-- Website CSS style -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
	     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/dataTables.bootstrap.min.css">
		<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.1.1/css/responsive.bootstrap.min.css">
		<!-- Google Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&subset=latin-ext" rel="stylesheet">
</head>
<body>
<br>
	<div class="container">

		<a href='<c:url value="/receipt/add"/>'><button type="button"
				class="btn btn-primary btn-sx pull-right">Add New Receipt</button> <br><br><br>
		</a>


        <div class="row">
			<div class="col-md-12">
				<div class="panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Receipt List</h3>						
					</div>
					<br>
        <div class="table-responsive" style="overflow: hidden;">
		<table class="table table-bordered dt-responsive nowrap table table-striped" id="rec_table">
			<thead style="background-color:lightBlue">
				<tr>
					<th>Serial#</th>
					<th>Date</th>
					<th>Received From</th>
					<th>Amount</th>
					<th>Payment Type</th>
                    <!-- babat -->
   					<th>For Payment of</th>
					<th>Bank</th>
					<th>Branch</th>
					<th>Cheque No</th>
					<!-- ReferenceName -->
					<th>Received By</th>
					<!-- <th>Actions</th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach var="receipt" items="${receipts}">
					<tr>
						<td> 
						<a href="/receipt/${receipt.receiptId}">
						 <span data-placement="top" data-toggle="tooltip" title="Edit" class="glyphicon glyphicon-pencil" ></span></a>
				         <a href="/receipt/delete/${receipt.receiptId}"> 
				         <span data-placement="top" data-toggle="tooltip" title="Delete" class="glyphicon glyphicon-trash"></span>
						</a>${receipt.receiptId}
						</td>
						<fmt:formatDate pattern="dd/MM/yyyy" value="${receipt.date}"
							var="date" />
						<td>${date}</td>
						<td>${receipt.cashReceivedFrom}</td>
						<td>${receipt.amount}</td>
						<td>${receipt.paymentType}</td>
						<td>${receipt.forPaymentOf}</td>
						<td>${receipt.bankName}</td>
						<td>${receipt.bankBranch}</td>
						<td>${receipt.chequeNo}</td>
						<td>${receipt.cashReceivedBy}</td>
						<%-- <td><a href="/receipt/${receipt.receiptId}">
						 <span data-placement="top" data-toggle="tooltip" title="Edit" class="glyphicon glyphicon-pencil" ></span></a>
				         <a href="/receipt/delete/${receipt.receiptId}"> 
				         <span data-placement="top" data-toggle="tooltip" title="Delete" class="glyphicon glyphicon-trash"></span>
						</a></td> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		</div>
		</div>
	</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
    $('#rec_table').DataTable();
} );
</script>
     <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
     <script src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script> 
       <script src="https://cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.min.js"></script>
      <script src="https://cdn.datatables.net/responsive/2.1.1/js/responsive.bootstrap.min.js"></script> 

</html>