package org.example.project_post_jakarta.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.project_post_jakarta.service.LikeService;
import org.example.project_post_jakarta.service.PostService;

import java.io.IOException;


@WebServlet(name = "LikeServlet", urlPatterns = "/like/*")
public class LikeServlet extends HttpServlet {

    PostService postService = PostService.getInstance();
    LikeService likeService = LikeService.getInstance();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = (int) req.getSession().getAttribute("id");
        int post_id = Integer.parseInt(req.getPathInfo().substring(1));

        likeService.toggleLike(id, post_id);

        String referer = req.getHeader("Referer");

        if ( referer != null && !referer.isBlank() ) {
            resp.sendRedirect(referer);
        }else {
            resp.sendRedirect(req.getContextPath()+"/");
        }
    }
}
