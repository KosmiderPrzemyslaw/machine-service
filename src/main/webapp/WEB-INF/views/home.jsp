<%--
  Created by IntelliJ IDEA.
  User: przemysaw
  Date: 16.06.20
  Time: 22:36
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <jsp:include page="header.jsp"/>
    <title>Title</title>
</head>
<body>
<h1><spring:message code="app.title"/></h1>
<h1><spring:message code="hello.message"/></h1>
<jsp:include page="footer.jsp"/>
</body>
</html>
