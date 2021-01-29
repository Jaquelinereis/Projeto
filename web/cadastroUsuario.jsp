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
        <link rel="stylesheet" href="style/estilos.css">
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

            input[type=text],[type=date],[type=email],[type=password]{
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
        <script type="text/javascript">
            function fMasc(objeto, mascara) {
                obj = objeto
                masc = mascara
                setTimeout("fMascEx()", 1)
            }
            function fMascEx() {
                obj.value = masc(obj.value)
            }
            function mTel(fone) {
                fone = fone.replace(/\D/g, "")
                fone = fone.replace(/^(\d)/, "($1")
                fone = fone.replace(/(.{3})(\d)/, "$1)$2")
                if (fone.length == 9) {
                    fone = fone.replace(/(.{1})$/, "-$1")
                } else if (fone.length == 10) {
                    fone = fone.replace(/(.{2})$/, "-$1")
                } else if (fone.length == 11) {
                    fone = fone.replace(/(.{3})$/, "-$1")
                } else if (fone.length == 12) {
                    fone = fone.replace(/(.{4})$/, "-$1")
                } else if (fone.length > 12) {
                    fone = fone.replace(/(.{4})$/, "-$1")
                }
                return fone;
            }
            function mCNPJ(cnpj) {
                cnpj = cnpj.replace(/\D/g, "")
                cnpj = cnpj.replace(/^(\d{2})(\d)/, "$1.$2")
                cnpj = cnpj.replace(/^(\d{2})\.(\d{3})(\d)/, "$1.$2.$3")
                cnpj = cnpj.replace(/\.(\d{3})(\d)/, ".$1/$2")
                cnpj = cnpj.replace(/(\d{4})(\d)/, "$1-$2")
                return cnpj
            }
            function mCPF(cpf) {
                cpf = cpf.replace(/\D/g, "")
                cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
                cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
                cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2")
                return cpf
            }
            function mCEP(cep) {
                cep = cep.replace(/\D/g, "")
                cep = cep.replace(/^(\d{2})(\d)/, "$1.$2")
                cep = cep.replace(/\.(\d{3})(\d)/, ".$1-$2")
                return cep
            }
            function mNum(num) {
                num = num.replace(/\D/g, "")
                return num
            }
        </script>
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
                        <input type="text" name="cpf" onkeydown="javascript: fMasc(this, mCPF);" maxlength="14"><br /> <br />

                        <label>Data Nascimento</label>
                        <input type="date" name="dataNascimento" /> <br /> <br />

                        <label>Fone</label>
                        <label id="erroFone" class="error"></label>
                        <input type="text" name="fone" onkeydown="javascript: fMasc(this, mTel);" maxlength="15"><br /> <br />

                        <label>Cep</label>
                        <label id="erroCep" class="error"></label>
                        <input type="text" name="cep" onkeydown="javascript: fMasc(this, mCEP);" maxlength="9"><br /> <br />

                        <label>Endereço</label>
                        <input type="text" name="endereco" /> <br /> <br />

                        <label>Bairro</label>
                        <input type="text" name="bairro" /> <br /> <br />

                        <label>Cidade</label>
                        <input type="text" name="cidade" /> <br /> <br />

                        <label>Estado</label>
                        <input type="text" name="uf" maxlength="2"/> <br /> <br />

                        <label>e-Mail/Usuario</label>
                        <input type="email" name="usuario" required /> <br /> <br />

                        <label>Senha</label>
                        <input type="password" name="senha" required /> <br /> <br />

                        <input type="button" value="Enviar" onclick="enviarDados()" />
                    </div>
                </form>

                <script>
                    function enviarDados() {
                        var nome = document.getElementsByName("nome");
                        if (nome[0].value === "") {
                            nome[0].focus();
                            alert("informe o Nome");
                            exit();
                        }
                        var cpf = document.getElementsByName("cpf");
                        var numsStr = cpf[0].value.replace(/[^0-9]/g, '');
                        if (!testaCpf(numsStr)) {
                            cpf[0].focus();
                            alert("Cpf inválido!");
                            exit();
                        }
                        var dataNascimento = document.getElementsByName("dataNascimento");
                        if (dataNascimento[0].value === "") {
                            dataNascimento[0].focus();
                            alert("informe a Data de Nascimento");
                            exit();
                        }
                        var cep = document.getElementsByName("cep");
                        if (cep[0].value === "") {
                            cep[0].focus();
                            alert("informe o Cep");
                            exit();
                        }
                        document.forms[0].submit();
                    }

                    function testaCpf(strCPF) {
                        var Soma;
                        var Resto;
                        Soma = 0;
                        if (strCPF == "00000000000")
                            return false;

                        for (i = 1; i <= 9; i++)
                            Soma = Soma + parseInt(strCPF.substring(i - 1, i)) * (11 - i);
                        Resto = (Soma * 10) % 11;

                        if ((Resto == 10) || (Resto == 11))
                            Resto = 0;
                        if (Resto != parseInt(strCPF.substring(9, 10)))
                            return false;

                        Soma = 0;
                        for (i = 1; i <= 10; i++)
                            Soma = Soma + parseInt(strCPF.substring(i - 1, i)) * (12 - i);
                        Resto = (Soma * 10) % 11;

                        if ((Resto == 10) || (Resto == 11))
                            Resto = 0;
                        if (Resto != parseInt(strCPF.substring(10, 11)))
                            return false;
                        return true;
                    }
                </script>
            </article>
        </section>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>
    </body>
</html>
