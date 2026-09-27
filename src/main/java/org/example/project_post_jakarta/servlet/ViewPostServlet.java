package org.example.project_post_jakarta.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.project_post_jakarta.dto.PostDTO;
import org.example.project_post_jakarta.entity.Post;
import org.example.project_post_jakarta.service.LikeResult;
import org.example.project_post_jakarta.service.LikeService;
import org.example.project_post_jakarta.service.PostService;
import org.example.project_post_jakarta.service.ViewService;

import java.io.IOException;
import java.util.Optional;


@WebServlet(name = "ViewPostServlet", urlPatterns = "/view/*")
public class ViewPostServlet extends HttpServlet {

    PostService postService = PostService.getInstance();
    LikeService likeService = LikeService.getInstance();
    ViewService viewService = ViewService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int postId = Integer.parseInt(req.getPathInfo().substring(1));


        Integer id = null;

        if (req.getSession() != null && req.getSession().getAttribute("id") != null) {
            id = (int) req.getSession().getAttribute("id");

            viewService.save(id, postId);
        }


        Optional<Post> byId = postService.findById(postId);
        Post post = byId.get();

        LikeResult likeResult = new LikeResult(likeService.exists(id, postId), likeService.likeCountByPostId(postId));

        req.setAttribute("viewCount", viewService.getPostViewCountByPostId(postId));
        req.setAttribute("post", post);
        req.setAttribute("likeResult", likeResult);
        req.getRequestDispatcher("/views/detailed_post.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
