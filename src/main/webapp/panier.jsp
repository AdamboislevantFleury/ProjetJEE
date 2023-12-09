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
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="style/index.css">
  <link rel="stylesheet" href="style/panier.css">
  <script>
    const url = window.location.href.split("?")[0].split("/").slice(0,-1).join("/");

    function achat() {
      const xhr = new XMLHttpRequest();
      xhr.open('GET', url+'/achat', true);
      xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
      xhr.send();

        //check response
        xhr.onload = function () {
          if (xhr.status === 200) {
            console.log(xhr.responseText);
            alert("Achat effectué");
            window.location.href = "profile.jsp";
          } else {
            console.log('Request failed.  Returned status of ' + xhr.status);
          }
        };

    }

    function addFunction(name) {
      const xhr = new XMLHttpRequest();
        xhr.open('POST', url+'/panier', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.setRequestHeader('type', 'add');
        xhr.setRequestHeader('champName', name);
        xhr.send();

        //check response
        xhr.onload = function () {
          if (xhr.status === 200) {
            //console.log(xhr.responseText);
            const quantity = document.getElementsByClassName(name+"-bold")[0];
            quantity.innerHTML = parseInt(quantity.innerHTML) + 1;

            //update the total price
            const prixTotal = document.getElementById("prix-total");
            const prixChamp = document.getElementById("price-"+name);
            newPrice = parseInt(prixTotal.innerHTML.split(" ")[2]) + parseInt(prixChamp.innerHTML);
            prixTotal.innerHTML = "Total : "+newPrice;

          } else {
            console.log('Request failed.  Returned status of ' + xhr.status);
          }
        };

    }
    function minusFunction(name) {
      const xhr = new XMLHttpRequest();
      xhr.open('POST', url+'/panier', true);
      xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
      xhr.setRequestHeader('type', 'remove');
      xhr.setRequestHeader('champName', name);
      xhr.send();

        //check response
        xhr.onload = function () {
          if (xhr.status === 200) {
            console.log(xhr.responseText);
            const quantity = document.getElementsByClassName(name+"-bold")[0];
            quantity.innerHTML = parseInt(quantity.innerHTML) - 1;

            //update the total price
            const prixTotal = document.getElementById("prix-total");
            const prixChamp = document.getElementById("price-"+name);
            newPrice = parseInt(prixTotal.innerHTML.split(" ")[2]) - parseInt(prixChamp.innerHTML);
            prixTotal.innerHTML = "Total : "+newPrice;

          } else {
            console.log('Request failed.  Returned status of ' + xhr.status);
          }
        };

    }
    function deleteFunction(name) {
      const xhr = new XMLHttpRequest();
      xhr.open('POST', '/panier', true);
      xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
      xhr.setRequestHeader('type', 'delete');
      xhr.setRequestHeader('champName', name);
      xhr.send();

        //check response
        xhr.onload = function () {
          if (xhr.status === 200) {
            console.log(xhr.responseText);
            document.getElementById(name).remove();

          } else {
            console.log('Request failed.  Returned status of ' + xhr.status);
          }
        };

    }
  </script>
</head>
<body>
<jsp:include page="header.jsp" />

<main>
  <div class="container">

    <%

      DatabaseUtils db = new DatabaseUtils();

      //get the user id from the session
      String userId = (String) session.getAttribute("id");

      String requestSQL = "select * from champions join panier on name = id_champion where id_user = "+userId+";";

      //execute the request
      ResultSet rs = db.sendQuery(requestSQL);

      int totalPanier = 0;

      try {
        //print each key and value
        while (rs.next()) {

          out.println("<div class='product' id='"+rs.getString("name")+"'>");
          out.println("<img src=" + rs.getString("image_url") + " alt='Produit 1'>");
          out.println("<h3>" + rs.getString("name") + "</h3>");
          out.println("<p>" + rs.getString("description") + "</p>");
          out.println("<span class='price' id='price-"+ rs.getString("name") +"'>" + rs.getString("prix") + "</span>");
          out.println("<span class='quantity'>Quantité : <span class='"+rs.getString("name")+"-bold'>" +rs.getString("quantite")+"</span></span>");
          //add +1 -1 button to add or remove the product from the cart
          out.println("<div class='add-remove'>");
          out.print("<button onclick='addFunction(");
          out.print('"'+rs.getString("name")+'"');
          out.println(")'>+1</button>");
          out.println("<button onclick='minusFunction(");
          out.print('"'+rs.getString("name")+'"');
          out.println(")'>-1</button>");
          out.println("<button onclick='deleteFunction(");
          out.print('"'+rs.getString("name")+'"');
          out.println(")'>Supprimer</button>");
          out.println("</div>");
          out.println("</div>");

            totalPanier +=  rs.getInt("prix") * Integer.parseInt(rs.getString("quantite"));

        }

      }catch (SQLException e){
        e.printStackTrace();
      }

      db.closeConnection();

    %>

    <%-- <p>Vous avez actuellement <span class="bold">0</span> articles dans votre panier.</p> --%>

  </div>

  <div class='total'>
    <h3 id ='prix-total'>Total : <span class="price"><%=totalPanier%></span></h3>
    <div class='acheter'>
      <button onClick='achat()'>Acheter</button>
    </div>
  </div>
  
</main>
<jsp:include page="footer.jsp" />
</body>
</html>
