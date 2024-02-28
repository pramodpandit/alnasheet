import 'package:flutter/material.dart';

class MyAttendanceScreenProvider with ChangeNotifier{
  String _fromDate="2023-01-01";
  String get fromDate=>_fromDate;
  void setFromDate(String newDate){
    if(newDate!="null") {
      _fromDate = newDate;
    }
    notifyListeners();
  }

  String _toDate="2023-01-31";
  String get toDate=>_toDate;
  void setToDate(String newDate){
    if(newDate!="null") {
      _toDate = newDate;
    }
    notifyListeners();
  }
}