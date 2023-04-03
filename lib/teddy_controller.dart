import 'package:flutter/material.dart';

class TeddyController extends ChangeNotifier {
  String _animationType;

  TeddyController(this._animationType);
  
  changeTheme() {
      _animationType = this._animationType;
    notifyListeners();
  }
}

