import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BugetBuddy Demo',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _animationType = 'idle';

  FocusNode _emailNode = FocusNode();
  FocusNode _passwordNode = FocusNode();

  @override
  void initState() {
    this._emailNode.addListener(() {
      if (this._emailNode.hasFocus) {
        setState(() => { this._animationType = 'test' });
      } else {
        setState(() => { this._animationType = 'idle' });
      }
    });
    
    this._passwordNode.addListener(() {
      if (this._passwordNode.hasFocus) {
        setState(() => { this._animationType = 'hands_up' });
      } else {
        setState(() => { this._animationType = 'hands_down' });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 236, 236, 1),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            Container(
              height: 300,
              width: 300,
              child: FlareActor(
                'assets/Teddy.flr',
                alignment: Alignment.bottomCenter,
                fit: BoxFit.contain,
                animation: _animationType,
                callback: (currentAnimation) {
                  setState(() => this._animationType = 'idle');
                },
              ),
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    focusNode: this._emailNode,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Digite seu email...",
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                  Divider(),
                  TextFormField(
                    focusNode: this._passwordNode,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Digite sua senha...",
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 70,
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
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
        ),
      ),
    );
  }
}
