<%-- 
    Document   : cadastro
    Created on : 30 de abr. de 2025, 11:52:50
    Author     : Matheus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="WEB-INF/jspf/html_head_libs.jspf" %>
    </head>
    <body class="d-flex flex-column align-items-center justify-content-center min-vh-100">
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="shadow-lg p-5 m-5 rounded-5" style="aspect-ratio: 3/4; max-width: 450px; height: auto;">

          <form>
            <div class="form-floating mb-3">
              <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
              <label for="floatingInput">Email</label>
              <div id="emailHelp" class="form-text">Não iremos compartilhar seu email com ninguém.</div>
            </div>
            <div class="form-floating mb-3">
              <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
              <label for="floatingPassword">Senha</label>
            </div>
            <button type="submit" class="btn btn-dark">Cadastre-se</button>
          </form>
        </div>
          
        <%@include file="WEB-INF/jspf/html_body_libs.jspf" %>
    </body>
</html>
