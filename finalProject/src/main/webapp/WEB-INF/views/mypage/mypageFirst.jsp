<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="../../../resources/js/gidae/gidae/morris/morris-data.js"></script>
<script src="../../../resources/js/gidae/morris/raphael.min.js"></script>
<script src="../../../resources/js/gidae/morris/morris.min.js"></script>
	    <!-- Bootstrap Core CSS -->

    <!-- Custom CSS -->
    <link href="../../../resources/css/gidae/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../../../resources/css/gidae/styles.css" rel="stylesheet" media="screen">
    <link href="../../../resources/css/gidae/bootstrap.min.css" rel="stylesheet">
    
    
<title>Insert title here</title>
<script type="text/javascript">
	function next() {
		window.location.href = "/list";
	}
</script>
<style type="text/css">
.panel-red {
    border-color: #d9534f;
}

.panel-red .panel-heading {
    border-color: #d9534f;
    color: #fff;
    background-color: #d9534f;
}

</style>

</head>
<body>


	<div class="row">
		<div class="col-lg-6">
			<div class="panel panel-red">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-long-arrow-right"></i>연도별관리비
					</h3>
				</div>
				<div class="panel-body">
					<div id="morris-line-chart"></div>
					<div class="text-right"></div>
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-long-arrow-right"></i>달별관리비
					</h3>
				</div>
				<div class="panel-body">
					<div id="morris-bar-chart"></div>
					<div class="text-right"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- /block -->
	<div class="row-fluid">
		<div class="span6">
			<!-- block -->
			<div class="block">
				<div class="navbar navbar-inner block-header">
					<div class="muted pull-left">건의사항</div>
					<div class="pull-right">
						<span class="badge badge-info" onclick="next()">더보기</span>

					</div>
				</div>
				<div class="block-content collapse in">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>글번호</th>
								<th>글 제목</th>
								<th>진행도</th>
							</tr>
						</thead>
						<tbody>
						     <c:forEach var="com" items="${complaint  }">
                                            <tr>
                                                <td>${com.cp_complaintNo }</td>
                                                <td>${com.cp_title }</td>
                                                <td>${com.cp_state }</td>
                                            </tr>
                                           </c:forEach> 
						</tbody>
					</table>
				</div>
			</div>
			<!-- /block -->
		</div>
		<div class="span6">
			<!-- block -->
			<div class="block">
				<div class="navbar navbar-inner block-header">
					<div class="muted pull-left">Orders</div>
					<div class="pull-right">
						<span class="badge badge-info">더보기</span>

					</div>
				</div>
				<div class="block-content collapse in">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>#</th>
								<th>Product</th>
								<th>Date</th>
								<th>Amount</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>Coat</td>
								<td>02/02/2013</td>
								<td>$25.12</td>
							</tr>
							<tr>
								<td>2</td>
								<td>Jacket</td>
								<td>01/02/2013</td>
								<td>$335.00</td>
							</tr>
							<tr>
								<td>3</td>
								<td>Shoes</td>
								<td>01/02/2013</td>
								<td>$29.99</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- /block -->
		</div>
	</div>
	<div class="row-fluid">
		<div class="span6">
			<!-- block -->
			<div class="block">
				<div class="navbar navbar-inner block-header">
					<div class="muted pull-left">Clients</div>
					<div class="pull-right">
						<span class="badge badge-info">더보기</span>

					</div>
				</div>
				<div class="block-content collapse in">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>#</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Username</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>Mark</td>
								<td>Otto</td>
								<td>@mdo</td>
							</tr>
							<tr>
								<td>2</td>
								<td>Jacob</td>
								<td>Thornton</td>
								<td>@fat</td>
							</tr>
							<tr>
								<td>3</td>
								<td>Vincent</td>
								<td>Gabriel</td>
								<td>@gabrielva</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- /block -->
		</div>
		<div class="span6">
			<!-- block -->
			<div class="block">
				<div class="navbar navbar-inner block-header">
					<div class="muted pull-left">Invoices</div>
					<div class="pull-right">
						<span class="badge badge-info">더보기</span>

					</div>
				</div>
				<div class="block-content collapse in">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>#</th>
								<th>Date</th>
								<th>Amount</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>02/02/2013</td>
								<td>$25.12</td>
							</tr>
							<tr>
								<td>2</td>
								<td>01/02/2013</td>
								<td>$335.00</td>
							</tr>
							<tr>
								<td>3</td>
								<td>01/02/2013</td>
								<td>$29.99</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- /block -->
		</div>
	</div>
	<div class="row-fluid">
		<!-- block -->
		<!-- /block -->
	</div>

	<!-- jQuery Version 1.11.0 -->

	<!-- Bootstrap Core JavaScript -->

	<!-- Morris Charts JavaScript -->

</body>
</html>