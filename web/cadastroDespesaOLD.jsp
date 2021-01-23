<%-- 
    Document   : cadastroDespesa
    Created on : 13/12/2020, 20:01:25
    Author     : User
--%>

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
        <h1>Cadastro de Despesa</h1>
        <%
            Categoria categoria = new Categoria();
            List<Categoria> categorias = categoria.consultar("D");
            
        %>
        
        <div>
            <form action="recebeDadosDespesa.jsp" method="POST">
            <label>Informe a categoria</label>
            <select name="iddespesa"><% for(Categoria c: categorias){ %>
                    <option value="<%out.write(c.getId());%>"> <%out.write(c.getDescricao());%> </option>
                    <%}%>
            </select> 
            
            <br />
            <label>Informe a descrição</label>
            <input type="text" name="descricao" /> 
            
            <br />
            <label>Informe o valor</label>
            <input type="text" name="valor" />
            
            <br />
            <label>Informe a data</label>
            <input type="date" name="data" />
            
            <hr />
            <input type="button" value="Salvar" onclick="enviaForm()" />
            <input type="reset" value="Cancelar" onclick="enviaForm()" />
            </div>
        </form>
        <script>
            function enviaForm(){
                var descricao = document.getElementsByName("descricao");
                if(descricao[0].value === ""){
                   descricao[0].focus();
                   alert("informe a descricao");
                   exit();
            }
                var valor = document.getElementsByName("valor");
                if(valor[0].value === ""){
                   valor[0].focus();
                   alert("informe o valor");
                   exit();
            }
                var data = document.getElementsByName("data");
                if(data[0].value === ""){
                   data[0].focus();
                   alert("informe a data");
                   exit();
            }
             
            document.forms[0].submit();
        }
        </script>
    </body>
</html>
