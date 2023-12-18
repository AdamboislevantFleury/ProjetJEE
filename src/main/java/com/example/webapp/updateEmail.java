package com.example.webapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.ResultSet;

import static java.lang.System.out;

@WebServlet(name = "updateEmail", value = "/updateEmail")
public class updateEmail extends HttpServlet {
    public updateEmail() {
        super();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String newEmail = request.getParameter("newEmail");
        String id = (String)request.getSession().getAttribute("id");

        // Vérifier si l'utilisateur est connecté
        if (id == null) {
            response.sendRedirect("connexion.jsp");
        } else {
            try {
                DatabaseUtils databaseUtils = DatabaseUtils.getInstance();
                String query = "SELECT email FROM "+databaseUtils.getDatabase()+".user WHERE id = " + id;
                ResultSet resultSet = null;
                resultSet = databaseUtils.sendQuery(query);
                if(resultSet.next()){
                    String oldEmail = resultSet.getString("email");
                    if(!newEmail.equals(oldEmail)){
                        query = "UPDATE "+databaseUtils.getDatabase()+".user SET email = '" + newEmail + "' WHERE id = " + id;
                        databaseUtils.sendQuery(query);
                        request.getSession().setAttribute("logged", "false");
                        request.getRequestDispatcher("/connexion.jsp").forward(request, response);
                    }
                    else{
                        out.println("les adresses mail doivent être différentes");
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
