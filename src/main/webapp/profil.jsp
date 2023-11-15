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
    <title>Profile</title>
</head>
<body>
<jsp:include page="header.jsp" />
<%
    String userId = (String)request.getSession().getAttribute("id");
    if (userId == null) {
        out.println("aucun user connecte");
    } else {
        DatabaseUtils databaseUtils = DatabaseUtils.getInstance();
        String query = "SELECT * FROM "+ databaseUtils.getDatabase() + ".user WHERE id = "+userId;
        ResultSet resultSet = null;
        try{
            resultSet = databaseUtils.sendQuery(query);
            if(resultSet.next()){
                String firstname = resultSet.getString("prenom");
                String name = resultSet.getString("nom");
                String email = resultSet.getString("email");
                String pwd = resultSet.getString("password");

                out.println("<h1>Bienvenue sur votre espace profile, Invocateur : "+firstname+" "+name+"</h1>");
                out.println("<form action=\"updateProfile.jsp\" method=\"post\">");
                out.println("<label for=\"newEmail\">Adresse mail actuelle : "+email+"</label><br>");
                out.println(" <input type=\"email\" placeholder=\"Nouvelle adresse\" id=\"newEmail\" name=\"newEmail\"><br>");
                out.println("<label for=\"newPassword\">Mot de passe :</label><br>");
                out.println("<input type=\"password\" placeholder=\"Nouveau mot de passe\" id=\"newPassword\" name=\"newPassword\"><br>");
                out.println("<input type=\"submit\" value=\"Modifier\">");
                out.println("</form>");
                }
            else{
                out.println("<p>Utilisateur non trouvé</p>");
            }

        }
        catch(Exception e)
        {
            System.out.println(e.toString());
        }
}




%>
<jsp:include page="footer.jsp"/>
</body>
</html>
