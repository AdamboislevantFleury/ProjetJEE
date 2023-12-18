package com.example.webapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.ResultSet;

import static java.lang.System.out;

@WebServlet(name = "updatePassword", value = "/updatePassword")
public class updatePassword extends HttpServlet {
    public updatePassword() {
        super();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String newPassword1 = request.getParameter("newPassword1");
        String newPassword2 = request.getParameter("newPassword2");
        String id = (String)request.getSession().getAttribute("id");

        // Vérifier si l'utilisateur est connecté
        if (id == null) {
            response.sendRedirect("connexion.jsp");
        } else {
            try {
                DatabaseUtils databaseUtils = DatabaseUtils.getInstance();
                String query = "SELECT password FROM "+databaseUtils.getDatabase()+".user WHERE id = " + id;
                ResultSet resultSet = null;
                resultSet = databaseUtils.sendQuery(query);
                if(resultSet.next()){
                    String oldPassword = resultSet.getString("password");
                    if(newPassword1.equals(newPassword2)){
                        if(!newPassword1.equals(oldPassword)){
                            query = "UPDATE "+databaseUtils.getDatabase()+".user SET password = '" + newPassword1 + "' WHERE id = " + id;
                            databaseUtils.sendQuery(query);
                            request.getSession().setAttribute("logged", "false");
                            request.getRequestDispatcher("/connexion.jsp").forward(request, response);
                        }
                        else{
                            out.println("le nouveau mot de passe et l'ancien doivent etre différents");
                            request.getRequestDispatcher("/profile.jsp").forward(request, response);
                        }
                    }
                    else{
                        out.println("les mots de passes ne sont pas le memes");
                        request.getRequestDispatcher("/profile.jsp").forward(request, response);
                    }
                }
                databaseUtils.closeConnection();
            }
            catch(Exception e){
                out.println(e.toString());
            }

        }
    }
    @Override
    public void destroy() {
        super.destroy();
    }

}
