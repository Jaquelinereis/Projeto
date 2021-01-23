<%-- 
    Document   : cadastroUsuario
    Created on : 13/12/2020, 20:02:04
    Author     : User
--%>

<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
        <link rel="stylesheet" href="styles/estilos.css">
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
        <!--<header>
            <script src="scripts/cabecalho.js"></script>
        </header>-->
        <section>
            <!--<nav>
                <script src="scripts/menu.js"></script>
            </nav>-->
            <article>
                <h1>Cadastro de Usuarios</h1>

                <p id="erros"></p>

                <form action="recebeDadosUsuario.jsp" method="POST">
                    <div>
                    <label>Nome</label>
                    <label id="erroNome" class="error"></label> 
                    <input type="text" name="nome" /> <br /> <br />
                    
                    <label>Cpf</label>
                    <label id="erroCpf" class="error"></label> 
                    <input type="text" name="cpf" /> <br /> <br />

                    <label>Data Nascimento</label>
                    <input type="date" name="dataNascimento" /> <br /> <br />

                    <label>Fone</label>
                    <label id="erroFone" class="error"></label>
                    <input type="text" name="fone" /> <br /> <br />
                    
                    <label>Cep</label>
                    <input type="text" name="cep" /> <br /> <br />

                    <label>Endereço</label>
                    <input type="text" name="endereco" /> <br /> <br />

                    <label>Bairro</label>
                    <input type="text" name="bairro" /> <br /> <br />

                    <label>Cidade</label>
                    <input type="text" name="cidade" /> <br /> <br />

                    <label>Estado</label>
                    <input type="text" name="uf" /> <br /> <br />

                    <label>e-Mail/Usuario</label>
                    <input type="text" name="usuario" /> <br /> <br />
                
                    <label>Senha</label>
                    <input type="password" name="senha" /> <br /> <br />

                    <input type="button" value="Enviar" onclick="enviarDados()" />
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
