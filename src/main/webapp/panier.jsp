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

      DatabaseUtils db = new DatabaseUtils();

      //get the user id from the session
      String userId = (String) session.getAttribute("id");

      String requestSQL = "select * from champions join panier on name = id_champion where id_user = "+userId+";";

      //execute the request
      ResultSet rs = db.sendQuery(requestSQL);

      try {
        //print each key and value
        while (rs.next()) {

          out.println("<div class='product'>");
          out.print("<img src=" + rs.getString("image_url") + " alt='Produit 1'>");
          out.print("<h3>" + rs.getString("name") + "</h3>");
          out.print("<p>" + rs.getString("description") + "</p>");
          out.print("<span class='price'>" + rs.getString("prix") + "</span>");
          out.print("<a href='page-article?champName=" + rs.getString("name") + "&background_url=" + rs.getString("image_url") + "'>Acheter</a>");
          out.println("</div>");

        }
      }catch (SQLException e){
        e.printStackTrace();
      }
    %>

    <p>Vous avez actuellement <span class="bold">0</span> articles dans votre panier.</p>

  </div>
</main>
<jsp:include page="footer.jsp" />
</body>
</html>
