package org.example.project_post_jakarta.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.project_post_jakarta.dto.PostDTO;
import org.example.project_post_jakarta.service.PostService;

import java.io.IOException;


@WebServlet(name = "DeletePostServlet", urlPatterns = "/remove/*")
public class DeletePostServlet extends HttpServlet {

    PostService postService = PostService.getInstance();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doDelete(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String requestURI = req.getPathInfo();

        int id = Integer.parseInt(requestURI.substring(1));

        postService.remove(id);
        resp.sendRedirect(req.getContextPath()+"/my_uploads");
    }
}
