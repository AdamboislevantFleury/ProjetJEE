package com.example.webapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "addChamp", value = "/addChamp")
public class AddChamp extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String champ = req.getParameter("name");
        String descr = req.getParameter("description");
        String title = req.getParameter("title");
        String image = req.getParameter("image");

        try {
            DatabaseUtils databaseUtils = DatabaseUtils.getInstance();
            String query = "INSERT INTO "+databaseUtils.getDatabase()+".champions (name,title,description,image) VALUES ('" + champ + "', '" + descr + "', '" + title + "', '" + image + "')";
            ResultSet resultSet = null;
            resultSet = databaseUtils.sendQuery(query);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
