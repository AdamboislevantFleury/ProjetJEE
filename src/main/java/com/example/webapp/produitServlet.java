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

        int pageID = req.getParameter("page") != null ? Integer.parseInt(req.getParameter("page")) : 1;

        try {

            //select all rows in the table and print them
            DatabaseUtils databaseUtils = DatabaseUtils.getInstance();
            String sql = "SELECT * FROM " + databaseUtils.getDatabase() + ".champions LIMIT 10 OFFSET " + (pageID - 1) * 10;
            ResultSet resultSet = databaseUtils.sendQuery(sql);

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


            resp.setHeader("champions", championsList.toString());

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
