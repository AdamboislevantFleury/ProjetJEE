package com.example.webapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.ResultSet;
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

                String request = "SELECT * FROM `panier` WHERE `id_user` = '"+id_user+"' AND `id_champion` = '"+name+"';";
                ResultSet rs = db.sendQuery(request);
                int quantite = 0;

                if(rs.next()){
                    quantite = rs.getInt("quantite");
                    quantite++;
                    request = "UPDATE `panier` SET `quantite` = '"+quantite+"' WHERE `id_user` = '"+id_user+"' AND `id_champion` = '"+name+"';";
                    db.sendQuery(request);
                }else {

                    request = "INSERT INTO `panier` (`id_user`, `id_champion`,`quantite`) VALUES ('" + id_user + "', '" + name + "','1');";
                    db.sendQuery(request);

                }
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
