<%--
  Created by IntelliJ IDEA.
  User: przemysaw
  Date: 21.06.20
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href="${contextPath}/recources/css/style.css" rel="stylesheet">
    <title>Registration form </title>

</head>
<body>
<div class="container">
    <center>
        <form:form modelAttribute="userForm" method="post">
            <h2 class="form-signin-heading">Rejestracja</h2>
            <spring:bind path="username">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <label for="username">Nazwa użytkownika:
                        <form:input path="username" class="form-control" id="username"/>
                        <form:errors path="username" cssClass="error"/>
                    </label>
                </div>
            </spring:bind>
            <spring:bind path="password">
                <div class="form-group${status.error ? 'has-error' : ''}">
                    <label for="password">Hasło:
                        <form:input type="password" path="password" name="password" class="form-control" id="password"/>
                        <form:errors path="password" cssClass="error"/>
                    </label>
                </div>
            </spring:bind>
            <spring:bind path="passwordConfirm">
                <div class="form-group${status.error ? 'has-error' : ''}">
                    <label for="passwordConfirm">Potwierdź hasło:
                        <form:input type="password" path="passwordConfirm" name="passwordConfirm" class="form-control"
                                    id="passwordConfirm"/>
                        <form:errors path="passwordConfirm" cssClass="error"/>
                    </label>
                </div>
            </spring:bind>
            <div class="form-group">
                <label for="emails">Email:
                    <form:input path="email" name="emails" class="form-control" id="emails"/>
                    <form:errors path="email" cssClass="error"/>
                </label>
            </div>
            <div class="form-group">
                <label for="companyName">Nazwa firmy:
                    <form:input path="companyName" name="companyName" class="form-control" id="companyName"/>
                    <form:errors path="companyName" cssClass="error"/>
                </label>
            </div>
            <div class="form-group">
                <label for="city">Miasto:
                    <form:input path="city" name="city" class="form-control" id="city"/>
                    <form:errors path="city" cssClass="error"/>
                </label>
            </div>
            <div class="form-group">
                <label for="address">Adres:
                    <form:input path="address" name="address" class="form-control" id="address"/>
                    <form:errors path="address" cssClass="error"/>
                </label>
            </div>
            <div class="form-group">
                <label for="phoneNumber">Numer telefonu:
                    <form:input path="phoneNumber" name="phoneNumber" class="form-control" id="phoneNumber"/>
                    <form:errors path="phoneNumber" cssClass="error"/>
                </label>
            </div>
            <div class="form-group">
                <label for="nip">Nip:
                    <form:input path="nip" name="nip" class="form-control" id="nip"/>
                    <form:errors path="nip" cssClass="error"/>
                </label>
            </div>
            <div class="form-check">
                <form:radiobutton path="sex" value="M" class="form-check-input" id="sex"/>
                <label class="form-check-label" for="sex">
                    Male
                </label>
                <form:errors path="sex" cssClass="error"/>
            </div>
            <div class="form-check">
                <form:radiobutton path="sex" value="F" class="form-check-input" id="sex"/>
                <label class="form-check-label" for="sex">
                    Female
                </label>
                <form:errors path="sex" cssClass="error"/>
            </div>

            <button type="submit" class="btn btn-primary">Wyślij</button>
        </form:form>
    </center>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
</body>
</html>



