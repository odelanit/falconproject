<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html>
<head>
    <title>Getting Started: Serving Web Content</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="${contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/assets/css/styles.css" rel="stylesheet">
    <meta name="_csrf" content="${_csrf.token}">
</head>
<body>
<header>
    <nav class="navbar navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Editor Demo</a>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/logout">Logout</a>
                </li>
            </ul>
        </div>
    </nav>
</header>
<div class="container py-4">
    <div class="row">
        <div class="col-12">
            <div class="table-responsive">
                <div class="row">
                    <div class="col-6">

                    </div>
                    <div class="col-6 text-right">
                        <a class="btn btn-link" href="/create">Create</a>
                    </div>
                </div>
                <table class="table">
                    <thead>
                    <tr>
                        <th>
                            <a th:href="@{'?sf=id&sd=' + ${reverseSortDir}}">ID</a>
                        </th>
                        <th>
                            <a th:href="@{'?sf=integerField&sd=' + ${reverseSortDir}}">Integer field</a>
                        </th>
                        <th>
                            <a th:href="@{'?sf=stringField&sd=' + ${reverseSortDir}}">String field</a>
                        </th>
                        <th>
                            <a th:href="@{'?sf=dateField&sd=' + ${reverseSortDir}}">Date field</a>
                        </th>
                        <th>Files</th>
                        <th>
                            <a th:href="@{'?sf=createdAt&sd=' + ${reverseSortDir}}">Created At</a>
                        </th>
                        <th>
                            <a th:href="@{'?sf=updatedAt&sd=' + ${reverseSortDir}}">Updated At</a>
                        </th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${posts}" var="post">
                        <tr>
                            <td>${post.id}</td>
                            <td th:text="${post.integerField}"></td>
                            <td th:text="${post.stringField}"></td>
                            <td th:text="${post.dateField}"></td>
                            <td th:if="${post.files != null}">
                                <a th:each="file : ${post.files}" th:href="@{/files/{id}(id=${file.id})}" th:text="${file.name}" class="btn btn-link"></a>
                            </td>
                            <td th:text="${post.createdAt}"></td>
                            <td th:text="${post.updatedAt}"></td>
                            <td>
                                <a th:href="@{/show/{id}(id=${post.id})}">Show</a> |
                                <a th:href="@{/edit/{id}(id=${post.id})}">Edit</a> |
                                <form th:action="@{/delete/{id}(id=${post.id})}" method="post" class="delete-form d-inline">
                                    <a href="javascript:void(0);" class="delete" data-toggle="modal" data-target="#confirmDelete">Delete</a>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="confirmDelete">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-danger">
                <div class="modal-title">
                    Delete
                </div>
                <button class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                Are you sure to delete?
            </div>
            <div class="modal-footer text-right">
                <button class="btn btn-primary" id="confirm">Yes</button>
                <button class="btn btn-secondary" data-dismiss="modal">No</button>
            </div>
        </div>
    </div>
</div>
<script src="${contextPath}/assets/jquery/jquery.min.js"></script>
<script src="${contextPath}/assets/js/bootstrap.min.js"></script>
<script>
    $('#confirmDelete').on('show.bs.modal', function (e) {
        var form = $(e.relatedTarget).closest('form');
        $(this).find('.modal-footer #confirm').data('form', form);
    });
    $('#confirmDelete').find('.modal-footer #confirm').on('click', function(){
        $(this).data('form').submit();
    });
</script>
</body>
</html>