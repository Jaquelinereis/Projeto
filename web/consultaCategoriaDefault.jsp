<%-- 
    Document   : consultaCategoriaDefault
    Created on : 16 de nov de 2020, 10:13:42
    Author     : entra21
--%>

<%@page import="Modelos.CategoriaDefault"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" href="style/estilos2.css"/>
        <title>consultaCategoriaDefault</title>
    </head>
    <body>
        <%
            //verifica sessão
            String usuarioEsperado = "entra21";     // usuario autorizado para manutenção
            String usuario = (String) session.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            }
            else if (!usuario.contains(usuarioEsperado)) {
                response.sendRedirect("index.html");
            }
        %>
        <header>
            <!--<script src="scripts/cabecalho.js"></script>-->
        </header>
        <section>
            <nav>
                <!--<script src="scripts/menu.js"></script>-->
            </nav>
            <article>
                <h1>Consulta Categorias (Padrões na inicialização do Usuario)</h1>

                <%
                    CategoriaDefault categoriaDefault = new CategoriaDefault();
                    ResultSet rs = categoriaDefault.consultarTodas();
                %>

                <table style="width: 70%;">
                    <thead>
                    <th>id</th>
                    <th>Descrição</th>
                    <th>Tipo Categoria</th>
                    <th>Editar</th>
                    <th>Excluir</th>
                    </thead>
                    <tbody>
                        <%while (rs.next()) {%>
                        <tr>
                            <td><%out.write(""+rs.getInt("id"));%></td>
                            <td><%out.write(rs.getString("descricao"));%></td>
                            <%if (rs.getString("tipo").contains("R")) {%>
                                <td><%out.write(rs.getString("tipo") + "ECEITA");%></td>
                            <%}%>
                            <%if (rs.getString("tipo").contains("D")) {%>
                                <td><%out.write(rs.getString("tipo") + "ESPESA");%></td>
                            <%}%>
                            <td><% out.write("<a href=editarCategoriaDefault.jsp?id=" + 
                                    rs.getInt("id") + ">Editar</a>"); %></td>
                            <td><% out.write("<a href=excluirCategoriaDefault.jsp?id=" + 
                                    rs.getInt("id") + ">Excluir</a>"); %></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
                <p><a href="cadastroCategoriaDefault.jsp">Clique <strong>aqui</strong> para 
                        Incluir uma nova Categoria</a></p>
            </article>
        </section>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>
    </body>
</html>
