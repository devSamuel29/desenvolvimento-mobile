import 'package:bugetbuddy/services/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes.dart';
import '../services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  logout() async {
    try {
      await context.read<GoogleSignInBugetBuddy>().logout();
      Navigator.pushReplacementNamed(context, LOGIN_PAGE);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget logoutButton() {
    return Container(
      height: 70,
      padding: EdgeInsets.only(top: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple.shade800,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {
          logout();
        },
        child: Text(
          "Sair da conta",
        ),
      ),
    );
  }

  Widget bottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              _onItemTapped(0);
            },
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              _onItemTapped(1);
            },
          ),
          label: 'Perfil',
        ),
      ],
      onTap: (index) {
        _onItemTapped(index);
      },
    );
  }

  Widget addCash() {
    return ElevatedButton.icon(
      onPressed: () {      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
      ),
      icon: Icon(
        Icons.attach_money,
        color: Colors.white,
      ),
      label: Text(
        'Adicionar dinheiro',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  // Widget addExpense() {}

  @override
  Widget build(BuildContext context) {
    Widget? bodyWidget;

    if (_selectedIndex == 0) {
      bodyWidget = addCash();
    } else if (_selectedIndex == 1) {
      bodyWidget = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logoutButton(),
        ],
      );
    }

    return Scaffold(
      body: Center(child: bodyWidget),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}
