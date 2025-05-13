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
        <title>AIBOOK</title>
        <%@include file="WEB-INF/jspf/html_head_libs.jspf" %>
    </head>
    <body class="d-flex flex-column align-items-center justify-content-center min-vh-100">
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="shadow-lg p-5 m-5 rounded-5" style="aspect-ratio: 3/4; max-width: 600px; height: 80vh;">
            <%@include file="WEB-INF/jspf/aibook_display.jspf" %>

            <div class="m-3 w-auto" x-data="projetos()" x-init="loadProjetos()">
            <form>
                <div class="mt-3 mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Título do Ebook</label>
                    <input type="text" class="form-control" id="exampleFormControlInput1" x-model="newProjetoTitle">
                </div>
                <div class="mt-3 mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">Descrição do Ebook</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1"
                              rows="4" style="resize: none;"></textarea>
                </div>
                <div class="mt-3 mb-3">
                    <label for="exampleFormSelect1" class="form-label">Tipo de Ebook</label>
                    <select class="form-select" aria-label="Default select example">
                        <option value="1">Guia ou Manual</option>
                        <option value="2">Estudo de Caso</option>
                        <option value="3">Compilados de artigos</option>
                        <option value="4">Atividades e exercícios</option>
                        <option value="5">WorkBook</option>
                        <option value="outro">Outros</option>
                    </select>
                </div>
            </form>
            <button type="button" class="btn btn-dark d-block mx-auto" x-on:click="addProjeto()">Gerar Ebook</button>
            </div>

            
        </div>

        <%@include file="WEB-INF/jspf/html_body_libs.jspf" %>
    </body>
    <script> // script pra descrição aumentar até 6 linhas de tamanho e adicionar o scroll quando o texto exceder o tamanho da area
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
