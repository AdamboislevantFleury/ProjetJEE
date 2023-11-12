package com.example.webapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

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

        if (username.equals("admin") && password.equals("admin")) {
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("connexion.jsp").forward(req, resp);
            resp.sendError(401, "Wrong username or password");
        }

        super.doPost(req, resp);
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
