import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _animationType = 'idle';
  bool _obscureText = true;

  FocusNode _emailNode = FocusNode();
  FocusNode _passwordNode = FocusNode();

  Widget teddy() {
    return Container(
      height: 200,
      width: 300,
      child: FlareActor(
        'assets/Teddy.flr',
        alignment: Alignment.center,
        fit: BoxFit.cover,
        animation: _animationType,
        callback: (currentAnimation) {
          setState(() {
            this._animationType = 'idle';
          });
        },
      ),
    );
  }

  Widget emailInput() {
    return TextFormField(
      focusNode: this._emailNode,
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
      focusNode: this._passwordNode,
      obscureText: _obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
                  this._obscureText = !_obscureText;
                });
          },
        ),
        hintText: "Digite sua senha...",
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
        onPressed: () {},
        child: Text(
          "Entrar",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  void initState() {
    this._passwordNode.addListener(() {
      if (this._passwordNode.hasFocus) {
        setState(() {
          this._animationType = 'hands_up';
        });
      } else {
        setState(() => {this._animationType = 'hands_down'});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 350,
          child: SingleChildScrollView(
            child: Column(
              children: [
                teddy(),
                emailInput(),
                SizedBox(height: 10),
                passwordInput(),
                submitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
