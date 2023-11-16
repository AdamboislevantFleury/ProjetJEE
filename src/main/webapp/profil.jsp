<%@ page import="com.example.webapp.DatabaseUtils" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/styles.css">
    <link rel="stylesheet" href="style/profil.css">
    <title>Profile</title>
</head>
<body>
<jsp:include page="header.jsp" />

<h1>Bienvenue sur votre espace profile, Invocateur</h1>
<h2>Modifier mes identifiants<h2><br>
<form action="updateProfile.jsp" method="post">
    <label>Adresse mail actuelle : <% out.println(session.getAttribute("email")); %></label><br>
    <input type="email" placeholder="Nouvelle adresse" name="newEmail"><br>
    <label>Mot de passe :</label><br>
    <input type="password" placeholder="Mot de passe" name="newPassword"><br>
    <input type="submit" value="Modifier">
</form>

<jsp:include page="footer.jsp"/>
</body>
</html>
