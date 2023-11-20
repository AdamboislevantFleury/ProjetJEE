package com.example.webapp;

import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "produitServlet", value = "/produit")
public class produitServlet extends HttpServlet {

    public produitServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("produitServlet doGet");

        System.out.println("Page: " + req.getParameter("page") + "");

        int pageID = req.getParameter("page") != null ? Integer.parseInt(req.getParameter("page")) : 1;

        int ChampsPerPages = 10;

        try {

            //select all rows in the table and print them
            DatabaseUtils databaseUtils = DatabaseUtils.getInstance();

            String ChampionsList_search = 
                req.getParameter("search")!=null ? 
                " WHERE name LIKE '%" + ((String)req.getParameter("search")).replaceAll("(.{1})", "$1%") + "'" :
                "";
            
            String ChampionsList_clampData = " LIMIT " + ChampsPerPages + " OFFSET " + (pageID - 1) * ChampsPerPages;
            
            String ChampionsList_query = "SELECT * FROM " + databaseUtils.getDatabase() + ".champions" + ChampionsList_search + ChampionsList_clampData;
            ResultSet resultSet = databaseUtils.sendQuery(ChampionsList_query);

            //if result is not null
            JSONObject championsList = new JSONObject();
            while (resultSet.next()) {

                JSONObject championData = new JSONObject();
                championData.put("name", resultSet.getString("name"));
                championData.put("role", resultSet.getString("role"));
                championData.put("description", resultSet.getString("description"));
                championData.put("image_url", resultSet.getString("image_url"));
                championData.put("prix", resultSet.getString("prix"));
                championData.put("titre", resultSet.getString("titre"));
                championData.put("lane", resultSet.getString("lane"));

                championsList.put(resultSet.getString("name"), championData);

            }

            req.setAttribute("champions", championsList);
            req.setAttribute("ChampionsPerPage", ChampsPerPages);



            ResultSet ChampionsAmount_query = databaseUtils.sendQuery("SELECT COUNT(*) FROM " + databaseUtils.getDatabase() + ".champions" + ChampionsList_search);

            if(ChampionsAmount_query.next()) {
                int ChampionsAmount = ChampionsAmount_query.getInt(1);
                // int PagesAmount = (int) Math.ceil((double) ChampionsAmount / ChampsPerPages);
                req.setAttribute("ChampionsAmount", ChampionsAmount);
            }else{
                req.setAttribute("ChampionsAmount", -1);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("produit.jsp").forward(req, resp);
        System.out.println("produitServlet doGet end");
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
