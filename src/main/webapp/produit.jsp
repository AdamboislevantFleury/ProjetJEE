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
    <link rel="stylesheet" href="style/index.css">
</head>
<body>
<jsp:include page="header.jsp" />

<main>
<div class="container">

<%

    //retrieve the list of champions as json from response payload
    String champions = (String) response.getHeader("champions");
    //parse the json
    JSONObject championList = new JSONObject(champions);


    //print each key and value
    for (String key : championList.keySet()) {

        JSONObject championData = championList.getJSONObject(key);

        out.println("<div class='product'>");
        out.print("<img src="+championData.getString("image_url")+" alt='Produit 1'>");
        out.print("<h3>"+key+"</h3>");
        out.print("<p>"+championData.getString("description")+"</p>");
        out.print("<span class='price'>"+championData.getString("prix")+"</span>");
        out.print("<a href='page-article?champName="+championData.getString("name")+"&background_url="+championData.getString("image_url")+"'>Acheter</a>");
        out.println("</div>");

    }
%>
</div>
</main>
<jsp:include page="footer.jsp" />
</body>
</html>
