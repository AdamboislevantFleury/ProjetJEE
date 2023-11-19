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
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="style/index.css">
    <link rel="stylesheet" href="style/produit.css">
</head>
<body>
<video muted loop autoplay id="video-bg">
  <source src="media/background.mp4" type="video/mp4" />
  <img src="media/background-fallback.jpg" title="Your browser does not support the <video> tag" />
</video>
<div id="overlay">
    <jsp:include page="header.jsp" />
    <main>
    <div class="container">

    <%

        //retrieve the list of champions as json from response payload
        // String champions = (String) response.getHeader("champions");
        //parse the json
        // JSONObject championList = new JSONObject(champions);
        JSONObject championList = (JSONObject)request.getAttribute("champions");

        int Product_id = 0;

        //print each key and value
        for (String key : championList.keySet()) {

            JSONObject championData = championList.getJSONObject(key);
            
            Product_id++;

            %>

            <div class="product">
                <img src="<%=championData.getString("image_url")%>" alt="Produit <%=Product_id%>">
                <span class="description">
                    <h3><%=key%></h3>
                    <p><%=championData.getString("description")%></p>
                </span>
                <span class="price"><%=championData.getString("prix")%></span>
                <span class="buy-btn-container">
                    <a class="buy-btn" href="page-article?champName=<%=championData.getString("name")%>&background_url=<%=championData.getString("image_url")%>">Acheter</a>
                </span>
            </div>
            
            <%
        }
    %>
    </div>
    </main>
    <jsp:include page="footer.jsp" />
</div>
</body>
</html>
