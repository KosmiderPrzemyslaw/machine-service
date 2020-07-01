<%--
  Created by IntelliJ IDEA.
  User: przemysaw
  Date: 30.06.20
  Time: 21:54
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
    <title>Machine List</title>
    <jsp:include page="header.jsp"/>
    <link href="${contextPath}/recources/css/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="dashboard.jsp"/>


<ul class="list-group">
    <button type="button" class="list-group-item list-group-item-action active">
        Maszyny użytkownika: ${user.username}
    </button>
    <c:forEach items="${machineList}" var="machine">
        <li class="list-group-item list-group-item-primary" id="number">Numer zgłoszenia serwisowego: ${machine.id}
            <a href="/update/${machine.id}" class="btn btn-warning" style="float: right"  role="button" id="button1" aria-pressed="true">Aktualizuj</a>
              <a href="/deleteService/${machine.id}" class="btn btn-danger" style="float: right" role="button" id="button2"
               aria-pressed="true">Usuń</a>
        </li>
        <li class="list-group-item">Nazwa maszyny: ${machine.machineName}</li>
        <li class="list-group-item">Opis problemu: ${machine.description}</li>
        <li class="list-group-item">Numer seryjny: ${machine.serialNumber}</li>
        <li class="list-group-item">Ostatnie zmiany: ${machine.updatedOn}</li>
    </c:forEach>
</ul>
<jsp:include page="footer.jsp"/>
</body>
</html>
