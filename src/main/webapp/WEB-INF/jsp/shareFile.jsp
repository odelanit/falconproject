<!DOCTYPE html>
<html>
<head>

<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.util.ArrayList, com.falconproject.web.bo.Invoice, com.falconproject.web.models.User, com.falconproject.web.models.UserGroup"%>

<script src="<c:url value="/resources/js/jquery-1.11.1.min.js"/>"></script>
<script src="<c:url value="/resources/js/underscore-1.5.2.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.scrollTableBody-1.0.0.js"/>"></script>

<!-- Bootstrap -->
<script type="text/javascript" src="<c:url value="/resources/assets/js/bootstrap/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/assets/js/utility/utility.js"/>"></script>
<script src="<c:url value="/resources/assets/js/demo/demo.js"/>"></script>
<script src="<c:url value="/resources/assets/js/main.js"/>"></script>

<script type="text/javascript">
	jQuery(document).ready(function() {
		Core.init();
		Demo.init();
	});
	function checkSave() {
		return false;
	}

	function viewFiles(){
		window.location = "/ddashboard/fileViewer";
	}
	
	
</script>

<%
String path = request.getContextPath();
String part_info_path=path+"/generalInfo";
String part_edit=path+"/part_edit";
String customer_order_path=path+"/customerOrderInfo";
String part_search=path+"/PartSearchDetails";
String ibt_search_path=path+"/ibtSearchInfo";
String viewDrawing_path=path+"/viewDrawing";
String customer_path=path+"/Customer";
String invoiceInfo_Path=path+"/invoiceInfo";
String invoiceLineSpecsInfoPath=path+"/invoiceLineSpecsInfo";
String vendorInfo_Path=path+"/vendorInfo";
String purchaseOrderInfo_Path=path+"/purchaseOrderInfo";
String idLinkPath=path+"/idLink";
String shortagePath=path+"/shortage";
String dozerSelectionPath=path+"/dozerSelection";
String invcAttr=(String)request.getSession().getAttribute("invcAttr");

String sharedById = (String)request.getAttribute("userid");

%>
<meta charset="utf-8">
<title>File Share</title>
<meta name="keywords" content="Falcon Race Solutions : Advance Software Make Easy" />
<meta name="description" content="Falcon Race Solutions : Advance Software Make Easy">
<meta name="author" content="Falcon Race Solutions">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'>
<link href="<c:url value="/resources/css/theme.css"/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value="/resources/css/admin-forms.css"/>" rel="stylesheet" type="text/css"/>

<link rel="shortcut icon" href="images/favicon.ico">

<script type="text/javascript">
      
      function checkChBox()
      {
    	  
    	  if(document.getElementById("isFileSharedToUser").checked)
    		  {
    		    document.getElementById("userid").disabled=false;
    		    document.getElementById("groupId").disabled=true;
    		  }else
    		  {
    			 document.getElementById("userid").disabled=true;
    			 document.getElementById("groupId").disabled=false;
    	      }
      }
      function checkChBoxSelection()
      {
    	  
    	  if(document.getElementById("isFileSharedToUser").checked)
    		  {
    		    document.getElementById("userid").disabled=false;
    		    document.getElementById("groupId").disabled=true;
    		    document.forms['sharefileform'].getElementById("groupId").value="-1";
    		  }else
    		  {
    			 document.getElementById("userid").disabled=true;
    			 document.forms['sharefileform'].getElementById("userid").value="-1";
    			 document.getElementById("groupId").disabled=false;
    	      }
      }      
</script>
</head>

<body class="ui-tabs-page" onload="checkChBox()">
<div id="skin-toolbox">
  <div class="panel">
    <div class="panel-body pn">
      <ul class="nav nav-list nav-list-sm pl15 pt10" role="tablist">
        <li class="active"> <a href="#toolbox-header" role="tab" data-toggle="tab">Navbar</a> </li>
        <li> <a href="#toolbox-sidebar" role="tab" data-toggle="tab">Sidebar</a> </li>
        <li> <a href="#toolbox-settings" role="tab" data-toggle="tab">Misc</a> </li>
      </ul>
      <div class="form-group mn br-t p15"> <a href="#" id="clearLocalStorage" class="btn btn-primary btn-block pb10 pt10">Clear LocalStorage</a> </div>
    </div>
  </div>
</div>
<div id="main">
  <jsp:include page="topHeader.jsp"/>
  <aside id="sidebar_left" class="nano nano-light affix">
    <div class="sidebar-left-content nano-content">
      <header class="sidebar-header">
        <div class="sidebar-widget search-widget hidden">
          <div class="input-group"> <span class="input-group-addon"> <i class="fa fa-search"></i></span>
            <input type="text" id="sidebar-search" class="form-control" placeholder="Search...">
          </div>
        </div>
      </header>
      
   <jsp:include page="header.jsp"/>
      <div class="sidebar-toggle-mini"> <a href="#"> <span class="fa fa-sign-out"></span></a></div>
    </div>
  </aside>
  <section id="content_wrapper">
    <div id="topbar-dropmenu" class="alt">
      <div class="topbar-menu row">
        <div class="col-xs-4 col-sm-2"> <a href="#" class="metro-tile bg-primary light"> <span class="glyphicon glyphicon-inbox text-muted"></span> <span class="metro-title">Messages</span></a></div>
        <div class="col-xs-4 col-sm-2"> <a href="#" class="metro-tile bg-info light"> <span class="glyphicon glyphicon-user text-muted"></span> <span class="metro-title">Users</span></a></div>
        <div class="col-xs-4 col-sm-2"> <a href="#" class="metro-tile bg-success light"> <span class="glyphicon glyphicon-headphones text-muted"></span> <span class="metro-title">Support</span></a></div>
        <div class="col-xs-4 col-sm-2"> <a href="#" class="metro-tile bg-system light"> <span class="glyphicon glyphicon-facetime-video text-muted"></span> <span class="metro-title">Videos</span></a></div>
        <div class="col-xs-4 col-sm-2"> <a href="#" class="metro-tile bg-warning light"> <span class="fa fa-gears text-muted"></span> <span class="metro-title">Settings</span></a></div>
        <div class="col-xs-4 col-sm-2"> <a href="#" class="metro-tile bg-alert light"> <span class="glyphicon glyphicon-picture text-muted"></span> <span class="metro-title">Pictures</span></a></div>
      </div>
    </div>
    

    <div id="content" class="animated fadeIn">
				<div class="panel">
					<div class="panel-body padding-none">
						<div id="tab3_1" class="tab-pane">
							<br />
							<br />
							<div class="col-md-12">
								<div class="panel">
									<div class="panel-heading">
										<span class="panel-title"><font color="black">View and Share Files</font></span>
									</div>
									<div class="panel-body p1 table-auto">
										<div class="panel-body pn b-none">
											<form method="post" action="uploadFile" name="sharefileform" enctype="multipart/form-data">
												<div style="color:#FF0000">${Message}</div>
												<table class="table">
													<tbody>
														<tr>
															<td><table class="table">
																	<tbody>
																		<tr>
																			<td class="success" style="width: 20%"><font color="black">Subject</font></td>
																			<td style="width: 80%"><input type="text" name="subject" value="" size="50"/><font color="black"></font></td>
																		</tr>
																		<tr>
																			<td class="success" style="width: 20%"><font color="black">Message</font></td>
																			<td style="width: 80%"><font color="black"><textarea name="message" value="" cols="75" rows="10"></textarea></font></td>
																		</tr>
																		<tr>
																			<td class="success" style="width: 20%"><font color="black">Select File</font></td>
																			<td style="width: 80%"><input type="file" name="file" /><font color="black"></font></td>
																		</tr>
																		<tr>
																			<td class="success" style="width: 20%"><font color="black">Select Group</font></td>
																			<td style="width: 80%"><font color="black"><select name="groupId" id="groupId">
																					<option value="">Select</option>
																					<c:forEach var="group" items="${groupList}">
																						<option value="${group.groupId}">${group.groupName}</option>
																					</c:forEach>
																			</select></font></td>
																		</tr>
																		<tr>
																			<td class="success" style="width: 20%"><font color="black">Shared to Individual User</font></td>
																			<td style="width: 80%"><font color="black"><input type="checkbox" id="isFileSharedToUser" onchange="checkChBoxSelection();" name="isFileSharedToUser" /></font></td>
																		</tr>
																		<tr>
																			<td class="success" style="width: 20%"><font color="black">Select User</font></td>
																			<td style="width: 80%"><font color="black"><select name="userid" id="userid">
																					<option value="">Select</option>
																					<c:forEach var="user" items="${userList}">
																						<option value="${user.userid}">${user.username}</option>
																					</c:forEach>
																			</select></font></td>
																		</tr>
																		<tr>
																		<td align="left" colspan="8">
																			<input type="submit" value="Upoad" />&nbsp;<input type="reset" value="Reset"/>&nbsp;<input type="Button" value="View Files" onclick="viewFiles();"/>
																		</td>
																		</tr>
																	</tbody>
																</table></td>
														</tr>
													</tbody>
												</table>
												<input type="hidden" name="sharedById" value="<%=sharedById%>" />
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<br />
					</div>
				</div>
			</div>    
    
</section>
</div>

</body>
</html>
