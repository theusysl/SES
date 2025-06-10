package web;

import ai.Gemini;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CorrigirRespostaServlet", urlPatterns = {"/corrigir-resposta"})
public class CorrigirRespostaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String codigo = request.getParameter("codigo");
        String enunciado = (String) request.getSession().getAttribute("resposta");

        String prompt = "analise o código abaixo escrito pelo usuário. identifique automaticamente a linguagem de programação utilizada. verifique se a lógica aplicada resolve corretamente o exercício proposto, e analise também a sintaxe da linguagem utilizada.\n" +
                        "\n" +
                        "importante:\n" +
                        "\n" +
                        "não forneça a solução correta nem sugestões de como consertar o código.\n" +
                        "\n" +
                        "apenas diga se o código está certo ou errado e explique o motivo (se houver erro).\n" +
                        "\n" +
                        "a explicação deve ser clara, objetiva e sem entregar a solução.\n" +
                        "\n" +
                        "evite repetições desnecessárias.\n" +
                        "\n" +
                        "exercício proposto:\n" +
                        enunciado +
                        "\n" +
                        "código do usuário:\n" +
                        "\n" +
                        codigo;

        if (enunciado == null || codigo == null) {
            request.setAttribute("erro", "Código ou enunciado ausente. Gere um exercício primeiro.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        try {
            String correcao = Gemini.getCompletion(prompt);
            request.setAttribute("resposta", enunciado); // pra manter o enunciado
            request.setAttribute("correcao", correcao);   // exibe o feedback da IA
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception ex) {
            request.setAttribute("erro", "Erro ao corrigir: " + ex.getMessage());
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}