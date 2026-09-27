package org.example.project_post_jakarta.security;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebFilter(urlPatterns = "/*")
public class MyWebFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;


         String username = (String) req.getSession().getAttribute("username");

        String requestURI = req.getRequestURI();



        String path = req.getRequestURI()
                .substring(req.getContextPath().length());

        // Allow anyone to open a post view.
        if (path.matches("/view/\\d+")) {
            chain.doFilter(request, response);
            return;
        }



        if ( username == null ) {
            if ( requestURI.equals("/login") || requestURI.equals("/") || requestURI.equals("/reg")) {
                chain.doFilter(req, resp);
            }
            else {
                resp.sendRedirect(req.getContextPath()+"/login");
            }
        } else {
                chain.doFilter(req, resp);
            }
    }
}
