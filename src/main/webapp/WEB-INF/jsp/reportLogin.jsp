<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script src="<c:url value="/resources/js/jquery-1.11.1.min.js"/>"></script>
<script src="<c:url value="/resources/js/underscore-1.5.2.min.js"/>"></script>
<script
	src="<c:url value="/resources/js/jquery.scrollTableBody-1.0.0.js"/>"></script>

<!-- Bootstrap -->
<script type="text/javascript"
	src="<c:url value="/resources/assets/js/bootstrap/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/assets/js/utility/utility.js"/>"></script>
<script src="<c:url value="/resources/assets/js/demo/demo.js"/>"></script>
<script src="<c:url value="/resources/assets/js/main.js"/>"></script>


<script type="text/javascript">
	function checkSave() {
		return false;
	}

	jQuery(document).ready(function() {
		Core.init();
		Demo.init();
	});
</script>


<meta charset="utf-8">
<title>Login Report</title>
<meta name="keywords" content=" Dashboard" />
<meta name="description" content=" Dashboard">
<meta name="author" content=" Dashboard">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap-->
<link rel='stylesheet' type='text/css'
	href='http://fonts.googleapis.com/css?family=Open+Sans:500,600,600,700'>
<link href="<c:url value="/resources/css/theme.css"/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/admin-forms.css"/>"
	rel="stylesheet" type="text/css" />
</head>

<body class="ui-tabs-page">
	<div id="main">
		<jsp:include page="topHeader.jsp" />
		<aside id="sidebar_left" class="nano nano-light affix">
			<div class="sidebar-left-content nano-content">
				<header class="sidebar-header">
					<div class="sidebar-widget search-widget hidden">
						<div class="input-group">
							<span class="input-group-addon"> <i class="fa fa-search"></i></span>
							<input type="text" id="sidebar-search" class="form-control"
								placeholder="Search...">
						</div>
					</div>
				</header>
				<jsp:include page="header.jsp" />
				<div class="sidebar-toggle-mini">
					<a href="#"> <span class="fa fa-sign-out"></span></a>
				</div>
			</div>
		</aside>

		<section id="content_wrapper">
			<div id="topbar-dropmenu" class="alt">
				<div class="topbar-menu row">
					<div class="col-xs-4 col-sm-2">
						<a href="#" class="metro-tile bg-primary light"> <span
							class="glyphicon glyphicon-inbox 

text-muted"></span> <span
							class="metro-title">Messages</span></a>
					</div>
					<div class="col-xs-4 col-sm-2">
						<a href="#" class="metro-tile bg-info light"> <span
							class="glyphicon glyphicon-user 

text-muted"></span> <span
							class="metro-title">Users</span></a>
					</div>
					<div class="col-xs-4 col-sm-2">
						<a href="#" class="metro-tile bg-success light"> <span
							class="glyphicon glyphicon-

headphones text-muted"></span> <span
							class="metro-title">Support</span></a>
					</div>
					<div class="col-xs-4 col-sm-2">
						<a href="#" class="metro-tile bg-system light"> <span
							class="glyphicon glyphicon-

facetime-video text-muted"></span>
							<span class="metro-title">Videos</span></a>
					</div>
					<div class="col-xs-4 col-sm-2">
						<a href="#" class="metro-tile bg-warning light"> <span
							class="fa fa-gears text-

muted"></span> <span
							class="metro-title">Settings</span></a>
					</div>
					<div class="col-xs-4 col-sm-2">
						<a href="#" class="metro-tile bg-alert light"> <span
							class="glyphicon glyphicon-picture text-muted"></span> <span
							class="metro-title">Pictures</span></a>
					</div>
				</div>
			</div>

			<div id="content" class="animated fadeIn">
				<div class="col-md-12">
								<!-- <div class="panel"> -->
									<div class="panel-heading">
										<span class="panel-title"><b><font color="black">Login Status Report</font></b></span>
									</div>
									<div class="panel-body p1 table-auto">
										<div class="panel-body pn b-none">
											<br />
											<table class="table">
												<thead>
													<tr class="success">
														<th style="text-align: center"><b><font color="black">Ln#</font></b></th>
														<th style="text-align: center"><b><font color="black">User Name</font></b></th>
														<th style="text-align: center"><b><font color="black">Session Create Date</font></b></th>
														<th style="text-align: center"><b><font color="black">Last Accessed Time</font></b></th>
														<th style="text-align: center"><b><font color="black">Idle Time</font></b></th>
														<th style="text-align: center"><b><font color="black">Max Idle Time</font></b></th>
														<th style="text-align: center"><b><font color="black">IP Address</font></b></th>
														<th style="text-align: center"><b><font color="black">Host Name</font></b></th>
													</tr>
												</thead>
												<tbody>
													<c:if test="${empty listSessions}">
														<tr>
															<td align="center" colspan="6">-- No Records Found --</td>
														</tr>
													</c:if>
													<c:if test="${not empty listSessions}">
														<c:forEach var="SessionList" items="${listSessions}"
															varStatus="serial">
															<tr>
																<td align="center"><font color="black">${serial.count}</font></td>
																<td align="center"><font color="black">${SessionList.USER}</font></td>
																<td align="center"><font color="black">${SessionList.CREATEDATE}</font></td>
																<td align="center"><font color="black">${SessionList.LASTACCESSED}</font></td>
																<td align="center"><font color="black">${SessionList.IDLETIME}Min</font></td>
																<td align="center"><font color="black">${SessionList.MAXIDLETIME}Min</font></td>
																<td align="center"><font color="black">${SessionList.IPADDRESS}</font></td>
																<td align="center"><font color="black">${SessionList.USERHOST}</font></td>
																<!--<td align="center"><a href="#">Kill</a></td>-->
															</tr>
														</c:forEach>
													</c:if>
													
												</tbody>
												<tfoot>
													<tr class="success">
														<td align="center" colspan="8"><a href="/ddashboard/reportLogin">Refresh</a></td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
								<!-- </div> -->
							</div>
			</div>
		</section>
	</div>




</body>
</html>