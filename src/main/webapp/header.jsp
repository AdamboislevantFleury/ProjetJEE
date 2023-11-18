<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>header</title>
    <link rel="stylesheet" href="style/styles.css">
</head>
<header>
    <h1><a href="index.jsp">LEAGUE OF CHAMPS</a></h1>
    <nav>
        <ul>
            <li><a href="index.jsp">Accueil</a></li>
            <li><a href="produit">Produits</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </nav>
    <div class="user-actions">
        <a href="./profil.jsp">Profil</a>
        <%if(session.getAttribute("logged") != "true") out.print("<a href='./connexion.jsp'>Se connecter</a>");
        else out.println("<a href='./panier.jsp'>Panier</a> <a href='./login'>Se déconnecter</a>");
        %>
    </div>
</header>
</html>
