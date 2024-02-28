import 'package:flutter/material.dart';

class LoginScreenProvider with ChangeNotifier{
  bool _securePass=true;
  bool get securePass=>_securePass;
  void showPass(){
    _securePass=!_securePass;
    notifyListeners();
  }

  TextEditingController _usernameController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  TextEditingController get usernameController=>_usernameController;
  TextEditingController get passwordController=>_passwordController;

  bool _loading = false;
  bool get loading => _loading;
  void changeLoadingStatus(){
    _loading = !loading;
    notifyListeners();
  }
}