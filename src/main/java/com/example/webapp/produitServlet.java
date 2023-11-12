package com.example.webapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;

import java.io.IOException;

@WebServlet(name = "produitServlet", value = "/produit")
public class produitServlet extends HttpServlet {

    public produitServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("produitServlet doGet");

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
