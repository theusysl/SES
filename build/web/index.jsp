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
        <link rel="icon" type="image/x-icon" href="images/logo_abngpt.png">
        <%@include file="WEB-INF/jspf/html_head_libs.jspf" %>
    </head>
    <body class="d-flex flex-column align-items-center justify-content-center min-vh-100">
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="shadow-lg p-5 m-5 rounded-5" style="aspect-ratio: 3/4; max-width: 600px; height: 80vh;">
            <%@include file="WEB-INF/jspf/abngpt_display.jspf" %>

            <div class="m-3 w-auto">
            <form>
                <div class="mt-3 mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Título do projeto</label>
                    <input type="text" class="form-control" id="exampleFormControlInput1">
                </div>
                <div class="mt-3 mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">Descrição do projeto</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1"
                              rows="4" style="resize: none;"></textarea>
                </div>
                <div class="mt-3 mb-3">
                    <label for="exampleFormSelect1" class="form-label">Tipo de projeto</label>
                    <select class="form-select" aria-label="Default select example">
                        <option value="1">TCC</option>
                        <option value="2">Artigo</option>
                        <option value="3">Dissertação</option>
                        <option value="outro">Outro</option>
                    </select>
                </div>
                <div id="outroProjetoContainer" class="mt-3 mb-3" style="display: none;">
                    <label for="outroProjetoInput" class="form-label">Descreva o tipo de projeto</label>
                    <input type="text" class="form-control" id="outroProjetoInput" name="outroProjeto" placeholder="Digite aqui...">
                </div>                
            </form>
            <button type="submit" class="btn btn-dark d-block mx-auto">Enviar</button>
            </div>

            
        </div>

        <%@include file="WEB-INF/jspf/html_body_libs.jspf" %>
    </body>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const select = document.getElementById('exampleFormSelect1');
            const outroContainer = document.getElementById('outroProjetoContainer');
    
            select.addEventListener('change', function () {
                if (this.value === 'outro') {
                    outroContainer.style.display = 'block';
                } else {
                    outroContainer.style.display = 'none';
                }
            });
        });

        const textarea = document.getElementById('exampleFormControlTextarea1');
    
        textarea.addEventListener('input', function () {
            this.style.height = 'auto';
    
            const maxRows = 6;
            const lineHeight = parseInt(window.getComputedStyle(this).lineHeight);
            const paddingTop = parseInt(window.getComputedStyle(this).paddingTop);
            const paddingBottom = parseInt(window.getComputedStyle(this).paddingBottom);
    
            const maxHeight = (lineHeight * maxRows) + paddingTop + paddingBottom;
            const scrollHeight = this.scrollHeight;
    
            // ajusta a altura até o limite
            this.style.height = Math.min(scrollHeight, maxHeight) + 'px';
    
            // só mostra scroll se passar das 6 linhas
            if (scrollHeight > maxHeight) {
                this.style.overflowY = 'auto';
            } else {
                this.style.overflowY = 'hidden';
            }
        });
    </script>
</html>
