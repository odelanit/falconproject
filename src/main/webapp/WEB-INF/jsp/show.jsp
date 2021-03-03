<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="com.falconproject.web.utils.*" %>
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js"/>"></script>

<link href="<c:url value="/resources/css/jquery.dataTables.min.css"/>"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.dataTables.js"/>"></script>

<!-- Bootstrap -->
<script type="text/javascript"
	src="<c:url value="/resources/assets/js/bootstrap/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/assets/js/utility/utility.js"/>"></script>
<script src="<c:url value="/resources/assets/js/demo/demo.js"/>"></script>
<script src="<c:url value="/resources/assets/js/main.js"/>"></script>

<meta charset="utf-8">
<title>Forms/SOP</title>
<meta name="keywords"
	content="Falcon Race Solutions : Advance Software Make Easy" />
<meta name="description"
	content="Falcon Race Solutions : Advance Software Made Easy">
<meta name="author" content="Falcon Race Solutions">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel='stylesheet' type='text/css'
	href='http://fonts.googleapis.com/css?family=Open+Sans:500,600,600,700'>
<link href="<c:url value="/resources/css/theme.css"/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/admin-forms.css"/>"
	rel="stylesheet" type="text/css" />
	<!-- Jss and Css Files for Hierarchy Display 24June -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.3/themes/default/style.min.css" />
<script src="http://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.3/jstree.min.js"></script>
<!-- link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"-->
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css"/>
</head>
<%
// 24 June fetch the hierarchy for displaying the file hierarchy
String data=(String)request.getAttribute("message");
%>
<body class="ui-tabs-page">
<script>
$(function() {
	$('#container').html('');
	$('#container').html('<%=data%>');
	$('#container').jstree({
	     "types" : {
	      "default" : {
	        "icon" : "glyphicon glyphicon-file"
	      }
	    },
	    "plugins" : [ "search","sort","types" ],
	    "search" : {"show_only_matches":true}
	  })
	.on('search.jstree', function (nodes, str, res) {
    	if (str.nodes.length===0) {
        	$('#container').jstree(true).hide_all();
        	$("#nomatch").show();
    	}
	})
		.bind("select_node.jstree", function (e, data) {
	  	var href = data.node.a_attr.href;
	     if(href!=="#"){
	      window.open( data.node.a_attr.href, data.node.a_attr.target );
	      }
	  });
	$('#findtest').keyup(function () {
	    $('#container').jstree(true).show_all();
	    $("#nomatch").hide();
	    var v = $('#findtest').val();
	    $('#container').jstree(true).search(v);
	  });
});
</script>
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
							class="glyphicon glyphicon-inbox text-muted"></span> <span
							class="metro-title">Messages</span></a>
					</div>
					<div class="col-xs-4 col-sm-2">
						<a href="#" class="metro-tile bg-info light"> <span
							class="glyphicon glyphicon-user text-muted"></span> <span
							class="metro-title">Users</span></a>
					</div>
					<div class="col-xs-4 col-sm-2">
						<a href="#" class="metro-tile bg-success light"> <span
							class="glyphicon glyphicon-headphones text-muted"></span> <span
							class="metro-title">Support</span></a>
					</div>
					<div class="col-xs-4 col-sm-2">
						<a href="#" class="metro-tile bg-system light"> <span
							class="glyphicon glyphicon-facetime-video text-muted"></span> <span
							class="metro-title">Videos</span></a>
					</div>
					<div class="col-xs-4 col-sm-2">
						<a href="#" class="metro-tile bg-warning light"> <span
							class="fa fa-gears text-muted"></span> <span class="metro-title">Settings</span></a>
					</div>
					<div class="col-xs-4 col-sm-2">
						<a href="#" class="metro-tile bg-alert light"> <span
							class="glyphicon glyphicon-picture text-muted"></span> <span
							class="metro-title">Pictures</span></a>
					</div>
				</div>
			</div>
                                      
			<div id="content" class="animated fadeIn">
				<div class="panel">
				<div class="panel-heading">
										<span class="panel-title"><font color="black">Forms/Sop's</font></span>
									</div>
					<div class="panel-body padding-none">
						<br>
						<!-- 24 June div tag in which the tree hierarchy is formed -->
						<p><input class="findtest" id="findtest" type="text" placeholder="Search By File Name"></input></p>
						<p id="nomatch" style="display: none"><b>No Match Found</b></p>
						<div id="container">
        				</div>
						<br />
					</div>
				</div>
			</div>
		</section>
	</div>

</body>
</html>