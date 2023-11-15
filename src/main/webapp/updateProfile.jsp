<%@ page import="com.example.webapp.DatabaseUtils" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%--
  Created by IntelliJ IDEA.
  User: Marwane
  Date: 14/11/2023
  Time: 19:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/styles.css">
    <title>Update Profile</title>
</head>
<body>

<%
    String newEmail = request.getParameter("newEmail");
    String newPassword = request.getParameter("newPassword");
    String id = (String)request.getSession().getAttribute("id");

    // Vérifier si l'utilisateur est connecté
    if (id == null) {
        response.sendRedirect("login.jsp");
    } else {
        try {
            DatabaseUtils databaseUtils = DatabaseUtils.getInstance();
            out.println("connexion");
            // Mettre à jour l'email de l'utilisateur dans la base de données
            String query = "UPDATE email,password SET email = "+newEmail+" AND password = "+newPassword+" WHERE id = "+id;
            ResultSet resultSet = null;
            resultSet = databaseUtils.sendQuery(query);
            out.println("requete envoyée");


        } catch (Exception e) {
            System.out.println(e.toString());
        }



%>
</body>
</html>