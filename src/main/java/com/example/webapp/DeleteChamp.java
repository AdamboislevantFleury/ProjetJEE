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
        try {
            DatabaseUtils databaseUtils = DatabaseUtils.getInstance();
            String query = "DELETE FROM "+databaseUtils.getDatabase()+".champions WHERE name = "+champ;
            ResultSet resultSet = null;
            resultSet = databaseUtils.sendQuery(query);
            out.println("champ supprimé");
            databaseUtils.closeConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        /*
        DatabaseUtils db = DatabaseUtils.getInstance();
        //String query = "INSERT INTO "+db.getDatabase()+".permissions VALUES ("+req.getSession().getAttribute("id")+",0,0,0,0)";
        String query = "SELECT * FROM "+db.getDatabase()+".permissions WHERE id_user = "+req.getSession().getAttribute("id");
        try {
            ResultSet rs = null;
            rs = db.sendQuery(query);
            if(rs.next()){
                Rights r = Rights.getInstance((String) req.getSession().getAttribute("id"));
                r.affichage();
            }
            else{
                out.println("cacapipi");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        */
    }
}
