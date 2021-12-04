import 'package:flutter/cupertino.dart';

class ModePresentation extends ChangeNotifier{

  bool _isGrid = true;
 
  
  bool get isGrid => this._isGrid;
  

  setModePresentation(bool mode){
    this._isGrid = mode;
    notifyListeners();
  }

 
}