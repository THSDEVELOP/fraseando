//Nessa tela basicamente foi feito o frontend com alguns validadores.
//Ainda falta implementar algumas coisas e tratar alguns possíveis erros.

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fraseando/components/decorationRegister.dart';
import 'package:fraseando/components/snackbar.dart';

import '../servicos/autentication.dart';
import 'pageLogin.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isObscureText = false;
  bool isObscureconfirmText = false;
  final _formkey = GlobalKey<FormState>();

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _confirmaSenhaController = TextEditingController();

  final AutenticacaoServico _autentServico = AutenticacaoServico();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.lightBlue,
              Color.fromRGBO(26, 186, 215, 1),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formkey,
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 22, 162, 244),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(27, 90, 225, 0.298),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/bebeBaleia.png',
                        height: 70,
                      ),
                      const Text(
                        "Cadastre-se no Fraseando",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _nomeController,
                        decoration: getAuthenticationInputDecoration("Nome:"),
                        validator: (value) {
                          if (value == null) {
                            return "O campo nome não pode ficar vazio.";
                          }
                          if (value.length < 4) {
                            return "Seu nome deve ter pelo menos 4 caracteres.";
                          }
                          return null;
                        },
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: getAuthenticationInputDecoration("Email:"),
                        validator: (value) {
                          if (value == null) {
                            return "O campo email não pode ficar vazio.";
                          }
                          if (value.length < 8) {
                            return "O email é muito curto.";
                          }
                          if (!value.contains("@")) {
                            return "O email não é valido.";
                          }
                          return null;
                        },
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: isObscureText,
                        onChanged: (value) {},
                        onTap: () {
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                        controller: _senhaController,
                        decoration: getPasswordInputRegisterDecoration(
                          "Senha",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            icon: Icon(
                              isObscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "É obrigatório o uso de senha para sua segurança.";
                          }
                          if (value.length < 8) {
                            return "Sua senha deve conter ao menos 8 caracteres.";
                          }
                          return null;
                        },
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: isObscureconfirmText,
                        onChanged: (value) {},
                        onTap: () {
                          setState(() {
                            isObscureconfirmText = !isObscureconfirmText;
                          });
                        },
                        controller: _confirmaSenhaController,
                        decoration: getConfirmPasswordInputRegisterDecoration(
                          "Confirme sua senha",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObscureconfirmText = !isObscureconfirmText;
                              });
                            },
                            icon: Icon(
                              isObscureconfirmText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        //validador apenas de simulação
                        validator: (value) {
                          if (value == null) {
                            return "Confirme a senha para sua segurança.";
                          }
                          if (value.length < 8) {
                            return "Suas senhas devem ser iguais.";
                          }
                          return null;
                        },
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.blue)),
                          onPressed: () {
                            botaoCadastrarClicado();
                          },
                          child: const Text(
                            "Cadastrar",
                            style: TextStyle(color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PageLogin()));
                          },
                          child: const Text(
                            "Já tem um login? clique aqui!",
                            style: TextStyle(
                                color: Color.fromARGB(255, 241, 240, 240)),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  botaoCadastrarClicado() {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _senhaController.text;
    if (_formkey.currentState!.validate()) {
      _autentServico
          .cadastrarUsuario(nome: nome, email: email, senha: senha)
          .then((String? erro) {
        if (erro != null) {
          //voltou com erro
          mostrarSnackbar(context: context, texto: erro);
        } else {
          //parece que deu bom
          mostrarSnackbar(
            context: context,
            texto: "Agora você faz parte do Fraseando, seja bem vindo",
            isErro: false,
          );
        }
      });
    } else {
      print("Form Inválido");
    }
  }
}
