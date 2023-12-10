<%@ page import="com.example.webapp.UserList" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: Marwane
  Date: 07/12/2023
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/editPages.css" type="text/css">
    <link rel="stylesheet" href="style/styles.css" type="text/css">
    <title>Ajouter un admin</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="container">
    <form action ="editAdmin" method="post">
        Choisissez un utilisateur à passer en admin :<br>
        <select name = "user">
            <%
                UserList users = new UserList();
                Iterator<String> it = users.getUserList().iterator();
                while(it.hasNext()){
                    String email = it.next();
                    out.println("<option>"+email+"</option>");
                }
            %>
        </select><br>
        <input type="submit" value="Modifier">
    </form>
<div>
<jsp:include page="footer.jsp"/>
</body>
</html>
