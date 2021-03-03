<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <%@page import="java.util.ArrayList,com.falconproject.web.models.Menu,com.falconproject.web.models.UserGroup" %>
    <%

        String path = request.getContextPath();
        String addUser_Path = path + "/addUser";
        String registerUser_Path = path + "/registerUser";
        String group = path + "/group";
        String createGroup_Path = path + "/createGroup";

        String fetchUsersList = path + "/fetchUsersList";
        String part_info_path = path + "/generalInfo";
        String part_edit = path + "/part_edit";
        String customer_order_path = path + "/customerOrderInfo";
        String part_search = path + "/PartSearchDetails";
        String ibt_search_path = path + "/ibtSearchInfo";
        String viewDrawing_path = path + "/viewDrawing";
        String customer_path = path + "/Customer";
        String invoiceInfo_Path = path + "/invoiceInfo";
        String vendorInfo_Path = path + "/vendorInfo";
        String purchaseOrderInfo_Path = path + "/purchaseOrderInfo";
        String idLinkPath = path + "/idLink";
        String shortagePath = path + "/shortage";
        String dozerSelectionPath = path + "/dozerSelection";

        String user_group_permissions = path + "/user_group_permissions";

        String partId = (String) request.getParameter("partId");
        String ibtId = (String) request.getAttribute("ibtId");
        ArrayList<Menu> menuList = (ArrayList<Menu>) request.getAttribute("menuList");
        ArrayList<UserGroup> groupList = (ArrayList<UserGroup>) request.getAttribute("groupList");

        String ibtLineSpecsInfoPath = path + "/ibtLineSpecsInfo";
        String ibtLineSpecsFlagVal = (String) request.getAttribute("ibtLineSpecsFlagVal");


    %>
    <meta charset="utf-8">
    <title> Dashboard</title>
    <meta name="keywords" content=" Dashboard"/>
    <meta name="description" content=" Dashboard">
    <meta name="author" content=" Dashboard">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'>
    <link href="<c:url value="/resources/css/theme.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/resources/css/admin-forms.css"/>" rel="stylesheet" type="text/css"/>

    <link rel="shortcut icon" href="images/favicon.ico">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

</head>

<body class="ui-tabs-page">
<div id="skin-toolbox">
    <div class="panel">
        <div class="panel-body pn">
            <ul class="nav nav-list nav-list-sm pl15 pt10" role="tablist">
                <li class="active"><a href="#toolbox-header" role="tab" data-toggle="tab">Navbar</a></li>
                <li><a href="#toolbox-sidebar" role="tab" data-toggle="tab">Sidebar</a></li>
                <li><a href="#toolbox-settings" role="tab" data-toggle="tab">Misc</a></li>
            </ul>
            <div class="form-group mn br-t p15"><a href="#" id="clearLocalStorage"
                                                   class="btn btn-primary btn-block pb10 pt10">Clear LocalStorage</a>
            </div>
        </div>
    </div>
</div>
<div id="main">
    <jsp:include page="topHeader.jsp"/>
    <aside id="sidebar_left" class="nano nano-light affix">
        <div class="sidebar-left-content nano-content">
            <header class="sidebar-header">
                <div class="sidebar-widget search-widget hidden">
                    <div class="input-group"><span class="input-group-addon"> <i class="fa fa-search"></i></span>
                        <input type="text" id="sidebar-search" class="form-control" placeholder="Search...">
                    </div>
                </div>
            </header>
            <jsp:include page="header.jsp"/>
            <div class="sidebar-toggle-mini"><a href="#"> <span class="fa fa-sign-out"></span></a></div>
        </div>
    </aside>
    <section id="content_wrapper">
        <div id="topbar-dropmenu" class="alt">
            <div class="topbar-menu row">
                <div class="col-xs-4 col-sm-2"><a href="#" class="metro-tile bg-primary light"> <span
                        class="glyphicon glyphicon-inbox text-muted"></span> <span
                        class="metro-title">Messages</span></a></div>
                <div class="col-xs-4 col-sm-2"><a href="#" class="metro-tile bg-info light"> <span
                        class="glyphicon glyphicon-user text-muted"></span> <span class="metro-title">Users</span></a>
                </div>
                <div class="col-xs-4 col-sm-2"><a href="#" class="metro-tile bg-success light"> <span
                        class="glyphicon glyphicon-headphones text-muted"></span> <span
                        class="metro-title">Support</span></a></div>
                <div class="col-xs-4 col-sm-2"><a href="#" class="metro-tile bg-system light"> <span
                        class="glyphicon glyphicon-facetime-video text-muted"></span> <span
                        class="metro-title">Videos</span></a></div>
                <div class="col-xs-4 col-sm-2"><a href="#" class="metro-tile bg-warning light"> <span
                        class="fa fa-gears text-muted"></span> <span class="metro-title">Settings</span></a></div>
                <div class="col-xs-4 col-sm-2"><a href="#" class="metro-tile bg-alert light"> <span
                        class="glyphicon glyphicon-picture text-muted"></span> <span class="metro-title">Pictures</span></a>
                </div>
            </div>
        </div>
        <div id="content" class="animated fadeIn">
            <div class="panel">
                <div class="panel-body padding-none">
                    <div id="tab3_1" class="tab-pane">


                        <form:form method="post" action="${contextPath}/createGroup" modelAttribute="userGroup">

                            <div class="row">
                                <div class="col-md-5">
                                    <div class="panel" style="margin-top:10px;">
                                        <div class="panel-heading"><span
                                                class="panel-title">Group Creation</span></div>
                                        <div class="panel-body pn">
                                            <table class="table">
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        <table class="table">
                                                            <tbody>
                                                            <c:forEach var="menuVar" items="${menuList}">
                                                                <tr>
                                                                    <td>
                                                                        <form:checkbox
                                                                                path="menuSet"
                                                                                value="${menuVar.menuId}"/>
                                                                    </td>
                                                                    <td>
                                                                            ${menuVar.menuName}
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table class="table">
                                                            <tbody>
                                                            <tr>
                                                                <td>Group Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <form:input type="text" path="groupName" value=""/>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Group Description:
                                                                    <form:input type="text" path="groupDescription"
                                                                                value=""/>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <input type="submit" value="Create Group"
                                                                           name="Create Group"
                                                                           style="color:gray;height:25px;font-size:13px">
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </form:form>
                        <br/>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel">
                                    <div class="panel-heading"><span class="panel-title">Groups</span></div>
                                    <div class="panel-body p1">
                                        <div class="panel-body pn b-none">
                                            <style>
                                                /*headere {*/
                                                /*    width: 100px;*/
                                                /*}*/

                                                .scrollef {
                                                    max-height: 143px;
                                                    overflow: auto;
                                            </style>

                                            <table class="table">
                                                <thead>
                                                <tr class="success">
                                                    <th style="width:25%">Group Name</th>
                                                    <th style="width:25%">Group Description</th>
                                                    <th style="width:25%">Delete Group</th>
                                                    <th style="width:25%">Edit Group</th>
                                                </tr>
                                                </thead>
                                            </table>
                                            <div class="scrollef">
                                                <table class="table">

                                                    <tbody>
                                                    <c:forEach items="${groupList}" var="group">
                                                        <tr>
                                                            <td style="width:25%">${group.groupName}</td>
                                                            <td style="width:25%">${group.groupDescription}</td>
                                                            <td style="width:25%"><a
                                                                    href="groupDeletion?groupId=${group.groupId}">Delete
                                                                Group</a></td>
                                                            <td style="width:25%"><a
                                                                    href="groupEdit?groupId=${group.groupId}">Edit
                                                                Group</a></td>
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

                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<script src="<c:url value="/resources/js/jquery-1.11.1.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery-ui.min.js"/>"></script>
<!-- Bootstrap -->
<script type="text/javascript" src="<c:url value="/resources/assets/js/bootstrap/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/assets/js/utility/utility.js"/>"></script>
<script src="<c:url value="/resources/assets/js/demo/demo.js"/>"></script>
<script src="<c:url value="/resources/assets/js/main.js"/>"></script>
<script type="text/javascript">


    function checkSave() {
        return false;
    }

    jQuery(document).ready(function () {

        "use strict";

        // Init Theme Core
        Core.init();

        // Init Demo JS
        Demo.init();

    });
</script>

</body>
</html>
