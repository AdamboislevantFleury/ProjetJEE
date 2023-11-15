/*
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
public class UpdateProfile extends HttpServlet {

    public UpdateProfile() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String newEmail = req.getParameter("newEmail");
        String newPassword = req.getParameter("newPassword");
        String id = (String)req.getSession().getAttribute("id");

        System.out.println(newEmail+" "+newPassword);

       // Vérifier si l'utilisateur est connecté
        if (id == null) {
            resp.sendRedirect("login.jsp");
        } else {
            try {
                DatabaseUtils databaseUtils = DatabaseUtils.getInstance();
                // Mettre à jour l'email de l'utilisateur dans la base de données
                String query = "UPDATE email,password SET email = "+newEmail+" AND password = "+newPassword+" WHERE id = "+id;
                ResultSet resultSet = null;
                resultSet = databaseUtils.sendQuery(query);

            } catch (Exception e) {
                System.out.println(e.toString());
            }
        }
        super.doPost(req, resp);

    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
*/

