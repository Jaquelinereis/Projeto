<%-- 
    Document   : informacao
    Created on : 10 de dez de 2020, 11:20:15
    Author     : entra21
--%>

<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            div{
                display: block;
                width: 300px;
                margin:auto;
                margin-top: 100px;
            }
            p{
                color: blue;
                font-size: 30px;
            }
        </style>
    </head>
    <body>
        <div>
            <a href="index.html"><img src="imagens/home.png" width="100px" height="100px"/></a> 
            <hr />
            <img src="imagens/informacao.jfif" width="100px" height="100px"/> 
            <p>
                <%
                    out.write(request.getParameter("msg"));
                %>
            </p> 
        </div>  

    </body>
</html>
