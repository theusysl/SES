package web;

import model.Usuario;
import model.UsuarioDAO;
import java.io.IOException;
import java.security.MessageDigest;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String email = req.getParameter("email");
            String senha = hash(req.getParameter("senha"));

            UsuarioDAO dao = new UsuarioDAO(getServletContext());
            Usuario user = dao.buscarPorEmail(email);

            if (user != null && user.getSenha().equals(senha)) {
                HttpSession session = req.getSession();
                session.setAttribute("usuario", user);
                res.sendRedirect("index.jsp");
            } else {
                req.setAttribute("erro", "Login inválido");
                req.getRequestDispatcher("login.jsp").forward(req, res);
            }

        } catch (Exception e) {
            req.setAttribute("erro", e.getMessage());
            req.getRequestDispatcher("login.jsp").forward(req, res);
        }
    }

    private String hash(String senha) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(senha.getBytes("UTF-8"));
        StringBuilder sb = new StringBuilder();
        for (byte b : hash) sb.append(String.format("%02x", b));
        return sb.toString();
    }
}