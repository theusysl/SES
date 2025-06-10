<%@ page import="java.util.*, model.Usuario" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario userLogado = (Usuario) session.getAttribute("usuario");

    if (userLogado == null || !userLogado.isAdmin()) {
%>
    <h2>acesso negado</h2>
    <a href="index.jsp" class="btn btn-dark">Sair</a>
<%
    } else {
        List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="WEB-INF/jspf/html_head_libs.jspf" %>
    <title>painel admin</title>
</head>
<body>
<%@include file="WEB-INF/jspf/header.jspf" %>

<div class="container-fluid"  style="padding: 60px 0px 0px 0px">
    <div class="container m-4">
    <h1>painel admin</h1>
    <p>logado como: <%= userLogado.getNome() %> (<%= userLogado.getEmail() %>)</p>

    <table class="table table-hover">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Role</th>
        </tr>
        <%
            if (usuarios != null) {
                for (Usuario u : usuarios) {
        %>
            <tr>
                <td><%= u.getId() %></td>
                <td><%= u.getNome() %></td>
                <td><%= u.getEmail() %></td>
                <td><%= u.isAdmin() ? "admin" : "user" %></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr><td colspan="4">nenhum usuário encontrado</td></tr>
        <%
            }
        %>
    </table>
    <a href="index.jsp" class="btn btn-dark">index</a>
    </div>
</div>

<%@include file="WEB-INF/jspf/html_body_libs.jspf" %>
</body>
</html>
<%
    }
%>
