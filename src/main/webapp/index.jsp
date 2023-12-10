<%@ page import="org.json.JSONObject" %>
<%@ page import="com.example.webapp.DatabaseUtils" %>
<%@ page import="com.example.webapp.Champions" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="style/index.css">
  <title>League of Champs</title>
</head>

<body>
<jsp:include page="header.jsp" />
<main>

  <div class="container">
    <h1>Bienvenue dans notre boutique invocateur</h1>
    <h2>Retrouvez ici les compositions tendances du moment</h2>
    <section id="featured-products">

      <%
        DatabaseUtils db = new DatabaseUtils();
        String[] roles = {"Top", "Jungle", "Mid", "Support", "ADC"};
        int j;
        for(j=0;j<3;j++){

      %>

      <%out.println("<h1 id=\"compo\">Composition n°"+(j+1)+"</h1>");%>
      <div class="product-carousel">
          <%
            for(int i=0;i<5;i++){
            JSONObject champion = Champions.getRandomChampionByLane(db, roles[i]);
            if (champion != null) {
          %>
        <a href="page-article?champName=<%= champion.getString("name") %>" class="product">
          <img src="<%= champion.getString("image_url") %>" alt="<%= champion.getString("name") %>">
          <h3><%= champion.getString("name") %></h3>
          <p><%= champion.getString("role") %></p>
          <span class="price"><%= champion.getString("prix") %> €</span>
        </a>

        <%
            }
          }
          db.closeConnection();
        %>
              }
            }%>
      </div>

      <%}%>


    </section>
  </div>
</main>


<jsp:include page="footer.jsp" />
</body>
</html>