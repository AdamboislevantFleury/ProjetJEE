<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<h2>Historique des commandes</h2>

    <table>
        <tr>
            <th>Commande</th>
            <th>Quantité</th>
            <th>Prix</th>
            <th>Prix total</th>
            <th>Date</th>
        </tr>
        <%
            DatabaseUtils db = new DatabaseUtils();
            String id_user = (String)session.getAttribute("id");

            if(id_user == null){
                response.sendRedirect("connexion.jsp");
                return;
            }

            String req = "SELECT * FROM achat join champions on id_champion = idChampions WHERE id_user = '"+id_user+"'";
            ResultSet rs = db.sendQuery(req);
            while(rs.next()){
                out.println("<tr>");
                out.println("<td>"+rs.getString("name")+"</td>");
                out.println("<td>"+rs.getString("quantite")+"</td>");

                int prixTotal = rs.getInt("prix") * rs.getInt("quantite");

                out.println("<td>"+rs.getString("prix")+"</td>");
                out.println("<td>"+prixTotal+"</td>");
                out.println("<td>"+rs.getString("date")+"</td>");
                out.println("</tr>");
            }
        %>
    </table>

<jsp:include page="footer.jsp"/>
</body>
</html>
