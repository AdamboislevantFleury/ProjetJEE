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
    private String mysqlDriver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://i1i7nk6d2r6ujwjh:gcmjbobuqrl61m0z@i54jns50s3z6gbjt.chr7pe7iynqr.eu-west-1.rds.amazonaws.com:3306/aemu3k287ijuu5wv";
    private String user = "i1i7nk6d2r6ujwjh";
    private String password = "gcmjbobuqrl61m0z";
    private String database = "aemu3k287ijuu5wv";

    public produitServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("produitServlet doGet");

        int pageID = req.getParameter("pageID") != null ? Integer.parseInt(req.getParameter("pageID")) : 1;

        try {
            Class.forName(mysqlDriver);
            Connection connection = DriverManager.getConnection(url);

            System.out.println("Connected to PostgreSQL database!");

            //select all rows in the table and print them
            String sql = "SELECT * FROM " + database + ".champions LIMIT 10 OFFSET " + (pageID - 1) * 10;
            java.sql.Statement statement = connection.createStatement();
            java.sql.ResultSet resultSet = statement.executeQuery(sql);

            //if result is not null
            JSONObject championsList = new JSONObject();
            while (resultSet.next()) {

                JSONObject championData = new JSONObject();
                championData.put("name", resultSet.getString("name"));
                championData.put("role", resultSet.getString("role"));
                championData.put("description", resultSet.getString("description"));
                championData.put("image_url", resultSet.getString("image_url"));
                championData.put("prix", resultSet.getString("prix"));
                championData.put("titre", resultSet.getString("titre"));
                championData.put("lane", resultSet.getString("lane"));

                championsList.put(resultSet.getString("name"), championData);

            }

            resp.setHeader("champions", championsList.toString());

        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        req.getRequestDispatcher("produit.jsp").forward(req, resp);
        System.out.println("produitServlet doGet end");
        super.doGet(req, resp);

    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
