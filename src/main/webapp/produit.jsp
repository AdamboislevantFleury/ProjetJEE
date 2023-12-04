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

    <%
        String CurrentSearch = (request.getParameter("search")!=null) ? request.getParameter("search") : "";
    %>

    <div class="search-bar">
        <form action="produit" method="get">
            <input type="text" name="search" placeholder="Rechercher un produit" value="<%=CurrentSearch%>">
            <%
                if (CurrentSearch != "") {
                %>
                    <a class="cancel-search" href="produit">
                        <%-- <img src="media/cross.svg" alt="Annuler la recherche"> --%>
                    </a>
                <%
                } 
            %>
            <input type="submit" value="">
        </form>
    </div>

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

        <% if(Product_id == 0) { %>
            <div class="no-product no-select">
                <span class="description">
                    <h3>Aucun produit trouvé</h3>
                </span>
            </div>
        <% } %>
        </div>
    </main>
    <div class="page-select">
    <%!
        public String getSelfURL(int page, String search) {
            String url = "produit?";

            if(page != 1) {
                url += "page="+page+(search!="" ? "&" : "");
            }

            if(search != "") {
                url += "search="+search;
            }

            return url;
        }
    %>
    <%
        int ChampionsAmount = (int)request.getAttribute("ChampionsAmount");
        int ChampionsPerPage = (int)request.getAttribute("ChampionsPerPage");

        int currentPage = (request.getParameter("page")!=null) ? Integer.parseInt(request.getParameter("page")) : 1;

        int PagesAmount = (int)Math.ceil((double)ChampionsAmount / ChampionsPerPage);

        /*
         * Version alternative de la pagination:
         * < (1) ... 9 >
         * < 1 (2) ... 9 >
         * < 1 ... (3) ... 9 >
         *         etc
         * < 1 ... (7) ... 9 >
         * < 1 ... (8) 9 >
         * < 1 ... (9) >
         * 
        */
        // char[] pages = {
        //     '-',
        //     '1',
        //     (currentPage > 2)? '?' : ' ',
        //     (currentPage >= 2 && currentPage <= (PagesAmount-1)) ? (char)(currentPage+(int)('0')) : ' ',
        //     (currentPage < (PagesAmount-1)) ? '?' : ' ',
        //     (char)(PagesAmount+(int)('0')),
        //     '+',
        //     '\0'
        // };

        char[] pages = new char[PagesAmount+3];

        pages[0] = '-';
        pages[PagesAmount+1] = '+';
        pages[PagesAmount+2] = '\0';

        for(int i = 1; i <= PagesAmount; i++) {
            pages[i] = (char)(i+(int)('0'));
        }


        for(int i = 0; pages[i]!='\0'; i++) {
            if (pages[i] == ' ') {
                continue;
            }

            if (pages[i] == '?') {
                %>
                    <a>...</a>
                <%
                continue;
            }

            if (pages[i] == (char)(currentPage+(int)'0')) {
                %>
                    <a class="current-page"><%=pages[i]%></a>
                <%
                continue;
            }

            if (pages[i] == '-') {
                %>
                    <%-- <a <%=(currentPage>1) ? "href=\"produit?page="+(currentPage-1)+"\"" : "class=\"unavailable\""%> >&lt; <span>Précedent</span> </a> --%>
                    <a <%=(currentPage>1) ? "href=" + getSelfURL(currentPage-1, CurrentSearch) : "class=\"unavailable\""%> >&lt; <span>Précedent</span> </a>
                <%
                continue;
            }

            if (pages[i] == '+') {
                %>
                    <a <%=(currentPage<PagesAmount) ? "href=" + getSelfURL(currentPage+1, CurrentSearch) : "class=\"unavailable\""%> > <span>Suivant</span> &gt;</a>
                <%
                continue;
            }

            %>
                <a href="<%=getSelfURL((int)pages[i] - (int)'0', CurrentSearch)%>"><%=pages[i]%></a>
            <%
        }
    %>
    </div>
    <jsp:include page="footer.jsp" />
</div>

<script>

</script>
</body>
</html>
