<%-- 
    Document   : recebeDadosDespesa
    Created on : 13/12/2020, 20:20:55
    Author     : User
--%>

<%@page import="Modelos.Despesa"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
    </head>
    <body>
        <h1>Dados Despesas</h1>
        <%
          //recebe os valores da tela HTML  
          String descricao = request.getParameter("descricao");
          String valor = request.getParameter("valor");
          String data = request.getParameter("data");
          
          //instancia o cliente
          Despesa despesa = new Despesa();
          despesa.setDescricao(descricao);
          despesa.setValor(Float.parseFloat(valor));
          despesa.setData(Date.valueOf(data));
          
          if(despesa.salvar()){
              out.write("Despesa salva com sucesso");
          }
          else
          {
              out.write("Problemas ao salvar despesa");
          }
          
        %>
        <hr />
    </body>
</html>
