<%-- 
    Document   : consultaUsuario
    Created on : 18/12/2020, 08:32:04
    Author     : entra21
--%>

<%@page import="java.util.List"%>
<%@page import="Modelos.Usuario"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
        <link rel="stylesheet" href="style/estilos2.css">
        <style>
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 70%;
            }
            td, th {
                border: 1px solid #B0E0E6;
                text-align: center;
                padding: 7px;
            }
            tr:nth-child(even) {
                background-color: #B0E0E6;
            }
        </style>
        </head>
    <body>
        <%
            //verifica sessão
            int idUser = 0;
            String usuario = (String) session.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } else {
                idUser = (int) session.getAttribute("idUser");
            }
        %>
        <header>
            <!--<script src="scripts/cabecalho.js" ></script>-->
        </header>
        <section>
        <nav>
            <!--<script src="scripts/menu.js" > </script>-->
        </nav>
        <article>
         <h1>Consulta Usuario</h1>
         <hr />
        <%
           Usuario u = new Usuario();
           u = u.consultar(idUser);
           
        %>
        <table>
            <thead>
                <th>Id</th>
                <th>Nome</th>
                <th>Cpf</th>
                <th>Data de Nascimento</th>
                <th>Telefone</th>
                <th>Cep</th>
                <th>Endereço</th>
                <th>Bairro</th>
                <th>Cidade</th>
                <th>Estado</th>
                <th>E-mail</th>
                <th>Senha</th>
            </thead> 
            <tbody>
                <%if (u != null) {%>
                    <tr>
                    <td><% out.write(""+u.getIdUser());%></td>      
                    <td><% out.write(u.getNome());%></td>
                    <td><% out.write(u.getCpf());%></td>
                    <td><% out.write(String.valueOf(u.getDataNasc()));%></td>
                    <td><% out.write(u.getFone());%></td>
                    <td><% out.write(u.getCep());%></td>
                    <td><% out.write(u.getEndereco());%></td>
                    <td><% out.write(u.getBairro());%></td>
                    <td><% out.write(u.getCidade());%></td>
                    <td><% out.write(u.getUf());%></td>
                    <td><% out.write(u.getEmail());%></td>
                    <td><% out.write(u.getSenha());%></td> 
                    </tr>
                <%}%>
            </tbody>             
        </table>
        <p><a href="editarUsuario.jsp">Clique <strong>aqui</strong> para Alterar alguma informação!</a></p>
        </article>
        </section>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>   
    </body>
</html>
