<%@ page import="org.json.JSONObject" %>
<%@ page import="com.example.webapp.DatabaseUtils" %>
<%@ page import="com.example.webapp.Champions" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
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
    <section id="featured-products">
      <h2>Produits en Vedette</h2>
      <div class="product-carousel">
        <%
          DatabaseUtils db = new DatabaseUtils();
          String[] roles = {"Top", "Jungle", "Mid", "Support", "ADC"};

          for (String role : roles) {
            JSONObject champion = Champions.getRandomChampionByLane(db, role);
            if (champion != null) {
        %>
        <a href="page-article?champName=<%= champion.getString("championName") %>" class="product">
          <img src="<%= champion.getString("imageUrl") %>" alt="<%= champion.getString("championName") %>">
          <h3><%= champion.getString("championName") %></h3>
          <p><%= champion.getString("role") %></p>
          <span class="price"><%= champion.getString("prix") %> €</span>
        </a>
        <%
            }
          }
        %>
        <!-- Ajoutez d'autres produits ici -->
      </div>
    </section>

    <section id="special-offers">
      <h2>Offres Spéciales</h2>
      <div class="offer">
        <img src="offer1.jpg" alt="Offre 1">
        <h3>Offre Spéciale 1</h3>
        <p>Description de l'offre spéciale 1.</p>
        <span class="discount-price">$14.99</span>
        <span class="original-price">$19.99</span>
        <a href="#">Détails</a>
      </div>

      <!-- Ajoutez d'autres offres spéciales ici -->
    </section>
  </div>
</main>

<jsp:include page="footer.jsp" />
</body>
</html>