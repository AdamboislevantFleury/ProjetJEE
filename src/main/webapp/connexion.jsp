<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/styles.css">
    <link rel="stylesheet" href="style/connexion.css">
    <title>Connection</title>
</head>
<body>
<jsp:include page="header.jsp" />

<main>
    <h2>Connexion</h2>
    <form action="login" method="post">
        <label for="email">Adresse e-mail</label>
        <input type="text" id="email" name="email" required>

        <label for="password">Mot de passe</label>
        <input type="password" id="password" name="password" required>

        <input type="submit" value="Se connecter">
    </form>

    <p>Pas encore de compte ? <a href="inscription.jsp">Inscrivez-vous</a></p>
</main>

<jsp:include page="footer.jsp" />
</body>
</html>