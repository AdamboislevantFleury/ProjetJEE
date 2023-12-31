package com.example.webapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "loginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    public LoginServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("LoginServlet doGet");

        req.getSession().setAttribute("logged", "false");
        req.getRequestDispatcher("/index.jsp").forward(req, resp);

        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("LoginServlet doPost");
        DatabaseUtils databaseUtils = DatabaseUtils.getInstance();

        String username = req.getParameter("email");
        String password = req.getParameter("password");

        String sql = "SELECT * FROM " + databaseUtils.getDatabase() + ".user WHERE email = '" + username + "' AND password = '" + password + "'";
        try {
            ResultSet resultSet = databaseUtils.sendQuery(sql);

            if (resultSet.next()) {
                String id = resultSet.getString("id");
                String email= resultSet.getString("email");
                String role = resultSet.getString("role");
                int solde = Integer.parseInt(resultSet.getString("solde"));
                req.getSession().setAttribute("id",id);
                req.getSession().setAttribute("email",email);
                req.getSession().setAttribute("logged", "true");
                req.getSession().setAttribute("role",role);
                req.getSession().setAttribute("solde",solde);
                //Récupération des droits et inscription dans la classe Rights pour les utilisations sur le site
                Rights r = Rights.getInstance(id);
                r.affichage();
                req.getRequestDispatcher("/index.jsp").forward(req, resp);
            } else {
                req.getSession().setAttribute("logged", "false");
                req.getRequestDispatcher("/connexion.jsp").forward(req, resp);
            }

            databaseUtils.closeConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
