package web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.ExercicioDAO;

import java.io.IOException;

@WebServlet(name = "ExcluirExercicioServlet", urlPatterns = {"/excluir-exercicio"})
public class ExcluirExercicioServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        HttpSession session = request.getSession();
        
        if (idStr != null && session.getAttribute("usuario") != null) {
            int id = Integer.parseInt(idStr);
            ExercicioDAO dao = new ExercicioDAO(getServletContext());
            try {
                dao.excluirExercicio(id);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("index.jsp");
    }
}
