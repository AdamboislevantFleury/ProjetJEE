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
    <a href="achat?champName=<% out.println(rs.getString("name"));%>">Acheter</a>
</div>


<jsp:include page="footer.jsp"/>
</body>
</html>
