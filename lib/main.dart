import 'package:bugetbuddy/services/auth_service.dart';
import 'package:bugetbuddy/services/google_sign_in.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/my_app.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => GoogleSignInBugetBuddy()),
      ],
    child: const MyApp(),
  ));
}
