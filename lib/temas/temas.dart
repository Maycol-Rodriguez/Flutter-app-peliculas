import 'package:flutter/material.dart';

class SwitchTemas with ChangeNotifier{

  bool _temaOscuro = false;
  ThemeData _temaActual = ThemeData.light();

  bool get temaOscuro => _temaOscuro;
  ThemeData get temaActual => _temaActual;

  set temaOscuro(bool value){
    _temaOscuro = value;

    (value) 
        ? _temaActual = ThemeData.dark()
        : _temaActual = ThemeData.light();

    notifyListeners();
  }
}