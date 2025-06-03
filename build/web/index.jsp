<%-- 
    Document   : index
    Created on : 29 de abr. de 2025, 11:33:28
    Author     : Matheus
--%>
<%@page import="ai.Gemini"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    if(request.getParameter("invoke")!=null){
        try{
            String prompt = request.getParameter("prompt");
            request.setAttribute("completion", Gemini.getCompletion(prompt));
        }catch(Exception ex){
            request.setAttribute("error", ex.getMessage());
        }
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
                            <% if(request.getAttribute("error") != null) { %>
                            <p>ERRO: <%= request.getAttribute("error") %></p>
                            <% } else if(request.getAttribute("completion") != null) { %>
                            <div><%= request.getAttribute("completion") %></div>
                            <% } %>

                            <input class="btn btn-dark mt-auto" type="submit" name="invoke" value="Enviar"/>

                        </div>
                    </div>
                </div>
                <div class="col-sm-6" style="height: 100%; padding: 50px 50px 50px 25px">
                    <div class="card shadow rounded-4 border-0 h-100">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title">Solução</h5>
                            <p class="card-text">Digite seu código aqui.</p>
                            <div class="form-floating flex-grow-1">
                                <textarea class="form-control h-100" placeholder="Leave a comment here" style="resize: none;"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="WEB-INF/jspf/html_body_libs.jspf" %>
    </body>
</html>
