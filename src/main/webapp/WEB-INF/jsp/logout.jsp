<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <link href="<c:url value="/resources/css/theme.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/resources/css/admin-forms.css"/>" rel="stylesheet" type="text/css"/>
    <link rel="shortcut icon" href="images/favicon.ico">
</head>

<body class="external-page external-alt sb-l-c ">
<div id="main" class="animated fadeIn">
    <section id="content_wrapper">
        <section id="content">
            <div class="admin-form theme-info mw500" id="login">
                <div class="row table-layout"><a href="#" title="Falcon">
                    <img src="<c:url value="/resources/images/logo.png"/>" title="Dashboard"
                         class="center-block img-responsive" style="max-width: 350px;"></a></div>
                <div class="panel mt30 mb25">
                    <div class="panel-footer clearfix" style="text-align:center;">
                        You have successfully Logged out. Click <a href="login">here</a> to login again.
                    </div>
                </div>
            </div>
        </section>
    </section>
</div>
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery-ui.min.js"/>"></script>
</body>
</html>
