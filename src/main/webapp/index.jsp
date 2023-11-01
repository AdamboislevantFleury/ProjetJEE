<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="styles.css">
  <title>Accueil - Ma Boutique en Ligne</title>
</head>
<body>
<header>
  <div class="container">
    <h1>Ma Boutique en Ligne</h1>
    <nav>
      <ul>
        <li><a href="#">Accueil</a></li>
        <li><a href="#">Produits</a></li>
        <li><a href="#">Promotions</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </nav>
  </div>
</header>

<main>
  <div class="container">
    <section id="featured-products">
      <h2>Produits en Vedette</h2>
      <div class="product">
        <img src="product1.jpg" alt="Produit 1">
        <h3>Nom du Produit 1</h3>
        <p>Description du produit 1.</p>
        <span class="price">$19.99</span>
        <a href="#">Acheter</a>
      </div>
      <div class="product">
        <img src="product2.jpg" alt="Produit 2">
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

<footer>
  <div class="container">
    <p>&copy; 2023 Ma Boutique en Ligne</p>
  </div>
</footer>
</body>
</html>
