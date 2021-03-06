<%-- 
    Document   : cadastroDespesa
    Created on : 13/12/2020, 20:01:48
    Author     : User
--%>

<%@page import="java.sql.Date"%>
<%@page import="Modelos.Despesa"%>
<%@page import="java.util.List"%>
<%@page import="Modelos.Categoria"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
    </head>
    <body>
        <h1>Despesa editada!</h1>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            int idUser = Integer.parseInt(request.getParameter("idUser"));
            Despesa despesa = new Despesa();
            Categoria categoria = new Categoria();
            List<Categoria> categorias = null;
            if (id != 0 && idUser != 0) {
                despesa = despesa.consultar(id, idUser);
                categorias = categoria.consultar(idUser, "D");  //consulta as categorias tipo=DESPESA
            }
        %>
        <div>
            <form action="recebeEditaDespesa.jsp" method="POST">

                <input type="hidden" name="id" value="<%out.write(""+despesa.getId());%>">
                <label>Informe a categoria</label>
                <select name="idCategoria"><% for (Categoria c : categorias) { %>
                    <option value="<%out.write("" + c.getId());%>"><%out.write(c.getDescricao());%></option>
                    <%}%>
                </select> 
                <br />
                <label>Informe a descrição</label>
                <input type="text" name="descricao" value="<%out.write(despesa.getDescricao());%>"/> 

                <br />
                <label>Informe o valor</label>
                <input type="text" name="valor" value="<%out.write(String.valueOf(despesa.getValor()));%>"/>

                <br />
                <label>Informe a data</label>
                <input type="date" name="data" value="<%out.write(String.valueOf(despesa.getData()));%>"/>

                <hr />
                <input type="button" value="Alterar" onclick="enviaForm()" />
            </form>
        </div>
    </form>
    <script>
        function enviaForm() {
            /*var descricao = document.getElementsByName("descricao");
             if (descricao[0].value === "") {
             descricao[0].focus();
             alert("informe a descricao");
             exit();
             }*/
            var valor = document.getElementsByName("valor");
            if (valor[0].value === "") {
                valor[0].focus();
                alert("informe o valor");
                exit();
            }
            var data = document.getElementsByName("data");
            if (data[0].value === "") {
                data[0].focus();
                alert("informe a data");
                exit();
            }

            document.forms[0].submit();
        }
    </script>
</body>
</html>
