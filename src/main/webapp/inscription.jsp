<%--
  Created by IntelliJ IDEA.
  User: wanto
  Date: 13/11/2023
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/styles.css">
    <link rel="stylesheet" href="style/connexion.css">
    <title>Profil</title>
</head>
<body>
<jsp:include page="header.jsp" />

<main>
    <h2>Connexion</h2>
    <form action="register" method="post">

        <label for="name">Nom</label>
        <input type="text" id="name" name="name" required>

        <label for="firstname">Prénom</label>
        <input type="text" id="firstname" name="firstname" required>

        <label for="email">Adresse e-mail</label>
        <input type="text" id="email" name="email" required>

        <label for="password">Mot de passe</label>
        <input type="password" id="password" name="password" required>

        <input type="submit" value="S'inscrire">
    </form>
</main>

<jsp:include page="footer.jsp" />
</body>
</html>