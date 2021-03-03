<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Dashboard</title>
    <meta name="keywords" content="Falcon Race Solutions : Advance Software Make Easy"/>
    <meta name="description" content="Falcon Race Solutions : Advance Software Make Easy">
    <meta name="author" content="Falcon Race Solutions">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link href="${contextPath}/resources/css/theme.css" rel="stylesheet" type="text/css"/>
    <link href="${contextPath}/resources/css/admin-forms.css" rel="stylesheet" type="text/css"/>
    <link rel="shortcut icon" href="images/favicon.ico">
</head>

<body class="external-page external-alt sb-l-c ">
<div id="main" class="animated fadeIn">
    <section id="content_wrapper">
        <section id="content">
            <div class="admin-form theme-info mw500" id="login">
                <div class="row table-layout"><a href="#" title="Falcon">
                    <img src="${contextPath}/resources/images/logo.png" title="Dashboard"
                         class="center-block img-responsive" style="max-width: 350px;"></a></div>
                <div class="panel mt30 mb25">
                    <form:form method="POST" action="${contextPath}/login">
                        <div class="panel-body bg-light p25 pb15">
                            <c:if test="${error != null}" >
                                <div class="alert alert-danger">
                                    <span>${error}</span>
                                </div>
                            </c:if>

                            <c:if test="${message != null}" >
                                <div class="alert alert-success">
                                    <span>${message}</span>
                                </div>
                            </c:if>
<%--                            <div style="text-align: center; color: #FE9A2E"><form:errors path="*" cssClass="error"--%>
<%--                                                                                         element="div"/></div>--%>

                            <div class="section">
                                <label for="username" class="field-label text-muted mb10">Username</label>
                                <label for="username" class="field prepend-icon">
                                    <input name="username" type="text" class="form-control" placeholder="Enter username" id="username" autofocus />
                                    <label for="username" class="field-icon"> <i class="fa fa-user"></i></label>
                                </label>
                            </div>

                            <div class="section">
                                <label for="password" class="field-label text-muted mb10">Password</label>
                                <label for="password" class="field prepend-icon">
                                    <input name="password" type="password" class="form-control" id="password" placeholder="Enter password"/>
                                    <label for="password" class="field-icon"> <i class="fa fa-lock"></i></label>
                                </label>
                            </div>
                        </div>
                        <div class="panel-footer clearfix" style="text-align:center;">
                            <button type="submit" class="button btn-primary mr10">Log In</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </section>
    </section>
</div>
<script src="${contextPath}/resources/js/jquery-1.11.1.min.js"></script>
<script src="${contextPath}/resources/js/jquery-ui.min.js"></script>
</body>
</html>
