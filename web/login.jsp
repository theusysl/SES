<%-- 
    Document   : login
    Created on : 29 de abr. de 2025, 15:24:23
    Author     : Fatec
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ABNGPT</title>
        <%@include file="WEB-INF/jspf/html_head_libs.jspf" %>
    </head>
    <body class="d-flex flex-column align-items-center justify-content-center min-vh-100">
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="shadow-lg p-5 m-5 rounded-5" style="aspect-ratio: 3/4; max-width: 450px; height: auto;">
          <%@include file="WEB-INF/jspf/aibook_display.jspf" %>

          <form>
            <div class="form-floating mb-3">
              <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
              <label for="floatingInput">Email</label>
              <div id="emailHelp" class="form-text">Não iremos compartilhar seu email com ninguém.</div>
            </div>
            <div class="form-floating mb-3">
              <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
              <label for="floatingPassword">Senha</label>
              <div id="passwordHelp" class="form-text"><a href="#" class="link-body-emphasis link-offset-2 link-underline-opacity-25 link-underline-opacity-75-hover">Esqueci a senha</a></div>
            </div>
            <div class="mt-4 mb-4 form-check">
              <input type="checkbox" class="form-check-input" id="exampleCheck1">
              <label class="form-check-label" for="exampleCheck1">Lembrar de mim</label>
            </div>
            <button type="submit" class="btn btn-dark">Login</button>
            <a class="btn btn-dark" href="cadastro.jsp" role="button">Cadastre-se</a>
          </form>
        </div>
    </body>
</html>
