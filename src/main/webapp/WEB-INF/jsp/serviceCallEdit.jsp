<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <title>Service Call Form</title>
    <meta name="keywords" content="Falcon Race Solutions : Advance Software Make Easy"/>
    <meta name="description" content="Falcon Race Solutions : Advance Software Make Easy">
    <meta name="author" content="Falcon Race Solutions">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap-->
    <link href="${contextPath}/resources/css/theme.css" rel="stylesheet" type="text/css"/>
    <link href="${contextPath}/resources/css/admin-forms.css" rel="stylesheet" type="text/css"/>

    <link href="${contextPath}/resources/odelan/dropzone/dropzone.min.css" rel="stylesheet" type="text/css"/>
    <link href="${contextPath}/resources/odelan/dropzone/basic.css" rel="stylesheet" type="text/css"/>
    <link href="${contextPath}/resources/odelan/css/styles.css" rel="stylesheet" type="text/css"/>

    <script src="${contextPath}/resources/odelan/jquery/jquery.min.js"></script>
    <script src="${contextPath}/resources/odelan/js/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/odelan/ckeditor/ckeditor.js"></script>
    <script src="${contextPath}/resources/odelan/dropzone/dropzone.min.js"></script>
    <meta name="_csrf" content="${_csrf.token}"/>

</head>

<body class="ui-tabs-page" onload="f1()">
<div id="main">
    <jsp:include page="topHeader.jsp"/>
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
            <jsp:include page="header.jsp"/>
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
                            class="glyphicon glyphicon-facetime-video text-muted"></span>
                        <span class="metro-title">Videos</span></a>
                </div>
                <div class="col-xs-4 col-sm-2">
                    <a href="#" class="metro-tile bg-warning light"> <span
                            class="fa fa-gears text-muted"></span> <span
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
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="panel-title">Service Call Add Form - Screen</span>
                </div>
                <div class="panel-body">
                    <div class="box-header with-border">
                        <div class="row">
                            <div class="heading col-lg-12">
                                <input type="button" class="btn btn-primary" id="serviceCallSearch"
                                       value="Search Service Call" onclick="location.href='/serviceCall'">
                                <input type="button" class="btn btn-primary" id="serviceCallNewAdd"
                                       value="New Service Call" onclick="location.href='/serviceCall/add'">
                                <input type="button" class="btn btn-primary" id="serviceCallPrint" value="Print">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <form:form id="form" modelAttribute="serviceCallForm" method="post" action="${contextPath}/serviceCall/store"
                               onSubmit="if(!confirm('Do you really want to save the Service Call request?')){return false;}">
                        <form:hidden path="id" />
                        <div class="panel-header">
                            <label>Integer field</label>
                            <form:input type="number" path="integerField" class="form-control"
                                        placeholder="Your answer"/>
                        </div>
                        <div class="panel-header">
                            <label>String field</label>
                            <form:input type="text" path="stringField" class="form-control" placeholder="Your answer"/>
                        </div>
                        <div class="panel-header">
                            <label>Date field</label>
                            <form:input type="date" path="dateField" class="form-control" placeholder="Your answer"/>
                        </div>
                        <div class="panel-header">
                            <label>File field</label>
                            <div class="dropzone" id="files-dropzone">
                            </div>
                            <form:select path="files" style="display: none" id="files"></form:select>
                        </div>
                        <div class="panel-header">
                            <label>Editor field</label>
                            <form:textarea path="editorField" id="editor"/>
                        </div>
                        <div class="panel-header">
                            <button class="btn btn-primary">Save</button>
                            <button class="btn btn-secondary" type="reset">Reset</button>
                        </div>
                    </form:form>
                </div>
            </div>

        </div>
    </section>
</div>

<script src="${contextPath}/resources/js/service-call-edit.js"></script>
</body>
</html>