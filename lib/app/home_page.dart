import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: OutlinedButton(
          onPressed: () => context.read<AuthService>().logout(),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Sair do App',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
