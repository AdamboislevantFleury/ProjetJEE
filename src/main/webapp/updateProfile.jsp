<%@ page import="com.example.webapp.DatabaseUtils" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.swing.JOptionPane" %>
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
    String newPassword1 = request.getParameter("newPassword1");
    String newPassword2 = request.getParameter("newPassword2");
    String id = (String)request.getSession().getAttribute("id");

    // Vérifier si l'utilisateur est connecté
    if (id == null) {
        response.sendRedirect("connexion.jsp");
    } else {
        try {
                DatabaseUtils databaseUtils = DatabaseUtils.getInstance();
                String query = "SELECT password FROM "+databaseUtils.getDatabase()+".user WHERE id = " + id;
                ResultSet resultSet = null;
                resultSet = databaseUtils.sendQuery(query);
                if(resultSet.next()){
                    String oldPassword = resultSet.getString("password");
                    int cas;
                    if(newPassword1.equals(newPassword2)){
                        if(!newPassword1.equals(oldPassword)){
                            query = "UPDATE "+databaseUtils.getDatabase()+".user SET email = '" + newEmail + "', password = '" + newPassword1 + "' WHERE id = " + id;
                            resultSet = null;
                            resultSet = databaseUtils.sendQuery(query);
                            request.getSession().setAttribute("logged", "false");
                            request.getRequestDispatcher("/connexion.jsp").forward(request, response);
                        }
                        else{
                            out.println("le nouveau mot de passe et l'ancien doivent etre différents");
                        }
                    }
                    else{
                        out.println("les mots de passes ne sont pas le memes");
                    }
                }
            }
            catch(Exception e){
                System.out.println(e.toString());
            }
            /*DatabaseUtils databaseUtils = DatabaseUtils.getInstance();
            String query = "UPDATE "+databaseUtils.getDatabase()+".user SET email = '" + newEmail + "', password = '" + newPassword1 + "' WHERE id = " + id;
            ResultSet resultSet = null;
            resultSet = databaseUtils.sendQuery(query);
            //boite de dialogue qui marche une fois sur dix
            //JOptionPane.showMessageDialog(null,"Informations changées, veillez vous reconencter");
            request.getSession().setAttribute("logged", "false");
            request.getRequestDispatcher("/connexion.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        */
    }

%>
</body>
</html>