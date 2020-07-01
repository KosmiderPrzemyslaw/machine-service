<%--
  Created by IntelliJ IDEA.
  User: przemysaw
  Date: 25.06.20
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="${contextPath}/recources/css/style.css" rel="stylesheet">
    <title>Login</title>
</head>
<body>
<center>
    <div class="container">
        <form:form method="post" modelAttribute="user">
        <h2 class="form-heading">Log in</h2>
        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span>${message}</span>
            <label for="username">Nazwa użytkownika
                <input type="text" name="username" class="form-control" id="username"/>
                    <%--            <form:errors path="email" cssClass="error"/>--%>
            </label>
        </div>
        <div class="form-group">

            <label for="password">Hasło
                <input type="password" name="password" class="form-control" id="password"/>
                    <%--            <form:errors path="password" cssClass="error"/>--%>
                <span>${error}</span>
            </label>
        </div>
        <button type="submit" class="btn btn-primary">Wyślij</button>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form:form>
        <small id="emailHelp" class="form-text text-muted">Nie masz konta? Kliknij</small>
        <button onclick="window.location.href='/registration'" class="btn btn-primary">Rejestracja</button>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
</center>
</body>
</html>
