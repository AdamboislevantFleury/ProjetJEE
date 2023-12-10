package com.example.webapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "editAdmin", value = "/editAdmin")
public class editAdmin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String user = req.getParameter("user");
        DatabaseUtils db = DatabaseUtils.getInstance();
        String query = "UPDATE "+ db.getDatabase()+".user SET role = 1 WHERE email = '"+user+"'";
        ResultSet r = null;
        try {
            r = db.sendQuery(query);
            db.closeConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("/profile.jsp").forward(req, resp);
    }
}
