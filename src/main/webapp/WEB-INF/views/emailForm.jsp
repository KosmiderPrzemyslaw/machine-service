<%--
  Created by IntelliJ IDEA.
  User: przemysaw
  Date: 03.07.20
  Time: 13:26
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
    <title>Title</title>
    <jsp:include page="header.jsp"/>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<jsp:include page="footer.jsp"/>

<div class="container">
    <center>
        <form:form modelAttribute="email" method="post">
            <h2 class="form-signin-heading">Formularz kontaktowy</h2>

            <spring:bind path="subject">
                <div class="form-group" ${status.error ? 'has-error' : ''}>
                    <label for="subject">Temat:
                        <form:input path="subject" name="subject" class="form-control" id="subject"/>
                        <form:errors path="subject" cssClass="error"/>
                    </label>
                </div>
            </spring:bind>

            <spring:bind path="text">
                <div class="form-group" ${status.error ? 'has-error' : ''}>
                    <label for="text">Treść:
                        <form:textarea path="text" name="text" class="form-control" id="text"/>
                        <form:errors path="text" cssClass="error"/>
                    </label>
                </div>
            </spring:bind>
            <label class="form-group">Wybierz do kogo wysłać wiadomość:</label><br>
            <form:select path="receiver" items="${usersMailAddresses}"/><br><br>
            <button type="submit" class="btn btn-primary">Wyślij</button>
        </form:form>
    </center>
</div>
</body>
</html>
