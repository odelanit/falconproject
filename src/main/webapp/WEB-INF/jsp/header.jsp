<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<script type="text/javascript">

    function clickMe(url) {
        if (checkSave()) {
            return false;
        }
        window.location = url;
    }
</script>

<ul class="nav sidebar-menu dont-print">
    <c:forEach items="${menuItems}" var="item">
        <li>
            <c:if test="${item.menuName == 'Logout'}">
                <a href="javascript:void(0);" onclick="document.getElementById('logout-form').submit();">
                    <span class="fa fa-users"></span>
                    <span class="sidebar-title">${item.menuName}</span>
                </a>
            </c:if>
            <c:if test="${item.menuName != 'Logout'}">
                <a href="${contextPath}/${item.menuUrl}">
                    <span class="fa fa-users"></span>
                    <span class="sidebar-title">${item.menuName}</span>
                </a>
            </c:if>
        </li>
    </c:forEach>
    <form:form class="d-none" action="/logout" method="post" id="logout-form">
    </form:form>
</ul>
