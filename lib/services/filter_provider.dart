import 'package:flutter/cupertino.dart';

class FilterProvider extends ChangeNotifier{
  bool _ascending  = true;
  bool _descending = false;
  bool _lastDateAdded = false;
  bool _lastDateUpdated = true;
  bool _isPressedFilter = false;
  
  bool get ascending => this._ascending; 
  bool get descending => this._descending; 
  bool get lastDateAdded => this._lastDateAdded; 
  bool get lastDateUpdated => this._lastDateUpdated;
  bool get isPressedFilter => this._isPressedFilter;
  
  void pressFilter(bool state){
    this._isPressedFilter = state;
    notifyListeners();
  }
  void setStateFilter(bool state, String typeFilter){
    if(typeFilter == 'asc'){
      this._ascending = state;
      if (this._ascending)this._descending = false;
    }else if(typeFilter == 'desc'){
      this._descending = state;
      if (this._descending)this._ascending = false;
    }else if(typeFilter == 'dateAdded'){
      this._lastDateAdded = state;
      if (this._lastDateAdded)this._lastDateUpdated = false;
    }else if(typeFilter == 'dateUpdated'){
      this._lastDateUpdated = state;
      if (this._lastDateUpdated)this._lastDateAdded = false;
    }
    
      notifyListeners();

  }


}