<%@ page import="java.util.*, model.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Usuario user = (Usuario) session.getAttribute("usuario");

    if (user == null || !user.isAdmin()) {
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
    <title>painel admin</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #666;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #222;
            color: #fff;
        }
    </style>
</head>
<body>
    <h1>painel admin</h1>
    <p>logado como: <%= user.getNome() %> (<%= user.getEmail() %>)</p>

    <table>
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
</body>
</html>
<%
    }
%>
