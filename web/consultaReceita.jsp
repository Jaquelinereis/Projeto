<%-- 
    Document   : consultaCategoria
    Created on : 05/01/2021, 15:10:41
    Author     : User
--%>

<%@page import="Modelos.Receita"%>
<%@page import="Modelos.Despesa"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Minha Agenda Financeira</title>
        <link rel="stylesheet" href="style/estilos.css">
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
        <header>
            <script src="scripts/cabecalho.js" ></script>
        </header>
        <section>
        <nav>
        <script src="scripts/menu.js" > </script>
        </nav>
        <article>
    <body>
        <h1>Consulta Receita</h1>
         <hr />
        <%
           Receita receita = new Receita();
           List<Receita> receitas = receita.consultar();
           
        %>
        <table>
        <thead>
        <th>Id</th>
        <th>Descricao</th>
        <th>Valor</th>
        <th>Data</th>
        <th>Excluir</th>
        <th>Editar</th>
        
         </thead> 
         
             
        <tbody>
            <% for(Receita r: receitas) {%>
            <tr>
                <td><% out.write(""+r.getId());%></td>
                <td><% out.write(r.getDescricao());%></td>
                <td><% out.write(String.valueOf(r.getValor()));%></td>
                <td><% out.write(String.valueOf(r.getData()));%></td>
                 
            <td><%out.write("<a href=excluircategoria.jsp?id="+r.getId()+">Excluir</a>");%></td>   
            <td><%out.write("<a href=editarcategoria.jsp?id="+r.getId()+">Editar</a>");%></td>   
            </tr>
            <%}%>
             
        </tbody>
            </table>
            <footer>
            <script src="scripts/rodape.js"></script>
        </footer>   
    </body>
</html>
