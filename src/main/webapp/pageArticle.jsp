<%--
  Created by IntelliJ IDEA.
  User: wanto
  Date: 12/11/2023
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><% out.print(response.getHeader("Title")); %></title>
</head>
<body>
<jsp:include page="header.jsp"/>


<jsp:include page="footer.jsp"/>
</body>
</html>
