<%--
  Created by IntelliJ IDEA.
  User: przemysaw
  Date: 21.06.20
  Time: 17:28
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
    function dostepZabroniony() {
        alert("Dostęp zabroniony!")
    }
</script>
<h1 class="dostep-zabroniony">DOSTĘP ZABRONIONY</h1>
<jsp:include page="footer.jsp"/>

</body>
<script type="text/javascript">window.onload = dostepZabroniony</script>
</html>