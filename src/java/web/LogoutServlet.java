package web;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "LogoutServlet", urlPatterns = {"/logout"})
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false); // pega sessão se tiver
        if (session != null) {
            session.invalidate(); // derruba a sessão
        }
        res.sendRedirect("login.jsp"); // volta pro login
    }
}