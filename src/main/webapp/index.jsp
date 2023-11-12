<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="style/styles.css">
  <link rel="stylesheet" href="style/index.css">
  <title>League of Champs</title>
</head>

<body>
<jsp:include page="header.jsp" />

<main>
  <div class="container">
    <section id="featured-products">
      <h2>Produits en Vedette</h2>
      <div class="product">
        <img src="https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/champion-icons/1.png" alt="Produit 1">
        <h3>Nom du Produit 1</h3>
        <p>Description du produit 1.</p>
        <span class="price">$19.99</span>
        <a href="#">Acheter</a>
      </div>
      <div class="product">
        <img src="https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/champion-icons/2.png" alt="Produit 2">
        <h3>Nom du Produit 2</h3>
        <p>Description du produit 2.</p>
        <span class="price">$29.99</span>
        <a href="#">Acheter</a>
      </div>
      <!-- Ajoutez plus de produits ici -->
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
      <div class="offer">
        <img src="offer2.jpg" alt="Offre 2">
        <h3>Offre Spéciale 2</h3>
        <p>Description de l'offre spéciale 2.</p>
        <span class="discount-price">$24.99</span>
        <span class="original-price">$29.99</span>
        <a href="#">Détails</a>
      </div>
      <!-- Ajoutez plus d'offres spéciales ici -->
    </section>
  </div>
</main>

<jsp:include page="footer.jsp" />
</body>
</html>
