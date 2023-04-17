import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  bool _obscureText = true;

  register() async {
    try {
      await context.read<AuthService>().register(email.text, password.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  Widget emailInput() {
    return TextFormField(
      controller: email,
      validator: (value) {
        if (value!.isEmpty) {
          return "Digite o email";
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: "Digite seu email...",
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: "Digite sua senha...",
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
          if (formKey.currentState!.validate()) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              width: 350,
              child: Column(
                children: [
                  emailInput(),
                  SizedBox(height: 10),
                  passwordInput(),
                  submitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
