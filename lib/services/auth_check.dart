// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../routes.dart';
// import '../services/auth_service.dart';

// class AuthCheck extends StatefulWidget {
//   const AuthCheck({Key? key}) : super(key: key);

//   @override
//   _AuthCheckState createState() => _AuthCheckState();
// }

// class _AuthCheckState extends State<AuthCheck> {
//   redirect(BuildContext context, String route) {
//     switch (route) {
//       case "HOME":
//         return Navigator.of(context).pushReplacementNamed(HOME_PAGE);
//       case "WELCOME":
//         return Navigator.of(context).pushReplacementNamed(WELCOME_PAGE);
//     }
//   }

//   @override
//   void dis() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       AuthService auth = Provider.of<AuthService>(context, listen: false);
//       if (auth.user != null) {
//         redirect(context, "HOME");
//       } else {
//         redirect(context, "WELCOME");
//       }
//     });
//     super.initState();
//   }
//   welcome: login ou registro, login -> home // welcome: login ou registro, login -> autenticava, login -> welcome -> home
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: CircularProgressIndicator()),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/home_page.dart';
import '../app/login_page.dart';
import '../services/auth_service.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.user == null) {
      return LoginPage();
    } else {
      return HomePage();
    }
  }
}