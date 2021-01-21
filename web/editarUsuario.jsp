<%-- 
    Document   : editarUsuario
    Created on : 13/12/2020, 20:02:04
    Author     : User
--%>

<%@page import="Modelos.Usuario"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
        <link rel="stylesheet" href="styles/estilos2.css">
        <style>
            input[type=checkbox]{
                display: block;
                position: relative;
                margin-left: 230px;                
            }

            input[type=button],[type=reset]{
                display: block;
                width: 90px;
                margin-left: auto;
                margin-right: auto; 
                margin-top: 10px;
            }

            input[type=text]:focus{
                background-color: white;                                              
            }

            input[type=text],[type=date],[type=password]{
                position: initial;
                background-color: lightskyblue;
                border-bottom-color: white;
                margin-left: 230px; 
                width: 280px;                                
            }
            label{
                display: block;
                position: absolute;
                margin-left: 10px;                 
            }

            div{
                display: block;
                background-color: lightblue;
                margin-left: auto;
                margin-right: auto;
                width: 530px;
                border: fuchsia;
                margin-bottom: 10px;
                padding: 20px;
            }
        </style>
    </head>
    <body>
        <%
            //verifica sessão
            String usuario = (String) session.getAttribute("usuario");
            int idUser = (int) session.getAttribute("idUser");
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <!--<header>
            <script src="scripts/cabecalho.js"></script>
        </header>-->
        <section>
            <!--<nav>
                <script src="scripts/menu.js"></script>
            </nav>-->
            <article>
                <h1>Edição do Usuario</h1>
                <%
                    Usuario user = new Usuario();
                    user = user.consultar(idUser);
                %>
                <p id="erros"></p>

                <form action="recebeEditaUsuario.jsp" method="POST">
                    <div>
                    <label>Nome</label>
                    <label id="erroNome" class="error"></label> 
                    <input type="text" name="nome" value="<%out.write(user.getNome());%>"/> <br /> <br />
                    
                    <label>Cpf</label>
                    <label id="erroCpf" class="error"></label> 
                    <input type="text" name="cpf" value="<%out.write(user.getCpf());%>"/> <br /> <br />

                    <label>Data Nascimento</label>
                    <input type="date" name="dataNascimento" value="<%out.write(String.valueOf(user.getDataNasc()));%>"/> <br /> <br />
                      
                    <label>Fone</label>
                    <label id="erroFone" class="error"></label>
                    <input type="text" name="fone" value="<%out.write(user.getFone());%>"/> <br /> <br />
                    
                    <label>Cep</label>
                    <input type="text" name="cep" value="<%out.write(user.getCep());%>"/> <br /> <br />

                    <label>Endereço</label>
                    <input type="text" name="endereco" value="<%out.write(user.getEndereco());%>"/> <br /> <br />

                    <label>Bairro</label>
                    <input type="text" name="bairro" value="<%out.write(user.getBairro());%>"/> <br /> <br />

                    <label>Cidade</label>
                    <input type="text" name="cidade" value="<%out.write(user.getCidade());%>"/> <br /> <br />

                    <label>Estado</label>
                    <input type="text" name="uf" value="<%out.write(user.getUf());%>"/> <br /> <br />

                    <label>e-Mail/Usuario</label>
                    <input type="text" name="usuario" value="<%out.write(user.getEmail());%>"/> <br /> <br />
                
                    <label>Senha</label>
                    <input type="password" name="senha" value="<%out.write(user.getSenha());%>"/> <br /> <br />

                    <input type="button" value="Alterar" onclick="enviarDados()" />
                    </div>
                </form>

                <script>
                    function enviarDados(){
                        var semErros = true;
                        var nome = document.getElementsByName("nome");
                        if (nome[0].value === ""){
                            //erros.innerHTML += "<br>Informe nome";
                            //nome[0].style="border: red solid 3px";
                            //nome[0].focus();
                            document.getElementById("erroNome").innerHTML = " <<< Informe Nome >>>";
                            semErros = false;
                        }
                        var cpf = document.getElementsByName("cpf");
                        if (cpf[0].value === ""){
                            //erros.innerHTML += "<br>Informe cpf";
                            document.getElementById("erroCpf").innerHTML = " <<< Informe Cpf >>>";
                            //cpf[0].focus();
                            semErros = false;
                        }
                        var fone = document.getElementsByName("fone");
                        if (fone[0].value === ""){
                            document.getElementById("erroFone").innerHTML = " <<< Informe Telefone/Celular >>>";
                            semErros = false;
                        }

                        if(semErros){
                            document.forms[0].submit();
                        }
                    }
                </script>
            </article>
        </section>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>
    </body>
</html>
