import 'package:bugetbuddy/app/home_page.dart';
import 'package:bugetbuddy/app/login_page.dart';
import 'package:bugetbuddy/app/register_page.dart';
import 'package:bugetbuddy/services/auth_check.dart';

import 'package:flutter/material.dart';

const AUTH_CHECK = '/';
const LOGIN_PAGE = '/login';
const REGISTER_PAGE = '/register';
const HOME_PAGE = '/home';

class Routes {
  mainRoutes() {
    return (RouteSettings route) {
      switch (route.name) {
        case AUTH_CHECK:
          return MaterialPageRoute(builder: (_) => const AuthCheck());
        case HOME_PAGE:
          return MaterialPageRoute(builder: (_) => const HomePage());
        case LOGIN_PAGE:
          return MaterialPageRoute(builder: (_) => const LoginPage());
        case REGISTER_PAGE:
          return MaterialPageRoute(builder: (_) => const RegisterPage());
      }
    };
  }
}
