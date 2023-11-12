<%--
  Created by IntelliJ IDEA.
  User: wanto
  Date: 11/11/2023
  Time: 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.StringReader" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.json.JSONObject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="product">
    <img src="https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/champion-icons/1.png" alt="Produit 1">
    <h3>Nom du Produit 1</h3>
    <p>Description du produit 1.</p>
    <span class="price">$19.99</span>
    <a href="#">Acheter</a>
</div>

<div class="container">
<%

    //retrieve the list of champions as json from response payload
    String champions = (String) response.getHeader("champions");
    //parse the json
    JSONObject json = new JSONObject(champions);
    //print each key and value
    for (String key : json.keySet()) {
        out.println("<div class='product'>");
        out.print("<img src='https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/champion-icons/1.png' alt='Produit 1'>");
        out.print("<h3>"+key+"</h3>");
        out.println("</div>");
    }
%>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
