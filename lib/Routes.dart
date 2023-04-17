import 'package:bugetbuddy/app/home_page.dart';
import 'package:bugetbuddy/app/welcome_page.dart';
import 'package:bugetbuddy/app/login_page.dart';
import 'package:bugetbuddy/widgets/auth_check.dart';
import 'app/register_page.dart';

import 'package:flutter/material.dart';

const AUTH_CHECK = '/auth-check';
const HOME_PAGE = '/home';
const WELCOME_PAGE = '/welcome';
const LOGIN_PAGE = '/login';
const REGISTER_PAGE = '/register';

class Routes {
  mainRoutes() {
    return (RouteSettings route) {
      switch (route.name) {
        case AUTH_CHECK:
          return MaterialPageRoute(builder: (_) => const AuthCheck());
        case HOME_PAGE:
          return MaterialPageRoute(builder: (_) => const HomePage());
        case WELCOME_PAGE:
          return MaterialPageRoute(builder: (_) => const WelcomePage());
        case LOGIN_PAGE:
          return MaterialPageRoute(builder: (_) => const LoginPage());
        case REGISTER_PAGE:
          return MaterialPageRoute(builder: (_) => const RegisterPage());
      }
    };
  }
}
