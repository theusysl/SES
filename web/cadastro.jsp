<%-- 
    Document   : cadastro
    Created on : 30 de abr. de 2025, 11:52:50
    Author     : Matheus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Usuario" %>
<%
    Usuario userLogado = (Usuario) session.getAttribute("usuario");
%>

<!DOCTYPE html>

<html>
    <head>
        <%@include file="WEB-INF/jspf/html_head_libs.jspf" %>
    </head>
    <body class="d-flex flex-column align-items-center justify-content-center min-vh-100">
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="shadow-lg p-5 m-5 rounded-5" style="aspect-ratio: 3/4; max-width: 450px; height: auto;">

          <form method="post" action="cadastro">
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatingName" name="nome" placeholder="Apelido" required>
              <label for="floatingName">Apelido</label>
            </div>
            <div class="form-floating mb-3">
              <input type="email" class="form-control" id="floatingInput" name="email" placeholder="nome@exemplo.com" required>
              <label for="floatingInput">Email</label>
              <div id="emailHelp" class="form-text">Não iremos compartilhar seu email com ninguém.</div>
            </div>
            <div class="form-floating mb-3">
              <input type="password" class="form-control" id="floatingPassword" name="senha" placeholder="Senha" required>
              <label for="floatingPassword">Senha</label>
            </div>
            <button type="submit" class="btn btn-dark">Cadastrar</button>
          </form>
                
          <% if (request.getAttribute("erro") != null) { %>
              <div class="alert alert-danger"><%= request.getAttribute("erro") %></div>
          <% } %>
        </div>
          
        <%@include file="WEB-INF/jspf/html_body_libs.jspf" %>
    </body>
</html>
