<%-- 
    Document   : index
    Created on : 29 de abr. de 2025, 11:33:28
    Author     : Matheus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ai.Gemini"%>
<%@page import="model.Usuario" %>

<!DOCTYPE html>

<%
    // verificar usuario logado
    Usuario userLogado = (Usuario) session.getAttribute("usuario");
    
    // se nao tiver logado joga pra tela de login
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    // ia
    if(request.getParameter("invoke")!=null){
        try{
            String prompt = request.getParameter("prompt");
            request.setAttribute("completion", Gemini.getCompletion(prompt));
        }catch(Exception ex){
            request.setAttribute("error", ex.getMessage());
        }
    }
    
    // 
    if (request.getAttribute("resposta") == null && request.getParameter("resposta") != null) {
        request.setAttribute("resposta", request.getParameter("resposta"));
    }
%>

<html>
    <head>
        <%@include file="WEB-INF/jspf/html_head_libs.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>

        <div class="container-fluid"  style="height: 100vh; padding: 60px 0px 0px 0px">
            <div class="row m-0 h-100">
                <div class="col-sm-6 mb-3 mb-sm-0" style="height: 100%; padding: 50px 25px 50px 50px;">
                    <div class="card shadow rounded-4 border-0 h-100">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title">Exercício</h5>

                            <%
                                String enunciado = (String) request.getAttribute("resposta");
                                boolean temResposta = (enunciado != null);
                            %>

                            <% if (temResposta) { %>
                                <div class="mt-3 flex-grow-1"><%= enunciado %></div>
                            <% } else { %>
                                <div class="flex-grow-1"></div>
                            <% } %>

                            <% if (request.getAttribute("erro") != null) { %>
                                <div class="mt-3 text-danger">erro: <%= request.getAttribute("erro") %></div>
                            <% } %>
                            
                            <% if (request.getAttribute("correcao") != null) { %>
                                <div class="mt-3 p-3 bg-light border rounded">
                                    <strong>Análise da sua resposta:</strong><br>
                                    <p class="m-0"><%= request.getAttribute("correcao") %></p>
                                </div>
                            <% } %>

                            <div class="mt-auto d-flex">
                                <% if (temResposta) { %>
                                    <form action="completion" method="post" class="w-50 me-1">
                                        <button type="submit" class="btn btn-dark w-100">Gerar exercício</button>
                                    </form>
                                    <form action="salvar-exercicio" method="get" class="w-50 ms-1">
                                        <input type="hidden" name="enunciado" value="<%= enunciado.replace("\"", "&quot;") %>">
                                        <button type="submit" class="btn btn-success w-100">Salvar</button>
                                    </form>
                                <% } else { %>
                                    <form action="completion" method="post" class="w-100">
                                        <button type="submit" class="btn btn-dark w-100">Gerar exercício</button>
                                    </form>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6" style="height: 100%; padding: 50px 50px 50px 25px">
                    <div class="card shadow rounded-4 border-0 h-100">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title">Solução</h5>
                            <p class="card-text">Digite seu código aqui.</p>
                            <div class="form-floating flex-grow-1 mb-3">
                                <textarea id="editor" class="form-control" style="display: none;"></textarea>
                                <div id="editor-container" style="height: 100%; border-radius: 12px; overflow: hidden;"></div>
                            </div>
                            <form action="corrigir-resposta" method="post" class="mt-auto">
                                <input type="hidden" name="codigo" id="codigo-hidden">
                                <button type="submit" class="btn btn-dark w-100">Enviar resposta</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="WEB-INF/jspf/html_body_libs.jspf" %>
    </body>
</html>