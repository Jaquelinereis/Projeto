<%-- 
    Document   : excluirCategoria
    Created on : 9 de nov de 2020, 17:52:36
    Author     : Paulo
--%>

<%@page import="Modelos.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    int idUser = Integer.parseInt(request.getParameter("idUser"));
    Categoria categoria = new Categoria();
    categoria = categoria.consultar(id, idUser);
    if (id != 0 && idUser != 0) {
        String msg = "";
        if (categoria.excluir()) {
            msg = "Categoria excluida com sucesso!";
        } else {
            msg = "Problemas ao excluir Categoria!";
        }
        response.sendRedirect("informacao.jsp?msg=" + msg);
    }
%>
