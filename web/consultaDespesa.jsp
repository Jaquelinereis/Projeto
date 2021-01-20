<%-- 
    Document   : consultaCategoria
    Created on : 05/01/2021, 15:10:41
    Author     : User
--%>

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
        <h1>Consulta Despesa</h1>
         <hr />
        <%
           Despesa despesa = new Despesa();
           List<Despesa> despesas = despesa.consultar();
           
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
            <% for(Despesa d: despesas) {%>
            <tr>
                <td><% out.write(""+d.getId());%></td>
                <td><% out.write(d.getDescricao());%></td>
                <td><% out.write(String.valueOf(d.getValor()));%></td>
                <td><% out.write(String.valueOf(d.getData()));%></td>
                 
            <td><%out.write("<a href=excluircategoria.jsp?id="+d.getId()+">Excluir</a>");%></td>   
            <td><%out.write("<a href=editarcategoria.jsp?id="+d.getId()+">Editar</a>");%></td>   
            </tr>
            <%}%>
             
        </tbody>
            </table>
            <footer>
            <script src="scripts/rodape.js"></script>
        </footer>   
    </body>
</html>
