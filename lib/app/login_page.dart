import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:bugetbuddy/services/auth_service.dart';

import '../services/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginFormKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  bool _obscureText = true;

  login() async {
    try {
      await context.read<AuthService>().login(email.text, password.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  loginWithGoogle() async {
    try {
      await context.read<GoogleSignInBugetBuddy>().googleLogin();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Widget emailInput() {
    return TextFormField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "Digite o email!";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        prefixIcon: Icon(Icons.email),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      ),
    );
  }

  Widget passwordInput() {
    return TextFormField(
      controller: password,
      obscureText: _obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return "Digite a senha!";
        } else if (value.length < 6) {
          return "A senha deve ter no mínimo 6 caracteres";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Senha",
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              this._obscureText = !_obscureText;
            });
          },
        ),
        hintStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      ),
    );
  }

  Widget submitButton() {
    return Container(
      width: double.infinity,
      height: 70,
      padding: EdgeInsets.only(top: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple.shade800,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {
          if (loginFormKey.currentState!.validate()) {
            login();
          }
        },
        child: Text(
          "Entrar",
        ),
      ),
    );
  }

  Widget toRegisterPage() {
    return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/register');
        },
        child: Text("Novo usuário? clique aqui para cadastrar-se"));
  }

  Widget loginWithGoogleWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(4),
            child: IconButton(
              onPressed: () {
                loginWithGoogle();
              },
              icon: Icon(
                FontAwesomeIcons.google,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 8),
          Text(
            "Entrar com Google",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget loginWithFacebook() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(4),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.facebook,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 8),
          Text(
            "Entrar com Facebook",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 350,
            height: 550,
            child: Form(
              key: loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Entrar",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                      )),
                  emailInput(),
                  SizedBox(height: 10),
                  passwordInput(),
                  SizedBox(height: 10),
                  submitButton(),
                  SizedBox(height: 10),
                  toRegisterPage(),
                  Divider(),
                  Column(
                    children: [
                      Text(
                        "Ou entre com:",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 10),
                      loginWithGoogleWidget(),
                      SizedBox(height: 10),
                      loginWithFacebook()
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
