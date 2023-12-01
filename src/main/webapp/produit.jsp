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
<%@ page import="com.example.webapp.DatabaseUtils" %>
<%@ page import="com.example.webapp.Champions" %>
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

            <div id="filter-form">
                <form action="produit.jsp" method="post">
                    <label for="lane-filter">Filtrer par lane :</label>
                    <select id="lane-filter" name="lane">
                        <option value="">Aucun filtre</option>
                        <option value="Top">Top</option>
                        <option value="Jungle">Jungle</option>
                        <option value="Mid">Mid</option>
                        <option value="Support">Support</option>
                        <option value="ADC">ADC</option>
                    </select>
                    <input type="submit" value="Filtrer">
                </form>
            </div>

            <%
                DatabaseUtils db = new DatabaseUtils();
                String selectedLane = request.getParameter("lane");

                // Si la lane n'est pas sélectionnée, utilisez une valeur par défaut
                if (selectedLane == null || selectedLane.isEmpty()) {
                    selectedLane = "Top";
                }

                JSONObject championList = (JSONObject) request.getAttribute("champions");

                int Product_id = 0;

                for (String key : championList.keySet()) {
                    JSONObject championData = Champions.getRandomChampionByLane(db, selectedLane);

                    if (championData != null) {
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
                }
            %>
        </div>
    </main>
    <jsp:include page="footer.jsp" />
</div>
</body>
</html>
