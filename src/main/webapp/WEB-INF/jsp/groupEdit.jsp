<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
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


                        <form:form method="post" action="${contextPath}/editGroup?groupId=${groupId}"
                                   modelAttribute="userGroup">
                            <form:hidden path="groupId"/>
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="panel" style="margin-top:10px;">
                                        <div class="panel-heading"><span
                                                class="panel-title">Group Edit<span></div>
                                        <div class="panel-body pn">
                                            <table class="table">
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        <table class="table">
                                                            <tbody>


                                                            <c:forEach var="menuVar" items="${menuItems}"
                                                                       varStatus="loop">
                                                                <tr>
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${menuVar.checked == true}">
                                                                                <form:checkbox path="menuSet"
                                                                                               value="${menuVar.menuId}"
                                                                                               checked="true"/>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <form:checkbox path="menuSet"
                                                                                               value="${menuVar.menuId}"/>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </td>
                                                                    <td>${menuVar.menuName}</td>
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
                                                                    <form:input type="text" path="groupName"/>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Group Description:
                                                                    <form:input type="text" path="groupDescription"/>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <input type="submit" value="Save" name="Save"
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
