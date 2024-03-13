import 'package:alnasheet/Utils/message_handler.dart';
import 'package:alnasheet/bloc/bloc.dart';
import 'package:alnasheet/data/model/api_response.dart';
import 'package:alnasheet/data/repository/AuthRepository.dart';
import 'package:alnasheet/view/presentation/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class AuthBloc extends Bloc{
  AuthRepository repo ;
  AuthBloc(this.repo);

  ValueNotifier<bool> loginLoading = ValueNotifier(false);
  ValueNotifier<bool> securePassword = ValueNotifier(false);
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  login(BuildContext context)async{
    loginLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String,dynamic> data = {
      "username" : username.text,
      "password" : password.text,
      "gcm_id" : "1234555",
    };
    try{
      var result = await repo.loginToDashboard(data);
      if(result['result']['success'] == 1){
        prefs.setString("uid", result['result']['data']['id']);
        prefs.setString("utoken", result['result']['data']['token']);
        DashboardScreen().launch(context,pageRouteAnimation: PageRouteAnimation.SlideBottomTop,isNewTask: true);
        toast(result['result']['message']);
      }else{
        toast(result['result']['message']);
      }
    }catch(e){
      print("the error $e");
    }finally{
      loginLoading.value = false;
    }
  }

  ValueNotifier<bool> forgotPasswordLoading = ValueNotifier(false);
  TextEditingController forgotPasswordUsername = TextEditingController();
  ValueNotifier<String> newPassword = ValueNotifier("");

  forgotPassword(BuildContext context)async{
    forgotPasswordLoading.value = true;
    Map<String,dynamic> data = {
      "username" : forgotPasswordUsername.text,
    };
    try{
      var result = await repo.forgotPasswordApi(data);
      if(result['success'].toString() == "1"){
        newPassword.value = result['message'];
        showInDialog(context,
          actions: [
            TextButton(onPressed: () {
              Navigator.of(context).pop();
              Navigator.pop(context);
            }, child: Text("Ok"))
          ],
          builder: (p0) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(newPassword.value),
              ],
            );
          },
        );
      }else{
        newPassword.value = result['message'];
        showInDialog(context,
          actions: [
            TextButton(onPressed: () {
              Navigator.of(context).pop();
            }, child: Text("Ok"))
          ],
          builder: (p0) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(newPassword.value),
              ],
            );
          },
        );
      }
    }catch(e,s){
      showInDialog(context,
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: Text("Ok"))
        ],
        builder: (p0) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(newPassword.value),
            ],
          );
        },
      );
      newPassword.value = "Invalid User";
      debugPrint('$e');
      debugPrint('$s');
    }finally{
      forgotPasswordLoading.value = false;
    }
  }

}