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
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String descr = req.getParameter("description");
        String title = req.getParameter("title");
        String image = req.getParameter("image");
        String lane = req.getParameter("lane");
        String type = req.getParameter("type");
        String splash = req.getParameter("splash");
        String price = req.getParameter("price");
        try {
            DatabaseUtils databaseUtils = DatabaseUtils.getInstance();
            String query = "INSERT INTO "+databaseUtils.getDatabase()+".champions VALUES ('" + id+ "', '"+ name + "', '" + type + "', '" + image + "', '" + splash + "', '" + title + "', '" + price + "', '" + lane + "', '" + descr +"')";
            ResultSet resultSet = null;
            resultSet = databaseUtils.sendQuery(query);
            databaseUtils.closeConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("/produit.jsp").forward(req, resp);
    }
}
