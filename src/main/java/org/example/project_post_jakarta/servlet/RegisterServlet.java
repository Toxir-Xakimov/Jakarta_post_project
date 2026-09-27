package org.example.project_post_jakarta.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.project_post_jakarta.dto.RegisterDTO;
import org.example.project_post_jakarta.service.AuthService;

import java.io.IOException;


@WebServlet(name = "RegisterServlet", urlPatterns = "/reg")
public class RegisterServlet extends HttpServlet {


    AuthService authService = AuthService.getInstance();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/reg.jsp").forward(req,resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullname = req.getParameter("fullname");
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        boolean reg = authService.reg(new RegisterDTO(fullname, username, password));

        if ( !reg ) resp.sendError(400,"username already exists (try creating another username)");

        resp.sendRedirect(req.getContextPath()+"/login");
    }
}
