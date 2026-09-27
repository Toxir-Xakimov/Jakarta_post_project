package org.example.project_post_jakarta.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.project_post_jakarta.dto.PostDTO;
import org.example.project_post_jakarta.service.PostService;

import java.io.IOException;


@WebServlet(name = "CreatePostServlet", urlPatterns = "/create")
public class CreatePostServlet extends HttpServlet {

    PostService postService = PostService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/user/create.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        int user_id = Integer.parseInt(req.getParameter("user_id"));

        postService.save(new PostDTO(title, content, user_id));
        resp.sendRedirect(req.getContextPath()+"/my_uploads");
    }
}
