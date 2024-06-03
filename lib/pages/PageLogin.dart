// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fraseando/components/decorationPassword.dart';
import 'package:fraseando/components/snackbar.dart';
import 'package:fraseando/pages/mainPage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';

import '../components/decorationRegister.dart';
import '../servicos/autentication.dart';
import 'register.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final AutenticacaoServico _autentServico = AutenticacaoServico();
  bool _isObscureText = true;
  bool _isLoading = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscureText = !_isObscureText;
    });
  }

  void _botaoLoginClicado() {
    setState(() {
      _isLoading = true;
    });

    if (_formKey.currentState!.validate()) {
      _autentServico
          .logarUsuarios(
              email: _emailController.text, senha: _senhaController.text)
          .then((String? erro) {
        setState(() {
          _isLoading = false;
        });
        if (erro != null) {
          mostrarSnackbar(context: context, texto: erro);
        } else {
          Navigator.pushReplacement(
            context,
            PageTransition(
                child: const MyHomePage(),
                type: PageTransitionType.scale,
                alignment: Alignment.center,
                duration: const Duration(milliseconds: 600),
                reverseDuration: const Duration(milliseconds: 600)),
          );
        }
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      mostrarSnackbar(context: context, texto: "Usuário ou senha inválidos");
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    } catch (error) {
      mostrarSnackbar(
          context: context, texto: "Erro ao fazer login com Google");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading ? _buildLoading() : _buildLoginForm(),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: Image.asset(
        'assets/babywhale.gif',
        width: 600.0,
        height: 240.0,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildLoginForm() {
    return Container(
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
                  _buildLoginFormFields(),
                  const SizedBox(height: 20.0),
                  const Text(
                    "Continue com sua mídia social",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 241, 240, 240),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20.0),
                  _buildSocialMediaButtons(),
                  const SizedBox(height: 20.0),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()));
                    },
                    child: const Text(
                      "Cadastre-se aqui!",
                      style:
                          TextStyle(color: Color.fromARGB(255, 241, 240, 240)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginFormFields() {
    return Container(
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
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: getAuthenticationInputDecoration("Email:"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "O campo email não pode ficar vazio.";
                }
                if (!value.contains("@")) {
                  return "O email não é valido.";
                }
                return null;
              },
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 10),
            TextFormField(
              obscureText: _isObscureText,
              controller: _senhaController,
              decoration: getPasswordInputDecoration(
                "Senha",
                suffixIcon: IconButton(
                  onPressed: _togglePasswordVisibility,
                  icon: Icon(
                    _isObscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black87,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
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
              onPressed: _botaoLoginClicado,
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
    );
  }

  Widget _buildSocialMediaButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(15),
            backgroundColor: const Color.fromARGB(255, 7, 65, 255),
            textStyle: const TextStyle(fontSize: 18),
          ),
          child: const Text(
            "Facebook",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            _signInWithGoogle(context);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            backgroundColor: const Color.fromARGB(255, 168, 12, 12),
            textStyle: const TextStyle(fontSize: 18),
          ),
          child: const Text(
            "Google",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
