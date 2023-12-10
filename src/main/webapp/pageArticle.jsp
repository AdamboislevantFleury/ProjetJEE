<%@ page import="com.example.webapp.DatabaseUtils" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: wanto
  Date: 12/11/2023
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%

    //get data og champ
    String champ = request.getParameter("champName");

    DatabaseUtils db = new DatabaseUtils();
    String sql = "SELECT * FROM champions WHERE name = '" + champ + "'";
    ResultSet rs = db.sendQuery(sql);
    rs.next();

%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style/pageArticle.css">
    <title><% out.print(response.getHeader("Title")); %></title>
    <style>
        body{
            background-image: url(<% out.print(rs.getString("splashart")); %>);
            background-size: cover;
            background-position: right;
    }
    </style>
    <script>
        function addpanier(name) {
            const url = window.location.href.split("?")[0].split("/").slice(0,-1).join("/");
            const xhttp = new XMLHttpRequest();
            xhttp.open("POST", url+"/panier", true);
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.setRequestHeader("type", "insert");
            xhttp.setRequestHeader("champName", name);
            xhttp.send();

            //check response
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    //redirect to panier
                    window.location.href = url+"/panier";
                }
            };

        }
    </script>
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="container">
    <div class="champ">
        <img src="<% out.print(rs.getString("image_url"));%>">
        <h1><% out.print(rs.getString("name"));%></h1>
        <p><% out.print(rs.getString("lane"));%></p>
        <p><% out.print(rs.getString("description"));%></p>
        <p class="price"><% out.print(rs.getString("prix"));%> €</p>
    </div>
        <button class="btn" onclick="addpanier('<% out.print(rs.getString("name"));%>')"><span>Acheter</span></button>
</div>
<% db.closeConnection();%>

<jsp:include page="footer.jsp"/>
</body>
</html>
