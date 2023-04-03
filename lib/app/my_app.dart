import '../routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BugetBuddy',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: WELCOME_PAGE,
      onGenerateRoute: Routes().mainRoutes(),
    );
  }
}
