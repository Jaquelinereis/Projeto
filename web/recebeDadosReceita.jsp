<%-- 
    Document   : recebeDadosReceita
    Created on : 16/12/2020, 08:05:39
    Author     : entra21
--%>

<%@page import="java.sql.Date"%>
<%@page import="Modelos.Receita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
    </head>
    <body>
        <h1>Dados Receita</h1>
        <%
          //recebe os valores da tela HTML  
          String descricao = request.getParameter("descricao");
          String valor = request.getParameter("valor");
          String data = request.getParameter("data");
          
          //instancia o cliente
          Receita receita = new Receita();
          receita.setDescricao(descricao);
          receita.setValor(Float.parseFloat(valor));
          receita.setData(Date.valueOf(data));
          
          if(receita.salvar()){
              out.write("Receita salva com sucesso");
          }
          else
          {
              out.write("Problemas ao salvar receita");
          }
          
        %>
        <hr />
    </body>
</html>
