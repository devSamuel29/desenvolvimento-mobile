import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:bugetbuddy/services/auth_service.dart';

import '../services/google_sign_in.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final registerFormKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final bday = TextEditingController();

  bool _obscureText = true;

  register() async {
    try {
      await context.read<AuthService>().register(email.text, password.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  loginWithGoogle() async {
    try {
      await context.read<GoogleSignInBugetBuddy>().googleLogin();
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  // Widget nameInput() {
  //   return TextFormField(
  //     controller: name,
  //     validator: (value) {
  //       if (value!.isEmpty) {
  //         return 'O campo "nome" é obrigatório';
  //       }
  //       return null;
  //     },
  //     decoration: InputDecoration(
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(15),
  //       ),
  //       icon: Icon(Icons.abc_rounded),
  //       hintText: "Digite seu email...",
  //       contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
  //     ),
  //   );
  // }

  // Widget lastnameInput() {
  //   return TextFormField(
  //     controller: lastname,
  //     validator: (value) {
  //       if (value!.isEmpty) {
  //         return 'O campo "sobrenome" é obrigatório';
  //       }
  //     },
  //     decoration: InputDecoration(
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(15),
  //       ),
  //       icon: Icon(Icons.abc_rounded),
  //       hintText: "Digite seu sobrenome...",
  //       contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
  //     ),
  //   );
  // }

  Widget emailInput() {
    return TextFormField(
      controller: email,
      validator: (value) {
        if (value!.isEmpty) {
          return "Digite o email!";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        prefixIcon: Icon(Icons.email_rounded),
      ),
    );
  }

  Widget passwordInput() {
    return TextFormField(
      controller: password,
      validator: (value) {
        if (value!.isEmpty) {
          return "Digite a senha!";
        } else if (value.length < 6) {
          return "A senha deve ter no mínimo 6 caracteres";
        }
        return null;
      },
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: "Senha",
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }

  // Widget bdayInput() {
  //   return TextFormField(
  //     controller: bday,
  //   );
  // }

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
          if (registerFormKey.currentState!.validate()) {
            register();
          }
        },
        child: Text(
          "Cadastrar",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 350,
            height: 550,
            child: Form(
              key: registerFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Cadastrar",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                      )),
                  // nameInput(),
                  // lastnameInput(),
                  emailInput(),
                  SizedBox(height: 10),
                  passwordInput(),
                  // bdayInput(),
                  SizedBox(height: 10),
                  submitButton(),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 10),
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
