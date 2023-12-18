package com.example.webapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.mail.internet.MimeMessage;
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
        String insertQuery = "INSERT INTO " + databaseUtils.getDatabase() + ".user (email, password, nom, prenom,role,solde) VALUES ('" + username + "', '" + password + "', '" + name + "', '" + firstname + "', 0,0)";

        //check for error
        try {

            ResultSet result = databaseUtils.sendQuery(checkQuery);

            if(result.next()) {
                resp.getWriter().write("<script>alert('Email already used');</script>");
                req.getRequestDispatcher("/inscription.jsp").forward(req, resp);
                return;
            }

            databaseUtils.sendQuery(insertQuery);
            String select = "SELECT * FROM "+databaseUtils.getDatabase()+".user WHERE email = '" + username + "'";
            result=databaseUtils.sendQuery(select);
            if(result.next()){
                String id = result.getString("id");
                String query = "INSERT INTO "+databaseUtils.getDatabase()+".permissions VALUES ('"+id+"',0,0,0,0)";
                databaseUtils.sendQuery(query);
            }
            //if no error, send email
            String subject = "Welcome to the League of Legends shop";
            String content = "Welcome to the League of Legends shop, " + name + " " + firstname + " !";

            MailUtils.sendMail(subject, content, username);


            databaseUtils.closeConnection();
            req.getSession().setAttribute("logged", "false");
            req.getRequestDispatcher("/connexion.jsp").forward(req, resp);

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
