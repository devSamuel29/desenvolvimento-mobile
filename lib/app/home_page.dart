import 'package:bugetbuddy/services/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

import '../routes.dart';
import '../services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  TextEditingController _addCashController = TextEditingController();
  TextEditingController _addExpenseController = TextEditingController();

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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        backgroundColor: Colors.green,
        padding: EdgeInsets.all(12),
      ),
      onPressed: onPressedAddCash,
      child: Icon(
        Icons.attach_money,
        color: Colors.white,
        size: 40,
      ),
    );
  }

  onPressedAddCash() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Adicionar dinheiro'),
        content: TextField(
          controller: _addCashController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Valor',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Adicionar'),
          ),
        ],
      ),
    );
  }

  Widget addExpense() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        backgroundColor: Colors.red,
        padding: EdgeInsets.all(12),
      ),
      onPressed: onPressedAddExpense,
      child: Icon(
        Icons.money_off,
        color: Colors.white,
        size: 40,
      ),
    );
  }

  onPressedAddExpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Adicionar despesa'),
        content: TextField(
          controller: _addExpenseController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Valor',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Adicionar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget? bodyWidget;

    if (_selectedIndex == 0) {
      bodyWidget = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              addCash(),
              SizedBox(
                width: 10,
              ),
              addExpense(),
            ],
          ),
        ],
      );
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
