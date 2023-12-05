<%--
  Created by IntelliJ IDEA.
  User: Marwane
  Date: 03/12/2023
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/styles.css" type="text/css">
    <title>Ajouter ou supprimer un champion</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<p>Supprimer un champion</p>
<form action="deleteChamp" method="post">
    <input type="text" name="deletedChamp" placeholder="Champion à supprimer"><br>
    <input type="button" value="Supprimer">
</form>

<p>Ajouter un champion</p>
<form action="addChamp" method="post">
    <label></label>
    <input type="text" name="name" placeholder="nom du champion"><br>
    <input type="text" name="title" placeholder="titre du champion"><br>
    <input type="text" name="description" placeholder="description du champion"><br>
    <input type="text" name="image" placeholder="lien image du champion"><br>
    <input type="button" value="Ajouter">

</form>

<jsp:include page="footer.jsp"/>
</body>
</html>
