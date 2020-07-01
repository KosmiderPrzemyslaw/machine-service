<%--
  Created by IntelliJ IDEA.
  User: przemysaw
  Date: 01.07.20
  Time: 01:37
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
    <title>Update service</title>
    <jsp:include page="header.jsp"/>
</head>

<body>
<jsp:include page="navbar.jsp"/>
<div class="container">
    <center>
        <form:form modelAttribute="machine" method="post">
            <h2 class="form-signin-heading">Korekta zgłoszenia serwisowego</h2>
            <spring:bind path="machineName">
                <div class="form-group" ${status.error ? 'has-error' : ''}>
                    <label for="machineName">Nazwa maszyny:
                        <form:input path="machineName" name="machineName" class="form-control" id="machineName"/>
                        <form:errors path="machineName" cssClass="error"/>
                    </label>
                </div>

            </spring:bind>
            <spring:bind path="description">
                <div class="form-group" ${status.error ? 'has-error' : ''}>
                    <label for="description">Opis problemu:
                        <form:textarea path="description" name="description" class="form-control" id="description"/>
                        <form:errors path="description" cssClass="error"/>
                    </label>
                </div>

            </spring:bind>
            <spring:bind path="serialNumber">
                <div class="form-group" ${status.error ? 'has-error' : ''}>
                    <label for="serialNumber">Numer seryjny:
                        <form:textarea path="serialNumber" name="serialNumber" class="form-control" id="serialNumber"/>
                        <form:errors path="serialNumber" cssClass="error"/>
                    </label>
                </div>
            </spring:bind>

            <spring:bind path="additionalEquipment">
                <div class="form-group" ${status.error ? 'has-error' : ''}>
                    <label for="description">Dodatkowa dokumentacja:
                        <input type="file" name="additionalEquipment" class="form-control-file"
                               id="additionalEquipment"/>
                    </label>
                </div>
            </spring:bind>
            <button type="submit" class="btn btn-primary">Wyślij</button>
        </form:form>
    </center>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
