<%-- 
    Document   : index
    Created on : 29 de abr. de 2025, 11:33:28
    Author     : Matheus
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
        <h1 class="display-1 mb-5">ABNGPT</h1>
        
        <div class="m-3 w-25">
            <div class="mt-3 mb-3">
                <label for="exampleFormControlInput1" class="form-label">Título do projeto</label>
                <input type="text" class="form-control" id="exampleFormControlInput1">
            </div>
            <div class="mt-3 mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">Descrição do projeto</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
            </div>
        </div>
        
        <%@include file="WEB-INF/jspf/html_body_libs.jspf" %>
    </body>
</html>
