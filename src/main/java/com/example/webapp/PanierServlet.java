package com.example.webapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

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

        if(type == "delete"){

            DatabaseUtils db = new DatabaseUtils();
            String sqlReq = "delete from panier where id_user = " + id_user + " and id_champion = " + name + ";";
            try {
                db.sendQuery(sqlReq);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }


        }

        try {
            DatabaseUtils db = new DatabaseUtils();
            String sqlReq = "update panier set quantite = quantite "+(type == "remove"?"-":"+")+" 1 where id_user = " + id_user + " and id_champion = " + name + ";";
            db.sendQuery(sqlReq);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
