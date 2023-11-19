package com.example.webapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

@WebServlet(name = "AchatServlet", value = "/achat")
public class AchatServlet extends HttpServlet {

    public AchatServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("champName");
        String id_user = (String) req.getSession().getAttribute("id");

        //check if id_user is null
        if (id_user == null) {
            //ask for connection
            resp.sendRedirect("connexion.jsp");
            return;
        }

        try {
            DatabaseUtils db = new DatabaseUtils();
            String reqSQL = "select * from panier join champions on id_champion = name where id_user = " + id_user;
            ResultSet resultSet = db.sendQuery(reqSQL);

            //for each row in the result set add the champ to achat table and remove it from panier table
            while(resultSet.next()){
                String id_champion = resultSet.getString("id_champion");
                int quantite = resultSet.getInt("quantite");
                int prix = resultSet.getInt("prix");
                Date date = Date.valueOf(LocalDate.now());
                System.out.println(date);
                String insertReq = "insert into achat (id_user,id_champion,quantite,prix,date) values ("+id_user+",'"+resultSet.getInt("idchampions")+"',"+quantite+","+prix+","+ date.toString() +")";
                db.sendQuery(insertReq);

                String deleteReq = "delete from panier where id_user = " + id_user + " and id_champion = '" + id_champion + "'";
                db.sendQuery(deleteReq);

            }

            db.closeConnection();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        req.getRequestDispatcher("index.jsp").forward(req, resp);

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
