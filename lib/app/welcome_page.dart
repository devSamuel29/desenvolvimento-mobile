import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  Widget loginButton(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Navigator.of(context).pushNamed('/login');
      },
      child: Container(
        width: 150,
        height: 50,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            "Fazer login",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget registerButton(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Navigator.of(context).pushNamed('/register');
      },
      child: Container(
        width: 150,
        height: 50,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            "Fazer cadastro",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade800,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/splash.png'),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                loginButton(context),
                SizedBox(width: 20),
                registerButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
