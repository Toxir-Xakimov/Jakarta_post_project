package org.example.project_post_jakarta.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.project_post_jakarta.dto.LoginDTO;
import org.example.project_post_jakarta.dto.LoginSuccessDTO;
import org.example.project_post_jakarta.service.AuthService;

import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {


    AuthService authService = AuthService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        LoginSuccessDTO login = authService.login(new LoginDTO(username, password));

        if ( login == null ) resp.sendError(400, "Username or password is incorrect!(try again)");

        req.getSession().setAttribute("id", login.id());
        req.getSession().setAttribute("role", login.role());
        req.getSession().setAttribute("username", username);
        req.getSession().setMaxInactiveInterval(120);
        resp.sendRedirect("/");
    }
}
