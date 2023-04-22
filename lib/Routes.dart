import 'package:bugetbuddy/app/home_page.dart';
import 'package:bugetbuddy/app/welcome_page.dart';
import 'package:bugetbuddy/app/login_page.dart';
import 'package:bugetbuddy/app/register_page.dart';

import 'package:flutter/material.dart';

const WELCOME_PAGE = '/';
const LOGIN_PAGE = '/login';
const REGISTER_PAGE = '/register';
const HOME_PAGE = '/home';

class Routes {
  mainRoutes() {
    return (RouteSettings route) {
      switch (route.name) {
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
