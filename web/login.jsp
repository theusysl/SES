<%-- 
    Document   : login
    Created on : 29 de abr. de 2025, 15:24:23
    Author     : Fatec
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
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="d-flex flex-column align-items-center justify-content-center min-vh-100">
            <div class="shadow-lg p-5 m-5 rounded-5" style="aspect-ratio: 3/4; max-width: 450px; height: auto;">

            <form method="post" action="login">
              <div class="form-floating mb-3">
                  <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="email" required>
                <label for="floatingInput">Email</label>
                <div id="emailHelp" class="form-text">Não iremos compartilhar seu email com ninguém.</div>
              </div>
              <div class="form-floating mb-3">
                  <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="senha" required>
                <label for="floatingPassword">Senha</label>
                <div id="passwordHelp" class="form-text"><a href="#" class="link-body-emphasis link-offset-2 link-underline-opacity-25 link-underline-opacity-75-hover">Esqueci a senha</a></div>
              </div>
              <div class="mt-4 mb-4 form-check">
                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                <label class="form-check-label" for="exampleCheck1">Lembrar de mim</label>
              </div>
              <button class="btn btn-dark" type="submit">Login</button>
              <a class="btn btn-dark" href="cadastro.jsp" role="button">Cadastre-se</a>
            </form>
                
            <% if (request.getAttribute("erro") != null) { %>
              <div class="alert alert-danger"><%= request.getAttribute("erro") %></div>
            <% } %>

          </div>
        </div>
        
          
        <%@include file="WEB-INF/jspf/html_body_libs.jspf" %>
    </body>
</html>
