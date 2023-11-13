package com.example.webapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.xml.crypto.Data;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "loginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    public LoginServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("LoginServlet doPost");
        String username = req.getParameter("email");
        String password = req.getParameter("password");

        DatabaseUtils databaseUtils = DatabaseUtils.getInstance();
        String sql = "SELECT * FROM " + databaseUtils.getDatabase() + ".user WHERE email = '" + username + "' AND password = '" + password + "'";
        ResultSet resultSet = databaseUtils.sendQuery(sql);

        System.out.println(resultSet.toString());

        try {
            if(resultSet != null && !resultSet.next()) {
                req.getRequestDispatcher("/index.jsp").forward(req, resp);
            } else {
                req.getRequestDispatcher("/login.jsp").forward(req, resp);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        super.doPost(req, resp);
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
