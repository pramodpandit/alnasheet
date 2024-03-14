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
  ValueNotifier<bool> securePassword = ValueNotifier(true);
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  login(BuildContext context)async{
    if(username.text == ''){
      showMessage(MessageType.info('Please enter username'));
    }else if( password.text ==''){
      showMessage(MessageType.info('Please enter password'));
    }else{
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

  }

  ValueNotifier<bool> forgotPasswordLoading = ValueNotifier(false);
  TextEditingController forgotPasswordUsername = TextEditingController();
  ValueNotifier<String> newPassword = ValueNotifier("");

  forgotPassword(BuildContext context)async{
    if(forgotPasswordUsername.text == ''){
      showMessage(MessageType.info('Please enter username'));
      return ;
    }
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

  ValueNotifier<bool> changePassLoading = ValueNotifier(false);
  ValueNotifier<bool> showChangePass = ValueNotifier(true);
  ValueNotifier<bool> showConfirmChangePass = ValueNotifier(true);
  TextEditingController changePass = TextEditingController();
  TextEditingController confirmChangePass = TextEditingController();

  changePassword(BuildContext context)async{
    if(changePass.text == ''){
      showMessage(MessageType.info('Please enter new password'));
    }else if( confirmChangePass.text ==''){
      showMessage(MessageType.info('Please enter confirm password'));
      return;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String,dynamic> data = {
      "password" : changePass.text,
      "confirm_password" : confirmChangePass.text,
      "token" : prefs.getString("utoken"),
      "user_id" : prefs.getString("uid"),
    };
    if(changePass.text != confirmChangePass.text){
      toast("password are not same");
      // return;
    }else{
      try{
        changePassLoading.value = true;
        var result = await repo.changePasswordApi(data);
        if(result['result']['success'] == 1){
          DashboardScreen().launch(context,pageRouteAnimation: PageRouteAnimation.SlideBottomTop,isNewTask: true);
          toast(result['result']['message']);
        }else{
          toast(result['result']['message']);
        }
      }catch(e){
        print("the error $e");
      }finally{
        changePassLoading.value = false;
      }
    }
  }

}