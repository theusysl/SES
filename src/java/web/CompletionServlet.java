package web;

import ai.Gemini;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Exercicio;
import model.ExercicioDAO;
import model.Usuario;

@WebServlet(name = "CompletionServlet", urlPatterns = {"/completion"})
public class CompletionServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");

        try {
            Usuario userLogado = (Usuario) request.getSession().getAttribute("usuario");
            ExercicioDAO dao = new ExercicioDAO(getServletContext());

            // pega TODOS os exercícios anteriores do user
            List<Exercicio> exerciciosAntigos = dao.listarSalvosPorUsuario(userLogado.getId());

            // junta tudo num só texto pra mandar no prompt
            StringBuilder enunciadosAnteriores = new StringBuilder();
            for (Exercicio ex : exerciciosAntigos) {
                enunciadosAnteriores.append("- ").append(ex.getEnunciado()).append("\n");
            }

            // prompt pancada 👇
            String prompt = """
                gere um enunciado claro e objetivo de exercício de lógica de programação para alunos iniciantes. 
                o exercício deve envolver raciocínio lógico e estruturas básicas como variáveis, condicionais, repetições, etc.
                seja direto no enunciado e não explique a solução.

                NÃO repita nenhum enunciado da lista abaixo. todos esses já foram usados antes e devem ser evitados:

                """ + enunciadosAnteriores.toString();

            // manda pra IA
            String resposta = Gemini.getCompletion(prompt).trim();

            // se ainda não existe, salva como descartado
            boolean existe = dao.enunciadoExiste(resposta);
            if (!existe) {
                dao.salvarExercicio(userLogado.getId(), resposta, true);
            }

            request.setAttribute("resposta", resposta);
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } catch (Exception ex) {
            request.setAttribute("erro", ex.getMessage());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}