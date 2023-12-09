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
import java.util.HashMap;

import static java.lang.System.out;

@WebServlet(name = "editRights", value = "/editRights")
public class editRights extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp){

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String radio = req.getParameter("rights");
        String user = req.getParameter("user");
        HashMap<String,String> map = new HashMap<>();
        String[] s = req.getParameterValues("val");
        if (s != null && s.length != 0) {
            for (int i = 0; i < s.length; i++) {
                if(radio.equals("add")){
                    map.put(s[i],"1");
                }
                else{
                    map.put(s[i],"0");
                }
            }
            Rights r = null;
            try {
                DatabaseUtils db = DatabaseUtils.getInstance();
                String query = "SELECT * FROM "+db.getDatabase()+".user WHERE email = '"+user+"'";
                ResultSet rs = db.sendQuery(query);
                if(rs.next()){
                    String id = rs.getString("id");
                    String email = rs.getString("email");
                    System.out.println("User : " +email + " | id : "+id);
                    r = Rights.getInstance(id);
                    r.setRights(map);
                    //pour éviter que rights pointe vers l'id du user edité (violation du principe de singleton)
                    r = new Rights((String) req.getSession().getAttribute("id")) ;
                }
                db.closeConnection();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        req.getRequestDispatcher("/profile.jsp").forward(req, resp);
    }
}
