import 'package:flutter/cupertino.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';


class WarningProvider extends ChangeNotifier{
 
  bool _responseEmpty = false;

 
  bool get responseEmpty => this._responseEmpty;
 

  setResponseEmpty(bool state){
    this._responseEmpty = state;
    notifyListeners();
  }
  
  Future<bool> checkInternetState() async {
   bool result = await DataConnectionChecker().hasConnection;
   if(result == true) {
     return true;
   } else {
     return false;
   }
  }
}