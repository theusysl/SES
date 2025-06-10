package web;

import java.io.IOException;
import java.net.URLEncoder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ExercicioDAO;
import model.Usuario;

@WebServlet(name = "SalvarExercicioServlet", urlPatterns = {"/salvar-exercicio"})
public class SalvarExercicioServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Usuario user = (Usuario) request.getSession().getAttribute("usuario");
        String enunciado = request.getParameter("enunciado");

        if (user != null && enunciado != null && !enunciado.trim().isEmpty()) {
            ExercicioDAO dao = new ExercicioDAO(getServletContext());
            
            // marca como salvo (descartado = false)
            dao.marcarComoSalvo(user.getId(), enunciado);
        }

        // só redireciona se tiver enunciado pra mostrar
        if (enunciado != null && !enunciado.trim().isEmpty()) {
            String encodedEnunciado = URLEncoder.encode(enunciado, "UTF-8");
            response.sendRedirect("index.jsp?resposta=" + encodedEnunciado);
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
