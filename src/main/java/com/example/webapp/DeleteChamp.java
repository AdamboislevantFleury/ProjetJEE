package com.example.webapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;


import static java.lang.System.out;

@WebServlet(name = "deleteChamp", value = "/deleteChamp")
public class DeleteChamp extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String champ = req.getParameter("deletedChamp");
        out.println(champ);
        try {
            DatabaseUtils databaseUtils = DatabaseUtils.getInstance();
            String delete = "SELECT * FROM "+databaseUtils.getDatabase()+".champions WHERE name = '"+champ+"'";
            ResultSet resultSet = null;
            resultSet = databaseUtils.sendQuery(delete);
            if(resultSet.next()){
                String id = resultSet.getString("idChampions");
                String query = "DELETE FROM "+databaseUtils.getDatabase()+".champions WHERE idChampions = '"+id+"'";
                resultSet = databaseUtils.sendQuery(query);
            }

            databaseUtils.closeConnection();
            req.getRequestDispatcher("index.jsp").forward(req,resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
