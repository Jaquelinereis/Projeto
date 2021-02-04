<%-- 
    Document   : consultaReceita
    Created on : 05/01/2021, 15:10:41
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Modelos.Receita"%>
<%@page import="java.util.List"%>
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
            int idUser = 0;
            //verifica sessão
            String usuario = (String) session.getAttribute("usuario");           
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            } 
            else{
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

                <h1>Consulta Receitas</h1>
                <hr />
                <%
                    Receita receita = new Receita();
                    ResultSet rs = receita.consultarInner(idUser);
                %>
                <table>
                    <thead>
                    <th>Id</th>
                    <th>Data</th>
                    <th>Categoria</th>
                    <th>Valor</th>
                    <th>Descrição</th>
                    <th>Editar</th>
                    <th>Excluir</th>
                    </thead> 
                    <tbody>
                        <%while(rs.next()){%>
                        <tr>
                            <td><%out.write(""+rs.getString("id"));%></td>
                            <td><%out.write(rs.getString("data"));%></td>
                            <td><%out.write(rs.getString("categoria"));%></td>
                            <td><%out.write(rs.getString("valor"));%></td>
                            <td><%out.write(rs.getString("descricao"));%></td>
                            <td><%out.write("<a href=editarReceita.jsp?id="+rs.getString("id")
                                +"&idUser="+rs.getString("idusuario")+">Editar</a>");%></td>   
                            <td><%out.write("<a href=excluirReceita.jsp?id="+rs.getString("id")
                                +"&idUser="+rs.getString("idusuario")+">Excluir</a>");%></td>   
                        </tr>
                        <%}%>
                    </tbody>
                </table>
                <p><a href="cadastroReceita.jsp">Clique <strong>aqui</strong> para Incluir novo registro!</a></p>
            </article>
        </section>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>   
    </body>
</html>
