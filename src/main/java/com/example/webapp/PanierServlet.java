package com.example.webapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Objects;

@WebServlet(name = "PanierServlet", value = "/panier")
public class PanierServlet extends HttpServlet {

    public PanierServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String type = req.getHeader("type");
        String name = req.getHeader("champName");
        String id_user = (String) req.getSession().getAttribute("id");

        //check if id_panier is null
        if (id_user == null) {
            //ask for connection
            resp.sendRedirect("connexion.jsp");
            return;
        }

        if (Objects.equals(type, "insert")) {

            try {
                DatabaseUtils db = new DatabaseUtils();
                String sqlReq = "insert into panier values ('" + name + "','" + id_user + "',1)";
                db.sendQuery(sqlReq);
                db.closeConnection();

                //respond with aknowledgement
                resp.getWriter().write("ok");

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            return;
        }
        if (Objects.equals(type, "delete")) {

            try {
                DatabaseUtils db = new DatabaseUtils();
                String sqlReq = "delete from panier where id_user = " + id_user + " and id_champion = '" + name + "'";
                db.sendQuery(sqlReq);
                db.closeConnection();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }

        try {
            DatabaseUtils db = new DatabaseUtils();
            String sqlReq = "update panier set quantite = quantite " + (Objects.equals(type, "remove") ? "-" : "+") + " 1 where id_user = " + id_user + " and id_champion = '" + name + "'";
            db.sendQuery(sqlReq);
            db.closeConnection();

            //respond with aknowledgement
            resp.getWriter().write("ok");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        resp.sendRedirect("panier.jsp");

    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id_user = (String) req.getSession().getAttribute("id");
        //check if id_panier is null
        if (id_user == null) {
            //ask for connection
            resp.sendRedirect("connexion.jsp");
            return;
        }

        // resp.sendRedirect("panier.jsp");
        req.getRequestDispatcher("panier.jsp").forward(req, resp);
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
