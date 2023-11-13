package com.example.webapp;

import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@WebServlet(name = "produitServlet", value = "/produit")
public class produitServlet extends HttpServlet {

    private String url = "jdbc:postgresql://db.cvtaxdfnhdyuhqzaxrmk.supabase.co:5432/champions";
    private String user = "postgres";
    private String password = "U2xj7ROoI669A2bq";


    public produitServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("produitServlet doGet");

        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(url, user, password);

            System.out.println("Connected to PostgreSQL database!");


        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }


        JSONObject jsonObject = new JSONObject();
        jsonObject.put("ashe", "ashe");
        jsonObject.put("ahri", "ahri");
        jsonObject.put("trundle", "trundle");
        jsonObject.put("katarina", "katarina");
        jsonObject.put("garen", "garen");
        jsonObject.put("lux", "lux");
        jsonObject.put("zed", "zed");
        jsonObject.put("yasuo", "yasuo");
        jsonObject.put("jinx", "jinx");
        jsonObject.put("senna", "senna");


        resp.setHeader("champions", jsonObject.toString());

        req.getRequestDispatcher("produit.jsp").forward(req, resp);
        super.doGet(req, resp);

    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
