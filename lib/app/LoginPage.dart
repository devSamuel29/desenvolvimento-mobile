import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _animationType = 'idle';
  int _passwordCountAnimation = 0;
  bool _obscureText = true;

  FocusNode _emailNode = FocusNode();
  FocusNode _passwordNode = FocusNode();

  @override
  void initState() {
    this._emailNode.addListener(() {
      if (this._passwordCountAnimation > 0) {
        setState(() => {
              this._animationType = 'hands_down',
              this._passwordCountAnimation--,
            });
      }
    });

    this._passwordNode.addListener(() {
      if (this._passwordNode.hasFocus) {
        setState(() => {
              this._animationType = 'hands_up',
              this._passwordCountAnimation++,
            });
      }
    });

    super.initState();
  }

  Widget Teddy() {
    return Container(
      height: 200,
      width: 300,
      child: FlareActor(
        'assets/Teddy.flr',
        alignment: Alignment.center,
        fit: BoxFit.cover,
        animation: _animationType,
        callback: (currentAnimation) {
          setState(() => this._animationType = 'idle');
        },
      ),
    );
  }

  Widget LoginForm() {
    return Column(
      children: [
        TextFormField(
          focusNode: this._emailNode,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            hintText: "Digite seu email...",
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          focusNode: this._passwordNode,
          obscureText: _obscureText,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            suffixIcon: IconButton(
              icon:
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            hintText: "Digite sua senha...",
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          ),
        ),
        Container(
          width: double.infinity,
          height: 70,
          padding: EdgeInsets.only(top: 20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple.shade800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: Text(
              "Entrar",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
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
              children: [Teddy(), LoginForm()],
            ),
          ),
        ),
      ),
    );
  }
}
