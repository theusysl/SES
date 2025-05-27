<%-- 
    Document   : index
    Created on : 29 de abr. de 2025, 11:33:28
    Author     : Matheus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="WEB-INF/jspf/html_head_libs.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>

        <div class="container-fluid"  style="height: 100vh; padding: 60px 0px 0px 0px">
            <div class="row m-0 h-100">
                <div class="col-sm-6 mb-3 mb-sm-0" style="height: 100%; padding: 50px 25px 50px 50px;">
                    <div class="card h-100">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title">Special title treatment</h5>
                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                            <a href="#" class="btn btn-primary mt-auto">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6" style="height: 100%; padding: 50px 50px 50px 25px">
                    <div class="card h-100">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title">Special title treatment</h5>
                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                            <div class="form-floating flex-grow-1">
                                <textarea class="form-control h-100" placeholder="Leave a comment here" id="floatingTextarea2" style="resize: none;"></textarea>
                                <label for="floatingTextarea2">Comments</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="WEB-INF/jspf/html_body_libs.jspf" %>
    </body>
</html>
