// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fraseando/components/decorationPassword.dart';
import 'package:fraseando/components/snackbar.dart';
import 'package:fraseando/servicos/autentication.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../components/decorationRegister.dart';
import 'Register.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  bool isObscureText = true;
  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  AutenticacaoServico _autentServico = AutenticacaoServico();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
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
                      child: Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              controller: _emailController,
                              decoration:
                                  getAuthenticationInputDecoration("Email:"),
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
                              decoration: getPasswordInputDecoration(
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
                            const SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {
                                botaoLoginClicado();
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(15),
                                backgroundColor: Colors.blue,
                                textStyle: const TextStyle(fontSize: 18),
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            const Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Esqueceu a Senha?",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "Continue com sua mídia social",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 241, 240, 240),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(15),
                            backgroundColor:
                                const Color.fromARGB(255, 7, 65, 255),
                            textStyle: const TextStyle(fontSize: 18),
                          ),
                          child: const Text(
                            "Facebook",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            signInWithGoogle();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            backgroundColor:
                                const Color.fromARGB(255, 168, 12, 12),
                            textStyle: const TextStyle(fontSize: 18),
                          ),
                          child: const Text(
                            "Google",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Register()));
                        },
                        child: const Text(
                          "Cadastre-se aqui!",
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
    );
  }

  signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);
  }

  botaoLoginClicado() {
    String email = _emailController.text;
    String senha = _senhaController.text;
    if (_formkey.currentState!.validate()) {
      _autentServico
          .logarUsuarios(email: email, senha: senha)
          .then((String? erro) {
        if (erro != null) {
          mostrarSnackbar(context: context, texto: erro);
        }
      });
    } else {
      return "Usuario ou senha inválidos";
    }
  }
}
