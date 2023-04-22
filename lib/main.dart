import 'package:bugetbuddy/services/db_context.dart';

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
        ChangeNotifierProvider(create: (context) => DbContext()),
      ],
      child: const MyApp(),
    )
  );
}
