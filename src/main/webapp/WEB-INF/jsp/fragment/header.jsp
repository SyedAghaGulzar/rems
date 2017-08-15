<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<title>M Rehan Enterprises</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.navbar a, .dropdown-menu>li>a, .dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover, .navbar-toggle{
 color: #fff;
}
.navbar .navbar-nav>li>a:hover {
  color: #000;
}

</style>
</head>

	<nav class="navbar .navbar-inverse" style="background-color: #337ab7">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" style="color: #fff" href="#">M Rehan
					Enterprises</a>
			</div>
			<ul class="nav navbar-nav tabs-left">
				<li class="active"><a href="#" data-toggle="tab"><span class="glyphicon glyphicon-th" aria-hidden="true"></span> DASHBOARD</a></li>
				<li><a href='<c:url value="/receipt" />'>RECEIPT</a></li>
				<li><a href='<c:url value="/receipt/${1}"/>'>CASH VOUCHER</a></li>
				<li><a href="#">GENERAL VOUCHER</a></li>
			</ul>
		</div>
	</nav>