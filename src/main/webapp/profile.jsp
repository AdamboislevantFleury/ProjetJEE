<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.example.webapp.UserList" %>
<%@ page import="com.example.webapp.User" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.example.webapp.*" %>
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
        <div>
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
            <div id="solde">
                <h2>Votre solde</h2>
                <label><%out.println(request.getSession().getAttribute("solde")+"€");%></label>
                <form action="crediter" method="post">
                    <label for="solde">Créditer solde</label><br>
                    <input type="text" name="solde" placeholder="Actualiser solde"><br>
                    <input type="submit" value="Créditer">
                </form>
            </div>
        <div>
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
                <%
                    Rights r = null;
                    try{
                        r=Rights.getInstance((String)request.getSession().getAttribute("id"));
                    }
                    catch(SQLException e){
                        throw new RuntimeException(e);
                    }
                    if(r.getCollection().get("edit").equals("1")||request.getSession().getAttribute("role").equals("1")){
                        out.println("<a href=\"editRights.jsp\">Modifier les droits d'un utilisateur</a><br>");
                    }
                    if(r.getCollection().get("promote").equals("1")||request.getSession().getAttribute("role").equals("1")){
                        out.println("<a href=\"editAdmin.jsp\">Ajouter un admin</a><br>");
                    }
                    if(r.getCollection().get("add").equals("1")||r.getCollection().get("remove").equals("1")||request.getSession().getAttribute("role").equals("1")){
                        out.println("<a href=\"editChamp.jsp\">Ajouter / Supprimers un champion</a><br>");
                    }
                %>
            </div>
        </div>
    </div>
</div>



<jsp:include page="footer.jsp"/>
</body>
</html>
