import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _animationType = 'idle';
  int _passwordCountAnimation = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
    
      body: Center(
        child: Container(
          height: 400,
          width: 300,
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                Container(
                  height: 300,
                  width: 300,
                  child: FlareActor(
                    'assets/Teddy.flr',
                    alignment: Alignment.topCenter,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
