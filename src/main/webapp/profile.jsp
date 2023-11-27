<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.webapp.DatabaseUtils" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.example.webapp.UserList" %>
<%@ page import="com.example.webapp.UserList" %>
<%@ page import="com.example.webapp.User" %>
<%@ page import="java.util.Iterator" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/styles.css" type="text/css">
    <link rel="stylesheet" href="style/profile.css" type="text/css">
    <title>Profile</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="container">
    <div class="bubbles">
       <jsp:include page="span.jsp"></jsp:include>
    </div>

    <h1>Bienvenue sur votre espace profile, Invocateur</h1>
    <div class="container2">
        <div id="modifying">
            <h2>Modifier mes identifiants</h2><br>
            <form action="updateEmail" method="post">
                <label>Nouvelle adresse mail :</label><br>
                <input type="email" placeholder = "<%out.println(session.getAttribute("email"));%>" name="newEmail"><br>
                <input type="submit" value="Modifier">
            </form>
            <br>
            <form action ="updatePassword" method="post">
                <label>Nouveau mot de passe :</label><br>
                <input type="password" placeholder="Mot de passe" name="newPassword1"><br>
                <label>Confirmer mot de passe :</label><br>
                <input type="password" placeholder="Mot de passe" name="newPassword2"><br>
                <input type="submit" value="Modifier">
            </form>
        </div>

        <div id="achats">
            <h2>Historique des commandes</h2>

            <table>
                    <tr>
                        <th>Commande</th>
                        <th>Nom</th>
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
                            String id = rs.getString("id_champion");
                            String champImgPath = "https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/champion-icons/"+id+".png";
                            out.println("<tr>");
                            out.println("<td><img id='img' src="+champImgPath+" alt="+rs.getString("name")+"></td>");
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

            <div id="adm">
                <legend>For admins</legend>
                <input type="radio" id="add" name="rights" value="ajouter" checked />
                <label for="add">Ajouter des droits</label><br>
                <input type="radio" id="remove" name="rights" value="retirer" checked />
                <label for="remove">Retirer des droits</label><br>
                <input type="radio" id="change" name="rights" value="changer" checked />
                <label for="change">Changer les droits</label><br>
                <input type="text" id="searchBar" placeholder="Rechercher un utilisateur" onkeyup="filterUsers()"/><br>
                <ul id="userList">
                <%
                    UserList users = new UserList();
                    Iterator<String> it = users.getUserList().iterator();
                    while(it.hasNext()){
                        String email = it.next();
                        out.println("<li>"+email+"</li>");
                    }
                %>
                </ul>
            </div>
        </div>
    </div>
</div>



<jsp:include page="footer.jsp"/>
<script src="javascript/profile.js"></script>
</body>
</html>