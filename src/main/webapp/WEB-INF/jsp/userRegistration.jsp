<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page import="java.util.ArrayList,com.falconproject.web.models.User,com.falconproject.web.models.TimePeriod" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Falcon Race Solutions : Advance Software Make Easy</title>
    <meta name="keywords" content="Falcon Race Solutions : Advance Software Make Easy"/>
    <meta name="description" content="Falcon Race Solutions : Advance Software Make Easy">
    <meta name="author" content="Falcon Race Solutions">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'>
    <link href="<c:url value="/resources/css/theme.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/resources/css/admin-forms.css"/>" rel="stylesheet" type="text/css"/>

    <link rel="shortcut icon" href="images/favicon.ico">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->


    <script src="<c:url value="/resources/js/jquery-1.10.2.min.js"/>"></script>
    <script src="<c:url value="/resources/js/underscore-1.5.2.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.scrollTableBody-1.0.0.js"/>"></script>

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
                <div class="panel-heading"><span class="panel-title">Add New User/ Change Password</span></div>
                <div class="panel-body padding-none">
                    <div id="tab3_1" class="tab-pane">


                        <div class="row">
                            <form:form method="post" modelAttribute="userForm" action="${contextPath}/registerUser">
                                <div class="col-md-4">
                                    <div class="panel">
                                        <div class="panel-body pn" style="margin-top:20px">
                                            <span class="panel-title"><b>Add New User</b></span><br/>
                                            <table>
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        <table>
                                                            <tbody>
                                                            <tr>
                                                                <td>&nbsp;<b>User ID</b>&nbsp;</td>
                                                                <td><form:input type="text" path="username"
                                                                                value=""/></td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;<b>User Name</b>&nbsp;</td>
                                                                <td><form:input type="text" path="userFullName"
                                                                                value=""/>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;<b>Password</b>&nbsp;</td>
                                                                <td><form:input type="text" path="password"
                                                                                value=""/></td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="submit"
                                                               style="color:gray;height:25px;font-size:13px;margin-left:110px"
                                                               name="Submit" value="Submit">
                                                    </td>
                                                </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </form:form>
                            <form:form method="post" modelAttribute="passwordChangeForm"
                                       action="${contextPath}/change_password">

                                <div class="col-md-4">
                                    <div class="panel">
                                        <div class="panel-body pn" style="margin-top:20px">
                                            <span class="panel-title"><b>Change Password</b></span><br/>
                                            <table>
                                                <br/>
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        <table>
                                                            <tbody>
                                                            <tr>

                                                                <td>&nbsp;<b>Select User:</b>&nbsp;</td>
                                                                <td>
                                                                    <form:select path="user">
                                                                        <form:options items="${userList}"
                                                                                      itemValue="userId"
                                                                                      itemLabel="username"/>
                                                                    </form:select>
                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;<b>New Password:</b>&nbsp;</td>
                                                                <td><form:input type="text" path="newPassword"
                                                                                value=""/></td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="submit"
                                                               style="color:gray;height:25px;font-size:13px;margin-left:96px"
                                                               name="Save" value="Save">
                                                    </td>
                                                </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </form:form>


                            <form:form method="post" modelAttribute="timeAllocateForm"
                                       action="${contextPath}/timePeriod">

                                <div class="col-md-4">
                                    <div class="panel">
                                        <div class="panel-body pn" style="margin-top:20px">
                                            <span class="panel-title"><b>Allocate Logout Time</b></span><br/>
                                            <table>
                                                <br/>
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        <table>
                                                            <tbody>
                                                            <tr>

                                                                <td>&nbsp;<b>Select User:</b>&nbsp;</td>
                                                                <td>
                                                                    <form:select path="user">
                                                                        <form:options items="${userList}"
                                                                                      itemValue="userId"
                                                                                      itemLabel="username"/>
                                                                    </form:select>

                                                                </td>

                                                            </tr>
                                                            <tr>

                                                                <td>&nbsp;<b>Select Time:</b>&nbsp;</td>
                                                                <td>
                                                                    <form:select path="timePeriod">
                                                                        <form:options items="${timePeriodList}"
                                                                                      itemValue="timeId"
                                                                                      itemLabel="timeVal"/>
                                                                    </form:select>


                                                                </td>

                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="submit"
                                                               style="color:gray;height:25px;font-size:13px;margin-left:78px"
                                                               name="Save" value="Save">
                                                    </td>
                                                </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </form:form>


                        </div>


                        <br/>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel">
                                    <div class="panel-heading"><span class="panel-title">Users</span></div>
                                    <div class="panel-body p1">
                                        <div class="panel-body pn b-none">
                                            <style>
                                                /*header {*/
                                                /*    width: 100px;*/
                                                /*}*/

                                                .scrollef {
                                                    max-height: 343px;
                                                    overflow: auto;
                                                }
                                            </style>

                                            <table id="arrestedDevelopment"
                                                   class="table table-striped table-hover table-bordered table-condensed">
                                                <thead>
                                                <tr class="success">
                                                    <th>USER ID</th>
                                                    <th>Logout Time</th>
                                                    <th>Assign Group/Access</th>
                                                    <th>Assigned Group</th>
                                                    <th>Delete User</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${userList}" var="user">
                                                    <tr>
                                                        <td>${user.username}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${user.timePeriod != null}">
                                                                    ${user.timePeriod} Mins
                                                                </c:when>
                                                                <c:otherwise>
                                                                    None
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <a href="${contextPath}/user_group_permissions?userid=${user.userId}">Assign
                                                                Group/Access</a>
                                                        </td>
                                                        <td>
                                                            <c:forEach items="${user.groups}" var="group">
                                                                ${group.groupName},
                                                            </c:forEach>
                                                        </td>
                                                        <td><a href="userDeletion?userid=${user.userId}">Delete User</a>
                                                        </td>
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
    </section>
</div>

<!-- Bootstrap -->
<script type="text/javascript" src="<c:url value="/resources/assets/js/bootstrap/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/assets/js/utility/utility.js"/>"></script>
<script src="<c:url value="/resources/assets/js/demo/demo.js"/>"></script>
<script src="<c:url value="/resources/assets/js/main.js"/>"></script>
<script type="text/javascript">

    function checkSave() {
        return false;
    }

    $(function () {
        $('#arrestedDevelopment').scrollTableBody();
    });

</script>
</body>
</html>
