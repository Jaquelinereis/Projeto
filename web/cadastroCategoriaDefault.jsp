<%-- 
    Document   : categoriaDefault
    Created on : 29 de out de 2020, 10:44:15
    Author     : entra21
--%>

<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" href="styles/estilos.css"/>
        <title>CategoriaDefault</title>
        <style>
            /*input[type=checkbox]{
                display: block;
                position: absolute;
                margin-left: 130px;                
            }*/
            
           /*input[type=text]:focus{
                background-color: white;                                              
            }
            
            input[type=number]:focus{
                background-color: white;                                              
            }*/
            
            input[type=text], [type=number]{
                display: block;
                /*position: relative;*/
                background-color: #3CBC8D;
                margin-left: 130px; 
                /*width: 250px;*/
            }
                        
            input[type=button],[type=reset]{
                display: block;
                width: 70px;
                margin-left: 350px;
                /*margin-left: auto;
                margin-right: auto; */
                margin-top: 10px;
            }
            
            label{
                display: block;
                position: absolute;
                margin-top: 20px;
                margin-left: 20px;                 
            }
            
            /*div{
                display: block;
                margin-left: auto;
                margin-right: auto;
                width: 600px;
                border: blue solid 2px;
                margin-bottom: 10px;
                padding: 20px;
            }*/
        </style>
    </head>
    <body>
        <%
            //verifica sessão
            String usuario = (String) session.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("loginDefault.jsp");
            } else if (usuario == "entra21") {
                response.sendRedirect("consultaCategoriaDefault.jsp");
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
                <div style="margin-left: 20px;">
                <h1>Cadastro de Categorias (Padrão/inicial)</h1>
                
                <form action="recebeDadosCategoriaDefault.jsp" method="POST">
                    <label>Descrição</label>
                    <input style="width: 35%" type="text" name="descricao" /> <br /> 
                    
                    <select name="tipo" style="margin-left: 130px;">
                        <option value="D">Despesa</option>
                        <option value="R">Receita</option>
                    </select>
                        
                    <input type="button" value="Salvar" onclick="enviaForm()" />
                    <input type="reset" value="Limpar" />
                </form>
                </div>

                <p class="error" id="erros" style= "margin-left: 70px; margin-bottom: 50px;
                                            color: red; font-size: 14px;"></p>

                <script>
                    function enviaForm(){
                        var descricao = document.getElementsByName("descricao");
                        if(descricao[0].value === ""){
                            descricao[0].focus();
                            erros.innerHTML = "Informe a Categoria";
                            exit();
                        }
                        
                        document.forms[0].submit();
                    }
                </script>
            </article>
        </section>
        <footer>
            <!--<script src="scripts/rodape.js"></script>-->
        </footer>
    </body>
</html>
