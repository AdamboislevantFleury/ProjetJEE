package com.example.webapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "createArticlePageServlet", value = "/page-article")
public class CreateArticlePageServlet extends HttpServlet {

    String champName;
    public void init() {
        System.out.println("CreateArticlePageServlet init");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        champName = req.getParameter("champName");

        PrintWriter out = resp.getWriter();
        resp.setHeader("Title", champName);
        req.getRequestDispatcher("pageArticle.jsp").forward(req, resp);

    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
