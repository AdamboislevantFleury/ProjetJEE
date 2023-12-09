package com.example.webapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import static java.lang.System.out;

@WebServlet(name="crediter",value ="/crediter")
public class CrediterServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp){

    }
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int solde = Integer.parseInt(req.getParameter("solde"));
            DatabaseUtils db = DatabaseUtils.getInstance();
            String query = "SELECT * FROM "+ db.getDatabase()+".user WHERE id = "+req.getSession().getAttribute("id");
            ResultSet rs = db.sendQuery(query);
            if(rs.next()){
                int solde1 = Integer.parseInt(rs.getString("solde"));
                req.getSession().setAttribute("solde",solde1);
                solde1+=solde;
                query ="UPDATE "+db.getDatabase()+".user SET solde = "+solde1+" WHERE id = "+req.getSession().getAttribute("id");
                db.sendQuery(query);
            }
            db.closeConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("profile.jsp").forward(req,resp);
    }


}
