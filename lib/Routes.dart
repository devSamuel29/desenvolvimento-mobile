import 'package:bugetbuddy/app/LoginPage.dart';
import 'package:bugetbuddy/app/RegisterPage.dart';
import 'package:bugetbuddy/app/SplashPage.dart';
import 'package:bugetbuddy/app/Home.dart';
import 'package:flutter/material.dart';

const SPLASH_PAGE = '/splash';
const HOME_PAGE = '/home';
const LOGIN_PAGE = '/login';
const REGISTER_PAGE = '/register';

class Routes {
  mainRoutes() {
    return (RouteSettings route) {
      switch (route.name) {
        case SPLASH_PAGE:
          return MaterialPageRoute(builder: (_) => const SplashPage());
        case HOME_PAGE:
          return MaterialPageRoute(builder: (_) => const Home());
        case LOGIN_PAGE:
          return MaterialPageRoute(builder: (_) => const LoginPage());
        case REGISTER_PAGE:
          return MaterialPageRoute(builder: (_) => const RegisterPage());
      }
    };
  }
}
