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

@WebServlet(name = "MyUploadsServlet", urlPatterns = "/my_uploads")
public class MyUploadsServlet extends HttpServlet {

    PostService postService = PostService.getInstance();
    LikeService likeService = LikeService.getInstance();
    ViewService viewService = ViewService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int user_id = (int) req.getSession().getAttribute("id");
        List<Post> posts = postService.getAll(user_id);

        Map<Integer, LikeResult> resForPosts = likeService.getResForPosts(posts, user_id);

        req.setAttribute("likeResults", resForPosts);
        req.setAttribute("viewCount", viewService.getPostViews(posts));
        req.setAttribute("posts", posts);
        req.getRequestDispatcher("/views/user/my_uploads.jsp")
                .forward(req, resp);
    }

}
