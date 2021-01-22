<%-- 
    Document   : editarCategoria
    Created on : 8 de nov de 2020, 21:09:00
    Author     : Paulo
--%>

<%@page import="Modelos.Categoria"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style/estilos2.css">
        <title>editarCategoria</title>
    </head>
    <body>
        <header>
            <!--<script src="scripts/cabecalho.js"></script>-->
        </header>
        <section>
            <nav>
                <!--<script src="scripts/menu.js"></script>-->
            </nav>
            <article>
                <h1>Categoria editada!</h1>

                <%
                    int id = Integer.parseInt(request.getParameter("id"));
                    int idUser = Integer.parseInt(request.getParameter("idUser"));
                    Categoria categoria = new Categoria();
                    if (id != 0 && idUser != 0) {
                        categoria = categoria.consultar(id, idUser);
                    }
                %>
                <form action="recebeEditaCategoria.jsp" method="POST">
                    <label>Id / Id Usuario</label>
                    <input style="width: 5%" type="text" name="id" readonly="true"
                           value="<%out.write(""+categoria.getId());%>"/>
                    <input style="width: 5%" type="text" name="idUser" readonly="true"
                           value="<%out.write(""+categoria.getIdUsuario());%>"/>
                    <br />
                    <label>Descrição</label>
                    <input style="width: 35%" type="text" name="descricao" 
                           value="<%out.write(categoria.getDescricao());%>"/> 
                    <br /> 
                    <select id="tipo" name="tipo" style="margin-left: 130px;">
                        <% if (categoria.getTipo().contains("D")) { %>
                                <option value="D" selected>DESPESA</option>
                                <option value="R">RECEITA</option>
                        <%}%>
                        <% if (categoria.getTipo().contains("R")) { %>
                                <option value="D">DESPESA</option>
                                <option value="R" selected>RECEITA</option>
                        <%}%>
                    </select>
                    <br /> 
                    <input type="submit" value="Alterar" />
                </form>
            </article>
        </section>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>            
    </body>
</html>
