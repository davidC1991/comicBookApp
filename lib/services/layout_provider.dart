
import 'package:flutter/material.dart';

class LayoutProvier with ChangeNotifier{
 
  bool _isTablet = false;

  bool get isTablet => this._isTablet;
 

  set stateScreenIsTable (bool state){
    this._isTablet = state;
    notifyListeners();
  }
}