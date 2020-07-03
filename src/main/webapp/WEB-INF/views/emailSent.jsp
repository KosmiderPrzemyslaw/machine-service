<%--
  Created by IntelliJ IDEA.
  User: przemysaw
  Date: 01.07.20
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<head>
    <title>Security with Spring Boot</title>
    <jsp:include page="header.jsp"/>
</head>
<body>
<jsp:include page="dashboard.jsp"/>
<script type="text/javascript">
    function emailZostalWyslany() {
        alert("Email został wysłany")
    }
</script>
<h1 class="email">Email został wysłany</h1>
<jsp:include page="footer.jsp"/>

</body>
<script type="text/javascript">window.onload = emailZostalWyslany</script>
</html>