package com.example.webapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.ResultSet;

@WebServlet(name = "registerServlet", value = "/register")
public class RegisterServlet extends HttpServlet {

    public RegisterServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("RegisterServlet doPost");

        DatabaseUtils databaseUtils = DatabaseUtils.getInstance();

        String username = req.getParameter("email");
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        String firstname = req.getParameter("firstname");

        String checkQuery = "SELECT * FROM " + databaseUtils.getDatabase() + ".user WHERE email = '" + username + "'";
        String insertQuery = "INSERT INTO " + databaseUtils.getDatabase() + ".user (email, password, nom, prenom) VALUES ('" + username + "', '" + password + "', '" + name + "', '" + firstname + "')";

        //check for error
        try {

            ResultSet result = databaseUtils.sendQuery(checkQuery);

            if(result.next()) {
                resp.getWriter().write("<script>alert('Email already used');</script>");
                req.getRequestDispatcher("/inscription.jsp").forward(req, resp);
                return;
            }

            databaseUtils.sendQuery(insertQuery);

            req.getSession().setAttribute("logged", "false");
            req.getRequestDispatcher("/index.jsp").forward(req, resp);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        super.doPost(req, resp);
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
