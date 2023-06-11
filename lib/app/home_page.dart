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
  var valorNovo = "0.00";
  var valorRetirado = "0.00";


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
              setState(() {
                valorNovo = _addCashController.text;
                _addCashController.text = "";
              });
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
              setState(() {

                valorRetirado = _addExpenseController.text;
                _addExpenseController.text = "";
              });
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
      bodyWidget = Padding(
        padding: const EdgeInsets.only(right: 30, left: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(minRadius: 24),
                  const SizedBox(width: 30),
                  Text("Olá,\n Samuel", style: TextStyle(
                    fontSize: 30
                  )),
                ],
              ),const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("R\$ 100,00", style: TextStyle(
                    fontSize: 40
                  ))
                ],
              ),
              const SizedBox(height: 10),
              Text("Saldo geral"),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(8)
                ),
                constraints: BoxConstraints(
                  minHeight: 400
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      constraints: BoxConstraints(
                        minWidth: double.infinity,
                        minHeight: 80
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.monetization_on, size: 40),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Saldo guardado"),
                              Text("R\$ $valorNovo", style: TextStyle(
                                fontSize: 25
                              ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        addExpense(),
                        const SizedBox(width: 10),
                        addCash(),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      constraints: BoxConstraints(
                          minWidth: double.infinity,
                          minHeight: 80
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Meta"),
                              Text("R\$ 500,00", style: TextStyle(
                                  fontSize: 25
                              ))
                            ],
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Total disponivel"),
                              Text("R\$ 300,00", style: TextStyle(
                                  fontSize: 25
                              ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      constraints: BoxConstraints(
                          minWidth: double.infinity,
                          minHeight: 80
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Contas a pagar"),
                              Text("R\$ $valorRetirado", style: TextStyle(
                                  fontSize: 25
                              ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      constraints: BoxConstraints(
                          minWidth: double.infinity,
                          minHeight: 80
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Indicações"),
                              Row(
                                children: [
                                  Icon(Icons.book),
                                  Icon(Icons.airplanemode_active),
                                  Icon(Icons.mic_external_on_sharp),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
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
      backgroundColor: Colors.deepPurple,
      body: Center(child: bodyWidget),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}
