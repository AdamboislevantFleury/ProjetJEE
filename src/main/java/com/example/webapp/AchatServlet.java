package com.example.webapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AchatServlet", value = "/achat")
public class AchatServlet extends HttpServlet {

    public AchatServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("champName");

        //add champ to basket
        String id_user = (String) req.getSession().getAttribute("id");

        //check if id_panier is null
        if(id_user == null){
            //ask for connection
            resp.sendRedirect("connexion.jsp");
        }else{

            try {
                DatabaseUtils db = new DatabaseUtils();
                String request = "INSERT INTO `panier` (`id_user`, `id_champion`) VALUES ('"+id_user+"', '"+name+"');";
                db.sendQuery(request);

                resp.sendRedirect("panier.jsp");

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
