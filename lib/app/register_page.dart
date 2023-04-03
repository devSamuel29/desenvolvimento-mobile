import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  bool _obscureText = true;

  Widget emailInput() {
    return TextFormField(
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

  Widget submitButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      padding: EdgeInsets.only(top: 150),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple.shade800,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {},
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
          child: Container(
            width: 350,
            child: Column(
              children: [
                emailInput(),
                SizedBox(height: 10),
                passwordInput(),
                submitButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
