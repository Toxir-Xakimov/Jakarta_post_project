package org.example.project_post_jakarta.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.project_post_jakarta.entity.Post;
import org.example.project_post_jakarta.service.LikeResult;
import org.example.project_post_jakarta.service.LikeService;
import org.example.project_post_jakarta.service.PostService;
import org.example.project_post_jakarta.service.ViewService;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "HomeServlet", urlPatterns = "/")
public class HomeServlet extends HttpServlet {

    PostService postService = PostService.getInstance();
    LikeService likeService = LikeService.getInstance();
    ViewService viewService = ViewService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Integer id = null;

        if (req.getSession() != null && req.getSession().getAttribute("id") != null) {
            id = (int) req.getSession().getAttribute("id");
        }

        req.setAttribute("global",postService.getGlobal());

        List<Post> global = postService.getGlobal();
        Map<Integer, LikeResult> resForPosts = likeService.getResForPosts(postService.getGlobal(), id);

        Map<Integer, Long> postViews = viewService.getPostViews(global);

        req.setAttribute("likeResults", resForPosts);
        req.setAttribute("viewCount", postViews);
        req.getRequestDispatcher("/views/home.jsp").forward(req,resp);
    }


}
