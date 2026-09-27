package org.example.project_post_jakarta.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.project_post_jakarta.service.PostService;

import java.io.IOException;


@WebServlet(name = "UpdatePostServlet", urlPatterns = "/updt/*")
public class UpdatePostServlet extends HttpServlet {

    PostService postService = PostService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();

        int id = Integer.parseInt(pathInfo.substring(1));

        req.setAttribute("post", postService.findById(id).get());

        req.getRequestDispatcher("/views/user/update.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String pathInfo = req.getPathInfo();

        int id = Integer.parseInt(pathInfo.substring(1));

        String title = req.getParameter("title");
        String content = req.getParameter("content");

        postService.update(id, title, content);
        resp.sendRedirect(req.getContextPath()+"/my_uploads");
    }
}
