<%-- 
    Document   : cadastroCategoria
    Created on : 16/12/2020, 08:44:41
    Author     : entra21
--%>

<%@page import="Modelos.Receita"%>
<%@page import="java.util.List"%>
<%@page import="Modelos.Despesa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
    </head>
    <body>
        <h1>Cadastro Categoria</h1>
        <hr />
         <div>
            <form action="recebeDadosCategoria.jsp" method="POST">
            
            <label>Informe a descrição</label>
            <input type="text" name="descricao" /> 
            
            <br />
            <label>Informe o tipo</label> <br />
           <!-- 
            <input type="radio" id="despesa" name="tipo" value="despesa" />
            <label for="despesa">Despesa</label><br>
            <input type="radio" id ="receita" name="tipo" value="receita" />
            <label for="receita">Receita</label><br>             
            -->
            <select name="tipo">
                <option value="R">Receita</option>
                <option value="D">Despesa</option>
            </select>
          
            <hr />
            <input type="button" value="Salvar" onclick="enviaForm()" />
            <input type="reset" value="Limpar" />
           
            <hr />
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
                var valor = document.getElementsByName("tipo");
                if(valor[0].value === ""){
                   valor[0].focus();
                   alert("informe o tipo");
                   exit();
            }
            
            document.forms[0].submit();
        }
        </script>
    </body>
</html>
