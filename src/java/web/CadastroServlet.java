package web;

import model.Usuario;
import model.UsuarioDAO;
import java.io.IOException;
import java.security.MessageDigest;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "CadastroServlet", urlPatterns = {"/cadastro"})
public class CadastroServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String nome = req.getParameter("nome");
            String email = req.getParameter("email");
            String senha = hash(req.getParameter("senha"));
            String role = "user";

            UsuarioDAO dao = new UsuarioDAO(getServletContext());
            
            // antes de inserir, pode até checar se já existe email
            Usuario userExistente = dao.buscarPorEmail(email);
            if (userExistente != null) {
                req.setAttribute("erro", "Email já cadastrado");
                req.getRequestDispatcher("cadastro.jsp").forward(req, res);
                return;
            }
            
            Usuario novoUser = new Usuario(0, nome, email, senha, role);
            dao.inserirUsuario(novoUser);

            res.sendRedirect("login.jsp");

        } catch (Exception e) {
            req.setAttribute("erro", e.getMessage());
            req.getRequestDispatcher("cadastro.jsp").forward(req, res);
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