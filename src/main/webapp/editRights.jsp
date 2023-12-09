<%@ page import="com.example.webapp.UserList" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: Marwane
  Date: 07/12/2023
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/styles.css" type="text/css">
    <title>Modifiez les droits d'un utilisateur</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<legend>Modifier les droits d'un utilisateur</legend>
<form action="editRights" method="post">

    <input type="radio" value="add" name="rights" id="addRights" checked/>
    <label for="addRights">Ajouter des droits</label><br>
    <input type="radio" value="remove" name="rights" id="removeRights"/>
    <label for="removeRights">Retirer des droits</label><br>
    <input type="checkbox" id="add" name="val" value="add"/>
    <label for="add">Ajouter un champion</label><br>
    <input type="checkbox" id="remove" name="val" value="remove"/>
    <label for="remove">Retirer un champion</label><br>
    <input type="checkbox" id="edit" name="val" value="edit"/>
    <label for="edit">Modifier les droits d'un utilisateur</label><br>
    <input type="checkbox" id="promote" name="val" value="promote"/>
    <label for="promote">Passer un utilisateur en admin</label><br>
    Choisissez un utilisateur :<br>
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
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>


