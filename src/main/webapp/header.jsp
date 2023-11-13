<html>
<head>
    <title>header</title>
    <link rel="stylesheet" href="style/styles.css">
</head>
<header>
    <h1><a href="#">LEAGUE OF CHAMPS</a></h1>
    <nav>
        <ul>
            <li><a href="index.jsp">Accueil</a></li>
            <li><a href="produit">Produits</a></li>
            <li><a href="#">Promotions</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </nav>
    <div class="user-actions">
        <a href="./profil.jsp">Profil</a>
        <%if(session.getAttribute("logged") != "true")out.println("<a href='./connexion.jsp'>Se connecter</a>'true'");
        else out.println("<a href='./deconnexion.jsp'>Se déconnecter</a>'true'");
        %>
        <a href="./connexion.jsp">Se connecter</a>
    </div>
</header>
</html>
