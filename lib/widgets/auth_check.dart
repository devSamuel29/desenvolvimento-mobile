import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/home_page.dart';
import '../app/login_page.dart';
import '../app/welcome_page.dart';
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
