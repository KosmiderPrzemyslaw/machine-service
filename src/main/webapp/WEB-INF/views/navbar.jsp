<%--
  Created by IntelliJ IDEA.
  User: przemysaw
  Date: 27.06.20
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Body</title>
    <jsp:include page="header.jsp"/>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/">Strona główna<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/machineService">Wyślij zgłoszenie serwisowe</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/send-email">Napisz wiadomość</a>
            </li>

            </li>
            <li class="nav-item">
                <a class="nav-link" href="/myServices">Moje serwisy</a>
            </li>

        </ul>

        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search in Google" aria-label="Search">
            <button class="btn btn-dark my-2 my-sm-0"  type="submit">Search</button>
        </form>
        <sec:authorize access="isAuthenticated() == false">
            <form class="form-inline my-0 my-lg-0" method="get" action="/login">
                <button class="btn btn-primary my-2 my-sm-2" type="submit"> Login</button>
            </form>
        </sec:authorize>

        <sec:authorize access="isAuthenticated()">
            <form class="form-inline my-2 my-lg-0" action="<c:url value="/logout"/>" method="post">

                <button class="btn btn-primary my-2 my-sm-2" type="submit">Logout:
                        ${pageContext.request.userPrincipal.name}</button>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </sec:authorize>

    </div>
</nav>

<jsp:include page="footer.jsp"/>
</body>
</html>
