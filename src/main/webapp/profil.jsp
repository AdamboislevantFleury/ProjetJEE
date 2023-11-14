<%@ page import="com.example.webapp.DatabaseUtils" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/styles.css">
    <title>Profil</title>
</head>
<body>
<jsp:include page="header.jsp" />
<%
    /* String userId = (String) request.getSession().getAttribute("userId");
if (userId == null) {
      out.println("aucun user connecté");
  } else {

      DatabaseUtils databaseUtils = DatabaseUtils.getInstance();
      String query = "SELECT * FROM "+ databaseUtils.getDatabase() + ".user WHERE id = "+userId;
      ResultSet resultSet = null;
      try{
          resultSet = databaseUtils.sendQuery(query);
          if(resultSet.next()){
              String firstname = resultSet.getString("firstname");
              String name = resultSet.getString("name");
              String email = resultSet.getString("email");
              String pwd = resultSet.getString("password");
*/
                out.println("<h1>Bienvenue sur votre espace profile, Invocateur</h1>");
                out.println("<form action=\"updateProfile.jsp\" method=\"post\">");
                out.println("<label for=\"email\">Adresse mail actuelle : </label><br>");
                out.println(" <input type=\"text\" placeholder=\"Nouvelle adresse\" id=\"email\" name=\"email\"><br>");
                out.println("<label for=\"password\">Mot de passe :</label><br>");
                out.println("<input type=\"text\" placeholder=\"Nouveau mot de passe\" id=\"password\" name=\"password\"><br>");
                out.println("<input type=\"submit\" value=\"Modifier\">");
                out.println("</form>");
/*
            }
            else{
                out.println("<p>Utilisateur non trouvé</p>");
            }

        }
        catch(Exception e)
        {

        }


    }
*/



%>
<jsp:include page="footer.jsp"/>
</body>
</html>
