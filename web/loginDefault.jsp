<%-- 
    Document   : login
    Created on : 09/12/2020, 15:46:18
    Author     : User
--%>

<%@page import="Modelos.Usuario"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login AgendaFinanceira</title>
        <link rel="stylesheet" href="style/estilos.css">
        <style>
            div{
                display: block;
                width: 300px;
                margin-left: auto;
                margin-right: auto;
            }
        </style>
    </head>
    <body>
        <div>
            <h1>Tela de Login Default</h1>
            <form action="loginDefault.jsp" method="POST">
                <label>Usuario</label><br/>
                <input type="text" name="usuario" /> <br/>
                <label>Senha</label><br/>
                <input type="password" name="senha" /> <hr/>
                <input type="submit" value="Logar" />  
                <a href="index.html"><input type="button" value="Cancelar" /><a/>
            </form>        
        </div>   
        <%
            String usuarioEsperado = "entra21";     // usuario autorizado para manutenção
            String usuario = request.getParameter("usuario");
            String senha = request.getParameter("senha");
  
            if ((usuario != null) && (senha != null) && !(usuario.isEmpty())
                    && !(senha.isEmpty())) {
                if (Usuario.podeLogar(usuario, senha)) {
                    if (usuario == usuarioEsperado) {
                        response.sendRedirect("consultaCategoriaDefault.jsp");
                    } else {
                        String msg = "Usuario não Autorizado na Manutenção!";
                        response.sendRedirect("informacao.jsp?msg=" + msg);
                    }
                }
            }
        %>
    </body>
</html>
