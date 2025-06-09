package web;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Usuario;
import model.UsuarioDAO;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminServlet", urlPatterns = {"/admin"})
public class AdminServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        Usuario logado = (Usuario) session.getAttribute("usuario");

        if (logado == null || !logado.isAdmin()) {
            res.sendRedirect("login.jsp");
            return;
        }

        try {
            UsuarioDAO dao = new UsuarioDAO(getServletContext());
            List<Usuario> lista = dao.listarUsuarios();

            req.setAttribute("usuarios", lista);
            req.getRequestDispatcher("admin.jsp").forward(req, res);

        } catch (Exception e) {
            req.setAttribute("erro", e.getMessage());
            req.getRequestDispatcher("erro.jsp").forward(req, res);
        }
    }
}