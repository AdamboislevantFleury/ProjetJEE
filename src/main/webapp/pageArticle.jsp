<%@ page import="com.example.webapp.DatabaseUtils" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: wanto
  Date: 12/11/2023
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><% out.print(response.getHeader("Title")); %></title>
    <style>
        body{
            background-image: url(<% out.print(request.getAttribute("background_url")); %>);
    }
    </style>
    <script>
        function addpanier(name) {
            const xhttp = new XMLHttpRequest();
            xhttp.open("POST", "http://localhost:8080/WebApp_war/panier", true);
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.setRequestHeader("type", "insert");
            xhttp.setRequestHeader("champName", name);
            xhttp.send();

            //check response
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    //redirect to panier
                    window.location.href = "http://localhost:8080/WebApp_war/panier.jsp";
                }
            };

        }
    </script>
</head>
<body>
<jsp:include page="header.jsp"/>

<%

    //get data og champ
    String champ = request.getParameter("champName");

    DatabaseUtils db = new DatabaseUtils();
    String sql = "SELECT * FROM champions WHERE name = '" + champ + "'";
    ResultSet rs = db.sendQuery(sql);
    rs.next();

%>

<div class="container">
    <img src="<% out.print(rs.getString("image_url"));%>">
    <h1><% out.print(rs.getString("name"));%></h1>
    <p><% out.print(rs.getString("description"));%></p>
    <p><% out.print(rs.getString("prix"));%></p>
    <button onclick="addpanier('<% out.print(rs.getString("name"));%>')">Acheter</button>
</div>


<jsp:include page="footer.jsp"/>
</body>
</html>
