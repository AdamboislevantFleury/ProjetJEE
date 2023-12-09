<%@ page import="com.example.webapp.Rights" %>
<%@ page import="com.example.webapp.Champions" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: Marwane
  Date: 03/12/2023
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/editPages.css" type="text/css">
    <link rel="stylesheet" href="style/styles.css" type="text/css">
    <title>Ajouter ou supprimer un champion</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="container">
    <div id="remove">
            <p>Supprimer un champion</p>
            <form action="deleteChamp" method="post">
                <select name = "user">
                    <%
                        Champions champList = new Champions();
                        Iterator<String> it = champList.getChampList().iterator();
                        while(it.hasNext()){
                            String name = it.next();
                            out.println("<option>"+name+"</option>");
                        }
                    %>
                </select><br>
                <input type="submit" value="Supprimer">
            </form>
    </div>

    <div id="add">
            <p>Ajouter un champion</p>
            <form action="addChamp" method="post">
                <label></label>
                <input type="text" name="id" placeholder="id du champion (>200)" required><br>
                <input type="text" name="name" placeholder="nom du champion" required><br>
                <input type="text" name="title" placeholder="titre du champion" required><br>
                <input type="text" name="description" placeholder="description du champion" required><br>
                <input type="text" name="lane" placeholder="Voie sur lequel se joue le champion" required><br>
                <input type="text" name="role" placeholder="quel est le role du champion" required><br>
                <input type="text" name="price" placeholder="prix du champion" required><br>
                <input type="text" name="image" placeholder="lien image du champion" required><br>
                <input type="text" name="splash" placeholder="splash art du champion" required  ><br>

                <input type="submit" value="Ajouter">
            </form>
    </div>
</div>
<jsp:include page="footer.jsp"/>

<script>
    <%
        Rights r = null;
        try{
            r=Rights.getInstance((String)request.getSession().getAttribute("id"));
        }
        catch(SQLException e){
            throw new RuntimeException(e);
        }
        %>
    if(<% r.getCollection().get("remove").equals("0");%>){
        document.getElementById("remove").style.display="none";
    }
</script>
</body>
</html>
